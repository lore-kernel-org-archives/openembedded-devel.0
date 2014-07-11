Return-Path: <smennetrier@connected-labs.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id D2B5A703A3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 07:37:25 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id s7so576612qap.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 00:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=nq3uzh3VNDfiktGsi8SLqkWHKuJov+Gcl9Wnh3Dp6wc=;
	b=F8HVwE8oPUOzrnWr9byToblFVRQgm5q9ZGkkB8o1mV+MCeNrucHw7i9d0l77VIoPZH
	nZu1GgooBvzKfboEf1XXbw8lqYCjNPss75RGXJpKP++Cqabi5jHMa7ed95/aMRh1GE7a
	0UxnGmELkxN5X2i4DPLFl2fXbEPflDRMX8x4YjbTNTJKFbO4MRZpK3cZgGCrRlyKtbof
	iaoW/2k2zBP79T7x0I1gQfnR0hMluVsA87JpD4q17tt8Ly1oWHLeeht94Mr+OHhZWyrw
	j/PI74zXNbs+fYTW/KNAIk7fll9m20uRvPUG98Yz05/VfTDn2MvvTrxQecjOPaD/lt0u
	Xftg==
X-Gm-Message-State: ALoCoQls8+pUJFoADk7tsy2A0Ra/D+z+7hfU1NnFBHxCDOAD8HJ8iGXIIwWtH+2IxIKZjIueQuXy
MIME-Version: 1.0
X-Received: by 10.140.24.76 with SMTP id 70mr56986087qgq.30.1405064245993;
	Fri, 11 Jul 2014 00:37:25 -0700 (PDT)
Received: by 10.140.91.108 with HTTP; Fri, 11 Jul 2014 00:37:25 -0700 (PDT)
X-Originating-IP: [94.103.137.126]
In-Reply-To: <53BF7DCD.7050803@cn.fujitsu.com>
References: <CAEaCVQiEEX45zS0PLGrExLxqLofDNht5c7MD9uBDbh4MpbskDA@mail.gmail.com>
	<53BF7DCD.7050803@cn.fujitsu.com>
Date: Fri, 11 Jul 2014 09:37:25 +0200
Message-ID: <CAKCtLPwBs3PYm6ANMmb_aJ7qUdn4+db_5O6b0pNg4jjjepceCQ@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Mennetrier?= <smennetrier@connected-labs.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: systemd service failing at start
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jul 2014 07:37:26 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I had the same issue and for me the problem came from the postinst script :

When you add a pkg_postinst_${PN} in the recipe, the documentation say to
use :

pkg_postinst_PACKAGENAME () {
     #!/bin/sh -e
     if [ x"$D" = "x" ]; then
          # Actions to carry out on the device go here
     else
          exit 1
     fi
     }

But for recipe that inherit systemd, the pkg_postint script is followed by
(see in systemd.bbclass) :

systemd_postinst() {
OPTS=""

if [ -n "$D" ]; then
    OPTS="--root=$D"
fi

if type systemctl >/dev/null 2>/dev/null; then
    systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}

    if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
        systemctl restart ${SYSTEMD_SERVICE}
    fi
fi
}

So your script is followed by "systemctl restart ${SYSTEMD_SERVICE}". And
if the service have some "Requires" that is not start when the postinst
script is executed, the message " A Start job is running for Run pending
postinsts" appears.

For solve the issue, I writed my pkg_postinst follow this schema :

pkg_postinst_${PN} () {
if [ x"$D" != "x" ]; then
    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
        # Script in systemd_postinst function
        OPTS="--root=$D"
        if type systemctl >/dev/null 2>/dev/null; then
            systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
        fi
    fi

    # Script in updatercd_postinst function
    OPT="-r $D"
    if type update-rc.d >/dev/null 2>/dev/null; then
        update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
    fi
    exit 1
else
    # Actions to carry out on the device go here
    exit 0
fi
}


I think that is maybe a bug in yocto ;)


Regards,
Seb M


2014-07-11 8:01 GMT+02:00 Li Zhijian <lizhijian@cn.fujitsu.com>:

>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


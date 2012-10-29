Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TSmZn-0000Nj-SO
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Oct 2012 11:28:12 +0100
Received: by mail-vc0-f175.google.com with SMTP id p1so4980890vcq.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2012 03:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=eQtka9wVBY59zq1No6mn7DUjwsuCt4uDxEncPLYGenQ=;
	b=GN2ita+hl7n8sFgTY+ZTpmZxgPZXNTt722gFRM3ESN7JAlx40eTWE0AX4kHL0DEMbL
	zcGhp3Nm1rWolZym1UANzioG0mKmi9T9ZN9Je+s3fFJHApJ5Od8J6koQ3Zoqz8w3ovtm
	xSlSxtTYHOlAcCyAwibFgd+4t/TuTQ8U8AqfjlaYrjRWL5dgsUO1fJq44gGUOPKLtKD9
	KXsE5Qs6W8KRiR4sN7u/J2lPjmuqEV3n/unozgSNpxMDi9qY+BOMPRF57TRzLr0yL7ZL
	nYntwn/60opqPKRqtawT1xivWRRkSciAgZpED+XQQqlF3UHEFw2GqZ+ertKAfmO649F4
	4YWg==
Received: by 10.52.24.231 with SMTP id x7mr38581879vdf.121.1351505677590; Mon,
	29 Oct 2012 03:14:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.59.0.10 with HTTP; Mon, 29 Oct 2012 03:14:17 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <CAC_9p+9kUhDG4dCo0Dvdhu0atZV=YxXQo3BOvMd72RsxQP9HUw@mail.gmail.com>
References: <CAC_9p+9kUhDG4dCo0Dvdhu0atZV=YxXQo3BOvMd72RsxQP9HUw@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 29 Oct 2012 12:14:17 +0200
Message-ID: <CAK18fxGyJGLnG1ga+QkHqXBp0Bk+snxgKBTPSzFoXhT4uaHZCA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmwqdM86TC/QU0AU3+Vre+rGLMTx3IyemRXpMRsG/xnw6yyWqUcoCfPviwIWprX+eFToq9P
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Building for armhf (RaspberryPI on Debian)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Oct 2012 10:28:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

This sounds like a bug. Could you please submit an issue on github?

Thanks,
ag


On Sat, Oct 27, 2012 at 4:36 PM, Matteo Fortini <matteo.fortini@gmail.com>wrote:

> Hi,
> I'm trying to build some OE deb packages using meta-raspberrypi, but my
> wheezy Raspbian distro is complaining that the OE .deb was built for the
> "arm" architecture and not for the "armhf" one.
>
> To fix this, I tried to use an "armhf" machine, by changing the machine
> definition in the following way. However, this didn't fix it, even if
> bitbake is telling me it's using the hardware accelerated FPU.
>
> Could you point me to a way of solving it?
>
> Thank you in advance,
> Matteo
>
> diff --git a/conf/machine/include/tune-arm1176jzf-s.inc
> b/conf/machine/include/tune-arm1176jzf-s.inc
> index b52c161..9060f48 100644
> --- a/conf/machine/include/tune-arm1176jzf-s.inc
> +++ b/conf/machine/include/tune-arm1176jzf-s.inc
> @@ -6,5 +6,5 @@ TUNEVALID[arm1176jzfs] = "Enable arm1176jzfs specific
> processor optimizations"
>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm1176jzfs",
> "-mtune=arm1176jzf-s", "", d)}"
>
>  AVAILTUNES += "arm1176jzfs"
> -TUNE_FEATURES_tune-arm1176jzfs = "${TUNE_FEATURES_tune-armv6} arm1176jzfs"
> -PACKAGE_EXTRA_ARCHS_tune-arm1176jzfs = "${PACKAGE_EXTRA_ARCHS_tune-armv6}"
> +TUNE_FEATURES_tune-arm1176jzfs = "${TUNE_FEATURES_tune-armv6hf}
> arm1176jzfs"
> +PACKAGE_EXTRA_ARCHS_tune-arm1176jzfs =
> "${PACKAGE_EXTRA_ARCHS_tune-armv6hf}"
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


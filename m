Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 00FCF6D6F5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 22:23:24 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id b11so10488533lfa.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 15:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=2LYSkZWtq5Yu8JzIaK8jLZsuxY8v1ymBocGFP14ADrM=;
	b=Pu8cN2ULSwAFUfOK4GX1k/sSwVeaKtR5CchNF5xQyTg4sCsLth4BpJXgrvdUOuselT
	Yc2Pc4xoc48PzJh0yVsaPAAR+GFkkuw2EBJtbEbqnTgKAoPsVBxiJxKpblZN236DjZZB
	dxRQOWgNNDZKmbgwICt/KEcd6cqjfqE2Y2aB+zzkemK1FZOtkAlQwSRmgRr5ScpUTEVJ
	hpOOdSkF58mfJk7SSq9qNKg8kGPq6T9WFMlrRra2NxhxrrF5MQebos2xH4YmjEIRzZzz
	qsUkdgm/uK3go6Lc16LdF6c0TZ2oNSl05r4K6h/Q2lPBipbs+lD2WB6+vXIM1cWKnKQm
	67cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=2LYSkZWtq5Yu8JzIaK8jLZsuxY8v1ymBocGFP14ADrM=;
	b=s1N3YHzuYAwko5ccpWty0QgifDwVyqRFQXQUhJ/oWH5sTgyo82vsGu4xlnvdMONNJm
	b2GcsTqnjSAZIaO0pz+1ptIkhBcJPk3sPzL7Y3bQkV43IstNUYFnWeVdscPAgc+VZXg5
	C997vCZeu+rhOfplMbo871Q0AAM9OmbxvSA3o6bWdDsdlVqbTIVTdjpFe46DxgQ7U2wc
	mPThoiRP4H/SOudzAU1TWz3vwSrCG/GvKHq5XUELo6XXOeBFwZE3fNLW49iQgjtTO0C3
	49Um/Uy0uH0Flah9ADAm264GBp/Q7tkrKOuMz07Ltk7HXXpTiQqZhZ2QzC8Odrz+etTZ
	eHuA==
X-Gm-Message-State: APjAAAUSmudoCb49hL48ydmrOVjuHX57m8UBPdFaq8o5NZT+cScIzXmD
	ocvZWephcrDQLNjB322w7mKQ7YAXkYI=
X-Google-Smtp-Source: APXvYqz0VSEFgZfhC+1nkRIYIVuTngpdFkIf503YccJgJE0DFBOMlLA7sdGafzRT2lMal5M8sIZgCA==
X-Received: by 2002:a19:5044:: with SMTP id z4mr57602422lfj.80.1560896605035; 
	Tue, 18 Jun 2019 15:23:25 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	j11sm2384454lfm.29.2019.06.18.15.23.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jun 2019 15:23:24 -0700 (PDT)
To: Vincent Prince <vincent.prince.fr@gmail.com>
References: <20190316144936.4768-1-open.source@oleksandr-kravchuk.com>
	<CAB2nKc9OS+c5MYdCbjjTTNcg0Qh-nrEXZ-T+cZ36Wy_O0qUBtg@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <6fcc4e72-0ff0-7048-5a8d-69da48c6c484@oleksandr-kravchuk.com>
Date: Wed, 19 Jun 2019 00:23:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAB2nKc9OS+c5MYdCbjjTTNcg0Qh-nrEXZ-T+cZ36Wy_O0qUBtg@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] openconnect: update to 8.02
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Jun 2019 22:23:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

I do not know how Yocto mirrors work, but according to
http://downloads.yoctoproject.org/mirror/sources/ last copy of the repo
was made in November 2018, while 8.02 was released in January 2019, so
it does make sense that 6487ee8763e1b63 isn't in it.

Perhaps someone can force Yocto mirrors to fetch the latest version?

On 18/06/2019 10:01, Vincent Prince wrote:
> Hi all,
>
> After this update I have some difficulties to populate my download
> pre-mirror with bitbake runall=fetch universe, warrior branch.
>
> I can't access infradead.org <http://infradead.org> in my company but
> it seems yocto mirrors does not contain following revision, this
> command fails:
> git -c core.fsyncobjectfiles=0 branch --contains
> 6487ee8763e1b6345718684909aca970befbc49d --list master
>
> For now, I just ignore the error as I don't use openconnect, anyone
> have same issue with it?
>
> Best regards,
> Vincent
>
> Le sam. 16 mars 2019 à 15:50, Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com
> <mailto:open.source@oleksandr-kravchuk.com>> a écrit :
>
>     Signed-off-by: Oleksandr Kravchuk
>     <open.source@oleksandr-kravchuk.com
>     <mailto:open.source@oleksandr-kravchuk.com>>
>     ---
>      .../openconnect/openconnect_git.bb <http://openconnect_git.bb>   
>                  | 14 ++++++++++----
>      1 file changed, 10 insertions(+), 4 deletions(-)
>
>     diff --git
>     a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
>     <http://openconnect_git.bb>
>     b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
>     <http://openconnect_git.bb>
>     index c944144e2..050a2833c 100644
>     ---
>     a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
>     <http://openconnect_git.bb>
>     +++
>     b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
>     <http://openconnect_git.bb>
>     @@ -2,7 +2,11 @@ SUMMARY = "Open client for Cisco AnyConnect VPN"
>      LICENSE = "LGPLv2.1"
>      LIC_FILES_CHKSUM =
>     "file://COPYING.LGPL;md5=243b725d71bb5df4a1e5920b344b86ad"
>
>     +SRC_URI = "git://git.infradead.org/users/dwmw2/openconnect.git
>     <http://git.infradead.org/users/dwmw2/openconnect.git>"
>     +SRCREV = "6487ee8763e1b6345718684909aca970befbc49d"
>     +
>      DEPENDS = "vpnc libxml2 krb5 gettext-native"
>     +RDEPENDS_${PN} = "bash python"
>
>      PACKAGECONFIG ??= "gnutls lz4 libproxy"
>
>     @@ -14,10 +18,7 @@ PACKAGECONFIG[libproxy]  =
>     "--with-libproxy,--without-libproxy,libproxy,"
>      # not config defaults
>      PACKAGECONFIG[pcsc-lite] =
>     "--with-libpcsclite,--without-libpcsclite,pcsc-lite,"
>
>     -PV = "7.08"
>     -
>     -SRCREV = "9697bea0e50952cab57063238b43a7099e498cbb"
>     -SRC_URI = "git://git.infradead.org/users/dwmw2/openconnect.git
>     <http://git.infradead.org/users/dwmw2/openconnect.git>"
>     +PV = "8.02"
>
>      S = "${WORKDIR}/git"
>
>     @@ -25,3 +26,8 @@ inherit autotools pkgconfig
>
>      EXTRA_OECONF +=
>     "--with-vpnc-script=${SYSROOT_DESTDIR}${sysconfdir}/vpnc/vpnc-script \
>                       --disable-static"
>     +
>     +do_configure_append() {
>     +    # script has /usr/bin/python2 path hardcoded
>     +    sed -i -e 's=python2\.*=python=g' ${S}/trojans/tncc-wrapper.py
>     +}
>     -- 
>     2.17.1
>
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


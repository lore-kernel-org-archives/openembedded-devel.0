Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P6gMs-0007Lq-6M
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 11:14:29 +0200
Received: by iwn2 with SMTP id 2so672126iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 02:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LyP4q0jQCRGHHQPhOoDoMKdN7/CJQqWzdnkC+dDhs5s=;
	b=lvk1kIDGPcpUWhPGP1QCkYrMpYK082pbr4VfCR5Mxxvs8wqD4S7JTkvos5IPmMAHPy
	QS9XlLaXvq//7Wq7iiE1OGSqf9LC3LXU3x6tnRyVPVjZ1cte+1s5MEnDr3CdYzbexSmc
	yGXfWJ2RCH0rGxKLHO35pFuGtzzufZKUrau6c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NEEoVxY5zHHA6VF8FePVsCevMJdoSsGKyN6gsO/YgVIDtHTqvnO1E7imrhuQi7yQsI
	MihXhlnKaFWxZeWFb8tB55/wKcgC2GGCaKbsIqjl3aczHcM0f7T1Gpoh972olOnQijC+
	AYXfuIwf+SRK1fukgAmK8uwBNholoqtig2XQ8=
MIME-Version: 1.0
Received: by 10.231.192.80 with SMTP id dp16mr331808ibb.39.1287133730650; Fri,
	15 Oct 2010 02:08:50 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 15 Oct 2010 02:08:50 -0700 (PDT)
In-Reply-To: <201010151039.08619.marcin@juszkiewicz.com.pl>
References: <201010151039.08619.marcin@juszkiewicz.com.pl>
Date: Fri, 15 Oct 2010 11:08:50 +0200
Message-ID: <AANLkTimOVyz_Zq2=+Sju0aozY98w5MSh9hjy8qFR-=SH@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: remove old kernels
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
X-List-Received-Date: Fri, 15 Oct 2010 09:14:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/15 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:
>
> Hi
>
> recipes/linux/ contains 235 recipes. I would like to propose cleaning:
>
> 1. drop 2.4 kernels - if someone still needs them then .oz354x and .stabl=
e
> =A0 branches have them.
>
> This may affect:
>
> - zauruses (which have 2.6 kernel)
> - ipaq h36/38/39/54/55 - some have 2.6 kernel
> - ipod - but does someone really uses 2.4.24 on own ipod?
> - ramses - but this is maintained out of tree
> - wrt54 - OpenWRT distro works better there and lets keep that way
> - xxs1500, mtx, sun4cdm - if someone maintain it at all then please raise=
 your
> =A0hand
> - colinux - no one will cry
> - geodegx - 2.6 mainline works on it
>
>
> 2. Drop kernels older then 2.6.20 - it was over 3 years ago so if someone=
 uses
> =A0 older one then probably also uses 3 years old OE.
>
> This may affect (checked recipes):
>
> - ep93xx - machines with this cpu are mainline supported, patches from ts=
72xx
> =A0and sim.one works
> - chumby
> - compulab-pxa270
> - devkitidp-pxa255
> - fsg3
> - gumstix
> - amsdelta
> - bd-neon
> - colinux
> - epia
> - geodelx
> - h1940
> - h6300
> - ks8695
> - magicbox
> - mtx-3
> - neuros
> - sun4cdm
> - tornado-omap2
> - wrap-geode
> - x86
> - acern30
> - logicpd-pxa270
> - mainstone
> - mx21ads
> - netbook-pro
> - triton
> - blueangel
> - universal
>
> Some of those machines are not maintained anymore, many of them should wo=
rk
> with current mainline kernels. If someone cares about anything on a list =
-
> raise your hand.
>
> Why 2.6.20? Because NHK-15 uses it and does not work with mainline kernel=
.
>
> Regards,
> --
> JID: =A0 =A0 =A0hrw@jabber.org
> Website: =A0http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>

Seems a fine plan to me.


According to my ls the following files are affected:

$ ls *2.4*.bb *2.6.[01]*.bb
chumby-kernel_2.6.16-chumby-1.2.bb	linux-jlime-jornada6xx_2.6.11.bb
compulab-pxa270_2.6.16.bb		linux-jlime-jornada6xx_2.6.17.bb
devkitidp-pxa255_2.6.19.bb		linux-jlime-jornada7xx_2.6.17.bb
ep93xx-kernel_2.6.17+2.6.18-rc1.bb	linux-jlime-jornada7xx_2.6.18.bb
ep93xx-kernel_2.6.19+2.6.20-rc7.bb	linux-jlime-jornada7xx_2.6.19rc6.bb
fsg3-kernel_2.6.18.bb			linux-ks8695_2.6.16.bb
handhelds-pxa_2.4.19-rmk6-pxa1-hh42.bb	linux-magicbox_2.6.18.6.bb
handhelds-sa_2.4.19-rmk6-pxa1-hh42.bb	linux-magicbox_2.6.19.2.bb
ipod_2.4.24-ipod0.bb			linux-mtx-1_2.4.27.bb
ixp4xx-kernel_2.6.18.bb			linux-mtx-1u_2.4.27.bb
ixp4xx-kernel_2.6.19.bb			linux-mtx-2_2.4.27.bb
LAB-kernel_2.6.13-hh2.bb		linux-mtx-3_2.6.15.4.bb
linux_2.6.14.bb				linux-mtx-3_2.6.15.bb
linux_2.6.18.bb				linux-navman_2.6.18.bb
linux-amsdelta-2.6_2.6.16-omap2.bb	linux-neuros_2.6.15.bb
linux-bast_2.4.25-vrs1-bast1.bb		linux-nokia800_2.6.18-osso40.bb
linux-colinux_2.4.28.bb			linux-omap1_2.6.12-rc2.bb
linux-colinux_2.6.10.bb			linux-omap1_2.6.18+git.bb
linux-efika_2.6.18+2.6.19-rc6.bb	linux-omap1_2.6.18-omap1.bb
linux-epia_2.6.11.bb			linux-omap1_2.6.19-omap1.bb
linux-epia_2.6.12.bb			linux-sun4cdm_2.4.26.bb
linux-epia_2.6.19.2.bb			linux-tornado-omap2_2.6.16.16.bb
linux-geodegx_2.4.24.bb			linux-wrap-geode_2.6.17.bb
linux-geodelx_2.6.11.bb			linux-wrt_2.4.20.bb
linux-gumstix_2.6.15.bb			linux-wrt_2.4.30.bb
linux-h1940_2.6.11-bk1-h1940.bb		linux-x86_2.6.17.9.bb
linux-h1940_2.6.14-h1940.bb		linux-xxs1500_2.4.21.bb
linux-h1940_2.6.17-h1940.bb		logicpd-pxa270_2.6.17-rc5.bb
linux-h6300-omap1_2.6.12-rc5.bb		logicpd-pxa270_2.6.19.2.bb
linux-h6300-omap1_2.6.14.3.bb		mainstone-kernel_2.6.11.bb
linux-h6300-omap1_2.6.16.16.bb		mainstone-kernel_2.6.18.bb
linux-handhelds-2.6_2.6.16-hh9.bb	mnci-ramses_2.4.21-rmk2-pxa1.bb
linux-handhelds-2.6_2.6.17-hh4.bb	mx21ads-kernel_2.6.19rc6.bb
linux-handhelds-2.6_2.6.18-hh2.bb	netbook-pro-kernel_2.6.17.bb
linux-handhelds-2.6_2.6.19-hh13.bb	triton-kernel_2.6.11.bb
linux-ixp4xx_2.6.18.bb			xanadux-ba-2.6_2.6.12.bb
linux-ixp4xx_2.6.19.bb			xanadux-un-2.6_2.6.12.bb

I guess there are some post 2.6.20 recipes as well that are
obsolete/superseded, but this is a good start.

Frans



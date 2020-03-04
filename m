Return-Path: <prvs=133295fcb3=holzmayr@rsi-elektrotechnik.de>
X-Greylist: delayed 360 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Mar 2020 17:09:03 UTC
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
	[85.215.255.21])
	by mail.openembedded.org (Postfix) with ESMTP id 61B0160AE3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 17:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583341743;
	s=strato-dkim-0002; d=rsi-elektrotechnik.de;
	h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=U8zmj1PEEWVjU4ln4vwZlTaIzpo1hES1FfdvptcAJJ8=;
	b=oh3ym7wb1FKtX4Xi+qhgr8DteRf9Or5UZfVzAEELpCRvc6T3Yq+SZtpY0IfJfPsago
	7+nXSxjD3XWskEPKngZtQGUbEzkHIstWY4v6yzlsMaKVYq6LR8xmG0DcjJQ1zPOSW/A4
	++hWyTqUmaSBO3u5KF1021oNkdpYw94BEgduYLsAvt20jezNrHl8BsVUaEGPJ42nOSAw
	M5AkQ0Oy2UvU3iOe2ia1rxUSAu6VaAJGqXVeuIb637cob+RGUwt3udw9Yoa9m3Nxv6st
	Rn/xcvyBnBbjeIT1MiDE86JcXabwy7f4E8NBmJfVUForyTMIneqkkz7yeFSWHYL+qBlP
	AMhA==
X-RZG-AUTH: ":fz5RJhWIaexwuXGosGLfiBc0xYyi1Y5bd+wRKqrzPXw4V1/KqCOd+ZZzzoK8epFp9XQIUl6aPGQL"
X-RZG-CLASS-ID: mo00
Received: from mail.rsi-elektrotechnik.de by smtp.strato.de (RZmta 46.2.0 AUTH)
	with ESMTPSA id Y0aff3w24H30HUv
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Wed, 4 Mar 2020 18:03:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed;
	d=rsi-elektrotechnik.de; s=MDaemon; t=1583341380; x=1583946180;
	i=holzmayr@rsi-elektrotechnik.de; q=dns/txt; h=Date:From:To:Cc:
	Subject:Message-ID:References:MIME-Version:Content-Type:
	Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	User-Agent; bh=U8zmj1PEEWVjU4ln4vwZlTaIzpo1hES1FfdvptcAJJ8=; b=s
	4R7vrO7NHayN02kYs2T5UoB7B3S4FC/coAwTqD3zpfztSfYUDyxSdyhylGtPHaLA
	rER9f1VqM9nVwF3wfu9guQpV4qVuwZRVC51gaPS7I42Mp09CF/T9dhqUug3DpnaU
	RPjNyrMSSAIWODj4Z1X2WoSFnSBZ+L2S4Az5dnV5Eo=
Received: by mail.rsi-elektrotechnik.de (MDaemon PRO v19.5.4) with ESMTPSA id
	md50000250744.msg; Wed, 04 Mar 2020 18:03:00 +0100
X-Spam-Processed: mail.rsi-elektrotechnik.de, Wed, 04 Mar 2020 18:03:00 +0100
	(not processed: message from trusted or authenticated source)
X-MDArrival-Date: Wed, 04 Mar 2020 18:03:00 +0100
X-Authenticated-Sender: holzmayr@rsi-elektrotechnik.de
X-Return-Path: prvs=133295fcb3=holzmayr@rsi-elektrotechnik.de
X-Envelope-From: holzmayr@rsi-elektrotechnik.de
Date: Wed, 4 Mar 2020 17:02:01 +0000
From: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
To: Philip Balister <philip@balister.org>
Message-ID: <20200304170201.msozkjkbqf4zf5wt@jh-mailer>
References: <20200304122811.16655-1-leo.yan@linaro.org>
	<alpine.LFD.2.21.2003041103340.29352@godzilla.spiteful.org>
	<0d9bdfd0-9321-940b-4542-e4ba6505aed1@balister.org>
MIME-Version: 1.0
In-Reply-To: <0d9bdfd0-9321-940b-4542-e4ba6505aed1@balister.org>
User-Agent: NeoMutt/20171215
Cc: Mike Leach <mike.leach@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v1] OpenCSD: Support for Arm CoreSight decode lib
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
X-List-Received-Date: Wed, 04 Mar 2020 17:09:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Mar 04, 2020 at 11:36:38AM -0500, Philip Balister wrote:
> On 3/4/20 11:05 AM, Scott Murray wrote:
> > On Wed, 4 Mar 2020, Leo Yan wrote:
> > 
> >> This recipe is to support OpenCSD, which is an open source
> >> CoreSight trace decode library and utility.
> > 
> > Just a thought, this seems like the kind of thing that might make sense
> > for the new meta-arm layer that Jon has been working up?
> 
> I had the exact thought and am really glad I read this before saying the
> same thing!

+1

> 
> Philip
> 
> > 
> >> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> >> ---
> >>  .../recipes-devtools/opencsd/opencsd_git.bb   | 28 +++++++++++++++++++
> >>  1 file changed, 28 insertions(+)
> >>  create mode 100644 meta-oe/recipes-devtools/opencsd/opencsd_git.bb
> >>
> >> diff --git a/meta-oe/recipes-devtools/opencsd/opencsd_git.bb b/meta-oe/recipes-devtools/opencsd/opencsd_git.bb
> >> new file mode 100644
> >> index 000000000..0c3b4837d
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-devtools/opencsd/opencsd_git.bb
> >> @@ -0,0 +1,28 @@
> >> +SUMMARY = "OpenCSD - An open source CoreSight(tm) Trace Decode library"
> >> +HOMEPAGE = "https://github.com/Linaro/OpenCSD"
> >> +LICENSE = "BSD-3-Clause"
> >> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ad8cb685eb324d2fa2530b985a43f3e5"
> >> +
> >> +SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=http;branch=master"
> >> +SRCREV = "03c194117971e4ad0598df29395757ced2e6e9bd"
> >> +
> >> +S = "${WORKDIR}/git"
> >> +
> >> +COMPATIBLE_HOST = "(x86_64.*|aarch64.*)-linux"
> >> +
> >> +EXTRA_OEMAKE = "ARCH='${TARGET_ARCH}' \
> >> +                CROSS_COMPILE='${TARGET_SYS}-' \
> >> +                CC='${CC}' \
> >> +                CXX='${CXX}' \
> >> +                LINKER='${CXX}' \
> >> +                LINUX64=1 \
> >> +                DEBUG=1 \
> >> +                "
> >> +
> >> +do_compile() {
> >> +    ( cd ${S}/decoder/build/linux; oe_runmake ${EXTRA_OEMAKE}; cd - )
> >> +}
> >> +
> >> +do_install() {
> >> +    ( cd ${S}/decoder/build/linux; oe_runmake PREFIX=${D}/usr install; cd - )
> >> +}
> >>
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
———————————————
Josef Holzmayr
Software Developer Embedded Systems

Tel: +49 8444 9204-48
Fax: +49 8444 9204-50

R-S-I Elektrotechnik GmbH & Co. KG
Woelkestrasse 11
D-85301 Schweitenkirchen
www.rsi-elektrotechnik.de
———————————————
Amtsgericht Ingolstadt – GmbH: HRB 191328 – KG: HRA 170393
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
Ust-IdNr: DE 128592548 

_____________________________________________________________
Amtsgericht Ingolstadt - GmbH: HRB 191328 - KG: HRA 170363
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
USt-IdNr.: DE 128592548



Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D85CC4332F
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 17:52:16 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.5182.1637257934818121867
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 09:52:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=acmf3b/2;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 53D3082F8C;
	Thu, 18 Nov 2021 18:52:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1637257932;
	bh=hCiIK38KTqacdd7x/L612c52qRgwAQlq7foL1day5Rg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=acmf3b/2Qn3cOiypl5rBgvZDUK2BSa0qy9qE0yTvZluBTp8PdvOkMcHGnQIo0xUUH
	 042QIRkGFnRTrpk/rMjPA38nQHDDQ8cLduIB447Q6+FpE1IthSVuEhnSbMvYna8d3l
	 QehVbS5/wOqMB6w3AK08GoHp8r4Crlx6cuDxowLKPWDquZ+nN2siA1oJ/C/S2RF6Cy
	 3wPwW2vYMTGJceMT80iZ9QEujZL41hbby4lGpjcwiXWHqM1GyVizTCoSElya+io5Jy
	 D7xBMwxliwufuyEZa6Rxnk7nFamVzu4AonYr+VKdunneZ6O9lzGT2jmGUucAimaeak
	 JeKf1h5N9duxA==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [meta-oe][PATCH 4/4] freerdp: Enable NEON SIMD on armv7a and armv7ve
Date: Thu, 18 Nov 2021 18:51:44 +0100
Message-Id: <20211118175144.1708578-4-marex@denx.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211118175144.1708578-1-marex@denx.de>
References: <20211118175144.1708578-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 17:52:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94048

Enable NEON SIMD on armv7a and armv7ve, this does improve performance
on these systems. Aarch64 NEON SIMD is available only in FreeRDP 3.x,
so do not enable NEON on aarch64 just yet.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alex@linutronix.de>
Cc: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb b/meta-oe/r=
ecipes-support/freerdp/freerdp_2.4.1.bb
index aba77e20f..571ba5fcb 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
@@ -30,6 +30,10 @@ EXTRA_OECMAKE +=3D " \
     -DWITH_MANPAGES=3DOFF \
 "
=20
+EXTRA_OECMAKE:append:armv7a =3D " -DWITH_NEON=3DON"
+EXTRA_OECMAKE:append:armv7ve =3D " -DWITH_NEON=3DON"
+# ARMv8a NEON support is available only in FreeRDP 3.x
+
 PACKAGECONFIG ??=3D " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'directfb pam pulseaudio wayla=
nd x11', d)}\
     gstreamer cups pcsc \
--=20
2.33.0



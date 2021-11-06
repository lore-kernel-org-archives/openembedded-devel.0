Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1255C433F5
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 12:58:47 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.18687.1636203525624762411
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Nov 2021 05:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=sLoK/L/f;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9F44F83305;
	Sat,  6 Nov 2021 13:58:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1636203522;
	bh=HXR52I+OKA8/UfBdVzNN2/O7vM+uieU7av4VF58ANco=;
	h=From:To:Cc:Subject:Date:From;
	b=sLoK/L/f8U6UKkJCHMOrq+wcISugIsH8F2zr30r2MRFWSFQZS0VCpYvQ5e3hcOv5s
	 yQ4AubylxUVa6+a8IwmCzlWl2GDdmYarTfzgEQMzYRYXQsv7CpEACeE57O4VaGjbzr
	 AQ1a2HLReD5T4UvWKTmNN6jARq/nlZOCjbxWB9E57DKPgMpSEwfCEZfeiG6V9sA183
	 k8nSM2oGEXxzQvfvik1/v+BnsznhMFHh2tRjOswBEv3TjwJ0Q6I7balfsJeMdjkGGo
	 f8ot6ZVVjiWNwzNr+HCY+39lvLl0RqfUttS0bLeX/EGL1tzyQ1yJO1O/EZkP4UCgrv
	 PyZBgqiWswSEA==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Marek Vasut <marex@denx.de>
Subject: [meta-oe][PATCH] libsdl2-ttf: Remove incorrect x11 from
 REQUIRED_DISTRO_FEATURES
Date: Sat,  6 Nov 2021 13:58:29 +0100
Message-Id: <20211106125829.13189-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Nov 2021 12:58:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93853

The SDL2 TTF library does not depend on X11, only on GL, remove the
X11 requirement.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.15.bb b/meta=
-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.15.bb
index 5787e988d..0fd9916e9 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.15.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.15.bb
@@ -16,7 +16,7 @@ S =3D "${WORKDIR}/SDL2_ttf-${PV}"
 inherit autotools pkgconfig features_check
=20
 # links to libGL.so
-REQUIRED_DISTRO_FEATURES +=3D "x11 opengl"
+REQUIRED_DISTRO_FEATURES +=3D "opengl"
=20
 do_configure:prepend() {
     # Removing these files fixes a libtool version mismatch.
--=20
2.33.0



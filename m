Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B5ACD11DF
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 20:50:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.6178.1711140611104419236
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Mar 2024 13:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=jMsd//TW;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9C0FB87F50;
	Fri, 22 Mar 2024 21:50:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1711140609;
	bh=Cbw4YZwcHcuo75uyOJOOVt9u+pEuG7XQmo9aKXQFvMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jMsd//TWOtyzKXqePJfXjWI7Y25wVzQN7mx15mil7Ai1AZ8Vv0SH3W679XXprvhub
	 weatDgbrQXPz5+Cm54AhqgwYlK/33JT70QO/kGWKWOBsItxDALbJ4hohx5qakilVW5
	 fylQSEdJTa5sjaUpVRf4IQWTHnQejBQshvhH/o7sDO85csz7+HJ6WIfqQt3uQM0oXk
	 yZpa30+HbqI3z+rjjmSKTc1qdjZcPZChB953huqP56W7EAKL+qDGg4BW1puyQUyavi
	 KJTqGRHQGHmFi4zjezqG8DDzMLIAVAO9ksZI2rwnF6Ty7Qa9LPwnhQYWyHmUpjnr5d
	 JylIB7+2YQ9Lw==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Christophe Chapuis <chris.chapuis@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] lvgl: Drop unnecessary PV append
Date: Fri, 22 Mar 2024 21:49:14 +0100
Message-ID: <20240322204951.43007-2-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322204951.43007-1-marex@denx.de>
References: <20240322204951.43007-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 20:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109528

The PV has been appended because the source has been pulled from
git as of specific revision past 9.0.1 release of LVGL. The current
source is pulled as of tagged release 9.1.0, drop the extra git
suffix.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Christophe Chapuis <chris.chapuis@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb | 1 -
 meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb         | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb b/meta-o=
e/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb
index 542b70ea2..2bf56e293 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb
@@ -17,7 +17,6 @@ SRC_URI =3D "\
 SRCREV_demo =3D "dccc6a1ca48372aa993dbea7a8e17dec6f42df6a"
 SRCREV_lvgl =3D "e1c0b21b2723d391b885de4b2ee5cc997eccca91"
 SRCREV_FORMAT =3D "demo_lvgl"
-PV .=3D "+git${SRCPV}"
=20
 EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
=20
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_9.1.0.bb
index 304068399..353d0002f 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "\
 	file://0007-fix-cmake-generate-versioned-shared-libraries.patch \
 	"
 SRCREV =3D "e1c0b21b2723d391b885de4b2ee5cc997eccca91"
-PV .=3D "+git${SRCPV}"
=20
 inherit cmake
=20
--=20
2.43.0



Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0668E731CD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jul 2016 02:15:27 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id o80so21133247wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jul 2016 19:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=RkrNwKrFdC0OYkfDvQux4X3I3KM7baCZm6JdrWxIU3Q=;
	b=QRm1+iYxr6AI+dR6MaCnB0Ku3RPVTCAlAeSCXPL6XhZujnx33jEDb4E2s1A4e/IB8p
	aypqGveOiMYA0uHmq6UVwHeGwq9OCLVVKvO6XXv3WO7VRY9rkqyAkYWAkhFVDXpI5g0B
	udAsrlyIvVUzxsVR/vRM6qOF2Rs3ABBcmbwwGHrduasLhbBQxuEUeZRj0U+ESorZZkuD
	MZ1lXANGfPCYyD/F5hKMg4EDzYeOk5YoXmjdwqU53iOr0NSjOKZGlymRMzzWiVGnJUAz
	liWPJupJBSnWue5+L6w6cAlaa/0A1xpaLWCGdOICYabf58ou+WUDO9Vp6kJneOTB9qcq
	IVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RkrNwKrFdC0OYkfDvQux4X3I3KM7baCZm6JdrWxIU3Q=;
	b=RUygRdFaZN4jto4xVm8AehMguXyOtFZVCXsM31b+6BX8T1H/cnQNb0OLAtb+Xd9rev
	CnXgzqafGSuGwsur8AEpRZ6KK5l2DBZaKFZJTfgQrAV6jLfZ+lyGF3cfcNnHqdsQTg2X
	+JmnvsOAU9TdYSpKlFK4Uhl5d3ljekxWhNoBD2mhlX0rg7hm4e0fyhV5gr9I9t+0LCH7
	fZUe7vGw2PI9kK26PoNV3/tiH26nZwP+2tukrNi0H9J7a6UMdy6KgikK2Hj3K/kflMoF
	rhiDmqfA8mIL+MIN6Eu6Cqsk9Hqr3ZhRCRH7bTlJZBm92cUQXMS3UEZUwGrxSnib77lc
	RpzQ==
X-Gm-Message-State: AEkoouuvQG8Ph6qeGRfkfeq7BulpQ1H8+VZFa5cV3Oj0BjPmtcR2Dz4vuIyf7vLHOmddag==
X-Received: by 10.28.196.136 with SMTP id u130mr7202980wmf.83.1469931327809;
	Sat, 30 Jul 2016 19:15:27 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0B1C.dip0.t-ipconnect.de.
	[91.10.11.28]) by smtp.googlemail.com with ESMTPSA id
	r16sm10078788wme.16.2016.07.30.19.15.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Jul 2016 19:15:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jul 2016 04:15:02 +0200
Message-Id: <1469931304-13906-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1469931304-13906-1-git-send-email-schnitzeltony@googlemail.com>
References: <1469931304-13906-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] libmbim: update to 1.14.0
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
X-List-Received-Date: Sun, 31 Jul 2016 02:15:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../libmbim/{libmbim_1.12.2.bb => libmbim_1.14.0.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.12.2.bb => libmbim_1.14.0.bb} (80%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
similarity index 80%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
index f1ecce5..f2b8df6 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
@@ -12,5 +12,5 @@ DEPENDS = "glib-2.0 libgudev"
 inherit autotools pkgconfig
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "921fb5ab3f13f1e00833e009d8f3b4f6"
-SRC_URI[sha256sum] = "949351d3e3d69b81e40a49f1d187944c26149e0647a415f0227ccdc112047b29"
+SRC_URI[md5sum] = "2ed809e65c85353d3ab59e372890e549"
+SRC_URI[sha256sum] = "ca8d52a95a18cbabae8f15f83f1572316e888b6504f946e6645d24405127ab5b"
-- 
2.5.5



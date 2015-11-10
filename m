Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 84DD475EE7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:50:01 +0000 (UTC)
Received: by wmww144 with SMTP id w144so136524315wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xPXruyoqaDKXRY6hxDKXgXIbM1WZgqyC5j2asMEpUiQ=;
	b=vh3DtplvppY+vKVivij6i/Ii6cAI720BiEIIPvKRtRbSjcVTt3+I0BZ5KGSsw6Vo2E
	xqGGxkaaSxEWmJPyDEo9fC39C9PN8Cn8ya1JueYSRnfX8RMyHhoDkb+H2X6H8FaKTSTc
	87GFv27mlNLl0gIDfByRtLQxTBShlvxjgT91LLL7b5dKWpjSbKRHIMURkfgTj+DXowc4
	GEeoVaeJEo/IZWmZ/ZI2eiGMMm/rhQsEf5Xb/dsH0zpi9S6hR3/XD8FruL3TY/lSU++P
	O12wxpP5qTX/gOaiGQcxC8wFzr/xDawgq1DYb5AK6+SaTRdMSHmCtSo64QAN/tISy+5s
	WMsg==
X-Received: by 10.28.1.146 with SMTP id 140mr1232114wmb.73.1447192200794;
	Tue, 10 Nov 2015 13:50:00 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm4763171wjd.32.2015.11.10.13.49.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:50:00 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 22:49:08 +0100
Message-Id: <1447192164-9399-2-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 01/17] libqmi: update to 1.12.6
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
X-List-Received-Date: Tue, 10 Nov 2015 21:50:03 -0000

ModemManager 1.4.12 needs at least qmi-glib version 1.12.4

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../libqmi/{libqmi_1.12.2.bb => libqmi_1.12.6.bb}                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.12.2.bb => libqmi_1.12.6.bb} (80%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb
similarity index 80%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb
index 789692b..7a15527 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb
@@ -12,5 +12,5 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "5b3b6b37a57e2fa828fd4cb6f86d7a9f"
-SRC_URI[sha256sum] = "d1661d73b510482b29b93b7e396756c433d35360b3d44c72afa7921339a98624"
+SRC_URI[md5sum] = "24c9eb300662ba6cff0152de89bd9ec0"
+SRC_URI[sha256sum] = "0857bffece4e8ddfa7f721dd9ca63b4c78de345ac9ae2faebf04062cacba3780"
-- 
2.4.3



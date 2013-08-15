Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 29B7E6B83F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:20:00 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so182326eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=uGA9/oBYNn2zt+fIsDWAr9yqoI74v0xpGDJchGnPLEQ=;
	b=QvqG5gvUH2N0geqQYpNK0dFG0xE5fjb3AtZjuNBHI6izUmSTlYfmGNbtJAJBwYdC2g
	2K4/oWgoSJCY1h4HgGZjHU1GMEcTZ3O6IUB+14hcer6c8bTOB82a7usC/nXBGVKD5FlN
	cgxRCa3ShY1iI0vJNv3PWAG+RCST4Orz2BEE02WPsTuHzUWh/xqgrjwO2BDXVRWuTWWm
	8P14IE204y3eGN/A3eMlrsrt5Bts+dcU/vwbeksjCDQzFZbje5SeHztye/obvRCc0RuR
	JePfHvCmhiwGzrjvtWWTcrT+1dyMUs2Gw2tA6z4WpJEzNx12MhGU8g5WZtb9UhGo2BbO
	ykkg==
X-Received: by 10.15.99.133 with SMTP id bl5mr109451eeb.92.1376551200615;
	Thu, 15 Aug 2013 00:20:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm68748273eeh.8.2013.08.15.00.19.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:20:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:30 +0200
Message-Id: <027c47a58ae3ca718fae4d195ee27323c7533232.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 50/60] farsight2: add PACKAGECONFIG for gupnp
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
X-List-Received-Date: Thu, 15 Aug 2013 07:20:00 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/farsight/farsight2_0.0.22.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
index 5abf1d7..a1029b3 100644
--- a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
+++ b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
@@ -11,6 +11,9 @@ DEPENDS = "libnice glib-2.0 libxml2 zlib dbus gstreamer gst-plugins-base"
 
 inherit autotools
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gupnp] = "--enable-gupnp,--disable-gupnp,gupnp-igd"
+
 EXTRA_OECONF = " \
     --disable-debug \
     --disable-gtk-doc \
-- 
1.8.3.2



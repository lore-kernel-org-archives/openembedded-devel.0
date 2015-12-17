Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id BA44A6E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 12:37:02 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l126so19404977wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 04:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bknoOhnUvBWoDOqqAZgoGwf1tlRaD2UdzatpNyZxyuk=;
	b=Jch5O43laz8EKGITfxrKFY023qvq1L8EgRv0zceOu/CeF7iGHQSWT3HE+R/wmVM3fk
	hU91MTvpreWVZTheaEgD7yKTuiL9+tzgFqv9cafv8T2vMLvr6Zl62c6TmqsWUStS7gQh
	OsPhC1X9FcfomJWXJJtI42VK6BcC8C91OvZbKki+8Afk2DQLUMbfU3VLqKFX03UiBQ04
	LklTTwevEvj7oucRUAPc+4XBq2BScEjljMcfoqAK7nAjkbix6g6R6bD3PVjfRqA54AWG
	YiLtRXm2RLhtR86YiNeCdLyYpMms4jiaotIvQVJTXYT5tVoA/w0CQ/DRTG6qKukyq3nD
	QqFA==
X-Received: by 10.28.6.130 with SMTP id 124mr3931413wmg.7.1450355822567;
	Thu, 17 Dec 2015 04:37:02 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c4sm10299770wjs.36.2015.12.17.04.37.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Dec 2015 04:37:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Dec 2015 13:39:20 +0100
Message-Id: <1450355960-1110-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH][meta-oe][dizzy] libssh: depends fix
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
X-List-Received-Date: Thu, 17 Dec 2015 12:37:03 -0000

From: Armin Kuster <akuster808@gmail.com>

the default was to build with GSSAPI enabled.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.6.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.6.3.bb b/meta-oe/recipes-support/libssh/libssh_0.6.3.bb
index 771a47a..0a944c6 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.6.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.6.3.bb
@@ -18,6 +18,9 @@ EXTRA_OECMAKE = " \
     -DWITH_ZLIB=1 \
     "
 
+PACKAGECONFIG ??=""
+PACKAGECONFIG[gssapi] = "-DWITH_GSSAPI=1, -DWITH_GSSAPI=0, krb5, "
+
 inherit cmake
 
 do_configure_prepend () {
-- 
2.6.4



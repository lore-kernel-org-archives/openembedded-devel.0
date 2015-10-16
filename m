Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id B271E7714C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 13:58:06 +0000 (UTC)
Received: by wijp11 with SMTP id p11so11818725wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=auDtU2yt4I4YtQnfVDi5rxxTG2z+YeSDpV5MU4/klUc=;
	b=JOPiS2ILg5e+0ejDW6B4n9T54wJWNGExh6VYZJgBpAjJ7srcUBHsG0oq0Z+AZDQtxe
	kurS3DAUCb9KgB+TbVLZXH2uPruVjQj9IBT5EFiliveneBsPVDBdnT/+nlTaFqHLQbua
	j67h+sFHpnMUDE5ZUoi6RFYrgK7RspQcBmUoUrXByZBhaO5T2KEB+CGB6DzzjP770epC
	PCsYoRVabXyvz7BBOxvODtOOe1qdlviU3izfprK3y7WZnbKkFyIMf6chg5o6WSAPhNKu
	ZgWSFhTAlUxzGyCZ6l+5u3N0vTsOscfUKuAJAUQw+FQQIe/z95eTMzuDsuxE967pEAXl
	QxvQ==
X-Received: by 10.180.88.164 with SMTP id bh4mr4984552wib.18.1445003886414;
	Fri, 16 Oct 2015 06:58:06 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id x16sm3355562wia.7.2015.10.16.06.58.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Oct 2015 06:58:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Oct 2015 15:58:28 +0200
Message-Id: <1445003910-6444-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1445003910-6444-1-git-send-email-Martin.Jansa@gmail.com>
References: <1445003910-6444-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][dizzy 2/4] gupnp-igd: fix missing dependencies
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
X-List-Received-Date: Fri, 16 Oct 2015 13:58:09 -0000

* add gobject-introspection-stub-native to fix:
  | doc/Makefile.am:70: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
  | libgupnp-igd/Makefile.am:65: error: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
* add sqlite3 to fix:
  WARNING: QA Issue: gupnp-igd rdepends on libsqlite3, but it isn't a build dependency? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
index 112bc4b..667f7ef 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libgupnp-igd/gupnp-simple-igd.c;beginline=1;endline=21;md5=aa292c0d9390463a6e1055dc5fc68e80"
 
-DEPENDS = "glib-2.0 gupnp"
+DEPENDS = "glib-2.0 gupnp gobject-introspection-stub-native sqlite3"
 
 SRC_URI = "http://download.gnome.org/sources/${BPN}/0.2/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "f881323304185c02634034e3bda714ba"
-- 
2.6.1



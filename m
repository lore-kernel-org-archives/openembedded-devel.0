Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 114A070276
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 14:02:04 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id k14so7510347wgh.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 07:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ndhdi9oGvgDfAB9l79a8MR822rHwxk6pzahlPMm+Q38=;
	b=PegXwzm4aFnPljJGvCh9dU11/9pCmsslmNX5b+5QKomu3OnpWgkbA/pzCM037ft/sX
	pUFOsGtGm1r1LuS3N0C6BUif0TgdMQZNmQuIUMO/YJ+KzZCcXwOskM4zyfWsw7LdT/Z8
	hUmEohhUsjQKzjmcawa9xjnZV1Q/t7UyRJK690P+ngNfMMmqlxkylmi+3rzozVm3LwqS
	FhgxM8T+eiDIcEUxne/RHlJWQ+x9tDW8+MzhCjlTeolrZsXElUgEDSAitZbcWGWa4Eu/
	kqEZj3hEeDXQud39hZ14iWSk9YriJxHTxl7bKqIuDWIus6F74pBAODwTFVlrclmjziyv
	9Ohg==
X-Received: by 10.180.35.134 with SMTP id h6mr18120729wij.0.1407679323703;
	Sun, 10 Aug 2014 07:02:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u7sm31499276wif.3.2014.08.10.07.02.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Aug 2014 07:02:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Aug 2014 16:02:25 +0200
Message-Id: <1407679345-31695-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407679345-31695-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407679345-31695-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 7/7] tracker: add PACKAGECONFIG for nautilus extension
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
X-List-Received-Date: Sun, 10 Aug 2014 14:02:05 -0000

* fixes following floating dependencies:
  WARN: tracker: tracker-nautilus-extension rdepends on atk, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on cairo, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on eglibc, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on expat, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on fontconfig, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on freetype, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on gdk-pixbuf, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on glib-2.0, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on gtk+, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on harfbuzz, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libffi, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libpng, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libsqlite3, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libunistring, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libx11, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libxau, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libxcb, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libxcb-render, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libxcb-shm, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libxdmcp, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libxext, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libxrender, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on pango, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on pixman, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on tracker, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on util-linux-libuuid, but it isn't a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on zlib, but it isn't a build dependency?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-support/tracker/tracker_0.14.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
index 21df29d..d412183 100644
--- a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
@@ -26,6 +26,9 @@ SYSTEMD_AUTO_ENABLE = "disable"
 
 EXTRA_OECONF += " tracker_cv_have_ioprio=yes"
 
+PACKAGECONFIG ?= "nautilus"
+PACKAGECONFIG[nautilus] = "--enable-nautilus-extension,--disable-nautilus-extension,nautilus"
+
 # Disable the desktop-centric miners
 EXTRA_OECONF += "--disable-miner-thunderbird --disable-miner-firefox \
                  --disable-miner-evolution --disable-miner-flickr"
-- 
2.0.4



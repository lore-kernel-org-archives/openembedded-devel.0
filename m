Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id E89596B5CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:53:51 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so1994834eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2013 01:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3Wth8UIfxOgsnoGi+/FweXVup0sBiWEUr4Dp6ipmjjI=;
	b=IyLbfSGMHDzUB9GbJpu9o32rp5GHZ2M9sIqQfZOVzosZvkO/ugSCnwyo645sB9WTox
	2zwFvTcb2eRgjKHtijmqnYFhywSvRqS3WbxsppddJlSm+CkHp8da4JnWvx+pxLfnhyt0
	A35ql4P5ZCwDSUEv2PTItkYd+bKITndcqRrH8RN1uDZ9dlnByROS/HfY/H6q+gGaYwzp
	PZeBTfF5Jq2fd5YbbCQo11D72sKhgXSLkdFI7XigUiwB2LqEGi8ZrgD/hs3th1myZCaR
	TDZCemmGMKDuq+6xt1jiDDSykuZ8E7jYjDKpvhPygBFW6X4lTdmQvjvsQ2/Xx72iE70G
	cF/Q==
X-Received: by 10.14.149.3 with SMTP id w3mr12346574eej.84.1376038432385;
	Fri, 09 Aug 2013 01:53:52 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm26806670eex.2.2013.08.09.01.53.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 01:53:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Aug 2013 10:54:24 +0200
Message-Id: <1376038471-32202-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
References: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 05/12] libwnck(3): add PACKAGECONFIG for startup-notification
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
X-List-Received-Date: Fri, 09 Aug 2013 08:53:52 -0000

* it's autodetected from sysroot and couple of packages are failing
  when pkg-config is trying to use libwnck*.pc without
  startup-notification in sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb | 3 +++
 meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
index e54b8d3..20c100a 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
@@ -9,6 +9,9 @@ DEPENDS = "gobject-introspection-stub gtk+3 gdk-pixbuf-native"
 
 PR = "r1"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
+
 inherit gnome
 SRC_URI[archive.md5sum] = "e4ea87320dd0600a81c50186e3804aae"
 SRC_URI[archive.sha256sum] = "4946b612c22d53238810d431f1b05c21f073f201edfd247ff74e2fa228618083"
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb b/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
index 935d4a3..03fbcf5 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
@@ -7,6 +7,9 @@ PR = "r2"
 SECTION = "x11/libs"
 DEPENDS = "gobject-introspection-stub gtk+ gdk-pixbuf-native"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
+
 inherit gnome
 SRC_URI[archive.md5sum] = "4162d5b96151e6d24ec02ae3a822203c"
 SRC_URI[archive.sha256sum] = "56b6681e89cd45491bb640165d62276d81369a08974042b26645dc1e0e954cc1"
-- 
1.8.3.2



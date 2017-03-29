Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 34EC971A30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:16:52 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id w43so1217819wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 02:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S9UhkHxNiI4oOpggdm5MJ9swWt3OrxlaLVdyytzvSKU=;
	b=SodHoyW3XXHFlhxQ3S3Df+S1scpzY3RZfXUu7u6xebvg7dikPxHTB9biCZ11ti6OmZ
	GOmF6/QPHQmTi6zCy4y8pQRwbLGBeohCjSd1dWbx9hwym4/cv59c3H0yQqvg++pVsjbq
	k6wn53hcev9lBRbdt2ldGYRVwFhIOVe1VNEwM6nj8f5P/9LcAOi8CierkUhb9t8++YvX
	4XtmVxzFufAqZhrwjafzNZWPHQkP8wQO11ciOYzGg5gADmFM8qo+QVd9WAWI/uSw0dmG
	/SrlEaa2dgz8uDtZJKGFl17BRUBgztsB385156mpnQkx8zBQDe5/6q3drlVz1oc7O25D
	dFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S9UhkHxNiI4oOpggdm5MJ9swWt3OrxlaLVdyytzvSKU=;
	b=ek9F9oyqm/QkijcjJWin5U4IVUNR/EkYhLCgpqATAZ7obkLxe7YHzV8PqPVtW6EiyZ
	t2QmcS23wjFq8pCCuqYY7tq7Z1+roCCPYQW5Kmv7HhHOQ5kI7w/iFWU47ZOC/cpSFo+2
	yp7QujTtRx6Pk9SMjnycZApxsoS7DXgmNbxUFJrUO+8sXgJFs+E1aKzsNyoUD5+ChNhh
	40pEUyWFYigP8WCnDxSu6i3aRCwBNB5KadT5esUE+wD67+QDBC5pmQdK/h5/lZF5rj4+
	2tWLiTtNwpF0nOUH8mqYbPCIer/WGOz4oleZHJmlig+M03/T8/UJ/Ai7hVpZdOcpm0kX
	KMAA==
X-Gm-Message-State: AFeK/H2Gp5K7ZlPm5Hkl6wOQzML15TT4AYw8+c1PeZOlC0kROwplqwuV8n35d/exlmImSg==
X-Received: by 10.223.164.210 with SMTP id h18mr13887444wrb.128.1490779013262; 
	Wed, 29 Mar 2017 02:16:53 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	140sm7304099wmg.18.2017.03.29.02.16.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Mar 2017 02:16:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Mar 2017 11:16:40 +0200
Message-Id: <20170329091643.32180-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170329091643.32180-1-Martin.Jansa@gmail.com>
References: <20170329091643.32180-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 6/9] vboxguestdrivers: make sure that do_compile fails when some module failed to build
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
X-List-Received-Date: Wed, 29 Mar 2017 09:16:52 -0000

* otherwise we get the failure from do_install with useless log:
  DEBUG: Executing shell function do_install
  install: cannot stat 'vboxsf.ko': No such file or directory
  WARNING: exit code 1 from a shell command.
* instead of the real issue like 5.1.14 currently has with default linux-yocto
  version:
  CC [M]  qemux86-oe-linux/vboxguestdrivers/5.1.14-r0/vbox_module/vboxsf/lnkops.o
          qemux86-oe-linux/vboxguestdrivers/5.1.14-r0/vbox_module/vboxsf/lnkops.c:93:23: error: 'generic_readlink' undeclared here (not in a function)
     .readlink       = generic_readlink,
                       ^~~~~~~~~~~~~~~~

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb | 4 ++++
 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.14.bb | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb
index f8a24a508..0c08d97f8 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb
@@ -41,6 +41,10 @@ do_export_sources() {
 # compile and install mount utility
 do_compile_append() {
     oe_runmake 'LD=${CC}' 'LDFLAGS=${LDFLAGS}' -C ${S}/utils
+    if ! [ -e vboxguest.ko -a -e vboxsf.ko -a -e vboxvideo.ko ] ; then
+        echo "ERROR: One of vbox*.ko modules wasn't built"
+        exit 1
+    fi
 }
 
 module_do_install() {
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.14.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.14.bb
index dde5b0b20..c27791e95 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.14.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.14.bb
@@ -41,6 +41,10 @@ do_export_sources() {
 # compile and install mount utility
 do_compile_append() {
     oe_runmake 'LD=${CC}' 'LDFLAGS=${LDFLAGS}' -C ${S}/utils
+    if ! [ -e vboxguest.ko -a -e vboxsf.ko -a -e vboxvideo.ko ] ; then
+        echo "ERROR: One of vbox*.ko modules wasn't built"
+        exit 1
+    fi
 }
 
 module_do_install() {
-- 
2.12.2



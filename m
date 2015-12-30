Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6C98A6FFC8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 16:46:29 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l65so64872024wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 08:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qEOfkx5+dnFpSn3P9YPgE1uW0/GHb8dVfWaGq7JEwOU=;
	b=V6mPwvaXrYsgUrcVBLbXcJGlvgBMhhcU0qz7ugElELg2W5wq+2b6hmd6J4949qrABH
	eKi18ijY1gsq0QVVfwX8eIf6RlUnrJAEmGhHpvpJT1jCnl/CNvq8G16+goMMHfHYMuEr
	mJEbI9nK4mLZS6UviFw0eyM3bcxHzhmMmVJzcN1nvw5qxZjgsMyMeODdiU7o7wCDThL4
	bv6DPxx7WvD7uvwDiWfRruZn3hi9ZVnRzI5eBfGWpGh2znjiPQz0NDOZaBM8AzpJ8h48
	KCINeRRgdZ8DE+3zaDqLYkJRymh0FLYtUBS28pgtejDQUu2plAPpozLUjQfBqc0hqdUT
	iYXg==
X-Received: by 10.28.186.85 with SMTP id k82mr52893854wmf.77.1451493989616;
	Wed, 30 Dec 2015 08:46:29 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	e198sm6111664wmd.0.2015.12.30.08.46.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Dec 2015 08:46:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Dec 2015 17:50:01 +0100
Message-Id: <1451494201-30941-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1451494201-30941-1-git-send-email-Martin.Jansa@gmail.com>
References: <1451494201-30941-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][jethro][master][meta-networking 2/2] cifs-utils: add PACKAGECONFIG for cifsidmap
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
X-List-Received-Date: Wed, 30 Dec 2015 16:46:29 -0000

* cifs.idmap links with keyutils as log.do_package shows:
  DEBUG: cifs-utils: Dependency libkeyutils.so.1 requires package keyutils (used by files: /home2/mjansa/build/build-starfish-jethro/BUILD/work/h15-starfish-linux-gnueabi/cifs-utils/6.4-r0/packages-split/cifs-utils/usr/sbin/cifs.idmap)
* that causes following QA issue when keyutils are autodetected from
  sysroot:
  WARNING: QA Issue: cifs-utils rdepends on keyutils, but it isn't a build dependency? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/cifs/cifs-utils_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
index 34630da..87306a6 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
@@ -18,6 +18,7 @@ PACKAGECONFIG[cap] = "--with-libcap,--without-libcap,libcap"
 PACKAGECONFIG[cifscreds] = "--enable-cifscreds,--disable-cifscreds,keyutils"
 # when enabled, it creates ${sbindir}/cifs.upcall and --ignore-fail-on-non-empty in do_install_append is needed
 PACKAGECONFIG[cifsupcall] = "--enable-cifsupcall,--disable-cifsupcall,krb5 libtalloc keyutils"
+PACKAGECONFIG[cifsidmap] = "--enable-cifsidmap,--disable-cifsidmap, keyutils"
 PACKAGECONFIG[pam] = "--enable-pam --with-pamdir=${base_libdir}/security,--disable-pam,libpam keyutils"
 
 inherit autotools pkgconfig
-- 
2.6.4



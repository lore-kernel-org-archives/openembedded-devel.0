Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 61B4C78CFD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jul 2018 02:39:39 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id f1-v6so4212492pgq.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 19:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Qy11YN55GLslJojdOL/g0YfZ6IaaGLfrOgt/MpTAEFk=;
	b=BlosMzZBcKsUDF7SmVHu1VQ4oeFfd9XRGQjleBNY/Gu+9SNj45I9vNwRpQAJPGBY6J
	HBxvmp6dCIoNz4Iq2AHkwWbYAz1KTo8YMq7w9zKvmvzO3BiR1z2u284qf1Jl3mFr7i9N
	kuQM1AGSLTfJVjBjHfv2m94KFZtDmlkap1/Eqf/sLGH4AMeHjII2tcgps0vKdyZTO5+l
	K9KV6V81Rlz7dN/e/z/rYVludCr8sr0vgmJ5xt7CIWBRmyxBfz9ikFOGedH8AuTf6Ndm
	skSPtGjAaWAq8JYmozhIwmzCAnDYJ4LhcqTHUAc3zmQEOiBf5rIh/6Qlqbzu9r5m/JYR
	spJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Qy11YN55GLslJojdOL/g0YfZ6IaaGLfrOgt/MpTAEFk=;
	b=B45xBw6Ao1MmlON7/o7TDkhgtlvC076cOiBLWv60pHc118fH5lXbxP9p8VD//imnZ3
	XtewLPQswV3TvLYqyKzQGtPPd2P3F6HI+SPe3SMz7D3GqzeQbjqCptu/uktGCgrag9T2
	opa3cqVAB1kK5N9tM+5plyiHuj4uVa1dris2DHRjy8gyDHLCM6xcHI5McZYEcaQ8Kz7Z
	SJT6DMo6iPscgx2KD0V8d3Rsjg5qD30c1Mx2APUxu/3ze1iC556m98ge/5qOhVLtVCez
	gO2wXPK7Duv/h6QKMNupANAaId33t198pV03s1jFUITU9v8I8unUhrtiC/JiyPGGBVhw
	wF/g==
X-Gm-Message-State: AOUpUlFnL1xln2ayWF+cZNbIpxC6ZGkZWQq6Tfx/pNQmhHITwPtju1tM
	lkUXS8oxIo3FlHDFgG9ah9bt2wjK
X-Google-Smtp-Source: AAOMgpdH0WaHSwgTixZfYmwXbfL+CE2ZPzY2zc8rIvWONEqcSPnP08+r1x/2924OWL06DnbPxFFG/Q==
X-Received: by 2002:aa7:86d7:: with SMTP id
	h23-v6mr9040292pfo.132.1532745580324; 
	Fri, 27 Jul 2018 19:39:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::ee7a])
	by smtp.gmail.com with ESMTPSA id
	m20-v6sm8749341pfg.61.2018.07.27.19.39.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 19:39:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 19:39:30 -0700
Message-Id: <20180728023930.25045-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180728023930.25045-1-raj.khem@gmail.com>
References: <20180728023930.25045-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH] samba: LDB 1.4.0 breaks Samba < 4.9
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
X-List-Received-Date: Sat, 28 Jul 2018 02:39:40 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ild-Samba-against-a-newer-minor-vers.patch | 86 +++++++++++++++++++
 .../recipes-connectivity/samba/samba_4.7.8.bb |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch b/meta-networking/recipes-connectivity/samba/samba/0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch
new file mode 100644
index 0000000000..4c94831d7f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch
@@ -0,0 +1,86 @@
+From 0bc8bc4143a58f91f6d7ce228b6763f377fdf45a Mon Sep 17 00:00:00 2001
+From: Andrew Bartlett <abartlet@samba.org>
+Date: Thu, 12 Jul 2018 12:34:56 +1200
+Subject: [PATCH] ldb: Refuse to build Samba against a newer minor version of
+ ldb
+
+Samba is not compatible with new versions of ldb (except release versions)
+
+Other users would not notice the breakages, but Samba makes many
+more assuptions about the LDB internals than any other package.
+
+(Specifically, LDB 1.2 and 1.4 broke builds against released
+Samba versions)
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=13519
+
+Signed-off-by: Andrew Bartlett <abartlet@samba.org>
+Reviewed-by: Gary Lockyer <gary@catalyst.net.nz>
+(cherry picked from commit 52efa796538ae004ca62ea32fc8c833472991be6)
+---
+ lib/ldb/wscript | 32 ++++++++++++++++++++++----------
+ 1 file changed, 22 insertions(+), 10 deletions(-)
+
+diff --git a/lib/ldb/wscript b/lib/ldb/wscript
+index d94086b..2bb0832 100644
+--- a/lib/ldb/wscript
++++ b/lib/ldb/wscript
+@@ -62,23 +62,33 @@ def configure(conf):
+     conf.env.standalone_ldb = conf.IN_LAUNCH_DIR()
+ 
+     if not conf.env.standalone_ldb:
++        max_ldb_version = [int(x) for x in VERSION.split(".")]
++        max_ldb_version[2] = 999
++        max_ldb_version_dots = "%d.%d.%d" % tuple(max_ldb_version)
++
+         if conf.env.disable_python:
+-            if conf.CHECK_BUNDLED_SYSTEM_PKG('ldb', minversion=VERSION,
+-                                         onlyif='talloc tdb tevent',
+-                                         implied_deps='replace talloc tdb tevent'):
++            if conf.CHECK_BUNDLED_SYSTEM_PKG('ldb',
++                                             minversion=VERSION,
++                                             maxversion=max_ldb_version_dots,
++                                             onlyif='talloc tdb tevent',
++                                             implied_deps='replace talloc tdb tevent'):
+                 conf.define('USING_SYSTEM_LDB', 1)
+         else:
+             using_system_pyldb_util = True
+-            if not conf.CHECK_BUNDLED_SYSTEM_PKG('pyldb-util', minversion=VERSION,
+-                                             onlyif='talloc tdb tevent',
+-                                             implied_deps='replace talloc tdb tevent ldb'):
++            if not conf.CHECK_BUNDLED_SYSTEM_PKG('pyldb-util',
++                                                 minversion=VERSION,
++                                                 maxversion=max_ldb_version_dots,
++                                                 onlyif='talloc tdb tevent',
++                                                 implied_deps='replace talloc tdb tevent ldb'):
+                 using_system_pyldb_util = False
+ 
+             # We need to get a pyldb-util for all the python versions
+             # we are building for
+             if conf.env['EXTRA_PYTHON']:
+                 name = 'pyldb-util' + conf.all_envs['extrapython']['PYTHON_SO_ABI_FLAG']
+-                if not conf.CHECK_BUNDLED_SYSTEM_PKG(name, minversion=VERSION,
++                if not conf.CHECK_BUNDLED_SYSTEM_PKG(name,
++                                                     minversion=VERSION,
++                                                     maxversion=max_ldb_version_dots,
+                                                      onlyif='talloc tdb tevent',
+                                                      implied_deps='replace talloc tdb tevent ldb'):
+                     using_system_pyldb_util = False
+@@ -86,9 +96,11 @@ def configure(conf):
+             if using_system_pyldb_util:
+                 conf.define('USING_SYSTEM_PYLDB_UTIL', 1)
+ 
+-            if conf.CHECK_BUNDLED_SYSTEM_PKG('ldb', minversion=VERSION,
+-                                         onlyif='talloc tdb tevent pyldb-util',
+-                                         implied_deps='replace talloc tdb tevent'):
++            if conf.CHECK_BUNDLED_SYSTEM_PKG('ldb',
++                                             minversion=VERSION,
++                                             maxversion=max_ldb_version_dots,
++                                             onlyif='talloc tdb tevent pyldb-util',
++                                             implied_deps='replace talloc tdb tevent'):
+                 conf.define('USING_SYSTEM_LDB', 1)
+ 
+     if conf.CONFIG_SET('USING_SYSTEM_LDB'):
+-- 
+2.18.0
+
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.7.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.7.8.bb
index fc1a2e0fd0..9858a18c49 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.7.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.7.8.bb
@@ -24,6 +24,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://dnsserver-4.7.0.patch \
            file://smb_conf-4.7.0.patch \
            file://volatiles.03_samba \
+           file://0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch \
           "
 SRC_URI_append_libc-musl = " \
            file://samba-pam.patch \
-- 
2.18.0



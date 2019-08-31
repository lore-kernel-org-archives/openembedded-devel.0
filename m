Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id B91FD7F4BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:31:58 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id m9so4888859pls.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ccBsDv23yj+zHmMIpQwxuz6bcBCNsm6QTULF53GWrpk=;
	b=CRODFxxS3Xg3e2ZygbY/g23+ZLn6MjLmaKO5wR+UY8sSRfaD8h6+EHEvjmCUVtHlrp
	GN1/FdazDcAocLJR6oitXTRgwFGQqbN6HE4ve1yMmZE7PV9IqQIPnLSBZ0M3kbzv6sAi
	88bGzxQ0/RpN+CNKDAe712Z0XxG3QUhW0dQYBDWceCLq/4Vyic+Q5I0wF2RAyLPCtCYm
	qsg3Zr/mcsIQrzD8a8MchD0V/uNR5XFajKKWtPbPwEJxGG+AYY3GfyPoGlqDHPgbgy/r
	eqbwTCRtG8kyrgiZ6p7HkXZ8i1S9kZzP5iQPidaUhPVVAmCZAUAf2oVfftDQKUupmuVu
	GwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ccBsDv23yj+zHmMIpQwxuz6bcBCNsm6QTULF53GWrpk=;
	b=KHkzS2oIMUiGwF+ROueuKQBIMBNwUJmd/DwZa7W84B5BmsEshUYS37vBnlZIfpfElP
	eS3vIumnOXFyD9etrnU8vvShWlD2vlEZ8HvI1rcUAC7c1HTdB01raQNXGG+3MhkXrJEo
	TUyigIQup1sChW7FAJwczAWZgcnWDKDcH9ZKHEcmlQtzDkbnRXgTVPIF7dmaPdDdJcYl
	d3sc9YVU+o9yVzrWEPah8w+m0vP9U+JZ+uz5TeT9RtAj/ol9EmHysARTyvI9H5VjCl9O
	ZGHi5QhB/fQd0bT6yc5hrKYEfibQ0OZHdXtevVIiCj1CLTpxK0U4Qg42oY8O86GeA3nA
	Dtzg==
X-Gm-Message-State: APjAAAU/oUWqGJLD42TRjhl2lqQ5byBLyo8wvtdbN8HdahHDGaVyNGWn
	xQ88br3sdb0jPbrF2peQuIKxh4Uq
X-Google-Smtp-Source: APXvYqxqjS2Q8zfiiVpIAyXHXdsJo4Frmh/Wyw8v0dTKC6uLl3z9mDoDxydctuEw5q7nkKtt6+fwag==
X-Received: by 2002:a17:902:26b:: with SMTP id
	98mr22690483plc.61.1567287119663; 
	Sat, 31 Aug 2019 14:31:59 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.31.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:31:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:34 -0700
Message-Id: <e081b879c76663068b6a473ce61cf5d6a83e4b0e.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 13/23] ntop: fix missing return from non-void function
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
X-List-Received-Date: Sat, 31 Aug 2019 21:31:58 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../fix-missing-return-from-non-void-function.patch   | 19 +++++++++++++++++++
 meta-networking/recipes-support/ntop/ntop_5.0.1.bb    |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch

diff --git a/meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch b/meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch
new file mode 100644
index 0000000..e627e59
--- /dev/null
+++ b/meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch
@@ -0,0 +1,19 @@
+Fix following error:
+
+netflowPlugin.c: In function 'netflowUtilsLoop':
+netflowPlugin.c:2144:1: error: no return statement in function returning non-void [-Werror=return-type]
+ 2144 | }
+      | ^
+
+Return NULL like netflowMainLoop does.
+
+--- ntop-5.0.1.orig/plugins/netflowPlugin.c	2012-03-09 17:44:17.000000000 +0000
++++ ntop-5.0.1/plugins/netflowPlugin.c	2019-08-09 10:25:40.878799852 +0000
+@@ -2141,6 +2141,7 @@
+       waitCondvar(&myGlobals.device[deviceId].netflowGlobals->ifStatsQueueCondvar);
+     }
+   }
++  return(NULL);
+ }
+ #endif
+ 
diff --git a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
index 2a7a7f2..80f009b 100644
--- a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
+++ b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/ntop/ntop-${PV}.tar.gz \
            file://use-static-inline.patch \
            file://0001-nDPI-Include-sys-types.h.patch \
            file://0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch \
+           file://fix-missing-return-from-non-void-function.patch \
           "
 SRC_URI[md5sum] = "01710b6925a8a5ffe1a41b8b512ebd69"
 SRC_URI[sha256sum] = "7e8e84cb14d2173beaca4d4cb991a14d84a4bef84ec37b2276bc363f45c52ef8"
-- 
2.7.4



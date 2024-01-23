Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0762C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 17:33:59 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.19452.1706031238076009094
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jan 2024 09:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bflyy9fj;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40eb2f392f0so13517405e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 09:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706031236; x=1706636036; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pD7GPvKxXEZmNh36i61Rz+yfuU/j0LtdNbLhUMF3KYQ=;
        b=Bflyy9fja0muXMSa5K4EC7jkvwA3PbC6sEP9fYYb89x15Xb8kDjrothqIxhEy+cwrH
         PdKbBTtbPFMLR576YfZOykb0K63RoSXsLTBjdCE2zyQ9T0z0/gs6d/moRbDZWfum2sLE
         uRpzTuTtOVAy2P/h8G1qAwJSDHrSKdCU2ZD4ghztbls+dzoKko6K/d+bHqFzty8POoM2
         EA4d9s7B1VG7jP++TuiNrAUaHyPDF9M+YeF5h0OHbwi3vumBBC/koSLTrkBZYE6Y9r2s
         daFRMnIC1vXPjEWbC0gSh4BR3Li+wHx8elG1VBK7zWVRqK9AzpqjB2hNijY04Qyb068t
         NdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706031236; x=1706636036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pD7GPvKxXEZmNh36i61Rz+yfuU/j0LtdNbLhUMF3KYQ=;
        b=HbXV2NIFp8hrIxYy6SyFOlhrlW+ooaAAV+KIiLiUee+CHt81ieSYXIqisWvTq4ykic
         Jv06tHtVVpVfjtG+BoWw3LCPyEhZCMb76wqawUDE2I6e4j/Uqk88MnG1iFmZOmsQ3qI6
         zIs+8h7kMsoKqG3pwWOKPjto81ppNkz5YIiVeDDFsd50WuZv6bH84uOPQRhb101byjyM
         2WlS/06lIjBPe7dHEUE69/YkvzUagdY7uDcDyrf8SPJvhCcNtiROd+9d8Q6+MzJs/ujq
         u22Q1Kwx5zLkzbrCYbKREptgqa2ez6p6AD+pYQ1cyk7SPV5p/hm4yvxCx1Gexlhtkzl8
         SP/g==
X-Gm-Message-State: AOJu0YxqWVmKQMFdQt7IaNa770H9Ko/ZEaJ+wQIorARF139rHiDohvYn
	iJS31zmwi3Ao4tNpXbsT9TMnLeFD10iYExHopJ7edFopwD6uVlrLrbzJ3A44
X-Google-Smtp-Source: AGHT+IE4mCDwVfgLrt/BMCQgHj+8RISbJbIJwYUgublXuUzHmxclXkq07QIbg7441Kt6mvvLc18PRw==
X-Received: by 2002:a05:600c:3781:b0:40e:b21a:7aa0 with SMTP id o1-20020a05600c378100b0040eb21a7aa0mr359139wmr.172.1706031235428;
        Tue, 23 Jan 2024 09:33:55 -0800 (PST)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id fl21-20020a05600c0b9500b0040e9d507424sm16929875wmb.5.2024.01.23.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 09:33:55 -0800 (PST)
From: max.oss.09@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][kirkstone][PATCH] linuxptp: fix do_compile error
Date: Tue, 23 Jan 2024 18:32:58 +0100
Message-ID: <20240123173258.1112540-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 17:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108437

From: Changqing Li <changqing.li@windriver.com>

with make 4.4, linuxptp do_compile will failed with error:
In file included from clock.c:35:
missing.h:61:9: error: redeclaration of enumerator 'HWTSTAMP_TX_ONESTEP_P2P'
   61 |         HWTSTAMP_TX_ONESTEP_P2P = 3,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
In file included from clock.c:21:
/buildarea2/WRLCD_Regression/Rerun/build_dir/11201532-build_scp_world_Feature_Test/qemux86-64-standard-std-OE/build/tmp-glibc/work/core2-64-wrs-linux/linuxptp/3.1.1-r0/recipe-sysroot/usr/include/linux/net_tstamp.h:128:9: note: previous definition of 'HWTSTAMP_TX_ONESTEP_P2P' with type 'enum hwtstamp_tx_types'
  128 |         HWTSTAMP_TX_ONESTEP_P2P,
      |

Following change of make 4.4 changes behavior of shell function:
* WARNING: Backward-incompatibility!
  Previously makefile variables marked as export were not exported to commands
  started by the $(shell ...) function.  Now, all exported variables are
  exported to $(shell ...).

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

Backport of commit 05c1003c4 ("linuxptp: fix do_compile error").
This is present in dunfell/kirkstone as well. If net_tstamp.h of the
build host disagrees with net_tstamp.h of the OE kernel or I remove
the build host's net_tstamp.h do_compile fails.

Changed Upstream Status to Backport with the git sha as the commit is
now applied upstream.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 ...ditional-assignment-for-KBUILD_OUTPU.patch | 42 +++++++++++++++++++
 .../linuxptp/linuxptp_3.1.1.bb                |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-makefile-use-conditional-assignment-for-KBUILD_OUTPU.patch

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-makefile-use-conditional-assignment-for-KBUILD_OUTPU.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-makefile-use-conditional-assignment-for-KBUILD_OUTPU.patch
new file mode 100644
index 000000000..83bdae858
--- /dev/null
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-makefile-use-conditional-assignment-for-KBUILD_OUTPU.patch
@@ -0,0 +1,42 @@
+From dfd38cb29c0768692f886d3ab9158bd2b3132582 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 22 Nov 2022 15:20:48 +0800
+Subject: [PATCH] makefile: use conditional assignment for KBUILD_OUTPUT
+
+Refer [1],from make 4.4, all variables that are marked as export will
+also be passed to the shell started by the shell function. use "=" will
+make KBUILD_OUTPUT always empty for shell function, use "?=" to make
+"export KBUILD_OUTPUT" in enrironment can work.
+
+[snip of 4.4 NEWS]
+* WARNING: Backward-incompatibility!
+   Previously makefile variables marked as export were not exported to commands
+   started by the $(shell ...) function.  Now, all exported variables are
+   exported to $(shell ...).
+[snip]
+
+[1] https://git.savannah.gnu.org/cgit/make.git/tree/NEWS?h=4.4&id=ed493f6c9116cc217b99c2cfa6a95f15803235a2#n74
+
+Upstream-Status: Backport [d3dd51ba611802d7cbb28631cb943cb882fa4aac]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/makefile b/makefile
+index 529d8a0..3db60fa 100644
+--- a/makefile
++++ b/makefile
+@@ -15,7 +15,7 @@
+ # with this program; if not, write to the Free Software Foundation, Inc.,
+ # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+ 
+-KBUILD_OUTPUT =
++KBUILD_OUTPUT ?=
+ 
+ DEBUG	=
+ CC	?= $(CROSS_COMPILE)gcc
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb
index 9c0f56e73..9c8e649b1 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v3.1/linuxptp-${PV}.tgz \
            file://build-Allow-CC-and-prefix-to-be-overriden.patch \
            file://Use-cross-cpp-in-incdefs.patch \
+           file://0001-makefile-use-conditional-assignment-for-KBUILD_OUTPU.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/linuxptp/files/"
-- 
2.42.0



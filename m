Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15579C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 17:54:23 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.529.1706032458601539021
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jan 2024 09:54:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZV3x06OC;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33921b8988fso4073608f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 09:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706032457; x=1706637257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O68qb9JuOCUIV4TxYDJv+OMpvmcYlbYHivTZctv8Z50=;
        b=ZV3x06OColQzteB494C5f4xMVGY5/8Px7RhtVoPsHhGY97PWeQCYeKr+o3guacWEWj
         5TiFYxWimis7T6SgEydSNnZU/B9Z52Ujt/bkyKQYlGzMlFVu4C9ITPsgxhrRQi9g07f1
         I2wBwaptqmBDhhhVvT9NATjiAYEZdux/y76F8iXIFnLy/Rhvxg5n8cdFmxzRDY4Z8c2a
         yisKluONc9ZIFZyD4CNl7zJPmYmXsY1tP5OOOUBpusMZiTKobywBWs6h0tvMzk9Xhghk
         hzmAM23qXO+/K2dXtNAmT+53CUpaRXuqGdr0huD9OJ9OdTc4bScoUWe0ng/fKsFeUsvt
         FigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706032457; x=1706637257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O68qb9JuOCUIV4TxYDJv+OMpvmcYlbYHivTZctv8Z50=;
        b=P0I+T4jHhKhgEMsfFbGsHOnBLLivr3D3xb3OY0BUTvL3DdWdq+E8Nu3/6kIgBn9Nsh
         jQBQlBTtFYiPA7gSbD6RfT7O3cYI1BPP2ISVEeSHZgrvRUdVFSUrUYm9QtCRI+FyQMYt
         n4udbtl0+fuvHoiVCTmOHGSwvkBlBjpGH1Rz9lZoV3lAGF0CUJkHOmhgdVlCxV03SYRV
         R5d7skthwN5pBNji3Wa3APmhE1Duatv6MTX02x9pcTPyxs/USP8kAZgVsWTdqhqQGsdf
         iI1oPguE1o6Kt2wEsRnBdUORpBihGpA7Id0Qyt+M/btKblNujP+JFTs35SfbUBfda3JE
         aYZg==
X-Gm-Message-State: AOJu0YwjLYTqubaX1sSi+rwfYTDscRM7adXW8FTuXC9klPq+58u1W8qh
	RxbZjX/mI2nd9etiSyrC73bkwewFH6NTX8rvU6jpYTVZ13PcH77GiQLR+CEh
X-Google-Smtp-Source: AGHT+IEQ1VEvW1Dkv7RMMhf5Bf2Z4eA4qDfM+EWBuTkS/t+U0BAfpa8obiWqFkVjdNtF5YcG6U5rXw==
X-Received: by 2002:a05:6000:11cb:b0:337:c3b2:284e with SMTP id i11-20020a05600011cb00b00337c3b2284emr3685089wrx.33.1706032456639;
        Tue, 23 Jan 2024 09:54:16 -0800 (PST)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id x4-20020a5d4904000000b0033928514699sm9480142wrq.2.2024.01.23.09.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 09:54:16 -0800 (PST)
From: max.oss.09@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][dunfell][PATCH] linuxptp: fix do_compile error
Date: Tue, 23 Jan 2024 18:53:37 +0100
Message-ID: <20240123175337.1115266-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 17:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108438

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
 .../linuxptp/linuxptp_2.0.1.bb                |  1 +
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
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.1.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.1.bb
index 79e59a8fe..b848575e1 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.1.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.1.bb
@@ -6,6 +6,7 @@ SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v2.0/linuxptp-${PV}.tg
            file://build-Allow-CC-and-prefix-to-be-overriden.patch \
            file://Use-cross-cpp-in-incdefs.patch \
            file://time_t_maybe_long_long.patch \
+           file://0001-makefile-use-conditional-assignment-for-KBUILD_OUTPU.patch \
            "
 
 SRC_URI[sha256sum] = "6f4669db1733747427217a9e74c8b5ca25c4245947463e9cdb860ec8f5ec797a"
-- 
2.42.0



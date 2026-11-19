Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1923.1795113517354319203
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0L9Wg+RK;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a070755c8cso74809b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113517; x=1795718317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZ4WCb+ScmKngwsp/siDQHAzz14yfFGebEcvGdvPm78=;
        b=0L9Wg+RKbuN4RB5nhQtmTOE7RLsbBakLbzwFWCVIrRgb3NUpCYDHxHbCeCaMGhOKOV
         w8pGsyjREIhJnIS3iPCRqDKabBvqJW6/OaUq4my+a49Cj4hn7jA7EmufQ3Sq5r0eYXRd
         AEJ/1G9l+OlqT8CayY/fwgoGFowpMeq3S+SeGrXXoJwINssPhpUEQfM8jrmbzUiBzFvL
         Vv2cq6fi2+xauzcDoRrIv7PBQQ7mDVfJm4HmM7enQp3UgtwfMLqTYO36BR/3fJobD/aY
         N7kbZh8CZhfZGxp6Fy178QjzP3lOO7KpWRaFMjcgD79VM/yB2NlGZurEVS+igkRTt+fP
         ixhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113517; x=1795718317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZ4WCb+ScmKngwsp/siDQHAzz14yfFGebEcvGdvPm78=;
        b=xgcdsqcbHuvC7YJdb20h4iqZISUkRoEbSHM3NC1aUyUecjN4aG6t3GrXhHvcQyA7v7
         TZq27RjD1IZq2vyIo/y2oeeD3E+22xCa1YEOvA70IN9Znf8BrgyxiivMbSrjE6nXNoEm
         jbjT5BpCzV43aXd9IFdnZR8SMBtdhsdVVkK4HnAjHWpDomkFWB5Aw05krbCL8j58TR4r
         g30Y2KjDIGPdLOvSR77wlKAmmp075mctVmqnpPCu5oiRFq4UAub+xgerxYbC7jq+x3eS
         2quHrE1mNkxA1WQSKKKkuR6GFAVL6tW8YjQTaAIaob0M4GgUWtCIkRcDt1/SstdrYNU5
         8eow==
X-Gm-Message-State: APuU4Z/528nBQENzy/fP//IMbcJmc5ZQic4rf+7yshv8Sdpr66qBiXDq
	QnILYjnT88KbTDvXyniVjROKs0gez0ta0loGmGCrY3rx5cnan2/vho+tbykPwg==
X-Gm-Gg: AYBFou3l96Zkp4CBMFeF2wZzMY3nrfpjXKz5+DHrf4fS/CyeOcdKibTt3PXUIsHzgIe
	bLLrb5wOufsrDlhz+/xoKLvHNEDtqvZd+NAzHnhugyl0G/dxf6rcccus6g+HQQAn1jORM5rIAeJ
	QVMsdqwT/VHsaWahtNxsx3JqbwryjKCQnYVlt2w3uT1tBY01uWzECfqwtQLVWmT0j7oWinsbJ8W
	0tPhR16YiQL0tmAAPUJjTwv4MSQSeDDjypf7m+5SbZE1hPprSSuk33eJD+O/NA0FoXtAdioIL7P
	Y5vnPhLXvYyJcwNRROBw5AeDiS7UAqioPTJfFlL0FDPPtyp10zODkL9Tv3tP8SPmKTD2dRNiTIr
	o5CEpuDOqSS4NNtycwedrFFA/NUtdIUvWMU5YoEeX6sveZTR1KsIEsdRZqBFIwaRPKx9m/zkIRF
	BPvcH4tUCvQC+Aoz33Ast1q51XNh7D05P+/zofUaNo8QBwpCwoUV1sk/I06kyG7lERiNNuUnbuH
	fznMuAX1bnnLCnWMBuqygChoat3upu31FNq9HTRh+5Chq0uhjuFVzwuiatLhCYxOg7KKh4/pH2C
	dtz1/zwZeGijKSCqBJs1bab+MhtvGfjhDpLka6vdHy7a1zUn6QQ8b+bq8zW2wQ==
X-Received: by 2002:a05:6a00:3e19:b0:89e:99a6:4671 with SMTP id d2e1a72fcca58-8c87c48601emr474226b3a.36.1795113516621;
        Thu, 19 Nov 2026 10:38:36 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:38:36 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 62/64] frr: Fix build with bison rejecting paths in output directives
Date: Fri, 20 Nov 2026 07:33:30 +1300
Message-ID: <5bbf434c376395fda46c003ee0525ed37debd279.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:38:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132752
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

bison now carries the fix for CVE-2026-56390, which rejects '/' in
%header/%defines and %output file names, so generating the command
parser fails:

  lib/command_parse.y:20.10-30: error: invalid %header file name ignored
  lib/command_parse.y:21.10-30: error: invalid %output file name ignored

Backport the upstream fix which drops these directives and passes the
output file name with -o instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit cf06742a7c064d293c715e143fdabf91bf072893)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ths-in-bison-output-defines-directiv.patch | 54 +++++++++++++++++++
 .../recipes-protocols/frr/frr_10.6.2.bb       |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch b/meta-networking/recipes-protocols/frr/frr/0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch
new file mode 100644
index 0000000000..ac732d9ebc
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch
@@ -0,0 +1,54 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Tue, 13 Oct 2026 15:33:02 +0300
+Subject: [PATCH] lib: Don't use paths in bison %output/%defines directives
+
+The fix for CVE-2026-56390 rejects any '/' in %output and %header (%defines)
+file names. The directive is then ignored, and bison reports an error
+and exits non-zero, which breaks the build:
+
+    invalid %output file name ignored
+    invalid %header file name ignored
+
+We only used these directives to place the generated files in lib/,
+because the .y.c rule ran bison without -o. Drop them and pass
+`-o $@` instead. With -d, bison derives lib/command_parse.h from the
+-o name, so the generated files stay the same.
+
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/b7ad39d799d98c982713b29c1d0ba6d49691308b]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ lib/command_parse.y | 4 ----
+ lib/subdir.am       | 2 +-
+ 2 files changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/lib/command_parse.y b/lib/command_parse.y
+index bc04bc93bb4c..4d9377e5df87 100644
+--- a/lib/command_parse.y
++++ b/lib/command_parse.y
+@@ -16,10 +16,6 @@
+ %define api.pure full
+ /* define api.prefix {cmd_yy} */
+ 
+-/* names for generated header and parser files */
+-%defines "lib/command_parse.h"
+-%output  "lib/command_parse.c"
+-
+ /* note: code blocks are output in order, to both .c and .h:
+  *  1. %code requires
+  *  2. %union + bison forward decls
+diff --git a/lib/subdir.am b/lib/subdir.am
+index 20947c306d60..dafebacf8e7a 100644
+--- a/lib/subdir.am
++++ b/lib/subdir.am
+@@ -537,7 +537,7 @@ CLEANFILES += vtysh/vtysh_cmd.c $(vtysh_cmd_split)
+ .l.c:
+ 	$(AM_V_LEX)$(am__skiplex) $(LEXCOMPILE) $<
+ .y.c:
+-	$(AM_V_YACC)$(am__skipyacc) $(YACCCOMPILE) $<
++	$(AM_V_YACC)$(am__skipyacc) $(YACCCOMPILE) -o $@ $<
+ 
+ #
+ # generated sources & extra foo
diff --git a/meta-networking/recipes-protocols/frr/frr_10.6.2.bb b/meta-networking/recipes-protocols/frr/frr_10.6.2.bb
index b72af9f244..f4a98e2471 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.6.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.6.2.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a
 
 SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/${@oe.utils.trim_version('${PV}', 2)};tag=frr-${PV} \
            file://frr.pam \
+           file://0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch \
            "
 SRCREV = "c8efb33af96f9f1220d0fdda6ac049f9126edd6f"
 

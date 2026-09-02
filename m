Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7252DC61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:05:46 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9344.1788343542396169974
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ssYrZexn;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso662412a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343542; x=1788948342; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rc7qwSsjaBXVljvRVfLk4XEdefaGzQx2wEW83EEgNyk=;
        b=ssYrZexnfLmVFeb9XvNM1PMPksLEogWwsw9G51KK9wxIBK5pOyUvHgvNouR4Lan01+
         cZ0NWIE1sw2PlOr4vAgDKZKMksJnt6ZYMIHuKW5euKp9ctfq4/+fA/ZfCk54cMYw0/8s
         XWWKGUyGHC1yFW/q3ZlmEx5+q0FAZdw9E783yWoRsFA9Ozn9RbQjULUczIguyebUtZNq
         BqgKiX+0/j3xg9T6Q+9QzJnu8bn1K68RBi9SCuTAP8k265eWjFa3UfWr+RDkzOB3GS6D
         J2jNfgpfrkhkKlzMttMJ8puNr3tz91jfAo/EECa0Lm2pOD4BxhHuq9jVFH9M09uxjo7w
         6Hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343542; x=1788948342;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rc7qwSsjaBXVljvRVfLk4XEdefaGzQx2wEW83EEgNyk=;
        b=gjonQB5GWIndtxLH5FqaC9iD7sJwGKSOeMSRctSCwIs7w14M1UUAYETtrOMnCx5gqP
         sHd+kh15rJe8YkdpVHpGmLmN5C6LlR6DDsRBpsCgkxNewDdyjnYLvo04/VfQVAnwtgif
         uc7j1MdXK7vquSaWjLQ8F6BVio1kVXydMKZnyvop1lX3Irin/bpO9vjjEQ/Edoj/AGXh
         QXuLSAFDIn2jiP78NhkxUuNvkUMoqqT3+8e7cucnoMAr2sEHh/Zzm3PIcwGr0ncu5zh2
         hfHsGQDzbW3SSL2Vbw6/OnMGgJ1FMeJ3qjTu4awROZbTzfwtPtzxWcAfcwr/NW9V9PQ/
         uBxw==
X-Gm-Message-State: AFuF++leL2AgDYlvKAjlslLEy91T01pY+iYAlRixSnepDMbERe/QGlN4
	3L3Y1yG5hbcz/53sy8jzZd7GA2O8pGuW+uNiGRpJF/WPFs38/V6OTPkcbgniHLie
X-Gm-Gg: AYBFou3OkIPXM8qYW9HOLxpN2tEwQlbrYIBsnNdYV0sThjsHzb32McsDJSmjwmYp+Dj
	ZDr9cPXjyBeb+jHs4RksWoGZehZZB7hwWf/5oOcvwdABYbuRbLJ2Yjyn6B4YOjT3vbHB9bFdHOu
	dabPRx8vjet2kaNZ1B3DCjFfAiNvbs7ov1o4XdaUbC01JMJyKhQzmjz9WEwIPnkVmtUxYrA0QU6
	w6o+Fm3wjNo0JSUIwKhy0Sk/i6wjiiZpJvzqtt2Z3dgWVNhhbK82Bl7DbMjiYB2pQ+aQpJSniZj
	ygKIRvacBZX3FXW96wY9s6GVAjyU7Br4hyOIsaMsBxS+7H2zpur0QFanq4RxsSiLS14ziivkzn3
	tVhlP2ZuC3U/vTlMK8ZkSHrXgsi2TF3G78KricDkmhQse8BPxrQkzJ0mevfD7rJzaZv7nfR0wo0
	00F2eimZ0t1C4oFuHuQA1zv/85yoVyACTMbI33aLZrsD/fKzKrDQA60BviJGO4SlMqu8vdjLG6I
	Q==
X-Received: by 2002:a17:90a:c106:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-39aedf1a98dmr5808550a91.7.1788343541663;
        Wed, 02 Sep 2026 03:05:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:05:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 9/28] dool: patch CVE-2026-56651
Date: Wed,  2 Sep 2026 22:04:51 +1200
Message-ID: <20260902100511.2105916-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129640

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-56651

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../dool/dool/CVE-2026-56651.patch            | 47 +++++++++++++++++++
 meta-oe/recipes-support/dool/dool_1.3.8.bb    |  4 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/dool/dool/CVE-2026-56651.patch

diff --git a/meta-oe/recipes-support/dool/dool/CVE-2026-56651.patch b/meta-oe/recipes-support/dool/dool/CVE-2026-56651.patch
new file mode 100644
index 0000000000..e367884ca9
--- /dev/null
+++ b/meta-oe/recipes-support/dool/dool/CVE-2026-56651.patch
@@ -0,0 +1,47 @@
+From f5eb4fbf3977d919a2e9da8b73985a29d2878e56 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20Majchrowicz?= <sectroyer@gmail.com>
+Date: Thu, 18 Jun 2026 10:52:27 +0200
+Subject: [PATCH] Neutralize formula-prefixed CSV output
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Michał Majchrowicz <sectroyer@gmail.com>
+(cherry picked from commit d5aa93b3d1939a83b2b10a7cd8af3c819930aea1)
+
+CVE: CVE-2026-56651
+Upstream-Status: Backport [https://github.com/scottchiefbaker/dool/commit/d5aa93b3d1939a83b2b10a7cd8af3c819930aea1]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ dool | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/dool b/dool
+index 634ed9d..fc1015d 100755
+--- a/dool
++++ b/dool
+@@ -3030,7 +3030,10 @@ def perform(update):
+ 
+             # Prep the line for the CSV file
+             if op.output and step == op.delay:
+-                oline = oline + o.showcsv() + o.showcsvend(totlist, vislist)
++                csv_cell = o.showcsv()
++                if o.type == 's' and len(o.vars) == 1:
++                    csv_cell = csv_quote_string_cell(csv_cell)
++                oline = oline + csv_cell + o.showcsvend(totlist, vislist)
+ 
+         ### Put the output in the csv file
+         if op.output and step == op.delay:
+@@ -3170,6 +3173,12 @@ def file_slurp(filename, size = -1):
+ 
+     return ret
+ 
++def csv_quote_string_cell(text):
++    "Quote free-form CSV string cells and neutralize spreadsheet formulas"
++    if text and text[0] in ('=', '+', '-', '@'):
++        text = "'" + text
++    return '"' + text.replace('"', '""') + '"'
++
+ # Make human readable device names that are shorter
+ #
+ # Example mappings:
diff --git a/meta-oe/recipes-support/dool/dool_1.3.8.bb b/meta-oe/recipes-support/dool/dool_1.3.8.bb
index 1c7350e871..787bdab4f2 100644
--- a/meta-oe/recipes-support/dool/dool_1.3.8.bb
+++ b/meta-oe/recipes-support/dool/dool_1.3.8.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
 DEPENDS += "asciidoc-native xmlto-native"
 RDEPENDS:${PN} += "python3-core python3-misc python3-resource python3-shell python3-six python3-unixadmin"
 
-SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=next;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=next;protocol=https;tag=v${PV} \
+           file://CVE-2026-56651.patch \
+"
 
 SRCREV = "b74503e2dfbca8ef01c284d40aa77dc82be308b9"
 


Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40C8CC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:07 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32815.1792043040719107468
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m24VyH93;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e8246b13cbso36315275ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043040; x=1792647840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m+sTFThoH6Lv4ULvwMa6/fAQl2K6X60ZibvriZVvDWc=;
        b=m24VyH93M/OieQ8ncKnARrLV8Zn+Ma62L9+YRQV4NV/VZtVidZxfeTIv/UEfBLYpiU
         vH0N647XsbIM9w9OBteU9rIAnTYqn5Ay5+sFcAFxYsp3SxHUBwS+DQJQHoBwQBzd1JKI
         dSn7f814r9SiY8xCX0ojeXaldcGZWpQwj8UxnYkVm+dKQoxmuvzzw2Bw9ECgd2CWEO3k
         p9tfTW+HSo2lSqU4fkQ3e76qnWrcLMiBsknT9k2J7erFnCJ7XMAeGjSiSOQ1nBCAeuky
         BbjFUAoanNU3NHhWNUUZvTGDTlDFhZiOHCyyR7gE1qs5N+PwFEKs5k26fxqEzL0kb0XA
         PGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043040; x=1792647840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m+sTFThoH6Lv4ULvwMa6/fAQl2K6X60ZibvriZVvDWc=;
        b=hv36xA3be6q7OiBYbB7mvGet4FNxh/h1DjLlcBI1MXc/93vCjPexUFeIJrAiAclpCp
         oUfvPAqikW6aVh7++qhM0ydWvlQuTE5rzU+V8fg1zerHHnrjxZmAEZ1DEB/SAohz8EJP
         2uZfEv3niPaqSgKB39jgaUG1Az4i+89fjCr56DmxNu9dFX+xWLlQxnm/zxJFI9dPOo6E
         7E6pnmVi5UbbkqMfCEeSGLhp5GQPUnLDrrWy6lQg5NkxXaY9T5ouqlW6s6o9m4TKefG0
         o/sV6xbrgPDD+uOVDoSCkVKudaa5ZosMeX/ptS3uO1zFuzrLWlVntjgVD2zKDiH1Sxli
         BwdA==
X-Gm-Message-State: AFq9FYL5y3DHtMknigetUZZ81uo/M6Kq/FWwkxpEiu4IGiyw68wIOxLf
	/ANMu0fcWyz1Djbiw4xZmFAor/h/ix/vJbkdaly9/qjK0qhMH6L2e/j+qnyerw==
X-Gm-Gg: AYBFou3ZqKgNasKOMJenLLqWwBZppfa/b4lfqFGChE+50+fJKktOLl4mQ72TzxP4Ozd
	BU/1MCuOUft2VC35FKkmlS2rucKZ95m4GR0gMi3q9MexnA+JS2YXCT40lRs4sZXb4Elp2BcrF7m
	24YdTg5scRNu+h2O2o83OEDEGeaFB3y+RU/aJNvFznvMMiWy6MY5NZrvreWThGK80Vr+1W+eTSS
	SpefUXKjlsoYioLdpGQkqqZfv91pkLfac8dQq1d/ejGTsWxhmLEFGpZSpKEAldyu4SJ8L7GuR8U
	/41KSf6h0a5SXOfMH227PUy935PzLk0fvWFcTWCfWm1MLHbPLqlmQ2mlIE7pW/Xjf8YZsmg1cCU
	+bTnLMvn2AzVYsi7Yhf6u1spgg9shbiWNSugfv3NSrKHkwcrQyXeucfvsqL1riIjiuzZMpUF8H1
	gzaobFpIxmC+iBMPQ4wDT4rXuwCQowF0qfCniEr8PT1X4RNqHSYEF9NALX29GMnPF3qirVeomlp
	LdINGULwUWt/JU+lMVCuhE=
X-Received: by 2002:a17:903:32c2:b0:2e8:30dd:523d with SMTP id d9443c01a7336-2e8429a739emr171880475ad.13.1792043039991;
        Wed, 14 Oct 2026 22:43:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 33/82] libnfs: patch CVE-2026-57918
Date: Thu, 15 Oct 2026 18:41:21 +1300
Message-ID: <5a964c11f8bf9d9897cb970ceb0f26956d5416e8.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130953

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-57918

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit bb3f5628f16b0ccac36287f6355c95000233c57b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libnfs/libnfs/CVE-2026-57918.patch        | 34 +++++++++++++++++++
 .../libnfs/libnfs_6.0.2.bb                    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-57918.patch

diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-57918.patch b/meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-57918.patch
new file mode 100644
index 0000000000..27c99b5704
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-57918.patch
@@ -0,0 +1,34 @@
+From 589568b88a06d92b298ecce563ae57b5fad91238 Mon Sep 17 00:00:00 2001
+From: Ronnie Sahlberg <ronniesahlberg@gmail.com>
+Date: Wed, 10 Jun 2026 12:21:58 +1000
+Subject: [PATCH] socket: prevent an underflow in xid
+
+if the expected pdu-size is larger than the absolute pdu size
+from the xid/record-marker.
+
+Reported-by: Nick Hummel <nickhummel@google.com>
+Signed-off-by: Ronnie Sahlberg <ronniesahlberg@gmail.com>
+(cherry picked from commit 935b8db712b3c6649bc57ddc276526c4a31680de)
+
+CVE: CVE-2026-57918
+Upstream-Status: Backport [https://github.com/sahlberg/libnfs/commit/935b8db712b3c6649bc57ddc276526c4a31680de]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ lib/socket.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/socket.c b/lib/socket.c
+index f51ca4d..8e38eb8 100644
+--- a/lib/socket.c
++++ b/lib/socket.c
+@@ -929,6 +929,9 @@ rpc_read_from_socket(struct rpc_context *rpc)
+                                 break;
+                         case READ_IOVEC:
+                                 rpc->pdu->read_count -= rpc->pdu_size;
++                                if (rpc->rm_xid[0] < rpc->pdu_size) {
++                                        return -1;
++                                }
+                                 rpc->rm_xid[0] -= rpc->pdu_size;
+                                 if (!rpc->rm_xid[0]) {
+                                         rpc_finished_pdu(rpc);
diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
index 8068d35e1c..ef99118230 100644
--- a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=825301ba17efc9d188ee0abd4b924ada"
 SRC_URI = "git://github.com/sahlberg/libnfs.git;protocol=https;branch=master \
            file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch \
            file://CVE-2026-53689.patch \
+           file://CVE-2026-57918.patch \
            "
 SRCREV = "18c5c73ee88bb7dc8da0d55dc95164bb77e49dc6"
 


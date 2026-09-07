Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1826DC79F9F
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:23:59 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31911.1788776635861127037
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RBbhwI30;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2721231a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776635; x=1789381435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RTExCWgctRbw3bixxzGCd196Kf1waqFdVs8GfmPF4uI=;
        b=RBbhwI30/3IzGuy59eFd4aKs/aVIxE8aedM+TdghB+jI3ymIKHgRBsMlezWANVA4+A
         Qr5PdtuV+M722dNNAhuFU8yjaAJuequezfZIIoVvU46nWzz4AEvRKeMOENJuaLzZn9U5
         Vmw6Q8zLtaPALYgZ7TyeNKHhkIkE3WDqGkmLYlHtTKz5AhrDXgnfq+mb+n1Hj80oYRGv
         yE8S4X6iIR0XXpuUIMsyXCiBCWsrYG0j7cEG5oQexnuW4KuOieU92pknp6RC4B3c5HBK
         qqxsDWXe2pA0McEo9uIHpSp1d96ta3XOh1cRTXefQXGOOMXseNFpBxfRaecU32MGKSUa
         4JVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776635; x=1789381435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RTExCWgctRbw3bixxzGCd196Kf1waqFdVs8GfmPF4uI=;
        b=C8YSUlChYAwXBngF7q7eRHJZgwvaxDNplisMxlLjFlLFUFpv0rJxo1xx4uMmfKeUHE
         5WmPSKIYMBZf/SqJffyb3+AZMPQbjd3+il62I5LY4X/4IbVHqGpGF+LgZQbVNk05PF99
         7kM9texfc5XkNHQcjQl13EFdLXAxlhZ1SSqWQxKqy66kYMWDjO3aB9D115wLouRDDNdd
         NlmG4v0HUVr9o4d0hY6Mhg7EA0ohMjqrgc3vIlIBdVVs+LSaZU+aMDCEw+b6rA9Zd4dp
         JcXcUdfwcFJRxKZkh96CM5F+nFzuDoO9SmMPGsvs4Apdaa7xsCwN773EBPOB/Y7SUZf4
         gIDA==
X-Gm-Message-State: AFuF++lfLjxTpvz961xg7ZfJDugTSL5Ei20n9ZyjY4ff4GttcnSBVCMJ
	goRJAXjJUNYWFL+BbA68RFnTPrvDZ0gU3mTJeW/w4IQBJXqfltp/ASky5B31xQ==
X-Gm-Gg: AYBFou3aHlYUW6lWir0ya02lS4J54Wf8tFy+YfoZi3vlFfN6r68Rzm4jETYn6eDaUvj
	11foN/w7hJ666/FEvJElBmp4sB7UcM9kP7AGZOL5hbEFU7z1iesFwcT+DSBLqQgl1Ngh9TqyLNI
	5B/aLArJJMjiQ8KHLEXIPKuIlAiEIBpoCDhAiJrhgpR+dd8555wSB3HGCA3osQ5DseF66aLdYdv
	l+ix6+JQFwUDMPq1/IDrTDzbmUEfOeoLg94pJhjo5Tg8zu0vJ59EFMYvhmI0TRDPReJe3Eg1Mj/
	kxxrNbM5qah5M4d/HW6zlSx0UCRCQmPGY5sLo+5lytemDUKK4unu1kY9iNkl7ssTVcvsOf7cWtN
	oU1arpu8Lmj89tHRnR+96aVwyxBSdOcgbOpbie1LaUsgsdjcevifzU4N1m7X2WYFoIVdFZt9FOt
	gnNPqCr4Vxpu1jSGxDHe7I9xFV560+Y2b3SHa7E6VpVxIqadrxyNY/Tke2DHmCZBwJ8THEAMLd
X-Received: by 2002:a17:90b:4cce:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-39b260dd4e9mr36012821a91.2.1788776635260;
        Mon, 07 Sep 2026 03:23:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:23:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 11/33] libyang: patch CVE-2026-41401
Date: Mon,  7 Sep 2026 22:22:55 +1200
Message-ID: <20260907102318.2459883-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129823

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport patch identified by Debian[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-41401

[1]https://security-tracker.debian.org/tracker/CVE-2026-41401

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libyang/libyang/CVE-2026-41401.patch      | 43 +++++++++++++++++++
 .../libyang/libyang_3.13.6.bb                 |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch

diff --git a/meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch b/meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch
new file mode 100644
index 0000000000..06537acbb8
--- /dev/null
+++ b/meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch
@@ -0,0 +1,43 @@
+From 34b2a26ee86716e2b593c44e51e38ee15d4e8434 Mon Sep 17 00:00:00 2001
+From: Michal Vasko <mvasko@cesnet.cz>
+Date: Thu, 26 Mar 2026 08:33:44 +0100
+Subject: [PATCH] parser common BUGFIX invalid metadata removal
+
+(cherry picked from commit 54c3276d871023da266d4ed3ceaee7e8d71d0b04)
+
+CVE: CVE-2026-41401
+Upstream-Status: Backport [https://github.com/CESNET/libyang/commit/54c3276d871023da266d4ed3ceaee7e8d71d0b04]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/parser_common.c                                    | 4 ++--
+ tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_26 | 5 +++++
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+ create mode 100644 tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_26
+
+diff --git a/src/parser_common.c b/src/parser_common.c
+index 0b221af72..fefe723eb 100644
+--- a/src/parser_common.c
++++ b/src/parser_common.c
+@@ -413,8 +413,8 @@ lyd_parser_set_data_flags(struct lyd_node *node, struct lyd_meta **meta, struct
+             next_meta = meta2->next;
+ 
+             /* delete the metadata */
+-            if (meta != &node->meta) {
+-                *meta = (*meta)->next;
++            if ((meta != &node->meta) && (meta2 == *meta)) {
++                *meta = next_meta;
+             }
+             lyd_free_meta_single(meta2);
+             if (prev_meta) {
+diff --git a/tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_26 b/tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_26
+new file mode 100644
+index 000000000..7e3b6c39e
+--- /dev/null
++++ b/tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_26
+@@ -0,0 +1,5 @@
++<int32 xmlns="urn:tests:types"
++       xmlns:yang="urn:ietf:params:xml:ns:yang:1"
++       xmlns:dflt="urn:ietf:params:xml:ns:netconf:default:1.0"
++       yang:operation="create"
++       dflt:default="true">5</int32>
diff --git a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb b/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
index 822c30ba24..7724b4c218 100644
--- a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
@@ -11,6 +11,7 @@ SRCREV = "c2ddd01b9b810a30d6a7d6749a3bc9adeb7b01fb"
 SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-test_context-skip-test-case-test_searchdirs.patch \
            file://run-ptest \
+           file://CVE-2026-41401.patch \
            "
 
 


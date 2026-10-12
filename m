Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC83CCA9ECF
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:11:23 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3535.1791763882367552326
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hFvza4H+;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so536957a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763882; x=1792368682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nd5iME4DHBJ20zDw+3DocSsaOXDxJpLV+Hucf4RLi2o=;
        b=hFvza4H+OkKqHrbDhROy1SNW1NnrI1G77IkxtvsKHXY32k6Xud+Gh/JfLYCq7zbUbi
         T3RDiZse2TMpsdbXxw5u9lfvMxqpwdL9ulCS3gIqT0BKrhkPJuAFihcImXNHqCBWCsLd
         iQhyVxGZS6xjJ8H8bw+lbq9DF6u3SM4/lk5Y54jbB/Pqnjx3EVd+LelhZEo2Pa6VEsJP
         Kju81xc42ziRndyDVQudKK4fyJBhhANf1ND/JnJ2of+ejcme9OEEkKu4Qm38EaYOShRM
         LdLV9MUxOg/6Ea8UHugPJk424kC1rKAi58NRj75NEkTFVMS2ea00gAD7FK8vj31GO91U
         wrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763882; x=1792368682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nd5iME4DHBJ20zDw+3DocSsaOXDxJpLV+Hucf4RLi2o=;
        b=mD/qQpqkNsNEcL6LQaNfJdhBxOMwppJSkvpPiA+MYuvXHbN4TAmF4EDdY7JAMrR1c1
         qmtN7WSWcxjFCkEotQHFpGuWYhdWRrsWk5WQcglkABNG/s47vd1F5D49TvOat7DfNcoL
         Fzms3TRy+Unk42fUZFSKV1ZcaI06O9gZpYauiMAT8QT5keD4S1fsFPMa7sWd3FGzVoYD
         IsqVGlMQA1/McXs4HGAgzkmpsA7QYEBTCauhBROYLX1gn9Usy3rAgcV8hJUuI5SaO+BF
         LWs175m2GyDkaZgJx0XjHE0XK25X6w4oIVA2l5OTrpU/UG4jCyWzqZeC1O4FIEKl+tIf
         rpEA==
X-Gm-Message-State: AFq9FYJqBFhGCmaG5j9sFNV4svNYtEF5V7HB/IqP1tz1ZOJvH50eCZvr
	5pw8B3ne7YwCiQfld1lJFMC57EVc/zBb1AONCMRXfPCCVIFeI2KwzOyFkM935s/gEwU=
X-Gm-Gg: AYBFou2B8343at57gRDM+lGRfsIpanRXEBqIhqtlYTVFS77YE5yChBYVnFhp7ed9jfl
	2PoOq/6Py2JMECilqTW9kVAYTyI5KjFeCZVUqLBtfMAuTfIFQ5V4tP6YUmbK0+FHxKLCaw0VxqB
	vTnb+AZ8euMn3QN5DWPxVvGSsXWBLaXdOo8fZ47drr15I+A95VWL7CiDsUzLnvlLsSR3a3wOBt2
	oJmyV8k2eeLybEXD5OewcGRGHs6jJjBU9mXJhU2nz+T2hbh7+g7Z6NwyN+uva6nmeBr3sgWQECR
	Ax6GONFEWUFxgYRd8+IO82BG0QGQdBXG6WlYnmcjH/Z7KPTo84Vc3fLzEhD7slpA32MS0iX6Iuu
	TqBVVhTyRNzi5SZ4idxHnoewp/vPcETEsmh5ob6lmGEjtrEqXca2v7QWbfEaRzcL+pNdGiO94pY
	bsdWUPHAdrcvNkZdkKza+GtQeglcgUN4sy8K6leTtzSRWHiWjBxG4tet0DISMxOXA49n8PmyMpd
	OksV8tLtm2R2McnvkS2qbB0vMjBR/wGz2cKpx0ZQVw0ibnVOA==
X-Received: by 2002:a17:90a:d446:b0:3a4:7938:844d with SMTP id 98e67ed59e1d1-3ab3ace27e4mr5399361a91.64.1791763881721;
        Sun, 11 Oct 2026 17:11:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:11:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH 25/28] libyang: patch CVE-2026-41401
Date: Mon, 12 Oct 2026 13:10:03 +1300
Message-ID: <20261012001007.2541673-25-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130750

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport patch identified by Debian[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-41401

[1]https://security-tracker.debian.org/tracker/CVE-2026-41401

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 6b06704ac1bae4ef4831384f0c28d14e98c804b8)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libyang/libyang/CVE-2026-41401.patch      | 43 +++++++++++++++++++
 .../libyang/libyang_3.13.6.bb                 |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch

diff --git a/meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch b/meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch
new file mode 100644
index 00000000000..06537acbb82
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
index 822c30ba24b..7724b4c2189 100644
--- a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
@@ -11,6 +11,7 @@ SRCREV = "c2ddd01b9b810a30d6a7d6749a3bc9adeb7b01fb"
 SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-test_context-skip-test-case-test_searchdirs.patch \
            file://run-ptest \
+           file://CVE-2026-41401.patch \
            "
 
 


Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4853CA9EDC
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:32 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5086.1791839491580876719
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NDn91dPj;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1657874a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839491; x=1792444291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nd5iME4DHBJ20zDw+3DocSsaOXDxJpLV+Hucf4RLi2o=;
        b=NDn91dPjXvZJOgG9opoGiQQnnhJPR7UYDAMPwmuZsF84z56jikPfvu6Hl77D6BN0Fu
         ag4h7A7w0gBwiTzBzXvyi6vOoDicdEums7g8uDylVay0jjwVOVS06oVgL6ReyYSR5cFu
         5C5wk/le7ez8Gc4MHZ3AbtIgSNwmszLcLZ3uPHKGHZHxPG9iBKZBHk2mFk2DaF1U4zX2
         Tja/z/2uVOmpBdFVAzZi61oqA0qEwuHNQD7fUGAgzXdpfoAxz//ySIxI8lfjHYyfO2KG
         s3+e56RAA2PJJNONToAyeLV6TsEy4Ux/a8XVUFPNMZKt8+0UepuU+5E5HUAnjImkkLtP
         7whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839491; x=1792444291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nd5iME4DHBJ20zDw+3DocSsaOXDxJpLV+Hucf4RLi2o=;
        b=ol+jnrV9RchBcuanoGqGBPRI48m+ZDVi6tbMgMxau/3v7GdemFtuSKwX1UUPHqXPKH
         l0gWctc1jmtHv+gD8yG+aihb/8vojENFMXLglL3IUPXLSTDOFeLNKNWZPa2NpbHgEoe1
         8pukkW7Ev/avHzhXW2ElEt9Cs0PWykFjHDdvdHTtvW0Yi58EP4syGDTVLL8RJ/w8dfLi
         FQ+yM9FUjaJnP2fj4Xv5sIhR7IncW6ShzHduraMxUQsguSz7hT1P4ImwdrWgo6NT80y8
         99RXkPchWvzkNAr7zBA/Gxb8xxW4C/fRXp/7EzSCqN0VasmAZcJF6fHBtFl3MFa0qHyu
         t3qQ==
X-Gm-Message-State: AFq9FYJG2kR5bQJTT8eEk64HVuRQkq9vic0tIifJzXfu3tT+fKwpbLp1
	vYNseYdV9C0oeqxnAVHLZd+DJWSwPP6fhLJe0TEBkWxCblEr0dL3qw89jYXPSw+X
X-Gm-Gg: AYBFou2sFWVqvFKWTi6+XYWlYQxQudjaEvgG7CHIxDuYN0/PiGmWRY3++zCGbvv3aWi
	AXg2csSz5hw5vSsNQPcNd1behMuPQfjVOvkAP10hi4x0I84yPNuZww322cBC21GKGhp0wMEGYt/
	fyMYnCqct6D4+f+4z0XsWFfZGGW4BCulFXtTtAwaIR2ngydJFyGOccBtuNEJYVJCB90wv7jfOCS
	6YC5pg8v7wKPSyjo3vkzDnRdeiuilz8z1QoPGpBeRyZU60QBMJ/3eUD12Lcw3foW9YyEP/P0ETj
	yzmfXTsjq7GnO5/ftzBIT05Fr3Jyht0U77VHXw8RpWfne6f+yRmV7UBu41DrF7JBewONGJQ/fnZ
	BsKg1ufySvTchyqcbP5lhQE07i2pi4netDNtOEeDzzv1oBGdMVD0Ati1hdRhCdOBCH3ViZqQGmo
	4yy5NWohwvAj58Y8Tll3AlSujmbGDUXWDSC1WD/Ps25FCRgVVxjGAyM7qFc3vRp3bggP7BuLljU
	MeNiDqy6w0ffMCZb+L/mbdfyNCBrZjco4fkXdE=
X-Received: by 2002:a17:90b:5486:b0:39e:6a7f:1dcd with SMTP id 98e67ed59e1d1-3ab3ab1d56cmr9498419a91.41.1791839490911;
        Mon, 12 Oct 2026 14:11:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 29/43] libyang: patch CVE-2026-41401
Date: Tue, 13 Oct 2026 10:09:53 +1300
Message-ID: <20261012211009.3352822-29-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130799

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
 
 


Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBFDCC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32825.1792043051725133277
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qLi+D3zf;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2dd9cbb661bso35498315ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043051; x=1792647851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b7dha++nqx+HO/t04qUjt7QKB5xMXwWH17uwD4kyq04=;
        b=qLi+D3zfFV5aTeP8bbPIhCBAwCs7fIKWCDWLAWh1GWlhLugWqtyzNDOIFA3w+ENDLe
         NAFwGRTl/sqrcOs55i5B0nM2FteCT4X0+I+MRdtuNpTUI7838+bVS4gMyZ00vIULTcUt
         gEKNawxnrVUquQAfm284mK+goja49ScvMNXWRc4ykKaqXUz1IubGnmrXGOViLf20/rt3
         Ljgg6IrWar4594P+cJI924hLxpCZKAEPZdH/BPo/11x09EEB5KBD7PClhxz+1R+8HIgP
         nVK6Tw/1KMrnOps+sC+XNu43QdOts0ittYWCbFfs6471Eo2Cfu8jzjpTbO40ZcGndbc6
         EjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043051; x=1792647851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b7dha++nqx+HO/t04qUjt7QKB5xMXwWH17uwD4kyq04=;
        b=g1C1Vv3GbLnp9SlpVmyKJrRgbTCUZP8aAukTpOPz9bfaKnzmbd3wgPdQVorIptg4PW
         lTFpxEDGlkI/MrzeRbI2IyhprwBAP+8YlvIOC9eMx2f5RTsPvqNqgvEbLnWPshZK+7z0
         R9H0dqW43T8E37g8DMo98300m3C0MQ+1Ez0Js27Cky5DxhkD5T4zxbE3MwJwpRo1wZOq
         weyfXnKSOK+Tp0pCfqOxtxpRKKVZwdJmLETle3KWhfJ0WSBnWQqLX5vK5kMzNNoFgkS0
         PtTwo+ub8+Pu7HL3JJwJdmxRcXxObHvTX7/JdtuAktCUqmC/ML8SqdCh2NqR1iafPGdk
         MP0w==
X-Gm-Message-State: AFq9FYLpDusLZhSqUdmpRRMDhW/AvBmcPGsDKSUnICe/7FlwrQnSAvXj
	JtGluuBCFQP3UrZKqa7b2b49GsNV3j5qRE4+ee7cBeJ6KZXe872yqAzOcZi3LA==
X-Gm-Gg: AYBFou3tUYV3WVmCBfnq3IpAtVXHG0R+4bMfX6a4gIWcWI7zEZxiIB4YzTqtmicvcYR
	zhTIZVp8E80dzvKNsJPR/qDM5l1L1JC/KKjfVDsvPOZiBZcePSFn4fwn8VFSj+eIvpWRpccUB2x
	oDk2uVGRK39+VpRLiv+zyDuk3kRUlvFUYjYiRY6Y6F+YsIoaf4WIfHKVTYymyJPyWiR9PifQYvb
	uKRFp+fUG6vlzCX1nTf4MjW2foe3UcxW0QT9I8cGPxfo7RH/ABrapSZfYR11mExiyfFCZBhJ5Y8
	vcogbvIL2wKxrqRcS5XE+IU/8bCruRN8X9/RIAl9+XAMLJUeZJxJ7VT229rGdbK3VXPMcC1kj7Q
	pYLCNyhqUSFFL5SALzDn6Wfc0Ydhl3M8xbi2ngk4dHfREsu1OMv7mSIuhfElaiRIaBnl4x9Hbw3
	BlcdbRqUBmPihe3udiY+CHJgpYzSB65zN3cWavvVViqkyrHx7Oz8F5EbZ2Xa0Saox4GyuQfob+J
	UhOWudxhcMvBjA9uOPfZGd/FfBRzgTjJw==
X-Received: by 2002:a17:903:1c7:b0:2df:3b09:664 with SMTP id d9443c01a7336-2e842ab03f3mr154636695ad.32.1792043051013;
        Wed, 14 Oct 2026 22:44:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 38/82] libyang: patch CVE-2026-41401
Date: Thu, 15 Oct 2026 18:41:26 +1300
Message-ID: <c82954824650761ef7d9e69f5fabf3c93bce8521.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130958

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
 
 


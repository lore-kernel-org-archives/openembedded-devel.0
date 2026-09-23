Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FD8C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:42:07 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4298.1790160124138223011
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dRvquSnL;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso392199b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160123; x=1790764923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzt3lpckQfouMtE3FT8Vfh3aKm1kjcWy6VoKBWzqgxQ=;
        b=dRvquSnLlCIh/wFHfRWxyekvGOScm4iE1SdMwtTfgWH73p2Z9kqI8LX3CKOQDfGfGb
         yBh01eJfVuGMhYkJWzrrR31rODKDsC68fFwSWjl5QVoM+7XUAY2Bnw1tqu4Qgga7b6/K
         UOR/MiX5M5fGkj8ixP0l/3w53t53QN9VDooDEV4puhhVibdT5RrAVwibDEvEP+JTPThD
         bce9KX2tL7sM5ZwZYF7oV/WNePbV6lbv8aAhHeOR2tAKrUZDNAzsghBLXbwqngzVGTeZ
         G/GIZbND61QVPdQfprlfRH8Q7w5Yr8ZxKE30FsHG+NPfHgb6mJkHFZM+mnWHi7ZrxvQw
         zL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160123; x=1790764923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hzt3lpckQfouMtE3FT8Vfh3aKm1kjcWy6VoKBWzqgxQ=;
        b=V4AZDn2KGkaei6Q5DVVz/h6v7b6vqT/AL6wsk2Zs8RTbHhSIgLqusTLRAIwY5QrIBE
         JWimjtVRKpIzVPbtiW2SC5J3xXPIo+J/ZRAV5EVsuGa7ThuhirviNN0j4HPaYmLeWjKG
         1WbyR+mbZe9D4P9uFd/5r8HP5OfFzH8C1icn7msaPu7PyvY0M2r0TEYkv4UQV6vJPUxz
         V7vwKodciFDwgfpPeVG5DP7B1EanofpJk9WuYFXUEp11JUh1DsEWzMWmTiYgNKRHQyMU
         hHSsJ93o3F2v+89HUuCIXAa8Cf+Wpe03LPB529WC2wbIWOa8PJ/EOwjihpJonr5LR6c5
         Hluw==
X-Gm-Message-State: AFuF++kHzhLer8lX5NJM2IEgDPTEU0bZm5AY9VBw6UDajon4W+wqdn+z
	lXZaRjq+lDzhE/2io18TQTWuuycWxCXl7p9hb6q7RagdYisXIJrt6z8z+bDEng==
X-Gm-Gg: AYBFou27DqgLkVoqxkAT63DWZyVgQ0DfZjG37E3uHISi2WI8U4UEEkHRmonRAiJcF6K
	ibDvDtYisO3m6wXM+PXZmO2dI1on9O1eBXIfAXHpnUu+m/QV5VC0t4dOti614f1q20BwT1uykpT
	lS2BDCCgF26hOe3WjW1I3CLC7/2IkTnXWW+IuEGddeZyshLe5xBnFU12XAbK63m9jrEvT3riFFE
	C9rLkMsqLr6Q7hLjvFcuWfU6smUbI09jwJYUfU8maQ3c4J36n8t2LRTxKVQLwVw6IdWobo3QFT/
	6rRCDsnQpGF1VCPdjemX4NepoDftAV9rkJYZ3TNm12xFhuR9k1Mu724lvr44QfSCLJm4ONz1TVj
	6g5ReDen69mJWNgmhaBtK+JCnpUN4xh5epxsVllh1GY9hAgUskZ6tIjewy9JXHK7+ffJRlnGyvC
	QcBJP+05kOZ7E6vtiB1pipKLBWDGot0PJdZ5Ub9XfEZ4F1nDpxZE0bBUq93tY+UY2QwyeEsSdTn
	jff+yJYCOYNNgaa3QAsrNX+fSQ7tFXu9A==
X-Received: by 2002:a05:6a20:7fa9:b0:3dd:a197:7369 with SMTP id adf61e73a8af0-3ddf82eecbemr2237614637.66.1790160123517;
        Wed, 23 Sep 2026 03:42:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:42:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 30/42] jq: correct CVE_PRODUCT mapping
Date: Wed, 23 Sep 2026 22:40:44 +1200
Message-ID: <20260923104056.457360-30-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130217

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping generates a vendor-wildcard CPE.
Use jq_project:jq for the historical NVD dictionary CPE and configuration
identity carrying two jq 1.5 CVEs, and jqlang:jq for the active NVD
dictionary CPE and configuration identity plus CNA affected-data identity
used by the current upstream.

This changes the generated identities to two exact CPEs, but the frozen
sbom-cve-check database leaves the 26-entry CVE report unchanged, with no
current CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 5d23770adc80e996393fcf6ffec23cdae43cfa48)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index 9d4ae74c00..af9704420c 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -32,6 +32,8 @@ SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${
 
 CVE_STATUS[CVE-2025-49014] = "fixed-version: fixed in v1.8.1"
 
+CVE_PRODUCT = "jq_project:jq jqlang:jq"
+
 inherit autotools ptest
 
 UPSTREAM_CHECK_GITTAGREGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"


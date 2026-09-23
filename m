Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6685EC9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:42:28 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4305.1790160144192751829
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HYlaLxnu;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8692a856865so353573b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160143; x=1790764943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aG15hR5mcbGlWAufTqxFlnyLU6O90y/1iwEQVsPLkZA=;
        b=HYlaLxnu+5w0+qPHbIA5zuUp7iLQLFXbWWOJmGI/TCQ6KAABU6WZkJPYJYZPydg7Eg
         tw3jHbO02GuKCbjEwE5xF8Njog8GE0E3i7VUzbX7hYnWJrRk+CgGSvggqosU2u85IFEB
         u/7RtbkcvtcSzrZOddagyPndkWlReA4I7dS9wnWJHmiDaNqFwIYlIRAzRdwZykNPqDyy
         m+QrzUijrSb40agO705aYVpWuA5GOXwANeojSq3jrNxo7iq4/aIkYHSeyY3VST9PWDV9
         tJVA5EryfydCySGcrxXbRnVphOSVJNAGdyA+Y/J8znbxpufbpvjcH3S4rvipfOOu3EO1
         sbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160143; x=1790764943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aG15hR5mcbGlWAufTqxFlnyLU6O90y/1iwEQVsPLkZA=;
        b=VVWlSoCGVUQcqLYijDg34hM46wCfMiw+A6RNIUGw5CvFDUvOIYjRD3SjGhpKnyrCWn
         a2lVgZCGvBpENpY9Nq1Gqwtkka4R3Z39kDwARauU62UJeazWmB0y2uShdgi7Xfupo8Wa
         oCCR+BFKOEMYQEYt1z/B4qdaKItnviOWMP8dhp8VgUHcitnH7vjbk78Fn2Bf2I2mWqVV
         lZU4wAjUmOafe6/VLbtOzfDISHI2K9QoaPSEULEv9Nv/S9R5V1pXvSYYROfMMpr2wXqN
         5QGgtmKithPy8AsQfArsUpcpu2PTmhOBCmkngyskg/DM4x0oA7HCkytZOJ0W9bcysAOi
         k7Yg==
X-Gm-Message-State: AFuF++k+/NTKYMZmgVqjZbA0CBKxJvPCZ3fAdZu4rifDJC+ubDXFd2yX
	ZmR72fFEKqwS/AjZ/bV25A2b0S7OY3a7+eu83YH6Tkx2O1RSel/YZexf1uqWFg==
X-Gm-Gg: AYBFou0J/reypJG8kYygSg0uidmMj6xS360MvBeIhqNMNEub2fI6Ty6Io6WfpFFMQJJ
	F9aB0Cxal1tBAtHh+UgmceEgARDz3Gb2l2D6wrqBsB/UuLdPIyKZ+dJhJSO41y9TCQu2+UH8evN
	OaY95WG2owEkywTAsMWVu4+wOnzDO8rTEaZsDyJo4RvmKP4htUjBxifVLSzWB6fO9fTyb5TKtUg
	LYiytq3hTs17h7uoix/Q7KIR6db6N7FtGooNfHAWcbvvIQR4EbF/t02moDnzBs5VAaMNPxw++ga
	pRhYXqa8NdLznw2SbCwowHrTnZwevJfJMjwgTqdVKaf3aQhQVk3d9AvAqrp/v2EKGe5z9B2UKXg
	N6phE3C8A3AMmTVp7GLgShdLRueLAQn3RavtQM5t6BNI48w8SdeCBzbD6bc84PibJDo2ZNKDkGw
	aR+kYga/r5L27ztEc636B7Zjm79O9TMUGsCQi4nzJDUZcmId6DJD4M8VHsYSNuYSVZBYIKS6N6x
	BCiain6mQhh+zjluYaT4a4=
X-Received: by 2002:a05:6a00:8014:b0:86c:79f5:281 with SMTP id d2e1a72fcca58-87d19370de3mr2064650b3a.13.1790160143527;
        Wed, 23 Sep 2026 03:42:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:42:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 38/42] python3-werkzeug: correct CVE_PRODUCT mapping
Date: Wed, 23 Sep 2026 22:40:52 +1200
Message-ID: <20260923104056.457360-38-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130225

From: Devansh Patel <devanshp@cisco.com>

The current product-only "werkzeug" mapping emits a wildcard-vendor identity instead of the exact identities assigned to the packaged Pallets source.

Use "pallets:werkzeug" for the CNA affected-data identity and "palletsprojects:werkzeug" for the NVD dictionary CPE and configuration identity. This changes the generated product identity, but sbom-cve-check 1.3.3 with the pinned databases leaves the current CVE report unchanged.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit fd0b8a36e6bbce468654cb917254cd9c32ef923c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
index 4e1be5cb2f..fae4de2a3f 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
 SRC_URI[sha256sum] = "9bad61a4268dac112f1c5cd4630a56ede601b6ed420300677a869083d70a4c44"
 
-CVE_PRODUCT = "werkzeug"
+CVE_PRODUCT = "pallets:werkzeug palletsprojects:werkzeug"
 
 inherit pypi python_flit_core
 


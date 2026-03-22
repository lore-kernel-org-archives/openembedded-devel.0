Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065E2FC72B6
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 10:14:31 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28175.1774174462376789987
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 03:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=khc968UA;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b04b4974abso30318455ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 03:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774174461; x=1774779261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/IXlsScGxINDGn6HqUI5bsAuO3euU7fI52STecF/1A=;
        b=khc968UAivT4MV3doPalwFW6faxAoPf4nJWYSwtiZUQhqvHBr5yvYk65IVzg2sftbb
         71wv1Jdd629UVoyLk/JpD0wLBsMK9i7T75Rj1DS5C+kqpSK0A6ZpK5eUKCje/I84vpE9
         mMCDBXI2qgDe2D4BjgxKHNP+DlHfXDsixKOEerowy/U4YYB4yGix8OzOkB3gLiyYDKbE
         Nn094v5vixKUG5BPQf1E14P/h2BVglDsQ8/+2F0gPjzVodYGqvYD1Ws17iEioISMtrF9
         /vVHx6iHUbeH69DU1O7eJT9y0E4II8/KlolOGwPDjL09fliHlMkZb1PCCVoaeAmVAagg
         DPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774174461; x=1774779261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p/IXlsScGxINDGn6HqUI5bsAuO3euU7fI52STecF/1A=;
        b=sr3NmPYHhZoOdDPMqm8peSzqj4xBKW+WHnAaDHMNlOmEggo01H2j4VeSzvIz4etzR+
         x+FQ8CyYOmnlJwnZ4bWCQ9Hh9Zq4sOFPFNbZYfKc2Z0X8vkwdDTo9bi3PMt4UHSDmeW8
         9C4N0a9qoHEMecn+AF+VmvP1tuYLW5Fz0vYuwBSq7nmnCcc8LV07hvdwrIKhgr9Gle87
         0JWPjHAMVqyHGbARwn1lrNMJ7hE5y98N/ZVjAOQOlFW29pRA0GH0UUYilYYuV5rtyup0
         PY026e9fo3H8jNYwyGXeJjz4iWHoNgAsL7R0dj4zTY51bwb+nMi5nHSXkG39KCw6sLzn
         J9QQ==
X-Gm-Message-State: AOJu0YyccO8iNcA4WCQ84zGKG5O5WSig0yx6YgvjHKz7wxIn/0ApQwwH
	oaR5EMrHynSEPII6rcdzm9mBhXVmFTTk//bqinKPaNDTPRVJGKhVsGt171s7Gqvi
X-Gm-Gg: ATEYQzw+eZa1/uKPERKmzszXwlxhqK9VTIN7LqgzMLiTGjiHIet09HF7xVSMZKf1mAt
	K3vQawIy4gM4jk0pR8JiZTU5aa1GcgxKVr8I+0ktmA1eBJgQwovNNc9vgJldU0EzL/JP4PdZOXV
	hsyYwko0PLej1gHdRO7lRgEn2R0+TMbuLqhkT1cKwWsgJmOprRHqG2Av1gY8dQfVWnYpa/+8zW6
	uXKAu/Xmryk+kB84wJih2xXc17vHIgDFrugJGMyAbiiryfJg9CEzHt2P266Ole8zeCyhkcxMgAa
	HbhjtO5LYV1oa84PwlxDQVblUgLuNXtb8TRHWjK6S/oiIjPq9RMy4xXkzkHaCt3ftuHOfeVrj2N
	EaW7rhw1aCLc/XvdU8EDdFeUW1gxtqRFBvtTgjA0C5uqvuTdsJhlnuk/iopaSFYInExT5DdrD5l
	lkHAlxzOWNkbTHjGOL0VObaxGAyxufQZnh9RWQeO2w7nIMAQ==
X-Received: by 2002:a17:902:d4d2:b0:2b0:5923:515f with SMTP id d9443c01a7336-2b0827a905emr82193965ad.35.1774174461502;
        Sun, 22 Mar 2026 03:14:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm73775575ad.75.2026.03.22.03.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 03:14:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/4] imapfilter: upgrade 2.8.3 -> 2.8.5
Date: Sun, 22 Mar 2026 23:13:48 +1300
Message-ID: <20260322101350.439083-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322101350.439083-1-ankur.tyagi85@gmail.com>
References: <20260322101350.439083-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 10:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125474

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: copyright year updated to 2026.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 89b961c889ce885597ca669150d998470d05bf4d)

https://github.com/lefcha/imapfilter/blob/v2.8.5/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../imapfilter/{imapfilter_2.8.3.bb => imapfilter_2.8.5.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/imapfilter/{imapfilter_2.8.3.bb => imapfilter_2.8.5.bb} (80%)

diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.5.bb
similarity index 80%
rename from meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb
rename to meta-oe/recipes-support/imapfilter/imapfilter_2.8.5.bb
index f4905e3c0b..754e793faa 100644
--- a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.5.bb
@@ -1,9 +1,9 @@
 SUMMARY = "IMAPFilter is a mail filtering utility that processes mailboxes based on IMAP queries"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f8d2fc4954306888fd0e4b27bef83525"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c9e8d74e78283c6319317d3cb15eded4"
 
 # v2.7.6
-SRCREV = "72f7fa621357299bb6c8f5d29b4efbafcbd34bf7"
+SRCREV = "23b693f7f7cad8b459beb5cf748078f9cc0e5dc8"
 SRC_URI = "git://github.com/lefcha/imapfilter;protocol=https;branch=master;tag=v${PV} \
            file://ldflags.patch \
 "


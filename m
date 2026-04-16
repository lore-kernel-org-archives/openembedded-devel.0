Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E068AF433F7
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:51:29 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7047.1776318681819883522
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HH1ru3VU;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c156c4a9efso10257582eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318681; x=1776923481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPGYogZ1BNuWGtwnTTeE35fMSS7WfwF72t6yEpzOKWo=;
        b=HH1ru3VU+BE+GTDfF2vmvg9jA17VY7ezKPvzDF+EQuxXGCuQyb0dKe3hhKM2mymqVb
         CtdOO09BgmFRNmYLt9JB1nK6P66nYZ43KLJ9TmR2oYjf8ZBrYzRmdCg+o+5ZEOSRImZV
         xb/EsIV/JIpR7pALVlKNZvb4MU4tZJRD8CXrHQbT29uAH6+YfQzdc6Sv8c4py8KA6k6k
         DPiAeXCmiCSAEZu36nJmrmR32C2ZEwMEBIgwRe1TVEqlIGOVQXW2Jm48IWYfyvdHOZLs
         JeaO+SVOfJo1Dh58bpjShptDB3C3Ye4KMnLUWEOFE4J639b7LOwuTRS8jaZPnZRRQV9m
         qC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318681; x=1776923481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pPGYogZ1BNuWGtwnTTeE35fMSS7WfwF72t6yEpzOKWo=;
        b=TVgYdh/7gVwks8VXW18EPYNLvFihxUISyF+dvs1txZgyjPvp7ZJ/uVmXAzB5HFFIzB
         G++cNJSjvUULNuXljS/jGeT7N8UErRJeP9xjlQnaBNr+51CA5IRlNTx5mu2GyiIIM88V
         BKTymqI3rkRxdjgt2K07RhtpyFVGnAxUKlvG1jFc3UtYC02ixJsgZm2ouTUaryrzuoJh
         YjIpNLI8+rxN0jaFaZBJSEcKMylmaoJP6c5L76hukuiAsoekmSJOQqy0Q/h6mtRoZRjb
         nFo+fZBdvzFdAqJhE5UHd1eqdE01Pyom8o6PplKqhTkZH9tCyd9GBPRrruVBgHZn4R+Z
         4VDQ==
X-Gm-Message-State: AOJu0YzkYH5tECQITwIwTPm2qlIVG/Co4c87dHdkmupGL4vE4gzp/ET1
	u9AcL3WFWPZxZRuXoiLdXaBwlFBWIKSxgDAUtMUutz6SI9vsVmiI0i/eIjPG8jpu
X-Gm-Gg: AeBDiesqVa/LkO9xgMX9/LjXwEfFGeG2LSQ1MoBQNPsMuNkUJ+KZGzmlESdc44kM6+U
	d62NbMV4Ui3FfRaU3Cg0xXHpAYTh+lYnFoMNx/SkUKnYZbmIG6B5LyAe9iHEMm6MAfUVzX+oyLO
	rU2aBxe+hLRLygVnUEIHILLA2wWm4IQyyRERYElZCFanXIC8BUNA/mBQneBZaU8zQNdZg4gUaqB
	nIjxlyYIu5Rwf1vNHaKDySTCt9Bk53jyS+S3pnxhSaF7KlUxMlAApYNFTm6CAKwkHePm5UogpEv
	jb55cZnx1xR3irZIqrE6a4Q2YsSKqEECT1aaI3+HEJuU9ERirOIWjLKNTnrXfM9YkhF5ZIST17P
	JISVqDVhQhyLFBrT9Ev0TkBOu7sO57t1OLwgxOvA4cUf0lHyF7TUNBdXposMAQHY5o42sx1NYOa
	epQTSWRhuGSVFcDGwGyiK3n+DUIwGi/RYuT82nF2ESmE5LnVF0qVgTHHt3nRfMxivPaaaU6hS1o
	CdduXDHkmfMSGVLqwgIjg1fKHZcUhWSF/6bWTpRIh97KR1Q8UNoGPu0M86n2B4numrb+fMXCnc8
	9dZsK8AR4vXYFZ2fL/Nr7j+k8SG3bdpxGldZ0VEgtbSt09bcibJjbW84qiMezg==
X-Received: by 2002:a05:7022:6894:b0:128:cf5c:5356 with SMTP id a92af1059eb24-12c34e68d6amr13413138c88.5.1776318680879;
        Wed, 15 Apr 2026 22:51:20 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm4810182c88.1.2026.04.15.22.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:51:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 17/18] packagegroup-meta-oe: Make pcp and remmina depend upon x11 distro feature
Date: Wed, 15 Apr 2026 22:50:57 -0700
Message-ID: <20260416055058.792189-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
References: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126395

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 72c061e872..7c2df00207 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -840,12 +840,11 @@ RDEPENDS:packagegroup-meta-oe-support = "\
     openldap \
     opensc \
     p910nd \
-    pcp \
     pcsc-lite \
     pcsc-tools \
     picocom \
     pidgin \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "pidgin-otr", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "pcp pidgin-otr", "", d)} \
     pidgin-sipe \
     pngcheck \
     poco \
@@ -861,7 +860,6 @@ RDEPENDS:packagegroup-meta-oe-support = "\
     rdfind \
     re2 \
     read-edid \
-    remmina \
     rsnapshot \
     sassc \
     satyr \
@@ -875,7 +873,7 @@ RDEPENDS:packagegroup-meta-oe-support = "\
     srecord \
     ssiapi \
     stm32flash \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "synergy", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "remmina synergy", "", d)} \
     syslog-ng \
     tbb \
     thin-provisioning-tools \


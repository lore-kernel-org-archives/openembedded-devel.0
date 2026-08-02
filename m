Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391D4C55177
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 12:05:09 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22326.1785672300087980638
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 05:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ODZw5A01;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso2848965b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 05:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785672299; x=1786277099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UA58OPHJErQY7Orjin6AZHk7wp/5isM96Wq48iy6pHM=;
        b=ODZw5A01K9i19W989JyQak17RbVZRSro8bXqLk2O4KApqFOXxifPdSJ3HWknJScDsB
         /oUt6edbqZNAyflhSxBQ3wZVPtMWe0pTXIkbHwWw2PQMX2GfOXhBDGQcEh8krAoregsg
         ItK+naaH21tPoGL7zXELHfZA6dAlQqiSwQmSfj+zSvHidoshp9S83ojPpGKxVhp9POXR
         i9bCCY8a551Dpa9Lzip2oPAR5W0G5gPBcRM4307ywAnJAlQ1cncZ3G/kA/PiwHnM6gl5
         9rox/4guG25Jg+3TLFUiHNrDmBnUWJjUasKeA7IyGGeWnk1odXQor/uqeIp6eo1Pr4mV
         dFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785672299; x=1786277099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UA58OPHJErQY7Orjin6AZHk7wp/5isM96Wq48iy6pHM=;
        b=h7bNsshoQlW1xjNVoOodyMGLVXbLYQ+lzrtLhLdFYUnxBxPgJbe/U+gSbLaDKxyc0n
         3dSaUO7ulllFsI8SpCLNWI1OshdvZNMisDwap0V2Qs5YTXfjjQ6+VVa1qR3A4CQISOk6
         skXvvU2tPuamtwbae+/xfZO/agJaZTVKa0wGfQvOPfLsKhDGOi42dQaAmSQip/hOkBOJ
         ArFw5gPAWVmg1d/itWCgLpFRK4T1JHd+R1fqEM3qwZGklnd1EuJGYJL9DYk2Tkd0nX25
         0ntHzO/0eCZ+BPRJkbxBtGvGeX/Wp0beP663886BrJoYv8WdfGPPDv0L8SFbbw8kzXFI
         ocpw==
X-Gm-Message-State: AOJu0YxGYgSRvm0U5DdW5qrGY2/9SGt2FJ+edKqXoE1jSfHKkUWHAX7P
	BPCunKODlwJ9TulsFTbx7wXFUZmDclmcMjuOuIVKvyVSHZc42Qp/Cl0iPJHEXQ==
X-Gm-Gg: AR+sD13jNqy2Cw9yiNwxxMp1CSVqBjZukEPSqEoLpG81lDwc8+GHK7vamDO09UgSeAG
	HRF3oPc1icM9ywo1wF9aA7nXEcGuKgGZydu55ZYTSvN8l+VaItZP1ahtta7W91BMlgoHFoCwaDr
	ReKLd8/5Y6gKHhnbkaVeKyfYmH0E0kZZ6jT24BeQQpA3EKPmhR5OkB26A2PWUW5qJyzD5jCMM0U
	OJywM2vOESH22bg8eXyblfZa1gGX551pGBUfyeGUO0AoV7lTt9mK+kGHGVBgHLr0XX02TV78nkN
	dXEGU6ZI7fPj7MxYXYpJhXAU1VvobuIOA1U4fpAfApU1bZCOfGn0Yt7kvyMtNGRbhgoh8tqqfpb
	ooUNJTUTe/pqoaZJQsOelQn0i+0p6HZKcnD9nb+N6mGCXfR2XZQ8I6Brb9B93r8vldvrsAAG7I0
	XlS/QDSMrYvHxFmTE6HC//qQrPuyUzIKkuUU+4fCL0EqOHSabmoKqxJE6p47l50ckb/hA7hkph/
	Q==
X-Received: by 2002:a05:6a00:2343:b0:848:7e85:f208 with SMTP id d2e1a72fcca58-84ee4954d26mr5760867b3a.37.1785672299511;
        Sun, 02 Aug 2026 05:04:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39eb13dbsm2556152a12.29.2026.08.02.05.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:04:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][master-next][PATCH 2/11] nghttp3: upgrade 1.15.0 -> 1.18.0
Date: Mon,  3 Aug 2026 00:04:33 +1200
Message-ID: <20260802120444.2973561-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
References: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 12:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128657

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Sub-source munit SRCREV unchanged.

https://github.com/ngtcp2/nghttp3/releases/tag/v1.16.0
https://github.com/ngtcp2/nghttp3/releases/tag/v1.17.0
https://github.com/ngtcp2/nghttp3/releases/tag/v1.18.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nghttp3/{nghttp3_1.15.0.bb => nghttp3_1.18.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/nghttp3/{nghttp3_1.15.0.bb => nghttp3_1.18.0.bb} (87%)

diff --git a/meta-networking/recipes-protocols/nghttp3/nghttp3_1.15.0.bb b/meta-networking/recipes-protocols/nghttp3/nghttp3_1.18.0.bb
similarity index 87%
rename from meta-networking/recipes-protocols/nghttp3/nghttp3_1.15.0.bb
rename to meta-networking/recipes-protocols/nghttp3/nghttp3_1.18.0.bb
index 2539939bb1..a0d1b97d93 100644
--- a/meta-networking/recipes-protocols/nghttp3/nghttp3_1.15.0.bb
+++ b/meta-networking/recipes-protocols/nghttp3/nghttp3_1.18.0.bb
@@ -9,9 +9,9 @@ SRC_URI = "git://github.com/ngtcp2/nghttp3;protocol=https;branch=main;tag=v${PV}
            git://github.com/ngtcp2/sfparse;protocol=https;branch=main;name=sfparse;subdir=${S}/lib/sfparse \
 "
 
-SRCREV_nghttp3 = "d326f4c1eb3f6a780d77793b30e16756c498f913"
+SRCREV_nghttp3 = "dbfc24286138cb0b6490160e7ca87fe1ce6722a0"
 SRCREV_munit = "11e8e3466b2d6a8bdfd4b05a3d1ee7805c5d3442"
-SRCREV_sfparse = "ff7f230e7df2844afef7dc49631cda03a30455f3"
+SRCREV_sfparse = "4b313cfd2e1b389ae632b36dcd50402307289af2"
 
 SRCREV_FORMAT = "nghttp3"
 


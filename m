Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F8BCD4F28
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:05 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17881.1763014801171549971
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LQ60i0Cs;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso374072b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014800; x=1763619600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceMACGqAeOEU0LKEOz4O6X7FkpLtIekKX6Tvb9vYze8=;
        b=LQ60i0CsvBf0dhYTz0dtoYv1oL4BNf1kSdcRVQC0cid4ZAWih4I/p5Z1NuwlSSNj+E
         m8YZ9Owjk0M3kkWyUAApx3cBO4yuAOfpG9auEo8eRvYff/IXig0bi4iDBksvPjaw+4/i
         dpQS8upLX+lhLG6UlzFXT3oJBKfxJwzdFKiSO6xtPAvV+7HLka/P822cznn1nOyk146d
         /eftyMeoz0Ov+md7ZpwTJswOXh8pgyLxlNojQae8a3/3cdS9V5rDoSTNGWuaP8mVSZP1
         wiA3G4gFW5mDvlrHq93pZVRBsNVhHSBvgp99yAOeGhgFq+GuspqCuP2JfZJlgFpyn3tj
         +6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014800; x=1763619600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ceMACGqAeOEU0LKEOz4O6X7FkpLtIekKX6Tvb9vYze8=;
        b=f7YICEbEYm1IJ1ZIGe3CH0+vdRDMJAj9ooby9cO7fULi0FfBijoeGdmm28M8R0Ry+L
         Du93xAf3+Zfr4yONHPJAg/4+I2NwgpRc2JJva7NJZz64Oi8zMYaL32JcqBWGymQE4nWf
         OHwvTaS7QcoQ8xJzlSMSWhgc1dr3kEtL49ZQSkF4//bOBqcXKA8nKl4KbxdnmaAHqgpY
         ArKs16btZdR/i3TbbTfFbhvGiCImBn8DGHEwcrmL7fuVdnQu7qpRykWPhuNrMNkL8hjH
         b3HeWQKSe1G+LqCxAynelVh3iFBAsej+MEtBflvAm5JVB235+SFWQ8WzcnZglJoHLyqX
         SNSA==
X-Gm-Message-State: AOJu0Yxg66zmJhMyqCRg2p9Asx6eW8VeuMoL2S+VyxuUhYNBAmrGqYTZ
	1b8g/cmR5te7s8/z8YD1wJabO3bbzoCstfAr4ncmE3y61y8J8robzO29ELrYmw==
X-Gm-Gg: ASbGncu0GwgzNorAj8Rg2wfpK4sCXhp+F5nH2xqGswkd3WyprtdLRYFCHv5PTuu1J5l
	AETPY/MzSm148L3o+OD6tQ0aYWJ+aSfuyYG+9XgOz4Dc7dxhqx8mGZXtAKmh9Ga+Pn3y0/MSS47
	3zgYRRT+jMNrMfO3J79R4bKB4RHQutBMIO2E79KcjLE7HuJ221Nl5o1duASq4Li2Bi84m/MmeMH
	vQjICAgwhH8XAKLiLSDrcA0AkP7SgWC/lPeCX2F7nXibW1+yD6pISeEGwk1hbe1CD5wJqpeS2Ic
	RH2jp2ji4xuATyiKKyD/nr5vBdTA92GZu8BGlEKzH5WFJ9svcnrI3QVQfZ1fdeLYdm3Ejqbc3UG
	r2Q5KZgb9VXz/3944INKfgtClyPpxwkdpSe4zN/M+45MjtPGCkGpnySL5VkSzt/+0ZXrioLu9Ws
	vllghmuPlTUDvrow==
X-Google-Smtp-Source: AGHT+IEV7ZFArVZptiSxtQlp5GC0QFpT8/pz6FmbY59ttqmStBHeK61cYs+TcOWD4T3dXpiRBjyLAw==
X-Received: by 2002:a05:6a00:3d0e:b0:7ac:c6f4:abc2 with SMTP id d2e1a72fcca58-7b7a52ca44fmr6086526b3a.26.1763014800422;
        Wed, 12 Nov 2025 22:20:00 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:00 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 10/38] openldap: upgrade 2.6.8 -> 2.6.9
Date: Thu, 13 Nov 2025 19:18:45 +1300
Message-ID: <20251113061914.3756301-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121608

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
https://www.openldap.org/software/release/changes.html

Drop 0001-fix-incompatible-pointer-type-error.patch as the issue has
been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1768156191e425c3c95b0307a329674e9d79a9fc)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../openldap/{openldap_2.6.8.bb => openldap_2.6.9.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.6.8.bb => openldap_2.6.9.bb} (99%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.6.8.bb b/meta-oe/recipes-support/openldap/openldap_2.6.9.bb
similarity index 99%
rename from meta-oe/recipes-support/openldap/openldap_2.6.8.bb
rename to meta-oe/recipes-support/openldap/openldap_2.6.9.bb
index 8550c10b21..02f292a7de 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.6.8.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.9.bb
@@ -21,7 +21,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
 "
 
-SRC_URI[sha256sum] = "48969323e94e3be3b03c6a132942dcba7ef8d545f2ad35401709019f696c3c4e"
+SRC_URI[sha256sum] = "2cb7dc73e9c8340dff0d99357fbaa578abf30cc6619f0521972c555681e6b2ff"
 
 DEPENDS = "util-linux groff-native"
 


Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A90CA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:12:04 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5123.1791839519717725171
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UroTXqX4;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so1815952a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839519; x=1792444319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xiGx4zfZNuwp8tv4MzK5ca16ry5+iO4X1zhBEE7mtRY=;
        b=UroTXqX4JwKgRx2gCQ0j5En5L6VlJk3Pq44Ae+vT2dDGNc62bPeki0HZjPtu8n/URu
         M4saynToJAEcMmkvQ9MbarXpINKpptFBiqIho9vExTSLPGcMv5gA8ZoF6HRt5cLAjtec
         TXIycZGT2K4aFIsdyFHZKGIUr/a52YGhH4Yu3X0ifsho/U2JePCR8n+GmOqwcYYx1AWF
         ohceO8YSOWLr6jk9g7hC/XIbtMC2GFviIwqptKfSlKlcWnxf7wv8DYkELIaf5CpALfon
         CW/4Pt2iBTFmoio2tn6l+gbHhEaOh6WdrnJjZ3TlP1xIbaBetEJdVOum0C+npbO0M0Yn
         5pqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839519; x=1792444319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xiGx4zfZNuwp8tv4MzK5ca16ry5+iO4X1zhBEE7mtRY=;
        b=paFd3eUG4Ven+6flLBWmNRrpYWEIgJYDYng3Mr635vCWi/JHK5EbMiAyfaMSQG6BLu
         +M9CBO1LmUzl+01o293u/VEkUs607aCf+6sMxGeuyNISA/kLh36bA01VnnehRBCjmExd
         WkSCnt0uz1u81RRZJKx5E/kz80DiJTF+krDkkRMpbWm3c8Jo+1+y7thBJzT1zd/yUrjK
         vdI9CbsS96gMdD83ohIzhDd1wXLWXAwgk89qXDxiRNifgYm3XpItefHx4SEfdOE+/aaF
         MLNA6qtuQKC3G7XheKEmJ9aN/SVydquYZDKWGJlzbSVtKSxgk7uaQVRop2EnM5BJYxr0
         E5Eg==
X-Gm-Message-State: AFq9FYLqLugteQGlHtqQHDhzyK9HJYXFu4PEY+XmUf4ZeO1c6ZeDif6A
	e6gdwXp420yxdb1pxmfuqLIqM6yFQzILnbrLljYpZu6ACJImPBm+Y9j71r3+57f7
X-Gm-Gg: AYBFou3h7dnJV2NhfPa6SxoUcu+LhVirxj7UzD44ufva3IcGOtYTbFhMbU6sLXXLR5r
	SMZqGyOtrSo+TdpZ06h9IZ3JBL4RukI8eETGRDqhvyjy06SKr3TgyLbxxUiXllmb0V04K3D8Ia/
	K+J+gYcLgqBxwqkz3WhMukkcqM56T5vFs7dEVrTjdvNzGu05V241eDnlFgdGeM733JlwTf9vN3M
	PiD4H9946fDDm55plUOK9eiMqNG2ohbMzU7vQreIvnzCSv/7pSN+TXlskAexkK8lRotLxANLEvl
	Mhyxo7pMdEawlH3kxN3xVFXARu+DmsHhbsGaPmMACdUwLJl+MDr7qRKcyQs2V45N8QxZiI5yrLB
	A+yvLHcqJVnBWGLMgoK3MqDQBu9YzRHssTxycEx88kPC3RDdeBwuTXcb4KaPGeuhCl/bjv5f4C0
	tLLmRNkeptzhrYO3xqCekcCDOgUXfCeLYAlRV8js2VYqgHXPnO44h71xQ2jSzYdWcWzGRZteZ6O
	EwrqnvEzTgYeHGvT0qsHXOj0NubZpoVeNxfR1U=
X-Received: by 2002:a17:90a:e01:b0:3ab:e588:c2a8 with SMTP id 98e67ed59e1d1-3abe588f9a0mr2241965a91.64.1791839519102;
        Mon, 12 Oct 2026 14:11:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:58 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-python][blacksail][PATCH 40/43] python3-tzdata: upgrade 2026.4 -> 2026.5
Date: Tue, 13 Oct 2026 10:10:04 +1300
Message-ID: <20261012211009.3352822-40-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130810

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/python/tzdata/releases/tag/2026.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 01bd918ea8c7a391e977b9ab409605fa7fc5d953)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-tzdata_2026.4.bb => python3-tzdata_2026.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2026.4.bb => python3-tzdata_2026.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2026.4.bb b/meta-python/recipes-devtools/python/python3-tzdata_2026.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-tzdata_2026.4.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2026.5.bb
index 9bd29afa61a..4590cec28de 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2026.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2026.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=804220b73c90950be376e7ff7b2066bb \
                     file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     "
 
-SRC_URI[sha256sum] = "f1b8bd365d8d210c55353f4d7f8d6d8561c0ba50d704b700d195a9424bba0d79"
+SRC_URI[sha256sum] = "8cc73c0a0bfca7dbfa59235d60b2eff82231dee33f53d206db1acd9173cfc0a7"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 


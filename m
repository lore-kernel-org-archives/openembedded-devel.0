Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by mail.openembedded.org (Postfix) with ESMTP id 56E717E08E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 21:15:22 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id u14so24993132ljj.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 14:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=8zqJfkb7f+kaWOY1/tlQyZNylu6pueEJBBykDGV5RwI=;
	b=Ac72oqfpaBp8X6n0ItcoKvCICf8XqRLgRdzI48L5Oi0/U+4Bpk4AHqnwRf8HuIwNIH
	Zs2tLwzW49DIz1A/pUfQf6KzAnIftQTgESG8BgIbu1z1eZvzXTvqynUWgEUHve0vmHL0
	5K9GpQsZ8Zu654i5bXjnqFh9jDAbh4uXBpGQScvHiQvlQts9KnrVTR84frKFlsNyeRek
	ctkMd5MarkBcPmOQmuEUkuyqnPZhuRD1I5webnxTS2e521DZEjJyg05fQr7PuHQnPqtZ
	5G9BBmhth0eoNX9OnKcb1Uxa0ndKxadmn8XYIqlLCXEI4mmtk6qJZUflRGzbPQPSPLhh
	qy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8zqJfkb7f+kaWOY1/tlQyZNylu6pueEJBBykDGV5RwI=;
	b=INrmyHA/1xOlbzJQXTmCNnngrtpPRxVdZCZR+LTrt70zavKUvs6xBEQiHOrJF81zaD
	S7dMpWMnUnJ2zJwM3LA+iP7iInmR26ff/mJ5JN3fkXYUgYNDrdB/LJX4tS9otDlBbbSG
	3JvHTtV5Z38slglcK8N6XYPBLntCPRTLtKic8bXd2es/0RjiHfsgZBt9Q3imovyUxAYD
	0hqFBOhf4GzGj7Y3+CU+WqLNHtLYCkaIkfEMLny0COtxWrffqBt93JXw20stJGFbWmv0
	rkAOxKBLvb2taNUwQCWr7xdN1ns3JJIiQ8KbFUOhFZgCa1c8trklgAJMsaI0V4lWS36X
	np6Q==
X-Gm-Message-State: APjAAAUtzXaryo7ux9dfIjpITFv6997JPbxjT1zstE/X4YDestrLsWRG
	kKdM4PCFDdfYpcl5s1lLpfeulLIzzko=
X-Google-Smtp-Source: APXvYqynvs/LKYE81DAtk4vXCL7p8ZPxbXK8Mla6evhT0JbKfrWJJeJlSq90k5WckWhp26nTm6nWgg==
X-Received: by 2002:a2e:5456:: with SMTP id y22mr28641723ljd.60.1568322922725; 
	Thu, 12 Sep 2019 14:15:22 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	d28sm6559831lfq.88.2019.09.12.14.15.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 14:15:22 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 23:15:20 +0200
Message-Id: <20190912211520.25521-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] ddrescue: update to 1.24
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Sep 2019 21:15:22 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ddrescue/{ddrescue_1.22.bb => ddrescue_1.24.bb}          | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/ddrescue/{ddrescue_1.22.bb => ddrescue_1.24.bb} (90%)

diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.22.bb b/meta-oe/recipes-extended/ddrescue/ddrescue_1.24.bb
similarity index 90%
rename from meta-oe/recipes-extended/ddrescue/ddrescue_1.22.bb
rename to meta-oe/recipes-extended/ddrescue/ddrescue_1.24.bb
index 2df7db9e8..52bd11b1a 100644
--- a/meta-oe/recipes-extended/ddrescue/ddrescue_1.22.bb
+++ b/meta-oe/recipes-extended/ddrescue/ddrescue_1.24.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
                     file://main_common.cc;beginline=5;endline=16;md5=3ec288b2676528cd2b069364e313016f"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.lz"
-SRC_URI[md5sum] = "49c845ed89d25b534842e40366154cb4"
-SRC_URI[sha256sum] = "09857b2e8074813ac19da5d262890f722e5f7900e521a4c60354cef95eea10a7"
+SRC_URI[md5sum] = "8ac89f833c0df221723e33b447e230fe"
+SRC_URI[sha256sum] = "4b5d3feede70e3657ca6b3c7844f23131851cbb6af0cecc9721500f7d7021087"
 
 # This isn't already added by base.bbclass
 do_unpack[depends] += "lzip-native:do_populate_sysroot"
@@ -42,4 +42,3 @@ do_install () {
         rm -f ${D}${infodir}/dir
     fi
 }
-
-- 
2.17.1



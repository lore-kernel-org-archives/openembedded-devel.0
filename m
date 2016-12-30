Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wj0-f178.google.com (mail-wj0-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 456046FFA4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 06:59:18 +0000 (UTC)
Received: by mail-wj0-f178.google.com with SMTP id v7so373015480wjy.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2016 22:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=q5dCytxbjIIGl0+20xRZNSi0JooCckvIpLk3k1xCvVM=;
	b=WPbZmu6fZhGFWa8WLYa/6SKUbmBxAIrdVaHdZTSyI61UnnZz5w3sO7rq+Ai/hKzD5J
	++h58h7pO+W30X8SNe3jvfBmA87TwhGhpjDW5plwm0YtCFbrIew8k2KGRp3OcgNSoNsR
	1UBKMasgd/V3I2ef+EwDOy802Nv2r7bQli8MjRYjhICpkwbUvX+fdBbwV1JIVYoTgmu1
	1GW+UtWVhzB7RCrQxMeYMZ29meWsQenkGV0IqTsnVywDzRy/kzlImV+h67lT6tev/1GZ
	1s0hruvtUxyodArJ4F3LV6k2vzbxVJZ6PK0/TUf6hpjh2vPo9FtZDjQ9gzhcNuqznPzI
	l7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=q5dCytxbjIIGl0+20xRZNSi0JooCckvIpLk3k1xCvVM=;
	b=ZJBpvOb56/GvvQ3DRL77y4H4Da0bBpOjISo4PBGSummE+Ws4iYYR6qQVpd/skUNlzW
	ClwqdnckTN3ByAxTU/ahBi4U1fhk9zEq1z4Woc7OFdTJkvmt3o5h9KIllnGeUfuoutSz
	z/P9qttpYy+7On7KepNWFBs71+YqmgiL1w2nqZTMBVFJql0SW8wlvsKpMn3yhz3T6+8W
	vaQeThB/10hoGN5hDG6/D20kekZ+7LQR0WpxzjmhwFcUm201Y4lHbp+0bJkU41+EQ6xM
	ehBmku3j5VC6GWK/PSQIonM1Vm6RK9AFYh33cAWpKdn28JOGRxosF0v4RA/iUeLQS09U
	9UtQ==
X-Gm-Message-State: AIkVDXL2PMCU7HLUTpEnAk5uut9F23pTwNgj6YlPHarSncskN3GnEqiZDAuPCH3/ZsbWrCGW
X-Received: by 10.194.185.146 with SMTP id fc18mr38616573wjc.45.1483081159818; 
	Thu, 29 Dec 2016 22:59:19 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	f67sm68512741wmd.13.2016.12.29.22.59.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Dec 2016 22:59:19 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Dec 2016 07:58:51 +0100
Message-Id: <1483081131-3857-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] pimd: update SRC_URI with new source
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
X-List-Received-Date: Fri, 30 Dec 2016 06:59:19 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta-networking/recipes-support/pimd/pimd_2.1.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
index 41b8f6d..cbedea1 100644
--- a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
+++ b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
@@ -4,7 +4,7 @@ SECTION = "net"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94f108f91fab720d62425770b70dd790"
 
-SRC_URI = "ftp://troglobit.com/pimd/${BP}.tar.bz2"
+SRC_URI = "http://ftp.troglobit.com/pimd/${BP}.tar.bz2"
 SRC_URI[md5sum] = "a12448bc7c9bfcebf51a13ebf1ffa962"
 SRC_URI[sha256sum] = "01016940543a0a6131d4e6c91b595d47e187012c59a298eec14c3dbc38564b3a"
 
-- 
2.7.4



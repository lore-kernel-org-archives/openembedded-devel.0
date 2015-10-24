Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 12CD360657
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 17:57:41 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so146183958pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 10:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ItBw+0ey1zBWXyNcpJDk5irLgtKmVaL2he6DVm4wwxs=;
	b=C7NdTRtU4+Iqnju/yibdq1Po+lZcZjZ1RXdb7NJC7Tbfr5SC80DAakrU1ZVWBcVT0l
	L2MZIHLwJBY0DhhyAcK7m1LsP3s5Oo5cBZ0iU6fdMv3VBjuKUGQa0jw7YEWo+lgbjSlw
	HACj7BceWqsQ8aSEYF4AWHcT1x070V2wdkaZk4kAZan2+2foHtBtCOrgFXJBoDUzoDjm
	G9Ysac83fXgbDqOmaZ2kWKEYmJdVUB+pfIFu5Y7yO39CJEgM2uEYr9SSFpkQ//pqxVMk
	VxHUqMQrioF509nX//y1Q4amRB2UP2zrCiHeQbmvppM5MuQfY1QlX5gd12LYveobNKD1
	XXng==
X-Received: by 10.66.216.101 with SMTP id op5mr12191980pac.71.1445709461567;
	Sat, 24 Oct 2015 10:57:41 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	b6sm25206477pbu.90.2015.10.24.10.57.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Oct 2015 10:57:40 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id C4D2DFC66D8; Sat, 24 Oct 2015 10:57:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 24 Oct 2015 10:57:25 -0700
Message-Id: <915d73ef8606dd4978d9e876eabf21da0e591fba.1445709055.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1445709055.git.akuster808@gmail.com>
References: <cover.1445709055.git.akuster808@gmail.com>
In-Reply-To: <cover.1445709055.git.akuster808@gmail.com>
References: <cover.1445709055.git.akuster808@gmail.com>
Subject: [PATCH 7/7] ntp: upgrade 4.2.8p2 -> 4.2.8p3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 24 Oct 2015 17:57:45 -0000

From: Li xin <lixin.fnst@cn.fujitsu.com>

4.2.8p3 fixed CVE-2015-5146 and Bugs.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/ntp/{ntp_4.2.8p2.bb => ntp_4.2.8p3.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p2.bb => ntp_4.2.8p3.bb} (97%)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb
similarity index 97%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb
index 693bdbb..2c1345a 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[md5sum] = "fa37049383316322d060ec9061ac23a9"
-SRC_URI[sha256sum] = "0d69bc0e95caad43ea04fdad410e756bae1a71e67b1c2bd799b76b55e04c9b31"
+SRC_URI[md5sum] = "b98b0cbb72f6df04608e1dd5f313808b"
+SRC_URI[sha256sum] = "818ca4f2ed6ca845b1c5ec43f5e6ad905eaa0fc0aab2d509ed6b962a37fbf38f"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
1.9.1



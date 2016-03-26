Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7B9446E630
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:12 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id y89so8548409qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=iXg3PLL0kLM9OXMNlxqqhAWkTO8oJUHOK81HDvY94Gw=;
	b=BI1jyaKAHFuG/BtJfQN0GBGdlWSeJZvQLwkUt8O97kDf3bJ1pMk3z8PmYeh/iOZouG
	A5yZNwRew6++7JujnXiz2NtpNYPWhZjCJkhnd/4y1s4R9g4PP3UIqhkTITWmwpUjrkAl
	YK9ilCSL+xIDgqBSZ9VZ4/zUHHjVZZssctqf7iuqe8g3/UfZjFkwjIIYvZ81OjxAsvT7
	Lyl8EfqPFNzN4js9J/snAHDBYJT1OlDrRnfKKFYUup/SWe19YLL2pZvdE6JOnOv4Av9d
	YG0nAfXkZNj0z98J4TgeEYBDPZS9DDiTTMF5YhlB+LVxsLdtU6eQX4dR8OC7cmBrV3rh
	4Ocw==
X-Gm-Message-State: AD7BkJL0oyRClg3wjb1q7jsKOTBTEopBsfqTrRPqd3vgI9IO2Bu0+OsKTnLVsgkRkMTLYQ==
X-Received: by 10.140.38.104 with SMTP id s95mr23263463qgs.7.1458997513257;
	Sat, 26 Mar 2016 06:05:13 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:12 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:27 -0400
Message-Id: <83e6e837027b9b6a7e3354c56a236595c89fb426.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 07/30] python-whoosh: update to 2.7.3
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:12 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-whoosh.inc                | 5 +++--
 .../python/{python-whoosh_2.7.0.bb => python-whoosh_2.7.3.bb}        | 0
 .../python/{python3-whoosh_2.7.0.bb => python3-whoosh_2.7.3.bb}      | 0
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-whoosh_2.7.0.bb => python-whoosh_2.7.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-whoosh_2.7.0.bb => python3-whoosh_2.7.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-whoosh.inc b/meta-python/recipes-devtools/python/python-whoosh.inc
index 84868f9..b3cde75 100644
--- a/meta-python/recipes-devtools/python/python-whoosh.inc
+++ b/meta-python/recipes-devtools/python/python-whoosh.inc
@@ -7,7 +7,8 @@ Whoosh works can be extended or replaced to meet your needs exactly."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05303186defc6141143629961c7c8a60"
 
-SRC_URI[md5sum] = "9a0fc2df9335e1d2e81dd84a2c4c416f"
-SRC_URI[sha256sum] = "cdfc0e1c5173207ac7b312afe78d83fb552cfed30427bf7b3dba8b1d26cea8f7"
+SRC_URI[md5sum] = "891edeba96cec53604c0cd176284c4cf"
+SRC_URI[sha256sum] = "aa6db447522e208ae652c6ce063bb23cedec47f5ed630121b3debaa011fcb9c4"
 
 PYPI_PACKAGE = "Whoosh"
+PYPI_PACKAGE_EXT = "zip"
diff --git a/meta-python/recipes-devtools/python/python-whoosh_2.7.0.bb b/meta-python/recipes-devtools/python/python-whoosh_2.7.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-whoosh_2.7.0.bb
rename to meta-python/recipes-devtools/python/python-whoosh_2.7.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-whoosh_2.7.0.bb b/meta-python/recipes-devtools/python/python3-whoosh_2.7.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-whoosh_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-whoosh_2.7.3.bb
-- 
1.9.1



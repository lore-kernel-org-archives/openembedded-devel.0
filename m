Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E5BFB76E3F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:30:53 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u188so518473wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=7TUXgmhEQzBexU4cJRBd3ckBro1Fv5n3attTTi+RGWI=;
	b=mRHuyu3gJaFpGAovRwF0oevtMLlAHe3wG2v5RI0aJorRJESbgLv7+lRj5qT0tOV27g
	29F/saSRcjz5sfBttS6z4lLrMuswtn9ZJfPmMIDz++p0lca7YhbtZbxF/zPomVMjSHks
	gDWLJRDkQPAPXrQWGEF704oeu4HGapLJ1ExvNJA0mKghPP01nwN6bEAFraReMkc2MsA4
	n+E6/5t+MZ/aV2Slo9Fd8UuLw6ZnFmokBNWNECYTsK4qxuFzzCZkcKifwIUDPDG84hgJ
	0cOCmVS5lCbBrQMhYGQ/EcPkFlI+omA6CPNatu8grFg36Du38k1CL4g53oWcUpAK4YvH
	CZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=7TUXgmhEQzBexU4cJRBd3ckBro1Fv5n3attTTi+RGWI=;
	b=TSondcvk1L62UDi9BJpY9EkK2xNThUR5bVV0QKDNKcrgWnIj8MtV2SvW/N8IHt0+FI
	a180EVTBJobJ+XpwzKksEwFQcb8w6SKUD20Fz87D3IpPigEb3rR/95t0w747yMQ91r+h
	O+o97uHUglT5c++wWBA2TZMb+3laGvrh94RHLGkam5EJPX4f0oaWzjJsFtWVQ8NCrlAx
	PC/F/zqBppMWx3sUxDjz95wCzPVeT/iH5hK66dpz157rfLyY1QfmGBZolIcp6zGazOVy
	3fc1+DTTyUaxDglko4AejrjBKHRCNeab3cjJLG+JqxcI44odxF6k46UnOhgmaETAdODk
	tZcQ==
X-Gm-Message-State: AG10YOTSmyA+D4L8WMIpIYi1vtYRUK3uJEV9Zq27W/BRS7ivUMrVOVtC9HwuTgXoWlqgqA==
X-Received: by 10.194.121.167 with SMTP id ll7mr6583896wjb.113.1453505454272; 
	Fri, 22 Jan 2016 15:30:54 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.30.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:30:53 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:12 +0100
Message-Id: <4e1e47e5bd11173df520208e17f940c5d4e7953f.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 10/21] python(3)-redis: add recipes
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
X-List-Received-Date: Fri, 22 Jan 2016 23:30:54 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta-python/recipes-devtools/python/python-redis.inc        | 9 +++++++++
 meta-python/recipes-devtools/python/python-redis_2.10.5.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-redis_2.10.5.bb | 2 ++
 3 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-redis.inc
 create mode 100644 meta-python/recipes-devtools/python/python-redis_2.10.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-redis_2.10.5.bb

diff --git a/meta-python/recipes-devtools/python/python-redis.inc b/meta-python/recipes-devtools/python/python-redis.inc
new file mode 100644
index 0000000..e64f041
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-redis.inc
@@ -0,0 +1,9 @@
+SUMMARY = "Python client for Redis key-value store"
+DESCRIPTION = "The Python interface to the Redis key-value store."
+HOMEPAGE = "http://github.com/andymccurdy/redis-py"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
+PR = "r0"
+
+SRC_URI[md5sum] = "3b26c2b9703b4b56b30a1ad508e31083"
+SRC_URI[sha256sum] = "5dfbae6acfc54edf0a7a415b99e0b21c0a3c27a7f787b292eea727b1facc5533"
diff --git a/meta-python/recipes-devtools/python/python-redis_2.10.5.bb b/meta-python/recipes-devtools/python/python-redis_2.10.5.bb
new file mode 100644
index 0000000..6cb5288
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-redis_2.10.5.bb
@@ -0,0 +1,2 @@
+inherit pypi
+require python-redis.inc
diff --git a/meta-python/recipes-devtools/python/python3-redis_2.10.5.bb b/meta-python/recipes-devtools/python/python3-redis_2.10.5.bb
new file mode 100644
index 0000000..59c4803
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-redis_2.10.5.bb
@@ -0,0 +1,2 @@
+inherit pypi3
+require python-redis.inc
-- 
1.9.1



Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id B8EE770A77
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:09:09 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q58so6793230wes.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=y/nboq0R6NE6pMAqFrIfEQC90XAV3DrHtMXfzz1COjI=;
	b=zkMcg5OJfXsfqzglS8QX6XzOVG8oiC2IX6ECTSPOyh0UMd0Wyvk21etgz2Gton8IKV
	bCf744If0q4BDX9XN2CIxzDVbe6g6VanAiOpMvmeiAowEvpqXX70EHrsPY8d5kpUXKtz
	yncmHpvl/CEH+ABdBgPo0y7khvnXar7gJ6XFlLhwFdxIyf3LgojW8FoRJ+B+GIjDYJ7m
	VYjrnmw2RHSDNjDbFJ6DgcZUY0SUl1g8m0BJ/d44isTYO6GyoCxrbPc+aMc6H1F8Q2Lt
	ztRRY/2M1q+3LX0TiBtJ85TqoAqA7zFgG6NxyjY5daPr/wCGbkDdY3hD53birXc6ttHq
	6ssw==
X-Received: by 10.180.212.77 with SMTP id ni13mr7351678wic.42.1407600550353;
	Sat, 09 Aug 2014 09:09:10 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ch5sm25538064wjb.18.2014.08.09.09.09.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:09:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:56 +0200
Message-Id: <1407600537-10857-35-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 35/36] snort: add dependency on util-linux
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
X-List-Received-Date: Sat, 09 Aug 2014 16:09:10 -0000

* fixes floating dependency:
  WARNING: QA Issue: snort rdepends on util-linux-libuuid but it isn't a build dependency? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
index 4d0e342..8f5175e 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.snort.org/"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
 
-DEPENDS = "libpcap libpcre daq libdnet"
+DEPENDS = "libpcap libpcre daq libdnet util-linux"
 
 
 SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
-- 
2.0.4



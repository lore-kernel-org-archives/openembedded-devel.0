Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB296013D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jul 2016 16:55:21 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id ts6so2239908pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2016 09:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=WtleyVHMY7E6rTjsXNCb1BnqZJ56gn/kXMJbEkgDEQ0=;
	b=l19ik0R5YRnCDZjROui8jZ+ZPIBlqIRthNFRDOe05+IIjwKQa2x4BiKtSzJhSao4Gs
	noNVaEV1vcn3YaLJgaqSfL/sflaYKaGXUNhm+OLAcmsfhtAZyVSwnxUo5xdwSGtjAHuO
	5tXF//KNV1rkVkmx61/F5i/AHJKqS+JjwXojSCuzYXTB7JEQc3SxXAD6gkCOVu+IWFL3
	9HdDPv89pHeKThvCWgKnklSntqUzeq27ifY4Qe+PdaEgOS8mQ41Wk0LOMKuZ6KcJesQs
	f6h9I8Tjrotltc/CU25fMVdcDNxiL5tQgiGgryOU/G8iOvnlfWF4T9WAyYxheLosaH9r
	c3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WtleyVHMY7E6rTjsXNCb1BnqZJ56gn/kXMJbEkgDEQ0=;
	b=bTfDBAUzUVzHJupCuAov2IgfFphA25nOaVcbtrOgDQFESZds9Q2vMt/FEFLXgoyufW
	8jYhYCoHflqrZZJgvM6S+3H4NhoRZJUMbBcoV3xPzdn1lSmIork6BRdteX7da7QCDQZ4
	UyUqSIgljTXKzFpLDkwrpGBFo9kEmhesTssPvXzuGlOFpHX6FaBJV0VNIm9UsyfGjUYd
	dgBC7WZPChUg0jj9k4/SXxgKt1y3HbNAlY8z4GNzCnDBnCb+1dXfn8JcJrCMovT6l1xm
	bqfCUWWv3ClAFOuXNsoVQ5DfKNoHty5l/yxidb3qBFr1QZagSSf2aQBYIGohS+O8hJHY
	fSXw==
X-Gm-Message-State: ALyK8tKFZyod8vGY6SMA9FWVfKW3sHeJEQf32AIVf7ZmxAGAGzJwgr7RjjX7k7CJzZFk6A==
X-Received: by 10.66.138.110 with SMTP id qp14mr1903784pab.135.1467910521737; 
	Thu, 07 Jul 2016 09:55:21 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	yt4sm5674470pab.26.2016.07.07.09.55.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jul 2016 09:55:21 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jul 2016 10:55:18 -0600
Message-Id: <20160707165518.22440-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.9.0.18.g2ff7dff
Subject: [meta-java][PATCH] openjdk-7, openjdk-8: use vardeps to fix shared state
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
X-List-Received-Date: Thu, 07 Jul 2016 16:55:21 -0000

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Previously if PARALLEL_MAKE changed, so did the task signature
for do_configure. Use vardepsvalue so that the signature remains
constant.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 recipes-core/openjdk/openjdk-7-common.inc | 1 +
 recipes-core/openjdk/openjdk-8-common.inc | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index bb399b1..759b426 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -80,6 +80,7 @@ def get_jdk7_jobs(d):
     # Whatever found in PARALLEL_MAKE was not suitable.
     return "1"
 
+get_jdk7_jobs[vardepsexclude] += "OPENJDK_PARALLEL_MAKE"
 JDK_JOBS = "${@get_jdk7_jobs(d)}"
 
 EXTRA_OECONF = " \
diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index dd3d397..74f686d 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -186,6 +186,8 @@ def get_jdk8_native_jobs(d):
     # Whatever found in PARALLEL_MAKE was not suitable.
     return "1"
 
+get_jdk8_native_jobs[vardepsexclude] += "OPENJDK8_PARALLEL_MAKE"
+
 # A function that is needed in the Shark builds.
 def get_llvm_configure_arch(d):
     import bb;
-- 
2.9.0



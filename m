Return-Path: <kergoth@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 04572708C0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 16:13:07 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so8611673wgh.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 09:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=zTQE1EplPhljRrxrmlVx1OoKlJo/Lru3jkKpuIReFDc=;
	b=rrtUgcxjqas60eq1wRIKBNmkMMNn51Qm02SqV4FbLJzEmXdO8qR7D5kdeK2kUrMSY8
	IPkxuq6lvje3VTzhJyCLb0fs6QzMMYrAHGNOflTDVkZZpRJgpdpqb7dK1RK2Kjg9ijZQ
	rLesWGhq8oWg+qiqhl6ZShX4Sr9GhfEOi53q9JXOVfjP8yyV4Ff6uYdnfCETeUrm58VU
	NR+1F5EOWuZOrXuyBxGJXJHYdpXRXaWEd7+8/xt+KnDkF4pG9cy8glIAYnBLQd22QctK
	2HGLaRxOaS5cb7HFy9e9GcNzf5WMfDOh9olDUCop1qhNRA1TyORpAWM0oVYG9vk3NL5h
	zwiw==
X-Received: by 10.180.187.141 with SMTP id fs13mr27125576wic.57.1407773588147; 
	Mon, 11 Aug 2014 09:13:08 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id 20sm2589822wjt.42.2014.08.11.09.13.06
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Aug 2014 09:13:07 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Aug 2014 09:12:24 -0700
Message-Id: <3b8c63d3ba25d5f303ad2802d6a0c1bbac5446aa.1407773390.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1407773390.git.chris_larson@mentor.com>
References: <cover.1407773390.git.chris_larson@mentor.com>
In-Reply-To: <cover.1407773390.git.chris_larson@mentor.com>
References: <cover.1407773390.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH v2 3/5] dnsmasq: move parallel make patch to .bb, add upstream-status
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
X-List-Received-Date: Mon, 11 Aug 2014 16:13:08 -0000

From: Christopher Larson <chris_larson@mentor.com>

Patches really belong in the recipe, not the .inc, given patches are generally
version-bound.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq.inc               | 1 -
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb           | 2 ++
 meta-networking/recipes-support/dnsmasq/files/parallel-make.patch | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 7037cb1..92c5367 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -11,7 +11,6 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://init \
            file://dnsmasq.conf \
            file://dnsmasq.service \
-           file://parallel-make.patch \
 "
 
 inherit pkgconfig update-rc.d systemd
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
index b1bef7a..6caa92a 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
@@ -1,4 +1,6 @@
 require dnsmasq.inc
 
+SRC_URI += "file://parallel-make.patch"
+
 SRC_URI[dnsmasq-2.68.md5sum] = "6f8351ca0901f248efdb81532778d2ef"
 SRC_URI[dnsmasq-2.68.sha256sum] = "402019d61f53f1ccc04cc6218719fd3b158ea3fca9a83ab55471f981a2097c2f"
diff --git a/meta-networking/recipes-support/dnsmasq/files/parallel-make.patch b/meta-networking/recipes-support/dnsmasq/files/parallel-make.patch
index 3d1040c..6d5b722 100644
--- a/meta-networking/recipes-support/dnsmasq/files/parallel-make.patch
+++ b/meta-networking/recipes-support/dnsmasq/files/parallel-make.patch
@@ -5,6 +5,7 @@ can't rely on that order when doing a paralllel make build, so add an explicit
 rule to enforce that order.
 
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Upstream-status: Pending
 
 --- dnsmasq-2.68.orig/Makefile
 +++ dnsmasq-2.68/Makefile
-- 
1.8.3.4



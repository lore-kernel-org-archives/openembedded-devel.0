Return-Path: <amy.fong@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6457A6AC37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jun 2015 14:29:46 +0000 (UTC)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5NETlPM005204
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 23 Jun 2015 07:29:47 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.85)
	(envelope-from <amy.fong@windriver.com>)
	id 1Z7PCW-0000Ur-Hq; Tue, 23 Jun 2015 10:29:24 -0400
Date: Tue, 23 Jun 2015 10:29:24 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org, amy.fong@windriver.com
Message-ID: <20150623142924.GA1887@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-java][PATCH] openjdk-7: fix icedtea-crosscompile-fix.patch
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
X-List-Received-Date: Tue, 23 Jun 2015 14:29:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From ed2cca0045c597a28ce4ea3f9ce220c97a2a05fe Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Mon, 22 Jun 2015 14:50:20 -0400
Subject: [PATCH] openjdk-7: fix patch

Fixing what looks like a hand edited patch error

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-core/openjdk/openjdk-7-75b13/icedtea-crosscompile-fix.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-7-75b13/icedtea-crosscompile-fix.patch b/recipes-core/openjdk/openjdk-7-75b13/icedtea-crosscompile-fix.patch
index 250f8a4..5e8e479 100644
--- a/recipes-core/openjdk/openjdk-7-75b13/icedtea-crosscompile-fix.patch
+++ b/recipes-core/openjdk/openjdk-7-75b13/icedtea-crosscompile-fix.patch
@@ -139,7 +139,7 @@ index 69e1177..dc7f8e6 100644
  CFLAGS_REQUIRED_hppa    +=
  CFLAGS_REQUIRED_i586    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
  CFLAGS_REQUIRED_ia64    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- @@ -359,7 +337,7 @@ LDFLAGS_COMMON  += $(LDFLAGS_DEFS_OPTION)
+@@ -359,7 +337,7 @@ LDFLAGS_COMMON  += $(LDFLAGS_DEFS_OPTION)
  #
  # -L paths for finding and -ljava
  #
-- 
2.1.4



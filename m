Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2566B7E0A1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYj1vg9z7P
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489321;
	bh=oJlZHkv0KdYmZpoVfrfsP/zaG/Zv2CgCoMj46W6fcIc=;
	h=From:To:Subject:Date:From;
	b=KkZy6+XNefI8dPcBeK0d39jp7s2Ibm2rzgsADWuA2lM9h7Fja1V54eLoXfqENd6gI
	4tgGN9w6n11L01rF9qBcocAKytoWIDLxopHahToVxiDQyzk3XC39Ns2doyeBN7ux1/
	LyjavMliKHKDuftGk8yvGkzhbko1YrSR7h2QQAs+Ls1t8aHyW6tu0dUB1PHwOHqDR+
	LBGeANzCgQlpiqgT3VrSB5wsSo0wAW8czwP8R5eP5pVIGTmiRpDWvrRi/ZRoLoZPMU
	MpAe/7+dC+SD5OEY9oyQmgjmam4nHa5tlasfb5grue+fBWtGlqza6lrraY/ayfHigw
	L6oVdJpPKZErBjQLrB5nQwedJtSKDBL1DnCD7jRrJqOYtVLDmxeFO0SrmNj12FGy1z
	7FusUTIyLag2qfvc76+I+9iM9ikHJkl8blYP+LxXTkLkQ8eVahsszFlOFtGmIp6l/I
	0EOWTuw1+NATBjISBAHSn+ahCKqiF7HV4QaW+k3ZYxYX/93RMbxxrhZjhDxDKPN//j
	xjtrXOQ9g0rGZfsCBz4I7LIO6ZHPZjsUDndap0+uhkYWOPTBGAXDhNDdzBjm9FJM6Y
	bEBCjkRaRVUcW2Ex8v0QVe8pU++xYUttCXsrge8iz9RuoAw2OfJnCmPvjAG5yZnN1w
	ftDu0PSwBgFUTXOGxrUyBkjk=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:55:12 +0300
Message-Id: <20190510115515.19491-16-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] ode: Remove stale file of recipe removed 2 years ago
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
X-List-Received-Date: Fri, 10 May 2019 11:55:20 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-support/ode/ode/install.patch | 23 -------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 meta-oe/recipes-support/ode/ode/install.patch

diff --git a/meta-oe/recipes-support/ode/ode/install.patch b/meta-oe/recipes-support/ode/ode/install.patch
deleted file mode 100644
index 2f6cdb008..000000000
--- a/meta-oe/recipes-support/ode/ode/install.patch
+++ /dev/null
@@ -1,23 +0,0 @@
---- ode-0.9.orig/Makefile.am	2007-02-21 15:54:54.000000000 +0100
-+++ ode-0.9/Makefile.am	2010-08-21 16:15:55.000000000 +0200
-@@ -25,13 +25,13 @@
- 
- if USE_SONAME
- install-exec-hook:
--	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
--	$(libdir)/libode.so
--	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
--	$(libdir)/@ODE_SONAME@
--	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
--	$(libdir)/@ODE_SONAME@.@ODE_REVISION@
--	/sbin/ldconfig
-+	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
-+	$(DESTDIR)/$(libdir)/libode.so
-+	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
-+	$(DESTDIR)/$(libdir)/@ODE_SONAME@
-+	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
-+	$(DESTDIR)/$(libdir)/@ODE_SONAME@.@ODE_REVISION@
-+	echo /sbin/ldconfig
- else
- install-exec-hook:
- endif
-- 
2.17.1



Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OgeOA-0007H6-Dv
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 15:52:37 +0200
Received: by fxm12 with SMTP id 12so2472815fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 06:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=SyNzHYvocfa2EaDIkZSGlISdxLc8syqExQms/Ioa6Og=;
	b=FqqGn7KG68wX1N5XDjZgYGuVF5E23VkbApMLbX7+S9i7kv4BSXccMI+Cm96sLrkhxl
	ZC17oekiKwZNhYIMTIWc4vH4TN7KUg4B5UmiCttNFFG5uVU7mX6MxsbIUIVdoZslo6mq
	2RZUJlXU1WjCqqamsjjJVvekPTEXpb8+4Ug8M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=uREQq8o+9zX9asJnedwwZk6d8hH9CAfAV2NwELicPQawXX3nm4qBbeiMgZyCRsL546
	6cW+npwWHW2GUT1atlO+EWVLe8BsDHWRCenOzQ2dze8GUMR/K1knRzbWAyIY73J5sSaj
	MrsdYkPXMkEek9G/Ka8iwXNk7FlXEqI81sjMk=
Received: by 10.223.122.148 with SMTP id l20mr8961064far.84.1280929926440;
	Wed, 04 Aug 2010 06:52:06 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id q17sm2968168faa.45.2010.08.04.06.52.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 06:52:05 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OgeO0-0006Dy-5F; Wed, 04 Aug 2010 15:52:00 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 15:51:57 +0200
Message-Id: <1280929918-23818-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280929918-23818-1-git-send-email-rep.dot.nop@gmail.com>
References: <1280929918-23818-1-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/3] perl: use only one method all_perl_packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Aug 2010 13:52:40 -0000

.. to avoid
ERROR: Error Method already seen: all_perl_packages in' perl_5.8.8.bb'
now in 'perl_5.10.1.bb'

TODO: error() already prints "ERROR:" so the "Error" in above msg is
redundant

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/perl/perl_5.10.1.bb  |    7 +------
 recipes/perl/perl_5.8.8.bb   |    7 +------
 recipes/perl/perl_helper.inc |    8 ++++++++
 3 files changed, 10 insertions(+), 12 deletions(-)
 create mode 100644 recipes/perl/perl_helper.inc

diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
index 75993b5..dd0bb0f 100644
--- a/recipes/perl/perl_5.10.1.bb
+++ b/recipes/perl/perl_5.10.1.bb
@@ -210,12 +210,7 @@ FILES_${PN}-doc = "${datadir}/perl/${PV}/*/*.txt \
 
 RPROVIDES_perl-lib = "perl-lib"
 
-def all_perl_packages(d):
-    depchains = (d.getVar("DEPCHAIN_POST", True) or "").split()
-    blacklist = ["perl-modules", "perl-misc", "perl-pod", "perl-doc"]
-    for pkg in d.getVar("PACKAGES", True).split():
-        if not pkg in blacklist and not any(pkg.endswith(post) for post in depchains):
-            yield pkg
+require perl_helper.inc
 
 # Create a perl-modules package recommending all the other perl
 # packages (actually the non modules packages and not created too)
diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
index 5400e69..d546a15 100644
--- a/recipes/perl/perl_5.8.8.bb
+++ b/recipes/perl/perl_5.8.8.bb
@@ -212,12 +212,7 @@ FILES_${PN}-doc = "${datadir}/perl/${PV}/*/*.txt \
 
 RPROVIDES_perl-lib = "perl-lib"
 
-def all_perl_packages(d):
-    depchains = (d.getVar("DEPCHAIN_POST", True) or "").split()
-    blacklist = ["perl-modules", "perl-misc", "perl-pod", "perl-doc"]
-    for pkg in d.getVar("PACKAGES", True).split():
-        if not pkg in blacklist and not any(pkg.endswith(post) for post in depchains):
-            yield pkg
+require perl_helper.inc
 
 # Create a perl-modules package recommending all the other perl
 # packages (actually the non modules packages and not created too)
diff --git a/recipes/perl/perl_helper.inc b/recipes/perl/perl_helper.inc
new file mode 100644
index 0000000..ddde0b8
--- /dev/null
+++ b/recipes/perl/perl_helper.inc
@@ -0,0 +1,8 @@
+# helper functions for perl
+def all_perl_packages(d):
+    depchains = (d.getVar("DEPCHAIN_POST", True) or "").split()
+    blacklist = ["perl-modules", "perl-misc", "perl-pod", "perl-doc"]
+    for pkg in d.getVar("PACKAGES", True).split():
+        if not pkg in blacklist and not any(pkg.endswith(post) for post in depchains):
+            yield pkg
+
-- 
1.7.1




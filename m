Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NYEwX-0006w1-EJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 09:32:40 +0100
Received: (qmail 1994 invoked by uid 813007); 22 Jan 2010 08:30:21 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Jan 2010 08:30:21 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jan 2010 09:30:16 +0100
Message-Id: <1264149016-18488-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.6
In-Reply-To: <19c1b8a91001212252u260f854enc50a9cc8f44099b4@mail.gmail.com>
References: <19c1b8a91001212252u260f854enc50a9cc8f44099b4@mail.gmail.com>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] ruby-native: fix building with gcc 4.4.x
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
X-List-Received-Date: Fri, 22 Jan 2010 08:32:40 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>

Looks like gcc 4.4.x do not like the way Ruby programmers used
preprocessor.

This change is not present in .dev due to different versions of Ruby.

Signed-off-by: Marcin Juszkiewicz <marcin@buglabs.net>
---
 recipes/ruby/files/gcc44.patch    |   19 +++++++++++++++++++
 recipes/ruby/ruby-native_1.8.5.bb |    5 +++++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ruby/files/gcc44.patch

diff --git a/recipes/ruby/files/gcc44.patch b/recipes/ruby/files/gcc44.patch
new file mode 100644
index 0000000..dc5a608
--- /dev/null
+++ b/recipes/ruby/files/gcc44.patch
@@ -0,0 +1,19 @@
+---
+ math.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- ruby-1.8.5.orig/math.c
++++ ruby-1.8.5/math.c
+@@ -32,11 +32,11 @@ domain_check(x, msg)
+ 	    rb_sys_fail(msg);
+ 	}
+ 	if (isnan(x)) {
+ #if defined(EDOM)
+ 	    errno = EDOM;
+-#elif define(ERANGE)
++#elif defined(ERANGE)
+ 	    errno = ERANGE;
+ #endif
+ 	    continue;
+ 	}
+ 	break;
diff --git a/recipes/ruby/ruby-native_1.8.5.bb b/recipes/ruby/ruby-native_1.8.5.bb
index e4d2a33..f35363d 100644
--- a/recipes/ruby/ruby-native_1.8.5.bb
+++ b/recipes/ruby/ruby-native_1.8.5.bb
@@ -1,2 +1,7 @@
 require ruby.inc
 inherit native
+
+PR = "r1"
+
+SRC_URI += " file://gcc44.patch;patch=1 "
+
-- 
1.6.6






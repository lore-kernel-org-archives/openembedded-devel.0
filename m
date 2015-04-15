Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 510746ABF7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2015 00:46:39 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so30441590pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2015 17:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=UsVvxu0Q2admmL5GjmhLWg1+cG5QjXgdwOgqom5rbJI=;
	b=nxrtksuTiSOWzN46Luj2JcPXksfafLKBn/ZAyMHTP8d9tHSTQskSTPJx7UNINRRfPV
	6jdZpFkyK9wGMmKPwdRA0+HhyVxOZZlCYO78sMKoH6oER8k1zpg1T4AonvR3UZPppLIK
	E9+G3rbbS+HaLlK2Ydzl3Op7Ileo63ARqSzJsY1q9KRI33fwQaBVlkDgsfNrsZxPfNlW
	ZXJXrX8lSbg+4DR/ZF5tB/zuT8aMAFsGWLz6AyMkWLc911M1uUlPEWhp+rElzF4KQXmi
	EkRYhUEN62Ike5FnEWtnugvIcskgEKW4HkEkyQZiCUZFsYACkCJSc1CnKI77LmkTqbcz
	7ybA==
X-Received: by 10.67.4.138 with SMTP id ce10mr41433925pad.102.1429058801186;
	Tue, 14 Apr 2015 17:46:41 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id x1sm2283355pdp.1.2015.04.14.17.46.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Apr 2015 17:46:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Apr 2015 17:46:36 -0700
Message-Id: <1429058796-30801-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-ruby][PATCH] ruby: Update to 2.2.2
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
X-List-Received-Date: Wed, 15 Apr 2015 00:46:42 -0000

Includes among other things: CVE-2015-1855: Ruby OpenSSL Hostname Verification

for more info see:
http://svn.ruby-lang.org/repos/ruby/tags/v2_2_2/ChangeLog

also, fixed runtime error.
only include "enable-wide-getaddrinfo" if IVP6 is enabled in disto feature
otherwise 'gem install rails' throws an error for the missing symbol 'getipnodebyname'.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-ruby/recipes-devtools/ruby/{ruby_2.2.1.bb => ruby_2.2.2.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-ruby/recipes-devtools/ruby/{ruby_2.2.1.bb => ruby_2.2.2.bb} (77%)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb b/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
similarity index 77%
rename from meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
rename to meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
index 29f2291..c463525 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
@@ -1,7 +1,7 @@
 require ruby.inc
 
-SRC_URI[md5sum] = "b49fc67a834e4f77249eb73eecffb1c9"
-SRC_URI[sha256sum] = "5a4de38068eca8919cb087d338c0c2e3d72c9382c804fb27ab746e6c7819ab28"
+SRC_URI[md5sum] = "326e99ddc75381c7b50c85f7089f3260"
+SRC_URI[sha256sum] = "5ffc0f317e429e6b29d4a98ac521c3ce65481bfd22a8cf845fa02a7b113d9b44"
 
 # it's unknown to configure script, but then passed to extconf.rb
 # maybe it's not really needed as we're hardcoding the result with
@@ -9,11 +9,13 @@ SRC_URI[sha256sum] = "5a4de38068eca8919cb087d338c0c2e3d72c9382c804fb27ab746e6c78
 UNKNOWN_CONFIGURE_WHITELIST += "--enable-wide-getaddrinfo"
 
 PACKAGECONFIG ??= ""
+PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+
 PACKAGECONFIG[valgrind] = "--with-valgrind=yes, --with-valgrind=no, valgrind"
 PACKAGECONFIG[gpm] = "--with-gmp=yes, --with-gmp=no, gmp"
+PACKAGECONFIG[ipv6] = ",--enable-wide-getaddrinfo,"
 
 EXTRA_OECONF = "\
-    --enable-wide-getaddrinfo \
     --disable-versioned-paths \
     --disable-rpath \
     --enable-shared \
-- 
2.3.5



Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f53.google.com (unknown [209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 04A5865E87
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 18:12:02 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kp14so7881922pab.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 11:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IqZ9avvTbM1VXY3098P/phKpcbO9askWmpJHVZiyhTk=;
	b=az2A9pH32dXtoLf2xizob9N/6qmWPTNlC3hpYWMkcCM1o4vs67dqH1fPV2KcXDr+0N
	8xhxjxrkONJgwstCMQgVEASYs/z7+HofM/LkQWLasDvfVe6qAYF3m12jZXERYcG2LEJt
	Zeth28X8kGNuGBZ1iSpq6FEUtGtjyUV5dKOaj6J7ozGqNvCnJf9QMqR+4YMIupcJDxlE
	ETgDH7Qv/TkWoC0OCJEsHmI3LbRZ9brHxAMhsPafQodeoYFHBXuAMebYcXcvTrYeYvvD
	U4hOV0L6aebCcWZ0jqHwjj2t7jFLaZJNtHCligxhyxURKroOO3a+fdD7gfwVh6SUYJiy
	OfSw==
X-Received: by 10.66.180.168 with SMTP id dp8mr30774191pac.100.1401127923497; 
	Mon, 26 May 2014 11:12:03 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18])
	by mx.google.com with ESMTPSA id av4sm61419766pac.8.2014.05.26.11.12.02
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 May 2014 11:12:02 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 11:11:49 -0700
Message-Id: <1401127909-3765-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] sqlite: Point to Makefile in source directory
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
X-List-Received-Date: Mon, 26 May 2014 18:12:04 -0000

Makefile.linux-gcc used to compile sqlite is found in the source
directory.  When building out-of-tree, we need to specify the
whole path.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb b/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
index 5148f35..e6e14c2 100644
--- a/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
+++ b/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
@@ -26,7 +26,7 @@ do_configure() {
 }
 
 do_compile() {
-    oe_runmake -f Makefile.linux-gcc \
+    oe_runmake -f ${S}/Makefile.linux-gcc \
              TOP="${S}" \
              BCC="${BUILD_CC}" \
              TCC="${CC}" \
-- 
1.8.3.2



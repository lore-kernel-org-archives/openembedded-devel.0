Return-Path: <ashcharles@gmail.com>
Received: from mail-pb0-f45.google.com (unknown [209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id A26E165D6D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 20:34:08 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id um1so8119623pbc.18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 13:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=LEWVAANvcmIMST3xQ+i0u99E2LewD+2QiUNl9JfgAeo=;
	b=wBW977ibB1YOM5UXZ+jlpwbb3IPWm0GikqPbtRXwCqVrjl6nv5kluhBqMRZWCBR0vs
	rBU5HUHyQDscDkcsT+OxlWfwBBDYGXyQ5nlWpFI8TD8BIcJ6P4+LME7ebYIfazG2gMUX
	llehTPCEt6Bwxyy4saLGIPJXb9XlUr1wiEJCrGQiEZ6PoNWGG9jOTD4e98dfSkwC1+No
	WyZAC17FTXH0PqlFChRnyJZX+e2lpYgFiPYVx3CxWcNMxWpDmg+GP3o8QcfsAbETz3VJ
	k/ve06px8hyGPQx0Edr+tLoFrLvKWLTr9Rx/uz6cUpH2Uq5szb6KCuGxvfttpr5UDWAL
	0/4w==
X-Received: by 10.66.139.73 with SMTP id qw9mr30583299pab.123.1401136450299;
	Mon, 26 May 2014 13:34:10 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	gr10sm19657533pbc.84.2014.05.26.13.34.09 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 May 2014 13:34:09 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 13:34:00 -0700
Message-Id: <1401136440-438-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] ltrace: Run autogen.sh in source directory
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
X-List-Received-Date: Mon, 26 May 2014 20:34:11 -0000

The autogen.sh script needs to be run in and from the source
directory.  The configuration step can still be run from
out-of-tree.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 149af52..89f760a 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -21,5 +21,5 @@ S = "${WORKDIR}/git"
 inherit autotools
 
 do_configure_prepend () {
-	./autogen.sh
+	( cd ${S}; ./autogen.sh )
 }
-- 
1.8.3.2



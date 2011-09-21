Received: from mail-ew0-f51.google.com ([209.85.215.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1R6JkS-0001CF-1h
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 12:09:48 +0200
Received: by ewy5 with SMTP id 5so1200770ewy.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2011 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=+0YeR6plRfmFCx6Q2tYXovFqWL2gJyzubjzgPELwc4g=;
	b=mNZCLrN7pW0+BWhKHV65vEOZ5OiGuhr0Qf9jUIJjG5iUgwAQ4yVmFQpOtVw+mGX5s5
	O6yqMG3MHAQ++78+dqQFPHCsp2ovLaDQ6cSNvvrug1IL7ugQBNJp261iKnsX8h5lTGge
	9SbgW03v4LTUSRzjW2jffBaZ1uiMXThogy6TQ=
Received: by 10.14.16.168 with SMTP id h40mr196374eeh.92.1316599469761;
	Wed, 21 Sep 2011 03:04:29 -0700 (PDT)
Received: from localhost.localdomain (147.84-49-231.nextgentel.com.
	[84.49.231.147])
	by mx.google.com with ESMTPS id d59sm13085254eea.3.2011.09.21.03.04.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 03:04:29 -0700 (PDT)
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Sep 2011 12:04:18 +0200
Message-Id: <1316599458-7433-1-git-send-email-tasskjapp@gmail.com>
X-Mailer: git-send-email 1.7.7.rc0.72.g4b5ea
Cc: Tasslehoff Kjappfot <tasskjapp@gmail.com>
Subject: [PATCH] Make sure grep runs without colorized output
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
X-List-Received-Date: Wed, 21 Sep 2011 10:09:48 -0000

My .bashrc contained "export GREP_OPTIONS='--color=always'", and that caused the path in my pseudodone file to  be prefixed by "^[[m^[[K". Override by calling grep with --color=never.
---
 scripts/bitbake |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 587428c..9330d71 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -65,7 +65,7 @@ if [ $buildpseudo = "1" ]; then
     if [ "$ret" != "0" ]; then
         exit 1
     fi
-    PSEUDOBINDIR=`bitbake -e | grep STAGING_BINDIR_NATIVE=\" | cut -d '=' -f2 | cut -d '"' -f2`
+    PSEUDOBINDIR=`bitbake -e | grep --color=never STAGING_BINDIR_NATIVE=\" | cut -d '=' -f2 | cut -d '"' -f2`
     ret=$?
     if [ "$ret" != "0" ]; then
         exit 1
-- 
1.7.7.rc0.72.g4b5ea




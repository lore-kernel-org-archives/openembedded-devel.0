Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lf0vO-0006zQ-IW
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Mar 2009 00:55:06 +0100
Received: by wa-out-1112.google.com with SMTP id n7so1775819wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2009 15:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=rwnoge3C3ZEz94lC65nnY12+1jVAR3GQHQVa3PM2BqY=;
	b=uCgjrkQHWXTiDZRQO3Tmn3ss3+4nmW+54iVKywdCM3yQ+KHwbSHMBcIn9rw6BxyLL8
	rXhJQyLN567a4Ax8TG3SKWoohl/x+eLyIGYuG4OeweeU2Jhrj1/HNzVvv1DoJ1bDnJ4f
	eb3L6K1wTySadf0NY0ndjJJWXd7rPnO1NXgdM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=ahwR3s1agOVXSrdy9HsTyDuaR6VXtQJtBfam99JSkmi0aIvGYcCz62Mbe08rPleiQ8
	6xlSFR+i4H/df4qNXWVFVYeKENT02z8Ip0+yaAeBTclrM2Rm20NAL1k7KSKGui+K/LDR
	byOrEydOzpMGrHuWqQO0lHVulUZ+H6gJwpeVs=
Received: by 10.114.37.1 with SMTP id k1mr266950wak.28.1236210638732;
	Wed, 04 Mar 2009 15:50:38 -0800 (PST)
Received: from gmail.com (adsl-71-146-1-99.dsl.pltn13.sbcglobal.net
	[71.146.1.99])
	by mx.google.com with ESMTPS id z15sm20250490pod.14.2009.03.04.15.50.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Mar 2009 15:50:38 -0800 (PST)
Date: Wed, 4 Mar 2009 15:50:32 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090304235032.GA29159@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: [PATCH] Make coreutils 6.x+ install utility to honor STRIP env	variable
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
X-List-Received-Date: Wed, 04 Mar 2009 23:55:30 -0000
X-List-Received-Date: Wed, 04 Mar 2009 23:55:30 -0000
X-Groupsio-MsgNum: 8252
Content-Type: multipart/mixed; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

As reported in bug 5052 and also on irc, install calls strip directly. We should make it use STRIP
env variable which is set to <cross-strip> in OE env.

This is a patch which does that

OK for .dev ?

Thx
-Khem



--sdtB3X0nJg68CQEu
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="coreutils-install-use-STRIP.patch"

Index: coreutils-6.0/src/install.c
===================================================================
--- coreutils-6.0.orig/src/install.c	2009-03-04 15:37:45.000000000 -0800
+++ coreutils-6.0/src/install.c	2009-03-04 15:38:57.000000000 -0800
@@ -526,7 +526,14 @@
 strip (char const *name)
 {
   int status;
-  pid_t pid = fork ();
+  pid_t pid;
+  char *strip_name;
+
+  strip_name = getenv ("STRIP");
+  if (strip_name == NULL)
+    strip_name = "strip";
+
+  pid = fork ();
 
   switch (pid)
     {
@@ -534,7 +541,7 @@
       error (EXIT_FAILURE, errno, _("fork system call failed"));
       break;
     case 0:			/* Child. */
-      execlp ("strip", "strip", name, NULL);
+      execlp (strip_name, "strip", name, NULL);
       error (EXIT_FAILURE, errno, _("cannot run strip"));
       break;
     default:			/* Parent. */

--sdtB3X0nJg68CQEu--

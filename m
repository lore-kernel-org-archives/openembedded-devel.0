Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NB7GN-0005JH-91
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 14:41:34 +0100
Received: by bwz9 with SMTP id 9so2287708bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 05:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=DXi31LMR7IKCZ3+r805bczz2YiPi1RNYFFUZbtlH2Ew=;
	b=RSt/VkG9nczo464JOgOXtBu1xOGdip1XXt9pXTOgBXyXjhdLr6BIqS8IYV6Lot8/SR
	yJBpRw/FLcKqNTohToKCkuvhOBvsB5vwxCP+itIayPsf3csnqLurbTwLRZZM6Ny5RIZ5
	pqXxf4if68AsgWxhAUFLMWkz0oW1lqiYGc1qs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=dgsfvYM1ihs2EdaPB5RwLszuMAsuLJXKerj9iuq8PAS+Cio0DVM+KZlMJRmHPs4waK
	pc1vccp3OGtVytUCOGXs8665PTNit7YQlkzx0fbRTwZZmLySMtnoBGTy4td9nrq/qmAY
	5BT71nbWap1rFEHnFXQvWyYtTCqLa57bqmOC4=
Received: by 10.204.36.206 with SMTP id u14mr4099647bkd.199.1258638006596;
	Thu, 19 Nov 2009 05:40:06 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm178900fxm.15.2009.11.19.05.40.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 19 Nov 2009 05:40:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Nov 2009 14:39:56 +0100
Message-Id: <1258637996-19441-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.3
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] bitbake.conf: Fix OVERRIDES description (After pb's explanation)
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
X-List-Received-Date: Thu, 19 Nov 2009 13:41:34 -0000

---
 conf/bitbake.conf |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 4435fdd..2f7cef2 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -651,10 +651,15 @@ BUILDCFG_NEEDEDVARS ?= "TARGET_ARCH TARGET_OS"
 ### Config file processing
 ###
 
+# Overrides are processed left to right, so the ones that are named later take precedence.
+# You generally want them to go from least to most specific.
+# 
 # This means that an envionment variable named '<foo>_arm' overrides an
-# environment variable '<foo>' (when ${TARGET_ARCH} is arm). And the same: an
-# environment variable '<foo>_ramses' overrides both '<foo>' and '<foo>_arm
-# when ${MACHINE} is 'ramses'. And finally '<foo>_local' overrides anything.
+# environment variable '<foo>' (when ${TARGET_ARCH} is arm).
+# an environment variable '<foo>_ramses' overrides '<foo>' but doesn't override
+# '<foo>_arm' when ${MACHINE} is 'ramses'. 
+# You can use combination ie you can use '<foo>_arm_ramses' to override both '<foo>' and '<foo>_arm'.
+# And finally '<foo>_local' overrides anything, but with lowest priority.
 #
 # This works for  functions as well, they are really just environment variables.
 # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
-- 
1.6.5.3




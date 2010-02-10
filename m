Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NfIwH-00068W-H3
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 21:13:36 +0100
Received: by fxm25 with SMTP id 25so402471fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 12:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=Swjn30XMAbu2KtezzLeYSsm212R5LWz8X5vDdfXMcn8=;
	b=ROxBvsfRY04luqXhOM569FvM1KbBI+IOavTj7RmIkRBFBM9kQ7FhTpnJYuWj/bDeNQ
	a8a1mstxQeQ02PuvXhC2DfFc9+mXG1sonFue3jYYs5kaFFVtsEN/FPLbp23WDvhIto9Z
	ZxS51mszU+7+jptiLZPsMH3I+KYydl8vpFKE0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=SRGCRhUVh/p1wFzUIEoQsKacKa74+r6Pyob9szHcIrghdnpYpGStFyJhfx07p0s2To
	O7CXMWHYATAbc9wAMgcx0GyEVGAsH2fxcZUDiOSJji0aCAnUgCHFBk58NetSS9U4Xm2l
	6v8/ISOKXxNkOKnULbaa2QTugo1V1KoYHdWzY=
Received: by 10.223.15.89 with SMTP id j25mr866951faa.97.1265832654972;
	Wed, 10 Feb 2010 12:10:54 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 9sm2612220fks.22.2010.02.10.12.10.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Feb 2010 12:10:52 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NfIvm-0005CM-3q; Wed, 10 Feb 2010 21:13:02 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Feb 2010 21:12:53 +0100
Message-Id: <1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265832780-19939-1-git-send-email-rep.dot.nop@gmail.com>
References: <1265832780-19939-1-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/8] hwclock.sh: some more !getopt_long fixes
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
X-List-Received-Date: Wed, 10 Feb 2010 20:13:36 -0000

busybox' hwclock can be built without support for getopt_long.
Flags of the big hwclock are compatible with the busybox version.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/busybox/files/hwclock.sh |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes/busybox/files/hwclock.sh b/recipes/busybox/files/hwclock.sh
index 6c0af34..f9c9f9f 100644
--- a/recipes/busybox/files/hwclock.sh
+++ b/recipes/busybox/files/hwclock.sh
@@ -14,7 +14,7 @@
 
 . /etc/default/rcS
 
-[ "$UTC" = yes ] && UTC=--utc || UTC=--localtime
+[ "$UTC" = yes ] && UTC=-u || UTC=-l
 
 case "$1" in
         start)
@@ -28,9 +28,9 @@ case "$1" in
 		then
 			if [ -z "$TZ" ]
 			then
-	                   hwclock -s $UTC;# --hctosys
+	                   hwclock -s $UTC
 			else
-			   TZ="$TZ" hwclock -s $UTC;# --hctosys
+			   TZ="$TZ" hwclock -s $UTC
 			fi
 		fi
 
@@ -53,7 +53,7 @@ case "$1" in
 		fi
 		if [ "$HWCLOCKACCESS" != no ]
 		then
-			hwclock -w $UTC;# --systohc
+			hwclock -w $UTC
 		fi
 		if [ "$VERBOSE" != no ]
 		then
@@ -64,7 +64,7 @@ case "$1" in
 	show)
 		if [ "$HWCLOCKACCESS" != no ]
 		then
-			hwclock -r $UTC;# --show
+			hwclock -r $UTC
 		fi
 		;;
         *)
-- 
1.6.5




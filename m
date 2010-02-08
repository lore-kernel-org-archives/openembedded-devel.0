Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Neax9-0004w9-Jb
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 22:15:34 +0100
Received: by fxm27 with SMTP id 27so1137706fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 13:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=TkL1KUH1ycVWIVoZ7SkR9IVKbumNQMoRC78LkcSCcEM=;
	b=mOz0xLxHsgvQYvxi3X6G/q3yoA5C8M2u/M4RgutbNjjsRhAe4l4NoHe1+3+eWJ+Nyz
	CMCUxWIuuEICQriar55x/PJMXg4jtHeFfgfZKvPxPYvS8cyh+4prtgSmxE4ws+0YahFo
	OxN7vuug2zc6KRVUM715cVMtbjiAbHmzUJXNk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=nLjoU4Wtu07OMlgc3W/HuOJRVEgVXy6Zj0tqKN6kVm95KGlwPxvGb5Vscu1r+XseLs
	DnWYkG9RsEeqjH20ShpZl44Ljb3cFOPRKtOY7zxVrYZ1FBhCr9GynKNDRSw0tymYpYDN
	98yMjZHTDgC1Oztp2UYkyLgBgXt15I9GipTkk=
Received: by 10.223.143.82 with SMTP id t18mr3707763fau.52.1265663579647;
	Mon, 08 Feb 2010 13:12:59 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 18sm7252626fks.4.2010.02.08.13.12.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 08 Feb 2010 13:12:56 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NeawH-0004G7-CT; Mon, 08 Feb 2010 22:14:37 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2010 22:14:23 +0100
Message-Id: <1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 02/12] some more !getopt_long fixes
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
X-List-Received-Date: Mon, 08 Feb 2010 21:15:34 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/busybox/files/hwclock.sh |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/recipes/busybox/files/hwclock.sh b/recipes/busybox/files/hwclock.sh
index 6c0af34..57c9fc7 100644
--- a/recipes/busybox/files/hwclock.sh
+++ b/recipes/busybox/files/hwclock.sh
@@ -14,27 +14,27 @@
 
 . /etc/default/rcS
 
-[ "$UTC" = yes ] && UTC=--utc || UTC=--localtime
+[ "$UTC" = "yes" ] && UTC=-u || UTC=-l
 
 case "$1" in
         start)
-                if [ "$VERBOSE" != no ]
+                if [ "$VERBOSE" != "no" ]
                 then
                         echo "System time was `date`."
                         echo "Setting the System Clock using the Hardware Clock as reference..."
                 fi
 
-		if [ "$HWCLOCKACCESS" != no ]
+		if [ "$HWCLOCKACCESS" != "no" ]
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
 
-                if [ "$VERBOSE" != no ]
+                if [ "$VERBOSE" != "no" ]
                 then
                         echo "System Clock set. System local time is now `date`."
                 fi
@@ -47,24 +47,24 @@ case "$1" in
 		# WARNING: If you disable this, any changes to the system
 		#          clock will not be carried across reboots.
 		#
-		if [ "$VERBOSE" != no ]
+		if [ "$VERBOSE" != "no" ]
 		then
 			echo "Saving the System Clock time to the Hardware Clock..."
 		fi
-		if [ "$HWCLOCKACCESS" != no ]
+		if [ "$HWCLOCKACCESS" != "no" ]
 		then
-			hwclock -w $UTC;# --systohc
+			hwclock -w $UTC
 		fi
-		if [ "$VERBOSE" != no ]
+		if [ "$VERBOSE" != "no" ]
 		then
 			echo "Hardware Clock updated to `date`."
 		fi
                 exit 0
                 ;;
 	show)
-		if [ "$HWCLOCKACCESS" != no ]
+		if [ "$HWCLOCKACCESS" != "no" ]
 		then
-			hwclock -r $UTC;# --show
+			hwclock -r $UTC
 		fi
 		;;
         *)
-- 
1.6.5




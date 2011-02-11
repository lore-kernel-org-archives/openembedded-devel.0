Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PnxP6-0006qO-8g
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 19:07:36 +0100
Received: by ewy28 with SMTP id 28so1397875ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 10:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=T0xlRbF2dplIgwrGvbdOHwS4e9gjSIz3IwskPfCcwxo=;
	b=AQ8d9zDvrr/P0toax752r4jD8t5WeE5brpzLIRmKtJevmwILGYiGkyQ6Cj38i900An
	ifE92/kkw6/i7NcN3xk49z9Pti9pmC3rskc+Dp30kNcXODRas3K7ZyI5b7Y6xY1AWvzF
	T4mYWb+OLvZxWXlTa6nw14RsmLGTNPKTOKnDI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=DL7IUDHjtc+uGI4JSWsNkfV8t4zA8ZPErKtbq8LfzEWlNdPupXv1X5nzN/QR7uT1+8
	5by9HZw3KWZvy3BNkej0FCWSlnDgMe7qTJTcJDwJADh9HgnPVeIdYJmIFAH7TgLRbSpS
	o2QdfYz2+JSOGSSEsp13e8xT9OJtZNg7EP1+U=
Received: by 10.103.226.13 with SMTP id d13mr538881mur.114.1297447590429;
	Fri, 11 Feb 2011 10:06:30 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id l3sm521015fan.0.2011.02.11.10.06.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Feb 2011 10:06:29 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Feb 2011 19:06:19 +0100
Message-Id: <1297447579-5311-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <AANLkTik+8d-hWG+ndtvSP7cKbbHhfyXq3tLxw1Fyi-=6@mail.gmail.com>
References: <AANLkTik+8d-hWG+ndtvSP7cKbbHhfyXq3tLxw1Fyi-=6@mail.gmail.com>
Subject: [PATCH] initscripts: handle busybox version of makedevs properly.
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
X-List-Received-Date: Fri, 11 Feb 2011 18:07:36 -0000

Makedevs from busybox has a different command line syntax.

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 recipes/initscripts/initscripts-1.0/devices |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/recipes/initscripts/initscripts-1.0/devices b/recipes/initscripts/initscripts-1.0/devices
index 67a2ec8..4059628 100755
--- a/recipes/initscripts/initscripts-1.0/devices
+++ b/recipes/initscripts/initscripts-1.0/devices
@@ -56,7 +56,13 @@ else
 	done
 	ln -sf /proc/self/fd /dev/fd
 	ln -sf /proc/kcore /dev/core
-	/sbin/makedevs -r / -D /etc/device_table
+
+	if test `readlink -f "/sbin/makedevs"` = "/bin/busybox"; then
+		MAKEDEV_ARGS="-d /etc/device_table /"
+	else
+		MAKEDEV_ARGS="-r / -D /etc/device_table"
+	fi
+	/sbin/makedevs $MAKEDEV_ARGS
 	if test $? -ne 0; then
 		if test "$VERBOSE" != "no"; then echo "failed"; fi
 	else
-- 
1.7.1




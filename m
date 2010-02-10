Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NfJI5-0003n9-Kd
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 21:36:08 +0100
Received: by fxm25 with SMTP id 25so425032fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 12:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=53HGSRiXWanZeuxAgFc9SVQ7jotp64PLFeOpj8HHYbY=;
	b=LgSezrejUZ8Aph8AEZFKrkgC1/lw4qlL14lu7HWMCcJnwrNoQEV4ueB8yktfJpGC07
	V8a9kTtZnmo+me71ZzoVgA5P8dvxjUdxFSX0rsrTG7GtOfuehVGCQd1XEgRm3JdPbs4L
	Xnfe75G08vWkcEIipsxLH3P8ka5quZsE2F9W0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=L0MuZ3zJLwGC8S/x1Kdcakn7ixB4M88qrYmLncIA7pa4cMZs6b0HkK/fmNdv6eDqOj
	piEZTDlkBA7MfQlziBV/YH7e8RAb+FYsVuuKbXCJNoWNUqox2M9jU0xCLMGWU8ghCTHb
	8hmrKe8tBiR5CibMaxu0bKBxP2/wvZe9l4mfw=
Received: by 10.223.100.214 with SMTP id z22mr908788fan.104.1265834010015;
	Wed, 10 Feb 2010 12:33:30 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id d13sm2636032fka.47.2010.02.10.12.33.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Feb 2010 12:33:28 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NfJHe-0005O2-Fl; Wed, 10 Feb 2010 21:35:38 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Feb 2010 21:35:34 +0100
Message-Id: <1265834134-20675-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] busybox: wget accept and ignore --no-check-certificate
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
X-List-Received-Date: Wed, 10 Feb 2010 20:36:08 -0000

needed for self-hosting; applied to upstream

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 .../0000-wget-no-check-certificate.patch           |   12 ++++++++++++
 recipes/busybox/busybox_1.15.3.bb                  |    1 +
 2 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 recipes/busybox/busybox-1.15.3/0000-wget-no-check-certificate.patch

diff --git a/recipes/busybox/busybox-1.15.3/0000-wget-no-check-certificate.patch b/recipes/busybox/busybox-1.15.3/0000-wget-no-check-certificate.patch
new file mode 100644
index 0000000..c737f17
--- /dev/null
+++ b/recipes/busybox/busybox-1.15.3/0000-wget-no-check-certificate.patch
@@ -0,0 +1,12 @@
+diff --git a/networking/wget.c b/networking/wget.c
+index 9d813dc..09edd67 100644
+--- a/networking/wget.c
++++ b/networking/wget.c
+@@ -546,6 +546,7 @@ int wget_main(int argc UNUSED_PARAM, char **argv)
+ 		"passive-ftp\0"      No_argument       "\xff"
+ 		"header\0"           Required_argument "\xfe"
+ 		"post-data\0"        Required_argument "\xfd"
++		"no-check-certificate\0" No_argument   "\xfc"
+ 		;
+ #endif
+ 
diff --git a/recipes/busybox/busybox_1.15.3.bb b/recipes/busybox/busybox_1.15.3.bb
index b638f9c..1e1aa1e 100644
--- a/recipes/busybox/busybox_1.15.3.bb
+++ b/recipes/busybox/busybox_1.15.3.bb
@@ -9,6 +9,7 @@ SRC_URI = "\
   file://B921600.patch;patch=1 \
   file://get_header_tar.patch;patch=1 \
   file://busybox-appletlib-dependency.patch;patch=1 \
+  file://0000-wget-no-check-certificate.patch;patch=1 \
   file://find-touchscreen.sh \
   file://busybox-cron \
   file://busybox-httpd \
-- 
1.6.5




Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2E0D36FFA6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:34:29 +0000 (UTC)
Received: by pabur14 with SMTP id ur14so105794590pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Fo2hxpmKsOrVTMlKKEh22ujDJYORKotim9bjTWUuDDM=;
	b=p6TmOwDJ0Si0glGTJXniZ8LwE30mGdMPaZVqK+Ukbix1UZzMiA15hFxEldz9Bv4v21
	SW4h3G2jJbH0k389lRNi8BcjtfY9iGrDZ9xa3fcQVxkHAa8KD57qlRQ4ANP9hoRmMjeO
	rgjTxPxK5jdGS5f2/6Jv4TQblPHvbP690Zkkf9iW4I7bEzlRgYAchrHa8ujZjT35V8fv
	jgfwf7JTYZDBp/YG5DLDNxs7UJVehz7Zt9K22g48I87FZskqstNgljt9LdXYmMGiD/tN
	Z5x2mby0zOgW2DH9ZCe9xhMA2OdzYzXo2hRMLmtkGOkM5+yq58JH98U/sTOr8lyUKq/2
	0Wfg==
X-Received: by 10.66.124.225 with SMTP id ml1mr11572075pab.81.1450107270097;
	Mon, 14 Dec 2015 07:34:30 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	71sm43284414pfj.28.2015.12.14.07.34.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 07:34:26 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id E4C2EFCC83F; Mon, 14 Dec 2015 07:34:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2015 07:33:58 -0800
Message-Id: <ff9178a442cae34c787f3076ddd9d95989565bb5.1450027640.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
Subject: [PATCH 05/14] ypbind-mt: set path of ypdomainname in ypbind script
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Dec 2015 15:34:29 -0000

From: Jian Liu <jian.liu@windriver.com>

The script ypbind will cause error if using ypdomainname command
provided by busybox. So add RDEPENDCY on yp-tools and change
the path of ypdomainname.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/nis/files/ypbind.init | 11 ++++++-----
 meta-networking/recipes-support/nis/ypbind-mt_1.38.bb |  2 ++
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-support/nis/files/ypbind.init b/meta-networking/recipes-support/nis/files/ypbind.init
index 244dc78..669c19c 100644
--- a/meta-networking/recipes-support/nis/files/ypbind.init
+++ b/meta-networking/recipes-support/nis/files/ypbind.init
@@ -26,6 +26,7 @@
 
 YPBIND_BIN=/usr/sbin/ypbind
 pidfile=/var/run/ypbind.pid
+YPDOMAINNAME_bin=/usr/bin/ypdomainname
 
 [ -f /etc/default/ypbind ] && . /etc/default/ypbind
 
@@ -34,14 +35,14 @@ case "$1" in
 	echo -n "Starting ypbind"
 	## If the domainname is not set, skip starting of ypbind
 	## and return with "program not configured"
-        /bin/ypdomainname >/dev/null 2>&1
-        if [ $? -ne 0 -o -z "`/bin/ypdomainname 2>/dev/null`" ]; then
+        $YPDOMAINNAME_bin >/dev/null 2>&1
+        if [ $? -ne 0 -o -z "`$YPDOMAINNAME_bin 2>/dev/null`" ]; then
            if [ -f /etc/defaultdomain ]; then
              XDOMAINNAME=`cat /etc/defaultdomain`
-             /bin/ypdomainname "$XDOMAINNAME"
+             $YPDOMAINNAME_bin "$XDOMAINNAME"
 	   fi
-           /bin/ypdomainname >/dev/null 2>&1
-           if [ $? -ne 0 -o -z "`/bin/ypdomainname 2>/dev/null`" ]; then
+           $YPDOMAINNAME_bin >/dev/null 2>&1
+           if [ $? -ne 0 -o -z "`$YPDOMAINNAME_bin 2>/dev/null`" ]; then
 	     # Tell the user this has skipped
 	     echo -n " . . . . . . . . . . No domainname set"
              # service is not configured
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
index 5702cd6..d113b82 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
@@ -21,6 +21,8 @@ DEPENDS = " \
            yp-tools \
            ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
           "
+RDEPENDS_${PN} += "yp-tools"
+
 # ypbind-mt now provides all the functionality of ypbind
 # and is used in place of it.
 PROVIDES += "ypbind"
-- 
1.9.1



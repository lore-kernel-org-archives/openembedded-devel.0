Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3v2-00083s-6E
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 16:58:12 +0200
Received: by mail-yi0-f47.google.com with SMTP id 13so1568954yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 07:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=WDvJea7hs0ZUabtXw4+dGLDIu0wfQ1o5MnvW0qzNZ3s=;
	b=bim7UeKYdmuXd9QbE3VVDFe0l2rbVpgGCCRftd8COc7XUtH9MILxw6QCx/NnfJGVNy
	tkPDEMeS1ChVzaSei89qU6JoNHif3/SL4U9MAMKwACEwoa1JRjGaty5jxCc0NTFVAtEC
	xgQrlDxykHXFVt3Tzu9o7Bc0m1tzUT8giuKq8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=U67xRuubLpelXrJTZFT/CGEX5RDACkIQPR9U55nfORNEeX+ZzuW1+S1ETdtrGIYLUg
	hPv1ZCuCLzaELEgTiAbiz1Xqvt4SpCjlOdbum82AHF6wb7LYcKnA4oUo10jQyllKHgUS
	nHZtngvDkdrLiW4Bimomo24/96+YqhUF30nLs=
Received: by 10.150.179.5 with SMTP id b5mr4455118ybf.417.1306767305556;
	Mon, 30 May 2011 07:55:05 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e48sm2530494yhk.56.2011.05.30.07.55.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:55:04 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 14:54:17 +0000
Message-Id: <1306767263-29895-12-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
References: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 11/17] initramfs-module-ext3: port to new getarg API
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
X-List-Received-Date: Mon, 30 May 2011 14:58:12 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/initrdscripts/files/80-ext3.sh             |   16 ++++++----------
 recipes/initrdscripts/initramfs-module-ext3_1.0.bb |    2 +-
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/recipes/initrdscripts/files/80-ext3.sh b/recipes/initrdscripts/files/80-ext3.sh
index 1f52d39..ff37e0f 100644
--- a/recipes/initrdscripts/files/80-ext3.sh
+++ b/recipes/initrdscripts/files/80-ext3.sh
@@ -5,13 +5,9 @@ ext3_mount () {
 	mount -t ext3 -onoatime,data=journal,errors=continue $1 $2
 }
 
-for arg in $CMDLINE; do
-    optarg=`expr "x$arg" : 'x[^=]*=\(.*\)'`
-    echo $arg xxx $optarg 
-    case $arg in
-        ext3=*)
-        dev=`expr "$optarg" : '\([^:]*\).*'`
-        path=`expr "$optarg" : '[^:]*:\([^:]*\).*'`
-        ext3_mount $dev $path ;;
-    esac
-done
+ext3=$(getarg ext3=)
+if [ -n "$ext3" ]; then
+        dev=`expr "$ext3" : '\([^:]*\).*'`
+        path=`expr "$ext3" : '[^:]*:\([^:]*\).*'`
+        ext3_mount $dev $path
+fi
diff --git a/recipes/initrdscripts/initramfs-module-ext3_1.0.bb b/recipes/initrdscripts/initramfs-module-ext3_1.0.bb
index 869ff05..cabffab 100644
--- a/recipes/initrdscripts/initramfs-module-ext3_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-ext3_1.0.bb
@@ -1,5 +1,5 @@
 SRC_URI = "file://80-ext3.sh"
-PR = "r2"
+PR = "r3"
 DESCRIPTION = "An initramfs module for mount ext3."
 RDEPENDS_${PN} = "initramfs-uniboot"
 
-- 
1.7.1




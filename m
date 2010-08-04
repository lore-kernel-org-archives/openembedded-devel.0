Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OghFB-0005d4-Nt
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 18:55:39 +0200
Received: by fxm12 with SMTP id 12so2576339fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 09:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=Yup5+kLsPBgc/0NaON8W+wmREX5LQzfi2k9wQCBcyuM=;
	b=VGPd1Nf+HybaoPfC7bVJW61MXEXxuPRVpJRyT9ud7L8YkHeACOOKXoh1WTiPgUFqzm
	KjhW88vKDi6QFrUGqu3ydsYA4XNmIN+0uz7NJXmq4mblwraTRr2RDdwpjv+rJ70pY9kc
	5aNJNC7LHGbMGcoE9cpPtNtRNp3ZzgsHDg7Nw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=wHnmkN0LYgPJIQ3WxniY/ZekyAXvWoW38zxoM60Cm/b7A0rCkQCI12cF3uxePxFk0Z
	9PReLY6Y52r35ijhiFszbXw/AvSCIpCEBuB7qPTxShkDfuJPpF30cdZ1ZeEwQjT1dDNs
	U0w66iEz6TY6qyzJZBQHSLTgKOclCh6zJuOv0=
Received: by 10.223.117.73 with SMTP id p9mr9250133faq.56.1280940901553;
	Wed, 04 Aug 2010 09:55:01 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id q17sm3075532faa.21.2010.08.04.09.55.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 09:55:00 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OghEz-0007FI-An; Wed, 04 Aug 2010 18:54:53 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 18:54:48 +0200
Message-Id: <1280940888-27741-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <201008041917.20529.khimov@altell.ru>
References: <201008041917.20529.khimov@altell.ru>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH][v2] perl: honour DISTRO_FEATURE largefile
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
X-List-Received-Date: Wed, 04 Aug 2010 16:55:40 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/perl/perl-native_5.8.8.bb |    3 +--
 recipes/perl/perl_5.8.8.bb        |   18 ++++++++++++++----
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/recipes/perl/perl-native_5.8.8.bb b/recipes/perl/perl-native_5.8.8.bb
index fe1bc84..74103de 100644
--- a/recipes/perl/perl-native_5.8.8.bb
+++ b/recipes/perl/perl-native_5.8.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.perl.org/"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS = "virtual/db-native gdbm-native"
-PR = "r20"
+PR = "r21"
 NATIVE_INSTALL_WORKS = "1"
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/perl-${PV}"
@@ -44,7 +44,6 @@ do_configure () {
         -Duseshrplib \
         -Dusethreads \
         -Duseithreads \
-        -Duselargefiles \
 	-Dnoextensions=ODBM_File \
         -Ud_dosuid \
         -Ui_db \
diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
index c8ad895..3321b9b 100644
--- a/recipes/perl/perl_5.8.8.bb
+++ b/recipes/perl/perl_5.8.8.bb
@@ -5,7 +5,7 @@ LICENSE = "Artistic|GPL"
 PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db perl-native grep-native"
-PR = "r35"
+PR = "r36"
 
 # Major part of version
 PVM = "5.8"
@@ -60,12 +60,22 @@ do_configure() {
         cd Cross
 
         # Generate configuration
-        rm -f config.sh-${TARGET_ARCH}-${TARGET_OS}
         for i in ${WORKDIR}/config.sh \
                  ${WORKDIR}/config.sh-${SITEINFO_BITS} \
                  ${WORKDIR}/config.sh-${SITEINFO_BITS}-${SITEINFO_ENDIANNESS}; do
-            cat $i >> config.sh-${TARGET_ARCH}-${TARGET_OS}
-        done
+            cat $i
+        done > config.sh-${TARGET_ARCH}-${TARGET_OS}
+	uselargefiles="${@base_contains('DISTRO_FEATURES', 'largefile', 'define', 'undef', d)}"
+	flaglfs="${@base_contains('DISTRO_FEATURES', 'largefile', '-D', '-U', d)}"
+	sed -i -e "s,^\(optimize=\).*,\1'',g" \
+	       -e "s,^\(uselargefiles=\).*,\1'$uselargefiles',g" \
+           -e "s,^\(d_readdir64_r=\).*,\1'$uselargefiles',g" \
+           -e "s,-[DU]\(uselargefiles\),$flaglfs\1,g" \
+		    config.sh-${TARGET_ARCH}-${TARGET_OS}
+    if [ "$uselargefiles" = "undef" ]; then
+        sed -i -e 's/\([[:space:]]\|__USE\|-D\|-U\)\(_LARGEFILE_SOURCE\|_LARGEFILE64_SOURCE\|_\(FILE_OFFSET_BITS\|FILE_OFFSET64\|LARGEFILE\|LARGEFILE64\)=[[:digit:]]*\)//g' \
+		    config.sh-${TARGET_ARCH}-${TARGET_OS}
+    fi
 
         # Fixups for uclibc
         if [ "${TARGET_OS}" = "linux-uclibc" -o "${TARGET_OS}" = "linux-uclibceabi" ]; then
-- 
1.7.1




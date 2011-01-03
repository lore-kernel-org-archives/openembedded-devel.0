Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PZqc6-0004XH-4h
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 21:02:43 +0100
Received: by mail-fx0-f47.google.com with SMTP id 17so12727982fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 12:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=tBdBUORdwjjkZKkdZMja4Qtuj6ElqV5hWL3WrHdkga8=;
	b=E/ieNlatBtlkOhi1n53mH0yni911jvWvfx7xQEksmws1xx+N2xl+nADu0t2bNLke6r
	iaF6pNsnMfamIOkGR9wGPzQzvkGV5NV8RaOvJvQry59l01YSLQHlsxePG5P3ndNLCwpS
	nWXgIgrZ4ovsw8ahtcsHD1J3TJ36S+L3qMhKU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=wOm47iIHmVzbf7vDGs+vbGckeyex5m2roQEVzJ0VPioNUMgZDWBdNpWfosUTqPTJWB
	GmZ2KpPpiLzhVITbascHMjDjH4HF40yU/CsGs+GUGlB66/aC69PM7J/HcRSwlG5Hl8e/
	G2azM7xj3H6chYpxtUuuoalAgxuWYXu1wrVeM=
Received: by 10.223.121.139 with SMTP id h11mr1544064far.5.1294084939115;
	Mon, 03 Jan 2011 12:02:19 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id n1sm4880044fam.16.2011.01.03.12.02.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Jan 2011 12:02:17 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PZqbf-0000p0-Ob; Mon, 03 Jan 2011 21:02:15 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jan 2011 21:02:01 +0100
Message-Id: <1294084926-3115-7-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 07/12] busybox: simplify handling of busybox-static
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
X-List-Received-Date: Mon, 03 Jan 2011 20:02:43 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/busybox/busybox-static_1.17.4.bb |    8 +-------
 recipes/busybox/busybox-static_1.18.1.bb |    6 ------
 recipes/busybox/busybox.inc              |   15 +++++++++++++--
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/recipes/busybox/busybox-static_1.17.4.bb b/recipes/busybox/busybox-static_1.17.4.bb
index 325752a..252fd66 100644
--- a/recipes/busybox/busybox-static_1.17.4.bb
+++ b/recipes/busybox/busybox-static_1.17.4.bb
@@ -1,11 +1,5 @@
 require busybox_${PV}.bb
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 FILESPATHPKG =. "busybox-${PV}:"
 S = "${WORKDIR}/busybox-${PV}"
-
-do_configure_append() {
-	sed -i -e '/CONFIG_STATIC/d' .config
-	echo "CONFIG_STATIC=y" >>.config
-}
-
diff --git a/recipes/busybox/busybox-static_1.18.1.bb b/recipes/busybox/busybox-static_1.18.1.bb
index 58aca93..eeb3040 100644
--- a/recipes/busybox/busybox-static_1.18.1.bb
+++ b/recipes/busybox/busybox-static_1.18.1.bb
@@ -2,9 +2,3 @@ require busybox_${PV}.bb
 
 FILESPATHPKG =. "busybox-${PV}:"
 S = "${WORKDIR}/busybox-${PV}"
-
-do_configure_append() {
-	sed -i -e '/CONFIG_STATIC/d' .config
-	echo "CONFIG_STATIC=y" >>.config
-}
-
diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index a9d1e6e..eda5f95 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 SECTION = "base"
 PRIORITY = "required"
 
-INC_PR = "r38"
+INC_PR = "r39"
 
 SRC_URI = "\
   file://busybox-cron \
@@ -97,9 +97,11 @@ python () {
                  d)
 }
 
-do_configure () {
+do_prepare_config () {
 	sed -e 's#@DATADIR@#${datadir}#g' \
 		< ${WORKDIR}/defconfig > ${S}/.config
+	sed -i -e '/CONFIG_STATIC/d' .config
+	echo "# CONFIG_STATIC is not set" >> .config
 	for i in 'CROSS' 'DISTRO FEATURES'; do echo "### $i"; done >> \
 		${S}/.config
 	sed -i -e '${configmangle}' ${S}/.config
@@ -112,6 +114,15 @@ do_configure () {
 	  {if(net==2&&$0 !~ /^#/&&$1){print("# "$1" is not set")}else{print}}' \
 		  ${S}/.config.oe-tmp > ${S}/.config
 	fi
+}
+
+do_prepare_config_append_pn-busybox-static() {
+	sed -i -e '/CONFIG_STATIC/d' .config
+	echo "CONFIG_STATIC=y" >>.config
+}
+
+do_configure () {
+	do_prepare_config
 	cml1_do_configure
 }
 
-- 
1.7.2.3




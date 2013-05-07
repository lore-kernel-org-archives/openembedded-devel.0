Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UZqrz-0003cy-Aq
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 01:00:36 +0200
Received: by mail-ea0-f170.google.com with SMTP id q16so76126ead.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2013 15:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Doew5apQmX5QD6NNhWV1pVX4OokgtU8ZpCemOnXTaBI=;
	b=q3kQ8U1A5ZGRGeBznfb8ddH80ErPR5UvG5nlXh/St6MrTiNF7EsohxBvkCGtqaoqo6
	ioP7ts5d93PCAdMVOXyPUdNQnc9YJB+uysVQtfqa7dG3M52uPHCyvgMS+9LLav1mWRJt
	/N2uNagnFIliApopR0RJSbnObmxpYSJEpJpXYuxus0iWYn7Y4XZ5WH6k8IQmAXEWaXog
	bYkTintd2kAXadPBctJDweI+XtHTIw/VTmH90XN7dcG3TOH5wtjdwojJd53Yyar72FT5
	isUgyOUXyX2Cod4nYvnIIJi7W0MiJft/v7vMhDa2TUYoULJojTUTe5bxCinTFOHaB9MA
	VJXw==
X-Received: by 10.14.3.9 with SMTP id 9mr9995628eeg.33.1367966546054;
	Tue, 07 May 2013 15:42:26 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0896.dip0.t-ipconnect.de.
	[91.10.8.150])
	by mx.google.com with ESMTPSA id i3sm41969409eev.1.2013.05.07.15.42.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 15:42:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2013 00:41:51 +0200
Message-Id: <1367966513-12566-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-gnome 13/15] proftpd: remove postinst - directory can be setup offline in do_install
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
X-List-Received-Date: Tue, 07 May 2013 23:00:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |   16 +++++-----------
 1 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
index 28a7357..806413b 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
            file://make.patch \
@@ -47,6 +47,10 @@ do_install () {
 
     install -d ${D}${sysconfdir}/default
     install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/proftpd
+
+    # create the pub directory
+    mkdir -p ${D}/home/${FTPUSER}/pub/
+    chown -R ${FTPUSER}:${FTPGROUP} ${D}/home/${FTPUSER}/pub
 }
 
 INITSCRIPT_NAME = "proftpd"
@@ -55,13 +59,3 @@ INITSCRIPT_PARAM = "defaults 85 15"
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "${FTPGROUP}"
 USERADD_PARAM_${PN} = "--system -g ${FTPGROUP} ${FTPUSER}"
-
-pkg_postinst_${PN} () {
-    if [ "x$D" != "x" ] ; then
-        exit 1
-    fi
-
-    # create the pub directory
-    mkdir -p /home/${FTPUSER}/pub/
-    chown -R ${FTPUSER}:${FTPGROUP} /home/${FTPUSER}/pub
-}
-- 
1.7.4.4




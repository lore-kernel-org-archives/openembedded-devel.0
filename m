Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgN7b-0000Ec-RH
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 23:07:15 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2191970eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 13:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=0nA615U5UEZQsNXMQ5tn/2ly0R4k7d8okBuLlWbkdMk=;
	b=sqOWVOcyATo/W4rs2UmSz573ehHhisgu+BwN8igLzx+gzqwzLQMri3iVXgTNW42Och
	Fg0PN/bPry1G+UmcvsrmY4rGyCLb2YP11xyhUEbU97H/hge5CexzVnndcgOYdQhgnkUu
	3CIlJObBb8d63hvjOwJ6E6DBVJpzVO4ymFW9mkaj9oR4LMGC299oMkxWX4sFXNtaNZxA
	VmX03KgLBiqwJz30eZK4jGg74BbWxq0Xwh1fue0/NmgDYDbef9tLtmJqcFQXa8QUzlPN
	asyWf32YRPazuNKAzf2RWdtGwhzb9sUnYzVZja5WgL2r40n4Ytfk5f5ruKec1W8tsJbE
	jAVA==
Received: by 10.14.184.131 with SMTP id s3mr64810460eem.38.1354744373243;
	Wed, 05 Dec 2012 13:52:53 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm11768144eeo.8.2012.12.05.13.52.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 13:52:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 22:52:04 +0100
Message-Id: <f3f9fac0ed8be5bad9dbafb2a23955dc735858cd.1354743849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354743849.git.Martin.Jansa@gmail.com>
Subject: [PATCH 81/85] gateone: fix unpackaged files
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
X-List-Received-Date: Wed, 05 Dec 2012 22:07:15 -0000

* fixes:
gateone-1.1: gateone: Files/directories were installed but not shipped
  /usr
  /usr/lib
  /usr/lib/python2.7
  /usr/lib/python2.7/site-packages
  /usr/lib/python2.7/site-packages/gateone-1.1-py2.7.egg-info

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/gateone/gateone_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index f6aa377..f0f727a 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
 LICENSE = "AGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ee5b168fc7de89a0cadc49e27830aa2c"
 
-PR = "r8"
+PR = "r9"
 
 PV = "1.1"
 SRCREV = "bb74e1095adb66b04b51ed6ff10ae0aa96afdd46"
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/liftoff/GateOne.git \
 
 S = "${WORKDIR}/git"
 
-inherit distutils allarch
+inherit distutils allarch python-dir
 
 export prefix = "${localstatedir}/lib"
 
@@ -26,7 +26,7 @@ do_install_append() {
 	install -m 0644 ${WORKDIR}/server.conf ${D}/var/lib/gateone/server.conf
 }
 
-FILES_${PN} = "${localstatedir}/lib ${localstatedir}/log ${base_libdir} ${sysconfdir}"
+FILES_${PN} = "${localstatedir}/lib ${localstatedir}/log ${base_libdir} ${sysconfdir} ${PYTHON_SITEPACKAGES_DIR}"
 RDEPENDS_${PN} = "file \
                   mime-support \
                   openssh-ssh \
-- 
1.8.0




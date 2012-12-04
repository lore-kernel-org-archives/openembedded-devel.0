Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi6F-00040y-GN
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:19:07 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926936eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=LxIIShN4RoJZGPHaku9I0E5z9mFV+7sextayH2bfcCk=;
	b=ndOd8sNplVn0JeAwSc3JM3jwFiim6VsdlX82ijxm0u/HpS7vDBLfE0u0gkTz6G46+1
	fkOW1btbhxeI2nVwXFd/PoZWrcLyG2wqrhWXrVtkBpfQHIpJsCndZvX/dwug36ptqMX5
	FvoohEs3e5vglukrYabCu8/Apy5h4p2GJkrcoE7U11Y7JuaDXwlufUil3mbN8DdaAlPP
	Ip6RVzuM97b83YCI0mjyJsZIyUNNNihEXfgKd2APui6SYC70KrKMIdCtaxCf3Fr3A0iG
	+3uR2MHHTX6raZtAiGlLJ9AefVxQLTixi9l7TosrbwrVNEgjkMYuETAvms93IB6ulhAA
	qlgw==
Received: by 10.14.214.132 with SMTP id c4mr42816476eep.18.1354586685010;
	Mon, 03 Dec 2012 18:04:45 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z8sm34805218eeo.11.2012.12.03.18.04.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:04:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:10 +0100
Message-Id: <3177afc0f637776bfcc84e342eefd3ecdb88759c.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 37/58] fuse: remove /dev/fuse in do_install_append
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
X-List-Received-Date: Tue, 04 Dec 2012 02:19:07 -0000

* it's not packaged and created on target dynamically
* fixes QA:
  fuse-2.9.2: fuse: Files/directories were installed but not shipped
    /dev
    /dev/fuse

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/fuse/fuse_2.9.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/fuse/fuse_2.9.2.bb b/meta-oe/recipes-support/fuse/fuse_2.9.2.bb
index bd0095b..23b9447 100644
--- a/meta-oe/recipes-support/fuse/fuse_2.9.2.bb
+++ b/meta-oe/recipes-support/fuse/fuse_2.9.2.bb
@@ -5,6 +5,8 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
+PR = "r1"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz \
            file://gold-unversioned-symbol.patch \
           "
@@ -31,3 +33,7 @@ FILES_fuse-utils = "${bindir} ${base_sbindir}"
 FILES_fuse-utils-dbg = "${bindir}/.debug ${base_sbindir}/.debug"
 DEBIAN_NOAUTONAME_fuse-utils = "1"
 DEBIAN_NOAUTONAME_fuse-utils-dbg = "1"
+
+do_install_append() {
+  rm -rf ${D}${base_prefix}/dev
+}
-- 
1.8.0




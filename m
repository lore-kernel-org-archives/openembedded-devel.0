Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1Rq0eD-0003G2-4Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 12:04:13 +0100
Received: by mail-bk0-f47.google.com with SMTP id q10so4060448bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 02:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=D+6nDC1DVJDsNPjlUd2Iqn6glncDDvL1ImBvWxKlcI0=;
	b=bTUQPDuIxF5OcpO6cN+TivV6ts/SMmMCfe/dZNSncgpcptQ+8wgfuO6Lg3a/TJvg1K
	mPdbhjfWxcAkxP879jaaWrWJy9NTD2YeONMCvXAJGYjq9wID8S/+EQiuhxyU04NOEM2+
	wlh89T3xB/o8aJ87tmK3JT3pI6RoOH6ciUWJs=
Received: by 10.204.152.7 with SMTP id e7mr6918418bkw.70.1327488984508;
	Wed, 25 Jan 2012 02:56:24 -0800 (PST)
Received: from localhost.localdomain (mx2.promwad.com. [195.222.87.218])
	by mx.google.com with ESMTPS id e12sm27217bko.14.2012.01.25.02.56.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 02:56:23 -0800 (PST)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Received: from jek by localhost.localdomain with local (Exim 4.77)
	(envelope-from <jek@jeknote.loshitsa1.net>)
	id 1Rq0Wb-0007N7-TE; Wed, 25 Jan 2012 13:56:21 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 13:56:21 +0300
Message-Id: <1327488981-28305-1-git-send-email-yauhen.kharuzhy@promwad.com>
X-Mailer: git-send-email 1.7.8.3
Cc: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
Subject: [PATCH 08/10] Add recipe for xerces-c 3.1.1
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
X-List-Received-Date: Wed, 25 Jan 2012 11:04:13 -0000

From: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>

Add recipe for Xerces-C++: a validating XML parser written in
a portable subset of C++.

Signed-off-by: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
---
 meta/recipes-support/xerces-c/xerces-c_3.1.1.bb |   35 +++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/xerces-c/xerces-c_3.1.1.bb

diff --git a/meta/recipes-support/xerces-c/xerces-c_3.1.1.bb b/meta/recipes-support/xerces-c/xerces-c_3.1.1.bb
new file mode 100644
index 0000000..e73a690
--- /dev/null
+++ b/meta/recipes-support/xerces-c/xerces-c_3.1.1.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "Xerces-c is a validating xml parser written in C++"
+HOMEPAGE = "http://xerces.apache.org/xerces-c/"
+SECTION =  "libs"
+PRIORITY = "optional"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57
+
+PR = "r1"
+
+SRC_URI = "http://apache.lauf-forum.at/xerces/c/3/sources/${BP}.tar.gz"
+
+inherit autotools pkgconfig
+
+PACKAGES = "libxerces-c \
+    libxerces-c-dbg \
+    libxerces-c-dev \
+    xerces-c-samples \
+    xerces-c-samples-dbg \
+" 
+
+FILES_libxerces-c = "${libdir}/libxerces-c-3.1.so"
+FILES_libxerces-c-dbg = "${libdir}/.debug/"
+FILES_libxerces-c-dev = "${libdir}/lib*.la \
+    ${libdir}/lib*.a \
+    ${libdir}/libxerces-c.so \
+    ${libdir}/pkgconfig/xerces-c.pc \
+    ${includedir}/xercesc \
+"
+FILES_xerces-c-samples = "${bindir}/*"
+FILES_xerces-c-samples-dbg = "${bindir}/.debug/"
+
+SRC_URI[md5sum] = "6a8ec45d83c8cfb1584c5a5345cb51ae"
+SRC_URI[sha256sum] = "a42785f71e0b91d5fd273831c87410ce60a73ccfdd207de1b805d26d44968736"
+
+BBCLASSEXTEND += "native"
-- 
1.7.6.4




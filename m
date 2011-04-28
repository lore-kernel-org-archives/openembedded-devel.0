Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QFaio-00050q-Od
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Apr 2011 01:34:10 +0200
Received: by pwj9 with SMTP id 9so1583367pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2011 16:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=xgzclZpeoonxoaU9GuMAVeZygbuCAZVYHqYGFEeMlGI=;
	b=INxS5PgLuWnfyv2zHisbSxhk2I8hnPsK4HgIvnzrtRROUzdNexuJj3jRmIKwa869iv
	lvH6susU9OTUluFIYoFg6bsSgc687ty1CmmRHa1Pd393AW4xkGE6eogDgsl80l3fmCEH
	dubIk8cnRrWGxNdcNzl8k3Djg+b0ezdcVfSsk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=bZBDrufXOPW7FFVTETbPslcvzXFAY6vSVQltsyeTtJztEdhQmhwdkm7ZPTwPosDaIj
	xr3NsCkEcLBBgAbxzsknQ8QTCHwTbLtVAUfAszCOFBZzRvus3Td+yEhrGwJ0fpuUPt+g
	2/gF5RTf2yo5HD6astkxGBmb/9R1s4lwRQvQw=
Received: by 10.68.44.227 with SMTP id h3mr4538054pbm.245.1304033497910;
	Thu, 28 Apr 2011 16:31:37 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y7sm1508046pbk.30.2011.04.28.16.31.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Apr 2011 16:31:37 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Apr 2011 16:31:17 -0700
Message-Id: <1304033478-22959-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1304033478-22959-1-git-send-email-raj.khem@gmail.com>
References: <1304033478-22959-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] xcb-proto: Add recipe for version 1.6
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
X-List-Received-Date: Thu, 28 Apr 2011 23:34:11 -0000

From: Khem Raj <raj.khem@gmail.com>

xcb-proto is needed by libxcb and --without-xcb
is not possible with xorg-lib anymore hence the need

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/xcb/xcb-proto.inc    |   18 ++++++++++++++++++
 meta-oe/recipes-graphics/xcb/xcb-proto_1.6.bb |    6 ++++++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xcb/xcb-proto.inc
 create mode 100644 meta-oe/recipes-graphics/xcb/xcb-proto_1.6.bb

diff --git a/meta-oe/recipes-graphics/xcb/xcb-proto.inc b/meta-oe/recipes-graphics/xcb/xcb-proto.inc
new file mode 100644
index 0000000..226dd72
--- /dev/null
+++ b/meta-oe/recipes-graphics/xcb/xcb-proto.inc
@@ -0,0 +1,18 @@
+DESCRIPTION = "XCB: an X protocol C binding"
+SECTION = "x11/libs"
+LICENSE = "MIT-X"
+HOMEPAGE = "http://xcb.freedesktop.org"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
+DEPENDS = "python-native"
+
+SRC_URI = "http://xcb.freedesktop.org/dist/xcb-proto-${PV}.tar.bz2"
+
+BBCLASSEXTEND = "native nativesdk"
+
+inherit autotools pkgconfig
+
+INC_PR = "r0"
+
+FILES_${PN}-dev += "${datadir}/xcb/*.xml"
+ALLOW_EMPTY_${PN} = "1"
+
diff --git a/meta-oe/recipes-graphics/xcb/xcb-proto_1.6.bb b/meta-oe/recipes-graphics/xcb/xcb-proto_1.6.bb
new file mode 100644
index 0000000..db18c2a
--- /dev/null
+++ b/meta-oe/recipes-graphics/xcb/xcb-proto_1.6.bb
@@ -0,0 +1,6 @@
+include xcb-proto.inc
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "04313e1d914b44d0e457f6c494fc178b"
+SRC_URI[sha256sum] = "f52bc1159b12496f002404eb5793c01277b20c82cb72c5ff076d7b25da9b5ca2"
+
-- 
1.7.4.1




Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id C5C227669F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 10:02:12 +0000 (UTC)
Received: by wijp11 with SMTP id p11so248540078wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 03:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=QpKLIqOkM24jTaoCji0EKlk6rSVgE1Y5jwTcyB6tnPA=;
	b=z64F07mtOfmlEZFGQdBmnpIJcH9jqMNEDKqSzdmuhSjbffQFa6+WbRzln4dPgGDm87
	bE2F07el+Gn6TGBPHo2UQoWfE9YW3XFeAk6JR/8+ZXmozfbwsnhHpY/g3EJA5AHWKWa0
	uF8ArEOuABE16Fdqa1jGucKj1q6PVkO6e4ToMS6k6Zgn3d57CkUSvBRadOTOJgrdrej4
	pUM3JHEeLCTYLXwHOm+HuyFcEkTQyJD6zEeuudayNVz+pMrPymzKcq9cnPxy4mKe7+nQ
	tA6GfW4ynP/hFASRYa/pKlJa50Ui8gTy/XZr3H2Wg5ob+50KRG+d5Xr6Pr5Bv6xU1wg+
	RCSw==
X-Received: by 10.180.211.101 with SMTP id nb5mr1983113wic.0.1446026532397;
	Wed, 28 Oct 2015 03:02:12 -0700 (PDT)
Received: from localhost.localdomain (p4FDF12E4.dip0.t-ipconnect.de.
	[79.223.18.228]) by smtp.googlemail.com with ESMTPSA id
	186sm4153114wmp.10.2015.10.28.03.02.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Oct 2015 03:02:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Oct 2015 11:02:02 +0100
Message-Id: <1446026522-30805-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-lxml: do not overwrite inherited DEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Oct 2015 10:02:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

python-lxml recipe inherits setuptools3 and after that includes
python-lxml.inc. In the current situation DEPENDS inherited by
setuptools3-tree are overwritten causing:

DEBUG: Executing shell function do_compile
/home/superandy/tmp/oe-core-glibc/work/x86_64-linux/python3-lxml-native/3.4.4-r0/temp/run.do_compile.30454: line 118: /home/superandy/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/bin/python3-native/python3: No such file or directory
ERROR: python3 setup.py build_ext execution failed.
WARNING: /home/superandy/tmp/oe-core-glibc/work/x86_64-linux/python3-lxml-native/3.4.4-r0/temp/run.do_compile.30454:1 exit 1 from
  exit 1
ERROR: Function failed: do_compile (log file is located at /home/superandy/tmp/oe-core-glibc/work/x86_64-linux/python3-lxml-native/3.4.4-r0/temp/log.do_compile.30454)

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-python/recipes-devtools/python/python-lxml.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 8ca8f41..7a596c1 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -6,7 +6,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b"
 SRCNAME = "lxml"
 
-DEPENDS = "libxml2 libxslt"
+DEPENDS += "libxml2 libxslt"
 
 SRC_URI = "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-- 
2.1.0



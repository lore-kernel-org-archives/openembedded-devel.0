Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SCorP-0001g1-Rx
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 11:08:07 +0200
Received: by wibhj13 with SMTP id hj13so5727578wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 01:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Ip9O1aYgQLuKXvb49U84iQysXZq0fNIm0X6aHLo3LqM=;
	b=gad46M2/xBfL9iWUqzMd/9Pe0A/RgPL5E3EBlzbVOxiS6ngXGH43tfojao/AsLeUAr
	AvN0fjKwypSgzxbTkb7a+vS0nj+8LWUcCfOPIBGl9fDy54lnnhG0OMCtsgvIMXlXYpJR
	wz3y4/pidt2QjnLEnz3HpT0+DOFkBuNuG8PTEiERkt5014a/TlaGvzoY0486uqcLYDpn
	63d0fjtIJFINuf8mvzfFKnEWgzjaYZdBqvaRegwD/wARTU+5MEz+YKCnRNrnQWGs7JgM
	r3DJHqyvaLD+kQwrUrWPE3sR/OGdNtfQeZX6Eo7iaD3W/3UycibPFMXUVzVi/zX6A/u4
	xsUg==
Received: by 10.180.8.231 with SMTP id u7mr5079080wia.9.1332925145935;
	Wed, 28 Mar 2012 01:59:05 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id ex2sm10807133wib.8.2012.03.28.01.59.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 01:59:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Mar 2012 10:58:58 +0200
Message-Id: <1332925138-28464-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1332925138-28464-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332925138-28464-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, v2 4/4] obexd: fix QA warnings by creating empty package obex-plugins
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
X-List-Received-Date: Wed, 28 Mar 2012 09:08:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix the following warnings:
WARNING: For recipe obexd, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/lib
WARNING:   /usr/lib/obex
WARNING:   /usr/lib/obex/plugins

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/obex/obexd_0.44.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/obex/obexd_0.44.bb b/meta-oe/recipes-connectivity/obex/obexd_0.44.bb
index 24edb9d..77d7f1e 100644
--- a/meta-oe/recipes-connectivity/obex/obexd_0.44.bb
+++ b/meta-oe/recipes-connectivity/obex/obexd_0.44.bb
@@ -4,14 +4,18 @@ DEPENDS = "openobex glib-2.0 dbus bluez4 libical"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "files://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
+PR = "r1"
+
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz"
 SRC_URI[md5sum] = "3fb9cb9d7ab119753253ff784235a364"
 SRC_URI[sha256sum] = "104fc50eb8bf41d690d31588c3a4829a75dc7738b1c76cf260171d8f525da758"
 
 inherit autotools
 
-PACKAGES =+ "obex-client"
+PACKAGES =+ "obex-client obex-plugins"
 
 FILES_${PN} += "${datadir}/dbus-1/services/${PN}.service"
 FILES_obex-client = "${libexecdir}/obex-client \
                      ${datadir}/dbus-1/services/obex-client.service"
+# currently the plugins are empty
+FILES_obex-plugins = "${libdir}/obex/plugins"
-- 
1.7.6.5




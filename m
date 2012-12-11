Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TiNcr-00015D-Ix
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 12:03:49 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2136170eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2012 02:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=59HSdsGGcdK1m64rPq0zFHAtNACRGjTGTKnQdxfR5Dg=;
	b=V9bVwYtmUrpVFm7AgXSbQdFPXhGlBAqbPaWhEYykseeRnmvBPIeHGYM+Cv54k6l17D
	dHUPXqK6fDs5QhBTPZ3FbMpuCHsMFXwMvIe2VRgEE2LGaHPTQlX8D3WCHZWk19cNYCmw
	bo5jbo/wg9j44C3ZACijz03PtPacOMJNh04AWMycMTkGG3ExpvlKyHUolapHq6c8Rw3H
	vJEBWR1Njl5Tkrqk33mLT921y/6WXrt4gRo8PKyDQ4Y2vdhufi5oWCLIKMfItzH+drjt
	XJEO+DncXk76Z5+gqpJxCUJ7zgKyNl98m612yf2+vE92qQObQSksAGDZd2HfnZSBDSYq
	T79w==
Received: by 10.14.221.65 with SMTP id q41mr59373505eep.30.1355222957552;
	Tue, 11 Dec 2012 02:49:17 -0800 (PST)
Received: from s-stirtzel-linux.zera.local
	(ip-178-200-247-119.unitymediagroup.de. [178.200.247.119])
	by mx.google.com with ESMTPS id k4sm42711894eep.15.2012.12.11.02.49.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Dec 2012 02:49:16 -0800 (PST)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Dec 2012 11:48:42 +0100
Message-Id: <1355222922-14422-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe] iceauth: Add native build
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
X-List-Received-Date: Tue, 11 Dec 2012 11:03:50 -0000

Some recipes require iceauth native (eg. xfce4-session)
Without this patch they would use the build-hosts iceauth

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
index d3fbd13..4cb3b26 100644
--- a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
@@ -2,7 +2,9 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 DESCRIPTION = "Tool for manipulating ICE protocol authorization records"
 LIC_FILES_CHKSUM = "file://COPYING;md5=13f70acf3c27f5f834bbc954df775f8e"
 DEPENDS += "libice"
-PR = "r6"
+PR = "r7"
 
 SRC_URI[md5sum] = "bb2e4d2611047f7c5a1a82ec956a9de4"
 SRC_URI[sha256sum] = "0ee6fd4554f0131b1ed526ee00b9cf643e7dc97eb70fb51448848ef2f349938d"
+
+BBCLASSEXTEND = "native"
\ No newline at end of file
-- 
1.7.9.5




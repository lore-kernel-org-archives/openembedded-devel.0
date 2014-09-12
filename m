Return-Path: <oliver.staebler@bytesatwork.ch>
X-Greylist: delayed 437 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 12 Sep 2014 15:51:12 UTC
Received: from bytesatwork.ch (bytesatwork.ch [91.135.72.15])
	by mail.openembedded.org (Postfix) with ESMTP id 4E42865CA7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 15:51:12 +0000 (UTC)
Received: from [192.168.2.37] (201-97.77-83.cust.bluewin.ch [83.77.97.201])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested) (Authenticated sender: oliver)
	by bytesatwork.ch (Postfix) with ESMTPSA id 6E10D18012EA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 17:44:46 +0200 (CEST)
Message-ID: <541314BE.2020105@bytesatwork.ch>
Date: Fri, 12 Sep 2014 17:43:58 +0200
From: =?UTF-8?B?T2xpdmVyIFN0w6RibGVy?= <oliver.staebler@bytesatwork.ch>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][daisy][PATCH] libmikmod: Adjust SRC_URI
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
X-List-Received-Date: Fri, 12 Sep 2014 15:51:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

The path to download libmikmod has changed on sourceforge. Adjust the
path so the tar.gz can be downloaded again.

Signed-off-by: Oliver Stäbler <oliver.staebler@bytesatwork.ch>
---
  meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb
index 6a3077f..2fadd75 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=b2b941d484c442e5c031a51463d8e11b"
  DEPENDS = "alsa-lib texinfo"
  
  SRC_URI = "\
-    ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
+    ${SOURCEFORGE_MIRROR}/project/mikmod/outdated_versions/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
  "
  SRC_URI[md5sum] = "0e0f9bce8f8e598ca292b41e0ae385c8"
  SRC_URI[sha256sum] = "79f02478c5abd8b2af73df4cc5f9d52625aa044327c01563168e270cf79b2437"
-- 
1.8.5.5



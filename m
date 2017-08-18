Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 71ED87845A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Aug 2017 03:00:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7I2tlS5004207
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 19:55:48 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 17 Aug 2017 19:55:46 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Aug 2017 22:55:45 -0400
Message-ID: <1503024945-85605-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] libvpx: upgrade to 1.6.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Aug 2017 03:00:00 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta-oe/recipes-multimedia/webm/{libvpx_1.5.0.bb => libvpx_1.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.5.0.bb => libvpx_1.6.0.bb} (90%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.6.0.bb
similarity index 90%
rename from meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
rename to meta-oe/recipes-multimedia/webm/libvpx_1.6.0.bb
index 648818e..b5a8cff 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.6.0.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 SRC_URI += "http://storage.googleapis.com/downloads.webmproject.org/releases/webm/${BP}.tar.bz2 \
             file://libvpx-configure-support-blank-prefix.patch \
            "
-SRC_URI[md5sum] = "49e59dd184caa255886683facea56fca"
-SRC_URI[sha256sum] = "306d67908625675f8e188d37a81fbfafdf5068b09d9aa52702b6fbe601c76797"
+SRC_URI[md5sum] = "f95a176768a0e1bb4fe42742e27a41af"
+SRC_URI[sha256sum] = "d0afbb5eb1ecae68f8d578abace160a97e2e8a230e3028cf4db115d59a695aad"
 
 # ffmpeg links with this and fails
 # sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GLIBC_2.4'
-- 
2.8.1



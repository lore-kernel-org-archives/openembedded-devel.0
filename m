Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DABB172B1E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:58:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7P9wOAM014820
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 02:58:24 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 25 Aug 2015 02:58:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Aug 2015 02:58:24 -0700
Message-ID: <1440496704-10645-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-gnome] [PATCH] libgtop: set GNOME_COMPRESS_TYPE to bz2
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
X-List-Received-Date: Tue, 25 Aug 2015 09:58:26 -0000
Content-Type: text/plain

Fixed:
ERROR: Fetcher failure: Fetch command failed with exit code 8, output:
http://ftp.gnome.org/pub/GNOME/sources/libgtop/2.28/libgtop-2.28.2.tar.xz:
2015-08-25 09:16:33 ERROR 404: Not Found.

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-core 20150825

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
index 69a0f5c..1063c4f 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
@@ -3,6 +3,9 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://copyright.txt;md5=dbc839bf158d19a20e661db14db7a58c"
 
 inherit gnomebase lib_package gtk-doc
+
+GNOME_COMPRESS_TYPE = "bz2"
+
 SRC_URI[archive.md5sum] = "ed44d736efd97d062b77621de6aff439"
 SRC_URI[archive.sha256sum] = "49958d7da1f76b257bfd0d557d8ed2b218a5ab0d31b59fed1c32ddf2a1529f5d"
 
-- 
1.7.9.5



Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4E2A56010B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2016 06:48:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4B6m366005300
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 23:48:03 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 23:48:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 May 2016 23:48:02 -0700
Message-ID: <1462949282-13909-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [meta-networking] [PATCH] nbd: fix LIC_FILES_CHKSUM
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
X-List-Received-Date: Wed, 11 May 2016 06:48:03 -0000
Content-Type: text/plain

The file depcomp would be changed during configure, which is not
suitable for LIC_FILES_CHKSUM, there is a COPYING file which is GPLv2,
so use it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-support/nbd/nbd_3.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/nbd/nbd_3.11.bb b/meta-networking/recipes-support/nbd/nbd_3.11.bb
index 0f0ae8e..2ad75bd 100644
--- a/meta-networking/recipes-support/nbd/nbd_3.11.bb
+++ b/meta-networking/recipes-support/nbd/nbd_3.11.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Network Block Device"
 HOMEPAGE = "http://nbd.sourceforge.net"
 SECTION = "net"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://depcomp;beginline=6;endline=26;md5=3a3627e6495e2ff2a3316bcdaad91e9c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "glib-2.0"
 
-- 
2.8.0



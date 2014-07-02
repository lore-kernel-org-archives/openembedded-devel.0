Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F8FD65D03
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jul 2014 06:58:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s626wRuJ013571
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Jul 2014 23:58:27 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Jul 2014 23:58:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Jul 2014 23:57:14 -0700
Message-ID: <1404284261-42377-48-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
References: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe] [PATCH 47/74] audiofile: use BPN in SRC_URI
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
X-List-Received-Date: Wed, 02 Jul 2014 06:58:25 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../audiofile/audiofile_0.2.7.bb                   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
index bf7cdfb..ecfc988 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-SRC_URI = "http://www.68k.org/~michael/audiofile/${PN}-${PV}.tar.gz"
+SRC_URI = "http://www.68k.org/~michael/audiofile/${BP}.tar.gz"
 SRC_URI[md5sum] = "a39be317a7b1971b408805dc5e371862"
 SRC_URI[sha256sum] = "a61c4036c2600a645843f16bec4be166093a9df5f15b02c85291213aa9cf15a2"
 
-- 
1.7.9.5



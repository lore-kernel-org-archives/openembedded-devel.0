Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E16AF727DC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jan 2015 23:30:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t03NUb9J022387
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 3 Jan 2015 15:30:37 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 3 Jan 2015 15:30:36 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 3 Jan 2015 15:30:36 -0800
Message-ID: <1420327836-9852-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [V2 meta-networking] [PATCH] dnrd: fix SRC_URI
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
X-List-Received-Date: Sat, 03 Jan 2015 23:30:37 -0000
Content-Type: text/plain

Fixed:
ERROR: Function failed: Fetcher failure for URL:
    'http://ncu.dl.sourceforge.net/project/dnrd/dnrd/2.20.3/dnrd-2.20.3.tar.gz'.
    Unable to fetch URL from any source.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-daemons/dnrd/dnrd_2.20.3.bb            |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb b/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
index 85a58cc..3b8fdc9 100644
--- a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
+++ b/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
@@ -9,7 +9,7 @@ SECTION = "System Environment/Daemons"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0be67017f1c770313ad7b40e18d568f1"
 
-SRC_URI = "http://ncu.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://dnrd.service \
            file://dnrd.conf.sample \
            file://dnrd.init"
-- 
1.7.9.5



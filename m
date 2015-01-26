Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1A4987261A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 01:45:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0Q1jBxV025597
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jan 2015 17:45:11 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 25 Jan 2015 17:45:11 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 25 Jan 2015 17:45:07 -0800
Message-ID: <b9c2d02f382408a8803c4ebb79c96b9604d470b2.1422236615.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422236615.git.liezhi.yang@windriver.com>
References: <cover.1422236615.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking] [PATCH 3/5] nuttcp: fix HOMEPAGE and SRC_URI
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
X-List-Received-Date: Mon, 26 Jan 2015 01:45:11 -0000
Content-Type: text/plain

The old ones are invalid.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-support/nuttcp/nuttcp_7.2.1.bb         |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb b/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb
index b931d04..a275238 100644
--- a/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb
+++ b/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb
@@ -8,12 +8,12 @@ network layer throughput by transferring memory buffers from a source system \
 across an interconnecting network to a destination system, either transferring \
 data for a specified time interval, or alternatively transferring a specified \
 number of bytes."
-HOMEPAGE = "http://www.nuttcp.net/nuttcp/Welcome%20Page.html"
+HOMEPAGE = "http://www.nuttcp.net/Welcome%20Page.html"
 LICENSE = "GPL-2.0"
 SECTION = "net"
-LIC_FILES_CHKSUM = "file://nuttcp-${PV}.c;beginline=4;endline=30;md5=ae7045c3c3616092e07d87f04ba0d960"
+LIC_FILES_CHKSUM = "file://${BP}.c;beginline=4;endline=30;md5=ae7045c3c3616092e07d87f04ba0d960"
 
-SRC_URI = "http://lcp.nrl.navy.mil/nuttcp/beta/nuttcp-${PV}.c"
+SRC_URI = "http://nuttcp.net/${BPN}/beta/${BP}.c"
 SRC_URI[md5sum] = "1ebf4a08bad2a295a8155f02995e8754"
 SRC_URI[sha256sum] = "c6e33810ccce67260f8d5d627f60e429d44f532365c58ed5673d035e2a59c4db"
 
-- 
1.7.9.5



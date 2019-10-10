Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CF6DB6C1BE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 00:51:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9A0pmEu001151
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Oct 2019 17:51:48 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 9 Oct 2019 17:51:47 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Oct 2019 20:51:46 -0400
Message-ID: <20191010005146.8378-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] rwmem: add DESCRIPTION since the summary is vague
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
X-List-Received-Date: Thu, 10 Oct 2019 00:51:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb b/meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb
index 0a15134df..5d81fdb4d 100644
--- a/meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb
+++ b/meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb
@@ -1,4 +1,13 @@
 SUMMARY = "A small tool to read/write memory"
+DESCRIPTION = "rwmem is a small tool for reading and writing device registers. \
+rwmem supports two modes: mmap mode and i2c mode. \
+\
+In mmap mode rwmem accesses a file by memory mapping it. \
+Using /dev/mem as the memory mapped file makes rwmem access memory and \
+can thus be used to access devices which have memory mapped registers. \
+\
+In i2c mode rwmem accesses an i2c peripheral by sending i2c messages to it."
+
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-- 
2.22.0



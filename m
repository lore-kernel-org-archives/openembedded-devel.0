Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63D8A7F3A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 07:07:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7U7734O002991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 00:07:13 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Fri, 30 Aug 2019 00:06:52 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 30 Aug 2019 15:06:48 +0800
Message-ID: <1567148808-286340-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567148808-286340-1-git-send-email-changqing.li@windriver.com>
References: <1567148808-286340-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH 3/3] grubby: support usrmerge
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
X-List-Received-Date: Fri, 30 Aug 2019 07:07:22 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-initramfs/recipes-devtools/grubby/grubby_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
index 6d53f48..7248147 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
@@ -25,7 +25,7 @@ RDEPENDS_${PN} += "dracut"
 
 inherit autotools-brokensep ptest
 
-EXTRA_OEMAKE = "-e 'CC=${CC}' 'LDFLAGS=${LDFLAGS}' LIBS='${LIBS}'"
+EXTRA_OEMAKE = "-e 'CC=${CC}' 'LDFLAGS=${LDFLAGS}' LIBS='${LIBS}' 'PREFIX'=${@bb.utils.contains('DISTRO_FEATURES','usrmerge','/usr','',d)}"
 
 LIBS_libc-musl = "-lexecinfo"
 LIBS ?= ""
-- 
2.7.4



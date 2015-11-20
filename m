Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6B7F960112
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 09:32:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAK9Wnm3001322
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 01:32:49 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 20 Nov 2015 01:32:48 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Nov 2015 01:32:40 -0800
Message-ID: <f6e6fa4fab723c1abbaac3d7db659e5913e099b3.1448011904.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1448011904.git.liezhi.yang@windriver.com>
References: <cover.1448011904.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] netmap-modules: fix for --no-drivers
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
X-List-Received-Date: Fri, 20 Nov 2015 09:32:49 -0000
Content-Type: text/plain

Issue: LIN8-1697

The --no-drivers=virtio_net.c overrided --no-drivers=ixgbe, then errors:
git/LINUX/ixgbe_netmap_linux.h:52:2: error: #error "unsupported ixgbe driver version"
 #error "unsupported ixgbe driver version"
  ^

(LOCAL REV: NOT UPSTREAM) -- Jackie will will merge into his
netmap-modules work and send.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-kernel/netmap/netmap-modules_git.bb    |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
index 6365fee..628c870 100644
--- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
@@ -15,7 +15,7 @@ EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
                 --driver-suffix="-netmap" \
                 "
 
-EXTRA_OECONF += "--no-drivers=ixgbe --no-drivers=virtio_net.c"
+EXTRA_OECONF += "--no-drivers=ixgbe,virtio_net.c"
 
 LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
 LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
-- 
1.7.9.5



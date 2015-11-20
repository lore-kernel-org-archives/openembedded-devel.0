Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98219602D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 09:33:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAK9XvFV016615
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 01:33:57 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 20 Nov 2015 01:32:54 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Nov 2015 01:32:47 -0800
Message-ID: <4b0426ae3f3f6506f8eb0e54642d0ac66ef370cf.1448011905.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1448011904.git.liezhi.yang@windriver.com>
References: <cover.1448011904.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] netkit-ftp: fixed invalid symlink
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
X-List-Received-Date: Fri, 20 Nov 2015 09:33:56 -0000
Content-Type: text/plain

Issue: LIN8-1635

netkit-ftp-0.17: Symlink /usr/bin/pftp in netkit-ftp points to TMPDIR [symlink-to-sysroot]
lib32-netkit-ftp-0.17: Symlink /usr/bin/pftp in lib32-netkit-ftp points to TMPDIR [symlink-to-sysroot]

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel on 20151120

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
index 2f227a6..37f5bc7 100644
--- a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
@@ -31,7 +31,7 @@ do_install () {
     install -d ${D}${mandir}/man5
 
     install -m${BINMODE} ${S}/ftp/ftp ${D}${bindir}
-    ln -sf ${D}${bindir}/ftp ${D}${bindir}/pftp
+    ln -sf ftp ${D}${bindir}/pftp
     install -m${MANMODE} ${S}/ftp/ftp.1 ${D}${mandir}/man1
     ln -sf ftp.1 ${D}${mandir}/man1/pftp.1
     install -m${MANMODE} ${S}/ftp/netrc.5 ${D}${mandir}/man5
-- 
1.7.9.5



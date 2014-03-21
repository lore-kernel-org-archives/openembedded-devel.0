Return-Path: <george.nita@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 297C86F89F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 07:23:19 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 21 Mar 2014 08:23:17 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4089)	id 79570282885;
	Fri, 21 Mar 2014 08:23:17 +0100 (CET)
From: George Nita <george.nita@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Mar 2014 08:23:16 +0100
Message-ID: <1395386596-56931-1-git-send-email-george.nita@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: george.nita@enea.com does not
	designate permitted sender hosts)
Subject: [meta-filesystems] [PATCH] Add fusermount to fuse by default
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
X-List-Received-Date: Fri, 21 Mar 2014 07:23:23 -0000
Content-Type: text/plain

Without fusermount the '/etc/init.d/fuse status' command exits with error.
Added fusermount to PACKAGES list and ensured it gets installed.

Signed-off-by: George Nita <george.nita@enea.com>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
index a761932..1e8f958 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
@@ -21,7 +21,8 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-kernel-module"
 
-PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
+PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev \
+             libulockmgr-dbg fusermount"
 
 RRECOMMENDS_${PN} = "kernel-module-fuse"
 
@@ -40,4 +41,6 @@ DEBIAN_NOAUTONAME_fuse-utils-dbg = "1"
 
 do_install_append() {
     rm -rf ${D}${base_prefix}/dev
+    install -d ${D}${base_bindir}
+    install -m 0755 ${B}/util/fusermount -t ${D}${base_bindir}
 }
-- 
1.7.10.4



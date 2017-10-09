Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB82277C31
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Oct 2017 02:04:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9924J4Q016822
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 8 Oct 2017 19:04:19 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 8 Oct 2017 19:04:18 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 8 Oct 2017 22:04:17 -0400
Message-ID: <1507514657-177736-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] netkit-rsh: correct the file attribute
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
X-List-Received-Date: Mon, 09 Oct 2017 02:04:19 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Correct the file /etc/pam.d/rsh attribute

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
index d61636e..3990f7b 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -70,7 +70,7 @@ do_install () {
         install -m 0644 debian/hosts.equiv ${D}/${sysconfdir}
         install -m 0644 ${WORKDIR}/rexec.pam ${D}/${sysconfdir}/pam.d/rexec
         install -m 0644 ${WORKDIR}/rlogin.pam ${D}/${sysconfdir}/pam.d/rlogin
-        install -m 0664 ${WORKDIR}/rsh.pam ${D}/${sysconfdir}/pam.d/rsh
+        install -m 0644 ${WORKDIR}/rsh.pam ${D}/${sysconfdir}/pam.d/rsh
     fi
     cp ${WORKDIR}/rexec.xinetd.netkit  ${D}/${sysconfdir}/xinetd.d/rexec
     cp ${WORKDIR}/rlogin.xinetd.netkit  ${D}/${sysconfdir}/xinetd.d/rlogin
-- 
2.8.1



Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Lylmf-0005ES-6H
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Apr 2009 13:47:33 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 907EB1880DC; Tue, 28 Apr 2009 13:46:42 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Apr 2009 13:46:42 +0200
Message-Id: <1240919202-18679-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] netkit-ftp: Fixed GNU_HASH QA error.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Apr 2009 11:47:33 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/netkit-ftp/netkit-ftp_0.17.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/netkit-ftp/netkit-ftp_0.17.bb b/recipes/netkit-ftp/netkit-ftp_0.17.bb
index 41c3b08..20ad1fb 100644
--- a/recipes/netkit-ftp/netkit-ftp_0.17.bb
+++ b/recipes/netkit-ftp/netkit-ftp_0.17.bb
@@ -4,9 +4,11 @@ LICENSE = "BSD"
 SRC_URI = "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/netkit-ftp-${PV}.tar.gz \
 	   file://mconfig.patch;patch=1"
 
+PR = "r1"
+
 EXTRA_OEMAKE = ""
 do_compile () {
-	oe_runmake 'CC=${CC}' 'LD=${LD}' all
+	oe_runmake 'CC=${CC}' 'LD=${LD}' 'LDFLAGS=${LDFLAGS}' all
 }
 
 do_install () {
-- 
1.5.6.5




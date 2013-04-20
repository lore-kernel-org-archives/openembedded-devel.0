Received: from 3.mo1.mail-out.ovh.net ([46.105.60.232]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul@paulbarker.me.uk>) id 1UTXZn-0005yL-CQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Apr 2013 15:11:40 +0200
Received: from mail99.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 0BEE7FF8E9A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Apr 2013 14:18:15 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 20 Apr 2013 14:18:14 +0200
Received: from 94-192-12-83.zone6.bethere.co.uk (HELO
	b5-server.betafive.co.uk) (paul@betafive.co.uk@94.192.12.83)
	by ns0.ovh.net with SMTP; 20 Apr 2013 14:18:13 +0200
Received: from b5-vm-mint0.betafive.co.uk (unknown [192.168.0.235])
	by b5-server.betafive.co.uk (Postfix) with ESMTP id 64F64160103;
	Sat, 20 Apr 2013 13:17:03 +0100 (BST)
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Date: Sat, 20 Apr 2013 13:17:06 +0100
Message-Id: <1366460227-18964-3-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1366460227-18964-1-git-send-email-paul@paulbarker.me.uk>
References: <1366460227-18964-1-git-send-email-paul@paulbarker.me.uk>
X-Ovh-Tracer-Id: 9765211368624654665
X-Ovh-Remote: 94.192.12.83 (94-192-12-83.zone6.bethere.co.uk)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeifedrfedvucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeifedrfedvucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Subject: [meta-oe][PATCH 2/3] vim: use correct license file
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
X-List-Received-Date: Sat, 20 Apr 2013 13:11:53 -0000

The vim license conditions are in the file runtime/doc/uganda.txt within the
sources, not src/README.txt.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-support/vim/vim.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/vim/vim.inc b/meta-oe/recipes-support/vim/vim.inc
index fbc0861..bb3e56a 100644
--- a/meta-oe/recipes-support/vim/vim.inc
+++ b/meta-oe/recipes-support/vim/vim.inc
@@ -4,7 +4,7 @@ DEPENDS = "ncurses"
 # vimdiff doesn't like busybox diff
 RSUGGESTS_${PN} = "diffutils"
 LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://README.txt;md5=72c4840d07b65659b60b3fa405c7da36"
+LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=cd49910a3dde6fe0a7e24ebe8cbf7066"
 
 PV_MAJOR = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 VIMDIR = "${PN}${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).split('.')[1]}"
-- 
1.7.10.4




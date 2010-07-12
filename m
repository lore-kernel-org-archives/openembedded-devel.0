Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OYP0b-0004O1-T7
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 21:49:48 +0200
Received: by pvg13 with SMTP id 13so2328304pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 12:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=4kXczOPV/uN7EiDkrY/hlUy3APRErozDfiJVSXFMzCA=;
	b=NNzp5PtD/nvjzxOISi+DsLOd5CgOyT5YvzNuUQso/XDusPhd8I2TP8jQFJ5iwYOttL
	OymssrKuH4D/reTpCROgRXUde012gC4mm3eTdCEbDP/eYEF6cRqMcK/gN1ZeylvKaUji
	5+J69a3O6sbEpPQum17Eg5JZ1gMnuKIJL9DT8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=HmEQjSddfPwQFMQFW18pdbg1YpKrEFD7dnPy2023bvSWnUyhbKD5hVrTHZtErev97F
	iwcaLkC7gsDi7DYM4IhS25s2p8uB1+pkosVAd+SUt23yNlOBVxEniDGLWJQxRsxlBYeE
	1RGP8YK5fG3oK7cvaNZ+p0oZBxZmDS8WP9ITk=
Received: by 10.142.232.13 with SMTP id e13mr17090910wfh.263.1278963888114;
	Mon, 12 Jul 2010 12:44:48 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.224.36])
	by mx.google.com with ESMTPS id 23sm5192380wfa.22.2010.07.12.12.44.45
	(version=SSLv3 cipher=RC4-MD5); Mon, 12 Jul 2010 12:44:46 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jul 2010 14:45:46 -0500
Message-Id: <1278963950-2587-5-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.1.1
In-Reply-To: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
References: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 5/9] u-boot-xilinx: new file
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
X-List-Received-Date: Mon, 12 Jul 2010 19:49:49 -0000

* u-boot for xilinx platforms
* Inherits xilinx-bsp.bbclass for passing xparameters
  header file from hardware reference design project
  to match hardware/software model

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/u-boot/u-boot-xilinx_git.bb |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-xilinx_git.bb

diff --git a/recipes/u-boot/u-boot-xilinx_git.bb b/recipes/u-boot/u-boot-xilinx_git.bb
new file mode 100644
index 0000000..57677fb
--- /dev/null
+++ b/recipes/u-boot/u-boot-xilinx_git.bb
@@ -0,0 +1,17 @@
+require u-boot.inc
+PR = "r0"
+
+# Prefered u-boot from mainstream since has generic support for
+# ppc405, ppc440 and microblaze
+# SRC_URI = "git://git.denx.de/u-boot.git;protocol=git"
+# SRCREV = "8bd9dbdfa3a19f322810e2ad9e6d6551602d8afe"
+SRC_URI = "git://git.xilinx.com/u-boot-xlnx.git;protocol=git"
+SRCREV = "26e999650cf77c16f33c580abaadab2532f5e8b2"
+
+inherit xilinx-bsp
+
+TARGET_BOARD = "${@map_target(bb.data.getVar('TARGET_ARCH', d, 1), d)}"
+UBOOT_TARGET = "${@uboot_target(bb.data.getVar('TARGET_ARCH', d, 1), d)}"
+export UBOOT_MACHINE = "${@uboot_machine(bb.data.getVar('TARGET_ARCH', d, 1), d)}"
+
+S = "${WORKDIR}/git"
-- 
1.7.1.1




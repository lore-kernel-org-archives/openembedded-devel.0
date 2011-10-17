Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RFmzk-0006gp-13
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 15:12:44 +0200
Received: by ggnq1 with SMTP id q1so2809424ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 06:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=IC/bAfftSTZMYitbPNZJ9s5R9YZE/FNZwj3K/0DByL4=;
	b=W/4204G/6KLAyTOPBCTx75hKBRM3A76X7Kv2RnBdPvUhDLQpeFYPdqHxG+UdZ1dVg3
	Q97MZwMbZRNV1uRP66lJEt2CepJvUmSVG9M7kqoFgVjiTsvvRnU3TEoV/Wzlpch79QUW
	CDTRUWCuq7lN3gw9DyZ0hbaZjQwfuFGRDjSLM=
Received: by 10.151.25.12 with SMTP id c12mr17345918ybj.85.1318856809279;
	Mon, 17 Oct 2011 06:06:49 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id u13sm36613507anf.14.2011.10.17.06.06.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 06:06:48 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Oct 2011 13:06:39 +0000
Message-Id: <914e717b651c0891badce01c1a6c5591457a2c1b.1318856759.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1318856759.git.otavio@ossystems.com.br>
References: <cover.1318856759.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1318856759.git.otavio@ossystems.com.br>
References: <cover.1318856759.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/1] digitemp: add 3.6.0 version
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
X-List-Received-Date: Mon, 17 Oct 2011 13:12:44 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb

diff --git a/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb b/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb
new file mode 100644
index 0000000..7d89e9b
--- /dev/null
+++ b/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "read temperature sensors in a 1-Wire net"
+SECTION = "util"
+PRIORITY = "optional"
+DEPENDS = "libusb"
+LICENSE = "GPL-2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=44fee82a1d2ed0676cf35478283e0aa0"
+PR = "r0"
+
+SRC_URI = "http://www.digitemp.com/software/linux/digitemp-3.6.0.tar.gz"
+
+inherit autotools
+
+do_install() {
+    install -d ${D}${sbindir}
+    install digitemp_* ${D}${sbindir}
+}
-- 
1.7.2.5




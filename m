Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lazy.gopher@gmail.com>) id 1PEokA-0004Zr-0p
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 20:48:06 +0100
Received: by fxm3 with SMTP id 3so3103415fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 12:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=mNXCaVng3txxcoIWD+eMmgQKLhKgnhZifUOv25XJrp4=;
	b=kaMXEkHltlqicm3NkcvlbirvJ1steOyswR3FwZ6UDsKLEiY3LtonFmjLxVoNyPEYTe
	D90gKLFfU9tHetQr2XspoaxB9sKZhXt7efG4EtT831+g5/PI4dC1DdwbP2xeom3WINk2
	zhb26vtV0rFTX1B7xgak/UTvj7o0iqcw+iqu0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=sNcK4h79ZQ68IJplnHp3vke2sunsJqcNWKmuL1A5b/+obRAanjWPAoQK825voSrtqP
	LczrUVaCUiPz9cCdp2KcxShTMnB2TP/HdsDSjgXCo6uMUdYDlVJvf+VmoiI+Kj2tYQmf
	Mqh/RinV0NWOJ0fXP3ri7hWhIVMo+/F4YPobY=
Received: by 10.223.93.198 with SMTP id w6mr2192914fam.135.1289072831128;
	Sat, 06 Nov 2010 12:47:11 -0700 (PDT)
Received: from localhost.localdomain ([46.128.240.207])
	by mx.google.com with ESMTPS id b15sm1290820fah.28.2010.11.06.12.47.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 06 Nov 2010 12:47:10 -0700 (PDT)
From: Maksym Parkachov <lazy.gopher@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Nov 2010 20:46:57 +0100
Message-Id: <1289072817-13412-1-git-send-email-lazy.gopher@gmail.com>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: lazy.gopher@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] mcpp: added new recipe for version 2.7.2
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
X-List-Received-Date: Sat, 06 Nov 2010 19:48:06 -0000

* created .inc file for both target and native version
* added version 2.7.2

Signed-off-by: Maksym Parkachov <lazy.gopher@gmail.com>
---
 recipes/mcpp/mcpp.inc      |   11 +++++++++++
 recipes/mcpp/mcpp_2.7.2.bb |    5 +++++
 2 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 recipes/mcpp/mcpp.inc
 create mode 100644 recipes/mcpp/mcpp_2.7.2.bb

diff --git a/recipes/mcpp/mcpp.inc b/recipes/mcpp/mcpp.inc
new file mode 100644
index 0000000..9c56a7c
--- /dev/null
+++ b/recipes/mcpp/mcpp.inc
@@ -0,0 +1,11 @@
+DESCRIPTION = "MCPP is a portable C/C++ preprocessor"
+HOMEPAGE = "http://mcpp.sourceforge.net/"
+LICENSE = "BSD"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+
+inherit autotools lib_package
+
+EXTRA_OECONF = " --enable-mcpplib "
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/mcpp/mcpp_2.7.2.bb b/recipes/mcpp/mcpp_2.7.2.bb
new file mode 100644
index 0000000..55418bf
--- /dev/null
+++ b/recipes/mcpp/mcpp_2.7.2.bb
@@ -0,0 +1,5 @@
+require ${BPN}.inc
+
+SRC_URI[md5sum] = "512de48c87ab023a69250edc7a0c7b05"
+SRC_URI[sha256sum] = "3b9b4421888519876c4fc68ade324a3bbd81ceeb7092ecdbbc2055099fcb8864"
+
-- 
1.7.2.3




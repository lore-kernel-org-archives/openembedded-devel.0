Received: from out3.smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjensen@gmx.de>) id 1PVQ4K-0006CZ-21
	for Openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 15:53:32 +0100
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 4A721997;
	Wed, 22 Dec 2010 09:53:26 -0500 (EST)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Wed, 22 Dec 2010 09:53:26 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	s=smtpout; bh=wyfMCw033NMx4bVSlFJQ8XdXwlI=;
	b=q8WW6Yhxv+tUcgQgLfquJAkTAoiNOzzzhxtZdRwjIzH2r7DocCOtOoDx3L1jHW5C/CSkCa/k95OLcHqA8HeFymZXkZZ/aNZiZcj5Db5f13D4jdezI/3tcmb5gCu++Y4Y1VR0lu2+cl48uOv7OdvQpiGchaovDQYHJR+INENsVK8=
X-Sasl-enc: OpIx6czs6WubXNz/oNNk2C8CNBj5Rwwm9RiFGw5nTodg 1293029605
Received: from vitus.devnet.local (unknown [145.253.169.210])
	by mail.messagingengine.com (Postfix) with ESMTPA id BDE00402C6F;
	Wed, 22 Dec 2010 09:53:25 -0500 (EST)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Wed, 22 Dec 2010 15:52:41 +0100
Message-Id: <1293029561-32081-1-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <alpine.LNX.2.00.1012221538090.11293@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1012221538090.11293@asterix.crazy-teaparty.dyndns.org>
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: [PATCH] monit: enable include from /etc/monit.d
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
X-List-Received-Date: Wed, 22 Dec 2010 14:53:32 -0000

---
 .../enable-include-from-etc-monit.d.patch          |   10 ++++++++++
 recipes/monit/monit_4.10.1.bb                      |    3 ++-
 2 files changed, 12 insertions(+), 1 deletions(-)
 create mode 100644 recipes/monit/monit-4.10.1/enable-include-from-etc-monit.d.patch

diff --git a/recipes/monit/monit-4.10.1/enable-include-from-etc-monit.d.patch b/recipes/monit/monit-4.10.1/enable-include-from-etc-monit.d.patch
new file mode 100644
index 0000000..3370921
--- /dev/null
+++ b/recipes/monit/monit-4.10.1/enable-include-from-etc-monit.d.patch
@@ -0,0 +1,10 @@
+--- a/monitrc
++++ b/monitrc
+@@ -212,6 +212,6 @@
+ ## It is possible to include additional configuration parts from other files or
+ ## directories.
+ #
+-#  include /etc/monit.d/*
++include /etc/monit.d/*
+ #
+ #
diff --git a/recipes/monit/monit_4.10.1.bb b/recipes/monit/monit_4.10.1.bb
index 4bdeeb8..ebdeb8e 100644
--- a/recipes/monit/monit_4.10.1.bb
+++ b/recipes/monit/monit_4.10.1.bb
@@ -1,9 +1,10 @@
 LICENSE = "GPL"
 DEPENDS = "openssl"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.tildeslash.com/monit/dist/monit-${PV}.tar.gz\
 	file://no-strip-in-makefile.patch \
+	file://enable-include-from-etc-monit.d.patch \
 	file://init"
 
 INITSCRIPT_NAME = "monit"
-- 
1.7.2.3




Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RaPwl-00055q-5o
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 11:50:55 +0100
Received: by yenm12 with SMTP id m12so4873551yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 02:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=UVB9oinMRFLFtx6F9lwzasufpUkGir+/feF+UwYGGm0=;
	b=CZbvH1sLsiXPRLdxZNl0punFjEx1jiNhKOs33h8YlU8r4v5n3aW5S1+yUHJPMvNhz5
	nYfJlkB8nN9bpDnnaQR694ymoBG710koGLQtAGVKT3HQs8ydjzb0575VZ4AmWSyVer1i
	vdDmOnxO3PTgC0mzNAnd6YOFVmQdGw0oONRCU=
Received: by 10.236.178.9 with SMTP id e9mr2585877yhm.77.1323773039219;
	Tue, 13 Dec 2011 02:43:59 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 37sm33437204anu.21.2011.12.13.02.43.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 02:43:58 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Dec 2011 10:43:43 +0000
Message-Id: <9980cb40bdc1c359bf464402bfb940396a67190a.1323772987.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323772986.git.otavio@ossystems.com.br>
References: <cover.1323772986.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323772986.git.otavio@ossystems.com.br>
References: <cover.1323772986.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/4] systemd-systemctl-native: add support to recursive services
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
X-List-Received-Date: Tue, 13 Dec 2011 10:50:57 -0000

Some services can reference others for installation thought the Also
key; systemctl now handles it calling itself recursively for each
service.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../systemd/systemd-systemctl-native.bb            |    2 ++
 .../systemd/systemd-systemctl-native/systemctl     |    8 ++++++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb b/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
index 3ee757e..dcd67ee 100644
--- a/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
@@ -3,6 +3,8 @@ DESCRIPTION = "Wrapper to enable of systemd services"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
+PR = "r1"
+
 inherit native
 
 SRC_URI = "file://systemctl"
diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
index 1fc77fd..54c1a18 100755
--- a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
+++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
@@ -49,3 +49,11 @@ for r in $wanted_by; do
 	ln -s $service_file $ROOT/etc/systemd/system/$r.wants
 	echo "Enabled $service for $wanted_by."
 done
+
+# call us for the other required scripts
+also=$(grep Also $ROOT/$service_file \
+           | sed 's,Also=,,g' \
+           | tr ',' '\n')
+for a in $also; do
+	$0 --root=$ROOT enable $a
+done
-- 
1.7.2.5




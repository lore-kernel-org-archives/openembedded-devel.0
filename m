Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QbZX2-0008Cj-Iw
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 16:44:53 +0200
Received: by gwb11 with SMTP id 11so102311gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 07:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=+Rrg5FKM8OS7lQlwu7wrCo09vMpBb+TXrxqx9OjXD9A=;
	b=E53TKgW3aepPX3Rkaf4/HmB1tm+7BluMT0We5nVmah0zpZywmYmGgx1X6oSl2NzzA0
	pqceCutpA87LTRL+rIuxD53nOCdLCOvkrLJSYxj30EAHaZ19bSv7T/nXJdEbbUkrJu9w
	Y0iGXB7v5Eoh1npWd3kH4VvrtaeVxbDwZ9h+s=
Received: by 10.150.11.17 with SMTP id 17mr8174490ybk.82.1309272070730;
	Tue, 28 Jun 2011 07:41:10 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id g7sm70817yba.11.2011.06.28.07.41.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 07:41:09 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jun 2011 14:40:48 +0000
Message-Id: <b4ab2620640d15cd71254f3d986c9c33ec118268.1309272010.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1309272010.git.otavio@ossystems.com.br>
References: <cover.1309272010.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1309272010.git.otavio@ossystems.com.br>
References: <cover.1309272010.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/2] systemd: set all packages PACKAGE_ARCH to MACHINE_ARCH
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
X-List-Received-Date: Tue, 28 Jun 2011 14:44:53 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index dff299e..96875af 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -67,7 +67,7 @@ FILES_${PN}-gui = "${bindir}/systemadm"
 
 # This is a machine specific file
 FILES_${PN}-serialgetty = "${base_libdir}/systemd/system/serial-getty@.service ${sysconfdir}/systemd/system/getty.target.wants/getty@${@get_console(bb, d)}.service"
-PACKAGE_ARCH_${PN}-serialgetty = "${MACHINE_ARCH}"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 FILES_${PN} = " ${base_bindir}/* \
                 ${datadir}/dbus-1/services \
-- 
1.7.2.5




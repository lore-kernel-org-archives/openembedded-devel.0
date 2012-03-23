Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB4J0-0002jU-WA
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 14:13:23 +0100
Received: by wibhm17 with SMTP id hm17so1682057wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2012 06:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2XT/yygpFOBNL+6efPvOxCiwzy/Ak7KcxialhZKSiV8=;
	b=BZfG2CwLIqvwUuKl6+f5GaqmNfWbP+s6BhWgoV6Q9r7lBNY0l8z5CPQptDBJIvXkd8
	dwuC1KIj3Khs8OFH0nREzj4D1UeYumuIZ1eZ8CTChHJRtaQqVuzfZMuuYvsqHWnZ0wpI
	4n3aClNdEN97QzgAX1gaTT+icrucbrR5Gr/TQTBIXQJTViwsS7yjW2MDlTITIWieFai5
	D/M+c8DXmogGFnf1QqNVgilnWa5z8NRqhoevrjsrtUQ6xLgUTlgrRIaa+hTpd3dm0lS8
	wi0l4VV0UXCZ6G4cVbuXxnO1Q1uRML6RCRNUmYOf54FtyO++P/Q0TGGyHTzS/N7w7vWa
	LIHg==
Received: by 10.180.95.1 with SMTP id dg1mr6363621wib.21.1332507866180;
	Fri, 23 Mar 2012 06:04:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gd4sm10250059wib.6.2012.03.23.06.04.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 06:04:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Mar 2012 14:04:11 +0100
Message-Id: <0683eac11a18f65c19f75ead09b16106aab9a911.1332507730.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <3fca50b933c63bab6cff938db607bcecde86fd3d.1332507730.git.Martin.Jansa@gmail.com>
References: <3fca50b933c63bab6cff938db607bcecde86fd3d.1332507730.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332507730.git.Martin.Jansa@gmail.com>
References: <cover.1332507730.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/5] kernel.bbclass: fix extra + in kernelrelease
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
X-List-Received-Date: Fri, 23 Mar 2012 13:13:23 -0000

* see http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014308.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 02d0ca5..d87b177 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -209,6 +209,12 @@ sysroot_stage_all_append() {
 }
 
 kernel_do_configure() {
+	# fixes extra + in /lib/modules/2.6.37+
+	# $ scripts/setlocalversion . => +
+	# $ make kernelversion => 2.6.37
+	# $ make kernelrelease => 2.6.37+
+	touch ${B}/.scmversion
+
 	# Copy defconfig to .config if .config does not exist. This allows
 	# recipes to manage the .config themselves in do_configure_prepend().
 	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
-- 
1.7.8.5




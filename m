Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Ubfsx-0007gt-4A
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 May 2013 01:41:03 +0200
Received: by mail-ea0-f177.google.com with SMTP id o10so3199975eaj.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2013 16:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Np0JBE8eMQVbNw696k1PM/9jP+zBzVEaUdRnYiKjcUk=;
	b=xCVNfNoor+865w3taBSF33EWbSX4JZ7xg9tNYdlC5IGp0ZjIYN0GkSySPuy4sXCaYe
	/w5s7Xwg/aXkHgxtYl8B6kqSQdlamPDIBD5xcBRilGZ9tYGx3H9d5SaFQdud5ffE2e/e
	P4zuusexoXa0ksDeaNmPSYiVO0OV5nmWT2Hizx7bm05J1uNMK3mk6yR6BKK06M+QxYwY
	iA+M/T38M2IxhhFcELmhoY9oIz16dT3PJ6yp+C39PA2PD86YTt2sOLh/3wmt3oVQ2OiZ
	ktsmGrqEQwz3yGQV/aqsyxy03KBDlcLGwMXttB1lR5bGHDCViSvb7bcBocpBf97vf+zT
	WODQ==
X-Received: by 10.14.127.5 with SMTP id c5mr71847847eei.45.1368400966841;
	Sun, 12 May 2013 16:22:46 -0700 (PDT)
Received: from mizar.localdomain
	(host170-249-dynamic.17-79-r.retail.telecomitalia.it.
	[79.17.249.170]) by mx.google.com with ESMTPSA id
	w43sm19120109eeg.14.2013.05.12.16.22.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 12 May 2013 16:22:46 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 May 2013 01:22:21 +0200
Message-Id: <7df7c9566b16d57fdf1fed3f7b9f679ed43d31fb.1368400320.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1368400320.git.andrea.adami@gmail.com>
References: <cover.1368400320.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1368400320.git.andrea.adami@gmail.com>
References: <cover.1368400320.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 2/4] kexecboot(-klibc): remove runtime dependency on kexec(-klibc)
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
X-List-Received-Date: Sun, 12 May 2013 23:41:07 -0000

* the binary itself can run without kexec (in host-debug mode) so
* specify in the cpio IMAGE which packages are needed at runtime

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb | 1 -
 meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb       | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
index f9aee7c..a158eb4 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
@@ -1,4 +1,3 @@
-RDEPENDS_${PN} = "kexec-klibc"
 PV = "0.5.9"
 PR = "r10+gitr${SRCREV}"
 
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index fe1ef36..d664261 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -1,4 +1,3 @@
-RDEPENDS_${PN} = "kexec"
 PV = "0.5.9"
 PR = "r10+gitr${SRCREV}"
 
-- 
1.8.1.5




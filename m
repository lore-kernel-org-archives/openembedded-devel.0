Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PyUVF-0004jM-Mg
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 20:29:30 +0100
Received: by ywg8 with SMTP id 8so1613730ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 11:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=zuVvY7VNXnhgw0OmSbECL0WqrZNBqrEVxrrOKUtNxBc=;
	b=R7lc4yzUAHVEwQpFurd34hfp3VXD5mOofkWMpI5NH+Ucin28i+2glqLtKvFgwS7AVo
	aVQYCDfjROreiYya60TxmiVH9iOdexmOmoL7XG3ggI6hMx0O1c4kiZda8QhjNONOMY5Z
	vQ4LSMqYGD5udE+J3XitNaE0pJM6m6vl0jOXE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=OcpGrHzkhc3QF17oFMVONy0qVzwcFICb72Fom9ZsTD3qvpX1k/OdNLHzy1G2XDzSO6
	Y8bdp+eofZ0xd3ZZTmYeIl0ymFdMRQG6BrDwSCh2y4kMIcyK46gJRR0fbFmTVG5d1hlI
	x3s9Tm2OWRHElYP4esm81vPz8UkZEpZnlbwHI=
Received: by 10.101.22.10 with SMTP id z10mr2201872ani.37.1299958070245;
	Sat, 12 Mar 2011 11:27:50 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c38sm4812832anc.38.2011.03.12.11.27.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2011 11:27:48 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Mar 2011 19:27:15 +0000
Message-Id: <1299958038-25216-9-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
References: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 08/11] linux (2.6.37): update to 2.6.37.3 stable patch
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
X-List-Received-Date: Sat, 12 Mar 2011 19:29:30 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/linux/linux_2.6.37.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/linux/linux_2.6.37.bb b/recipes/linux/linux_2.6.37.bb
index 7dca582..e3d6c4e 100644
--- a/recipes/linux/linux_2.6.37.bb
+++ b/recipes/linux/linux_2.6.37.bb
@@ -1,6 +1,6 @@
 require linux.inc
 
-PR = "r4"
+PR = "r5"
 
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE = "-1"
@@ -22,7 +22,7 @@ DEFAULT_PREFERENCE_ben-nanonote = "1"
 # DEFAULT_PREFERENCE_om-gta01 = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.2.bz2;apply=yes;name=stablepatch \
+           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.3.bz2;apply=yes;name=stablepatch \
            file://defconfig "
 
 SRC_URI_append_ben-nanonote = " \
@@ -42,5 +42,5 @@ SRC_URI_append_om-gta01 = " \
 
 SRC_URI[kernel.md5sum] = "c8ee37b4fdccdb651e0603d35350b434"
 SRC_URI[kernel.sha256sum] = "edbf091805414739cf57a3bbfeba9e87f5e74f97e38f04d12060e9e0c71e383a"
-SRC_URI[stablepatch.md5sum] = "bb5798f2a2a5af13219d1a250c4dad11"
-SRC_URI[stablepatch.sha256sum] = "3d65f2fb5f0018e8dafda4abe68d947d2ab5e21c386062cb0d6e011244a16aef"
+SRC_URI[stablepatch.md5sum] = "c0a38dd3b5bad43d5f5d07ed0fcf3692"
+SRC_URI[stablepatch.sha256sum] = "af6ccb6c85db09e78a85657b1013b2aa1399ef252ce552aafcf25684e6e5ad98"
-- 
1.7.2.3




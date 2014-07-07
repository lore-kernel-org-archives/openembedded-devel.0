Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E353965CE6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jul 2014 10:03:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s67A3e7p002443
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 Jul 2014 03:03:40 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 7 Jul 2014 03:03:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 7 Jul 2014 03:03:37 -0700
Message-ID: <1404727418-20199-3-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404727418-20199-1-git-send-email-liezhi.yang@windriver.com>
References: <1404727418-20199-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-initramfs] [PATCH 2/3] meta-initramfs: fix no newline at end of file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jul 2014 10:03:40 -0000
Content-Type: text/plain

Add a '\n' to the last line of the file to fix:

No newline at end of file

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../kexec-tools-klibc-2.0.2/x86_basename.patch     |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_basename.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_basename.patch
index 200fb1d..77a1c01 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_basename.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_basename.patch
@@ -11,4 +11,4 @@
 +				"entry: %s\n", strrchr(sysfs_name,'/') + 1);
  		return -1;
  	}
- 
\ No newline at end of file
+ 
-- 
1.7.9.5



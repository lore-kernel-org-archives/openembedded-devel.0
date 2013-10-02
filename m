Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id BFEA76CBAA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Oct 2013 22:56:45 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so703803eaj.39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Oct 2013 15:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Z21AObNHtScXD6bG/LqMtC/ysuCa2G5aLywud8yVQ2c=;
	b=F2rZC0BhByQmDZH+275BJbFFmD1hePZPx5MrcLvRZMYxocA0UWQlrAv5MXGzbGc3y5
	uOA56m0xYsunjDEug/sRMrJ/ibBeQvFp26v7ZoFVyl+r/FcVqqeiv/aERNODtLR0hiE6
	gXRiLTyCQFiIF/hsAeU/yvi7C2pJMSqPLWeCtud6fkoE2JRnC9nRhdjByT4RX8cZl77d
	SBNMPeLrC5WyGbI1JVukRzeEIFZcmQxpTF/uK3gaBs2l/+iC097B2FosGPjA8uWmQYvE
	tuvBNo+K+5O/S1pu1roivgqe90C+iaURxW6stpCrQ3vnABjr7IbQXA1wZNP7dqhUXZiC
	w6Jw==
X-Received: by 10.15.53.70 with SMTP id q46mr7360262eew.48.1380754606567;
	Wed, 02 Oct 2013 15:56:46 -0700 (PDT)
Received: from mizar.localdomain
	(host40-228-dynamic.1-79-r.retail.telecomitalia.it. [79.1.228.40])
	by mx.google.com with ESMTPSA id f49sm8572641eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 02 Oct 2013 15:56:46 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Oct 2013 00:56:19 +0200
Message-Id: <1380754580-10877-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] linux-yocto: re-enable CONFIG_JFFS2_LZO
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
X-List-Received-Date: Wed, 02 Oct 2013 22:56:46 -0000

Override the settings in
base/base.cfg:# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-3.10/zaurus-non-hardware.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-kernel/linux/linux-yocto-3.10/zaurus-non-hardware.cfg b/recipes-kernel/linux/linux-yocto-3.10/zaurus-non-hardware.cfg
index dd7de2c..0dd4da9 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/zaurus-non-hardware.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.10/zaurus-non-hardware.cfg
@@ -326,6 +326,7 @@ CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_TMPFS_XATTR=y
 CONFIG_MISC_FILESYSTEMS=y
 CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
 CONFIG_JFFS2_FS_DEBUG=0
 CONFIG_JFFS2_FS_WRITEBUFFER=y
 CONFIG_JFFS2_SUMMARY=y
-- 
1.8.1.5



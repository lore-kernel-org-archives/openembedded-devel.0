Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Tx3M7-0003y5-CG
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jan 2013 23:27:32 +0100
Received: by mail-ee0-f52.google.com with SMTP id b15so2417973eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2013 14:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=o1bnOzzytEvJol/Yjvin38h9gQ4xki4auVB/qtvNCFk=;
	b=OgyBFf3LRmitg1XzJ/oU4wMg6NC7q3FR9RWN0VddwnFmTRdDwZnrPDNcaOQhwDTIk+
	2MS4Y1l1Xsh6j/81yh4WIGv1IpdFFgSxRQ4vy8qMEiNk1PwomG9IgnMWmx9VakxLOmGr
	4tSifBVFx45RfI9dBsphmXkODs0pmw19KuG4R7Eq56WDscUT6J1IsKdermKIuYTJByxG
	SAA7pOj1fopwdCXPelEO1lPuFjSc8d0k8opxaFu40F4zjvEFPOlh4FzlwLcSgHESbpKV
	RFZwF+seNeB6UInil9xijemVsPOG7e1VpjQt7YRaEcqzoax8xX+mTxoap8WU3xr3VrG5
	WK9g==
X-Received: by 10.14.1.195 with SMTP id 43mr53277532eed.31.1358719903899;
	Sun, 20 Jan 2013 14:11:43 -0800 (PST)
Received: from mizar.localdomain
	(host170-248-dynamic.5-87-r.retail.telecomitalia.it. [87.5.248.170])
	by mx.google.com with ESMTPS id w44sm19450405eep.6.2013.01.20.14.11.42
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 14:11:43 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jan 2013 23:11:27 +0100
Message-Id: <a2fa6bd72820ccfaa483372bc9828489d4b47468.1358719629.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1358719629.git.andrea.adami@gmail.com>
References: <cover.1358719629.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1358719629.git.andrea.adami@gmail.com>
References: <cover.1358719629.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 1/5] linux-yocto-3.2: remove yaffs2 references from poodle.cfg
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
X-List-Received-Date: Sun, 20 Jan 2013 22:27:43 -0000
X-List-Received-Date: Sun, 20 Jan 2013 22:27:43 -0000
X-List-Received-Date: Sun, 20 Jan 2013 22:27:43 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-3.2/poodle/poodle.cfg | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.2/poodle/poodle.cfg b/recipes-kernel/linux/linux-yocto-3.2/poodle/poodle.cfg
index 644ff69..e74f5a5 100644
--- a/recipes-kernel/linux/linux-yocto-3.2/poodle/poodle.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.2/poodle/poodle.cfg
@@ -2059,7 +2059,6 @@ CONFIG_MISC_FILESYSTEMS=y
 # CONFIG_BEFS_FS is not set
 # CONFIG_BFS_FS is not set
 # CONFIG_EFS_FS is not set
-# CONFIG_YAFFS_FS is not set
 CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_FS_DEBUG=0
 CONFIG_JFFS2_FS_WRITEBUFFER=y
-- 
1.7.12.4




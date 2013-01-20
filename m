Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Tx4rp-0007V0-2P
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jan 2013 01:04:27 +0100
Received: by mail-ee0-f49.google.com with SMTP id d4so2555414eek.22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2013 15:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=0WRdIIMF9HbWCj0Nsw+VUzN7pnb8kotQzlcPEQJdsN4=;
	b=eTauWN5b42yxrbcWsJm/sCmRPsy8h/vuJTXSe5kW0qGEkSCIjs5tUCaZyis5lGZ+9I
	45wY/uhgwE1H/Wg6vbYrtIteK1L957Jn+UVYgboacTO6VG9fRmV/XfaM7vbsF/P+LvlT
	Opy8dkkesMEl0TV4RtHJUUy8xxywHMZjUA1uvy9CJ4QoTdBAUIds6F3FTuEztOFiiHWs
	AjXevGaiWyi/pgINqFup9Rp4zaXqzmFgJFtTrjbx0W60IVkLrVl9m9Jvjo4C2U58vYST
	14NWibosTRG98A9UFy0DNfdQ1Gq6T5CYxqTI1vWkOsp96T4uXMDRe0ViGzrIsrPA0Chs
	0unA==
X-Received: by 10.14.175.70 with SMTP id y46mr53564339eel.6.1358725713415;
	Sun, 20 Jan 2013 15:48:33 -0800 (PST)
Received: from mizar.localdomain
	(host170-248-dynamic.5-87-r.retail.telecomitalia.it. [87.5.248.170])
	by mx.google.com with ESMTPS id d3sm19746185eeo.13.2013.01.20.15.48.31
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 15:48:32 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jan 2013 00:48:22 +0100
Message-Id: <1358725702-18634-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [meta-handheld][PATCH] linux-yocto_3.4: add general MTD options to zaurus-hardware.cfg
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
X-List-Received-Date: Mon, 21 Jan 2013 00:04:27 -0000

* options were removed from zaurus-pxa-common.cfg because are
* shared by collie as well

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg b/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
index ae3627a..b01ec8f 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
@@ -60,6 +60,16 @@ CONFIG_MTD_BLKDEVS=y
 CONFIG_MTD_BLOCK=y
 
 #
+# RAM/ROM/Flash chip drivers
+#
+CONFIG_MTD_MAP_BANK_WIDTH_1=y
+CONFIG_MTD_MAP_BANK_WIDTH_2=y
+CONFIG_MTD_MAP_BANK_WIDTH_4=y
+CONFIG_MTD_CFI_I1=y
+CONFIG_MTD_CFI_I2=y
+CONFIG_MTD_ROM=y
+
+#
 # Mapping drivers for chip access
 #
 CONFIG_MTD_COMPLEX_MAPPINGS=y
-- 
1.7.12.4




Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R1Inb-0004qz-Lz
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 16:08:19 +0200
Received: by mail-bw0-f47.google.com with SMTP id zu17so214309bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 07:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=qTnUwz3kjkDRDV1D013Azj3GYI+lxA6wwYUwG29uMVM=;
	b=qfo4EQ8GN4LCQRcZUeYUx24rhfmQnTtrBVi3fMtSLmvz+IsMVgbHKcwbV0keoso3OJ
	TzMo/d/NKFEAJZN1mnXC8uP7dwdQb+9XDY3iyJtcJtRc9/TfRj+v3B33i8raVAw3OcBm
	espa0K7GmAR10R4LPRAmEfxHkRjrdbao2ylsk=
Received: by 10.204.129.217 with SMTP id p25mr3423341bks.282.1315404199576;
	Wed, 07 Sep 2011 07:03:19 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id l11sm440069bkb.1.2011.09.07.07.03.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 07:03:18 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2011 18:02:58 +0400
Message-Id: <1315404187-18176-4-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
References: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-handheld 03/12] linux.inc: drop at91sam9263ek cmdline setting
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
X-List-Received-Date: Wed, 07 Sep 2011 14:08:19 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-kernel/linux/linux.inc |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index 09dee86..a37308d 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -14,13 +14,6 @@ ARM_KEEP_OABI ?= "1"
 # Quirk for udev greater or equal 141
 UDEV_GE_141 ?= "0"
 
-# Specify the commandline for your device
-
-# Boot from mmc
-CMDLINE_at91sam9263ek = "mem=64M console=ttyS0,115200 root=/dev/mmcblk0p1 rootfstype=ext2 rootdelay=5"
-# Boot from nfs
-#CMDLINE_at91sam9263ek = "mem=64M console=ttyS0,115200 root=301 root=/dev/nfs nfsroot=172.20.3.1:/data/at91 ip=172.20.0.5:::255.255.0.0"
-
 # Set the verbosity of kernel messages during runtime
 # You can define CMDLINE_DEBUG in your local.conf or distro.conf to override this behaviour
 CMDLINE_DEBUG ?= '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "loglevel=3", d)}'
-- 
1.7.2.5




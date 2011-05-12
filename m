Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1QKNLT-0003Ov-EL
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 06:17:51 +0200
Received: by gxk3 with SMTP id 3so445933gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2011 21:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=5zX3/I7mkjyd8cxFW/RV1GBimskYjyrpR/84kI+Gk7s=;
	b=dGSITeJTliOYYmqccwbGu6uEHLOedwheDX8jZDssb39YvqccSUxsX7ps0/Lb0k/eW6
	Si34cIAaD84P6GKGjlLdKQxOcNbw7OdtaaELQ1Wi2uFOigrU4woSeVaOnh8eq31Cz5AK
	p8hp6CBOITtc93Fh5oVs4RFgNULrzanJD/LEE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qGpt5CXEk+w4TNM63XmcRPcpnvqqHNNCL6boBnEPlT6aUrltTxhWNTc4VL14IgYzQc
	KmqLyz++TKPDdW5kTGyTVzdru/k3eeLJe0FlYeuwGUFPOjYzuWilq3jug/Ki1dN0KDXo
	b1ResSEbklbHg52KpnYS2xh+XmemnqNSi+yD8=
Received: by 10.91.80.15 with SMTP id h15mr139625agl.126.1305173703607;
	Wed, 11 May 2011 21:15:03 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id s36sm525916ano.1.2011.05.11.21.15.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2011 21:15:03 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 May 2011 09:44:51 +0530
Message-Id: <1305173692-19917-2-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1305173692-19917-1-git-send-email-heroor@gmail.com>
References: <1305173692-19917-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCHv2 2/3] ti816x machine: Update for latest kernel version
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
X-List-Received-Date: Thu, 12 May 2011 04:17:51 -0000

From: Siddharth Heroor <heroor@ti.com>

* In 2.6.37 the console is tied to ttyO2.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 conf/machine/include/ti816x.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/ti816x.inc b/conf/machine/include/ti816x.inc
index 9db1df8..ef56264 100644
--- a/conf/machine/include/ti816x.inc
+++ b/conf/machine/include/ti816x.inc
@@ -22,5 +22,5 @@ EXTRA_IMAGEDEPENDS += "u-boot"
 # Ship all kernel modules
 IMAGE_FSTYPES += "jffs2 tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lqn -e 128"
-SERIAL_CONSOLE = "115200 ttyS2"
+SERIAL_CONSOLE = "115200 ttyO2"
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 ethernet"
-- 
1.7.0.4




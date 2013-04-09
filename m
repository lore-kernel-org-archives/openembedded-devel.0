Received: from mail-yh0-f49.google.com ([209.85.213.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPeKF-00087K-S5
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 21:35:28 +0200
Received: by mail-yh0-f49.google.com with SMTP id q14so579893yhf.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2013 12:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=NTrK1NhokOP74aZIQ0eHt3h8dx8KI0DXFoThlmRkSWY=;
	b=hHpB/yQrrJUJUPErETqAHLSQ7FknSZyepIy6hpDqbe/ocz9EUIaxZbiwqDCCkK98lo
	L5VSOXi98hQ8fG8G9oiCSGu78FLTGh7Y1XGo+aW6OpjL9Sd0ZBUQKALB5J4wp5kLXF/m
	ZFnuEtrpGbcvGIw2qtvfSviHuUwRV/jLBRCuoBYKggUmPTZW0y4zCqpR0fqolc5AHhkH
	TR/hurQoIIG9lBWEfmL5g2yYqiqlS/yM7ebGm9oAYxO3h1/u7kxPMJ2ZJuORbRBOquCn
	fnkktXq4ipa9A1/4+kIOTe2X76VI0w75PTeZ2+v/kPL8JWwzE3Q/ZoqXBfwlhTui8poV
	DTpQ==
X-Received: by 10.236.133.194 with SMTP id q42mr16126018yhi.174.1365535087069; 
	Tue, 09 Apr 2013 12:18:07 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id t9sm45013110yhh.0.2013.04.09.12.18.05
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 12:18:06 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue,  9 Apr 2013 16:17:39 -0300
Message-Id: <1365535059-27254-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1365535059-27254-1-git-send-email-otavio@ossystems.com.br>
References: <1365535059-27254-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-fsl-arm][PATCH v2 4/4] imx6slevk: Use U-Boot mainline
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
X-List-Received-Date: Tue, 09 Apr 2013 19:35:29 -0000

Change-Id: I8e5b3d6b31267f6cfcfe11be9a7aa4d6a5fdfec0
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/machine/imx6slevk.conf       | 2 --
 conf/machine/include/imx-base.inc | 1 -
 2 files changed, 3 deletions(-)

diff --git a/conf/machine/imx6slevk.conf b/conf/machine/imx6slevk.conf
index 786822a..454c34f 100644
--- a/conf/machine/imx6slevk.conf
+++ b/conf/machine/imx6slevk.conf
@@ -8,8 +8,6 @@ include conf/machine/include/tune-cortexa9.inc
 SOC_FAMILY = "mx6sl:mx6"
 
 UBOOT_MACHINE = "mx6slevk_config"
-UBOOT_SUFFIX = "bin"
-UBOOT_PADDING = "2"
 
 SERIAL_CONSOLE = "115200 ttymxc0"
 
diff --git a/conf/machine/include/imx-base.inc b/conf/machine/include/imx-base.inc
index ad3df13..ffdb871 100644
--- a/conf/machine/include/imx-base.inc
+++ b/conf/machine/include/imx-base.inc
@@ -72,7 +72,6 @@ PREFERRED_PROVIDER_virtual/libgles1_mx6 ?= "gpu-viv-bin-mx6q"
 PREFERRED_PROVIDER_virtual/libgles2_mx6 ?= "gpu-viv-bin-mx6q"
 
 PREFERRED_PROVIDER_virtual/kernel_mx3 = "linux-fslc"
-PREFERRED_PROVIDER_u-boot_mx6sl = "u-boot-imx"
 PREFERRED_PROVIDER_u-boot_mx6dl = "u-boot-imx"
 
 EXTRA_IMAGEDEPENDS = "u-boot"
-- 
1.8.1




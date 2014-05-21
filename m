Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f41.google.com (unknown [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0327665F1E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 21:30:57 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so1985936eei.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 14:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Wc4+3uqTPUHDECyqhrmDJ+LpQI6W0PcvUNsBUvhKbqg=;
	b=rlznxjMZim5NvmorcbVoL1jTGbN6GFXPPlQ3EyaVpB6i0FGm9dB6SGSECmdeXFfJ50
	FleiRfz72j1VhuSCtb03L6M2xxSY13vt/oOEiV4jSb0WBfmP29LYZ4W7GIT4vIxxc/XO
	6Ebb5KgqTpi64MxiypE7BbHz0Ep22tQ+2djxSFiHgMDsQtgnNo0Ujh2e5yd+PHcswP7A
	g5dQLVv5cq2WHB1+UlAhHHLV/y/mcBvX+fQsDizZNgriu0wJl61nBjZCdewWxkkQhzCZ
	bTjkbvIiK4lpAb3Cy0DmD8T2mCAjmzusXLWSuvcidAG4WcMIa1X0M4vYBdH/Z8UNAKI1
	Y5MA==
X-Received: by 10.15.51.193 with SMTP id n41mr7391870eew.80.1400707858538;
	Wed, 21 May 2014 14:30:58 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host253-196-dynamic.45-79-r.retail.telecomitalia.it.
	[79.45.196.253])
	by mx.google.com with ESMTPSA id o5sm14784166eeg.8.2014.05.21.14.30.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 May 2014 14:30:57 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 May 2014 23:26:21 +0200
Message-Id: <1400707582-7786-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1400707582-7786-1-git-send-email-andrea.adami@gmail.com>
References: <1400707582-7786-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/3] h1940: prefer linux-yocto kernel
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
X-List-Received-Date: Wed, 21 May 2014 21:30:58 -0000

h1940 was using linux-yocto-dev, waiting for inclusion in linux-yocto_3.14.
Support is now present so we can switch back to the standard kernel provider.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/h1940.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/h1940.conf b/conf/machine/h1940.conf
index 5945363..7a6b5a2 100644
--- a/conf/machine/h1940.conf
+++ b/conf/machine/h1940.conf
@@ -9,7 +9,7 @@
 require conf/machine/include/tune-arm920t.inc
 
 # Set preferred providers
-PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
+PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
 
 KERNEL_IMAGETYPE = "uImage"
 UBOOT_LOADADDRESS = "0x30108000"
-- 
1.9.1



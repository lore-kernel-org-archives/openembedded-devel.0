Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id B9E156D51A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 21:27:47 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id c50so292292eek.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 14:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+SpcWX9P31GNd5k2N4GtURUfU/i8gxDxyymRsIsn+Go=;
	b=x6oxg/kbRDsLgOOg7aoQdh0Z66dAtmJ+YaW25SrKRSCtCGXRLoOgTrDPncAMomz2Hx
	muTUb8V+yDhSQc+8mq+jzjrCmS6Mcc74hV9kuOxsd43yMAIRXjvN3aflp+eW2CpmC2tJ
	POknvc9FFK4ljmcU/xu3D7jsh73u4wdaRsgpnpVRrR8zMahJBAWCb3wLPXZIP6R9JSoU
	d/d7TxyoAR6/+7F1jC9uAKPKWCd44P/MthUSRpNwa8FBj/G3WW3U2tkwFAnhKgiHyu8K
	LFkmN2EXprhdHVbm6JAFE9W4MBTnU+MgnkDIZb5eEril2ULTPTg6K/TWPB9MGf6FlS/K
	+Now==
X-Received: by 10.14.210.8 with SMTP id t8mr7067324eeo.39.1383168469069;
	Wed, 30 Oct 2013 14:27:49 -0700 (PDT)
Received: from mizar.localdomain
	(host241-23-dynamic.14-87-r.retail.telecomitalia.it. [87.14.23.241])
	by mx.google.com with ESMTPSA id b42sm58092eem.9.2013.10.30.14.27.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Oct 2013 14:27:48 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Oct 2013 22:27:43 +0100
Message-Id: <1383168463-19887-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] collie.conf: provide a custom EXTRA_IMAGECMD_sum.jffs2
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
X-List-Received-Date: Wed, 30 Oct 2013 21:27:49 -0000

Match the changes to image_types.bbclass in oe-core.

REMARKS:

Q: the sum.jffs2 image is really smaller than the .jffs2
A: If you run sumtool with --pad parameter then it pads the OUTPUT file with
   0xFF to the end of the last used eraseblock.
   If you have empty eraseblocks at the end of your INPUT image then the sumtool
   skips those.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/collie.conf | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/conf/machine/collie.conf b/conf/machine/collie.conf
index bec8842..c98d2f4 100644
--- a/conf/machine/collie.conf
+++ b/conf/machine/collie.conf
@@ -6,8 +6,10 @@ require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-strongarm1100.inc
 
 JFFS2_ERASEBLOCK = "0x20000"
-
+# For NOR flash we need the cleanmarkers so override the defaults
 EXTRA_IMAGECMD_jffs2 = "--pad=14680064 -l -e ${JFFS2_ERASEBLOCK}"
+# sumtool does not accept the argument for --pad
+EXTRA_IMAGECMD_sum.jffs2 = "-p -l -e ${JFFS2_ERASEBLOCK}"
 
 # UBI: max collie (14.125 = 113 PEBs)
 # 14.125 x 1024 : 128 = 113 PEBs
-- 
1.8.1.5



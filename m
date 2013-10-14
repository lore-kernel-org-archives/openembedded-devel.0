Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id CDA546CE3F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 15:39:54 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so3481120eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 08:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2it6zg9alAF56fonxRozlBBW9DHwXkkCPEU2CXvMDwg=;
	b=KsAEokQ0enRIEZnWNIL+5tYt1HjMX09x2e7wWqyARSv5FXxy6iO08OtIVJAMcM2zOS
	Ke6Gp3xHIbiiwyzF0Z0aD0WEorfiaJc3Kk2f2tVrcO8MXaZmUQwRaTIoqqLGMu2M01JL
	z0D/++7dZ096u1t7fAXWTsJxbUb6Hh7NmmnLJW6kbad9rHD3uGCWv3z5r/Tlr0YkGu1e
	YndALTQwtC+2URpWIOEeuQdTlmn8IYbSPToXdZMpctNsPuIR29GMAp4KuDeNM5mv7Jxh
	jajYNecfzxuYaZ5v0+/D/+qcTOQYBiYm7pqhVSxvdZxh62yMpWeCZ1StAgtaci6EWy0k
	qaMQ==
X-Received: by 10.14.211.136 with SMTP id w8mr1432387eeo.80.1381765195681;
	Mon, 14 Oct 2013 08:39:55 -0700 (PDT)
Received: from mizar.localdomain ([95.237.174.211])
	by mx.google.com with ESMTPSA id
	n48sm155044259eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 08:39:55 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 17:39:52 +0200
Message-Id: <1381765192-3697-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] h3800.conf: fix MACHINE_FEATURES
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
X-List-Received-Date: Mon, 14 Oct 2013 15:39:55 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/h3800.conf | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/conf/machine/h3800.conf b/conf/machine/h3800.conf
index 0c3cf15..53f3940 100644
--- a/conf/machine/h3800.conf
+++ b/conf/machine/h3800.conf
@@ -2,7 +2,5 @@
 #@NAME: Compaq iPAQ 38xx
 #@DESCRIPTION: Machine configuration for the Compaq iPAQ 38xx devices
 
-#this machine will be primarily focussed on the 2.6 port
-MACHINE_FEATURES = "touchscreen apm alsa pcmcia bluetooth irda usbgadget screen vfat qvga"
-
 require conf/machine/h3600.conf
+MACHINE_FEATURES += "pcmcia bluetooth"
-- 
1.8.1.5



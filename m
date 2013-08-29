Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 938D66BEB9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 18:36:09 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id y13so814189pdi.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pc+XO0BT+DqVEE6GmUjGQ4pHLGElxpV9npz5v8CtX54=;
	b=gechRl+gct9/Awbrnfm6rGIwBOQAnAQy3RZTTzXnOtZ2aGO0YawQmnuAwbgTVvATHr
	V5XN7ffN9FHuEiS7TtUC1Ni3Y05dYC/f+RN8QPzBolhIRqFl27wNy9kccTZK9cioiQi9
	ZXlKmGUV1BsdgjhrLIGuO1YRQzgT0E8sKYWHWiys1W8Fq8gpCKoycbFvPBYJWrhAKvAz
	SJrIU85OaFYktio7ITLO2ObXPxeeTvXHzjBmWAPxGEYiax8I5EIfZT5RAYLG5u2S11ws
	ABFjZGud4Cx8PQvr6MHTQM6Wiw07MVd8MHK0IqC5gNMBZUWRefJeau/iZKEr/dMsIqmW
	NPFQ==
X-Received: by 10.66.234.131 with SMTP id ue3mr5953383pac.35.1377801370476;
	Thu, 29 Aug 2013 11:36:10 -0700 (PDT)
Received: from titan.du.ae ([94.205.106.26]) by mx.google.com with ESMTPSA id
	zi1sm39412487pbb.28.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 11:36:09 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 22:35:54 +0400
Message-Id: <1377801358-3942-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Cc: bruce.ashfield@windriver.com, Elvis Dowson <elvis.dowson@gmail.com>
Subject: [oe-core 1/5] qemu: Add cpio to the list of image filesystem types.
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
X-List-Received-Date: Thu, 29 Aug 2013 18:36:09 -0000

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 meta/conf/machine/include/qemu.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 545f8d1..d5c95ff 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -15,7 +15,7 @@ MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
 
 MACHINEOVERRIDES =. "qemuall:"
 
-IMAGE_FSTYPES += "tar.bz2 ext3"
+IMAGE_FSTYPES += "cpio tar.bz2 ext3"
 
 # Don't include kernels in standard images
 RDEPENDS_kernel-base = ""
-- 
1.7.10.4



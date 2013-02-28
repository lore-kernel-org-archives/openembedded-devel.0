Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UBDcN-00044D-Ak
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Mar 2013 01:14:39 +0100
Received: by mail-ee0-f52.google.com with SMTP id b15so1909894eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2013 15:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ybM0zr3vZ3j4ayezcJhnGfkVFB4+Rh6UC+xnCWcuC9s=;
	b=Z2NsV9qObSqTBvfermqN3qiRPq6Ma59DNjNBFXbZlQ5frJEMEOQaAjneRbdsCwmSI3
	Q8xkVlAezbay/tL3JrWetwGGuCU1x5OhN9Yt3HF6eY4YVXB0zZYH6VScyXoAkLUlL0V1
	+r5jFzZXbeqW4G+cBkrCu/2qJb8mMCL44jkJ8LbvS7/aXnCQ0zMuv+qHu6NssJG/QC2G
	Uf2okycmBSOVLHa6fFWweZ+WlmSI0ve05PhHBUpZjIKzGFEtFgfjT1oOlWY7jHxpmwoC
	9cn9v21IoYBR+6s+ASOeJ9p9oELWxx+OZLuHj5Hilp6RncSaYl4zPlgiRr9l6SBqfGbD
	rCkA==
X-Received: by 10.14.4.69 with SMTP id 45mr22024008eei.0.1362095888951;
	Thu, 28 Feb 2013 15:58:08 -0800 (PST)
Received: from mizar.localdomain
	(host223-35-dynamic.252-95-r.retail.telecomitalia.it.
	[95.252.35.223])
	by mx.google.com with ESMTPS id f47sm14308586eep.13.2013.02.28.15.58.07
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 15:58:08 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Mar 2013 00:57:52 +0100
Message-Id: <1362095872-4586-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <1362095872-4586-1-git-send-email-andrea.adami@gmail.com>
References: <1362095872-4586-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH] zaurus.inc: reflect packaging changes of mtd-utils
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
X-List-Received-Date: Fri, 01 Mar 2013 00:14:41 -0000

* and add the mtd tools for collie as well
* (mtd2 is atm not writeable, locked at boot)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 09d6066..a4fec21 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -100,8 +100,8 @@ MACHINE_FEATURES_append_akita = " usbhost"
 MACHINE_FEATURES_append_spitz = " usbhost"
 MACHINE_FEATURES_append_tosa  = " usbhost wifi "
 
-MACHINE_EXTRA_RDEPENDS = "zaurusd mtd-utils nandlogical"
-MACHINE_EXTRA_RDEPENDS_collie = "zaurusd"
+MACHINE_EXTRA_RDEPENDS = "zaurusd mtd-utils mtd-utils-jffs2 mtd-utils-ubifs nandlogical"
+MACHINE_EXTRA_RDEPENDS_collie = "zaurusd mtd-utils mtd-utils-jffs2 mtd-utils-ubifs"
 
 ##################################
 # Zaurus rootfs are booted by
-- 
1.7.12.4




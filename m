Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 193D4731A8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2016 11:30:52 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id b205so34469677wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2016 03:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=t3H5qOmxyMGYKO8QTiyYVJuyD8IvcwqeCQILtl+vDZQ=;
	b=PZK05lOxB8RO4gVZZhGa1pEaqS4DVCnAZ6fmJxxVKIOYnBzTgFxcHAch/JQp3tEpLf
	O9QfYukHy+/5ZRR22Du6JfANhlSLqrbDSzCOwAKePhmOjnmubg+Mzd/wYxVNHXZZpcMb
	EKrynPqem0HnhicVzTnVCC0/zuDbdi+9FUWa/TZGyXepz+7vbsHsREI6lEMgbI9Xi1tu
	t8v6NzXRlg7XOCqY2z66ry9gUjQKO4j8TeuLgWBjuXvAyiLwypU+FkwF53btzlobIKDT
	tekylE7OJhAdo9Vl+mdXp932dq0eaan1qPElkyDJExJeNzBC8tpL04pY3EsgZjF6UmUV
	OrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=t3H5qOmxyMGYKO8QTiyYVJuyD8IvcwqeCQILtl+vDZQ=;
	b=He35GH+MwrfM2TjglU/9b89Fb1BVlEyutJY0A0ZwAMKAInLl5YBy3CA1F4ufL4JH1N
	mJx7XT4jgw6nTH1pfw0P7iL8TTFqGTTvXM6/59/pJpFSvv1XtF/nZQJy4HMAayTGga6V
	rHuxyzbLzO4HFDTbqRay+o6v/zO299VSsd4SwRBjeSJSmAQmheogU/T1tPZ+a84Fv/3K
	ntwpGT/ch80wFnXSBwHfzSfD97XMFzvoqFQ4gVuiLCO/83OFpF8ktO0wji1MAH+FZO11
	5we4mHzWjFacluv/ODrOZ9hG1bYtuhOEn6LgtR/6y9hJhIiQQeCi33nZMNS4Gb9b6N9k
	5ZGQ==
X-Gm-Message-State: AG10YOTq3xD7evVf6p0KHqIm+y50NWlR6XV5e8RxaVp6xq9a5l4463518/wwUFF+DeAwAQ==
X-Received: by 10.194.76.72 with SMTP id i8mr10555037wjw.117.1455449453414;
	Sun, 14 Feb 2016 03:30:53 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host180-22-dynamic.15-87-r.retail.telecomitalia.it. [87.15.22.180])
	by smtp.gmail.com with ESMTPSA id
	ko2sm20293223wjc.9.2016.02.14.03.30.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 14 Feb 2016 03:30:52 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Feb 2016 12:30:49 +0100
Message-Id: <1455449449-4598-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH] linux-handheld_4.4: backport fix for SD read-only (sent for stable).
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Feb 2016 11:30:55 -0000

PXA devices suffered SD card RO. The patch fixes this.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../mmc-pxamci-fix-again-read-only.patch           | 36 ++++++++++++++++++++++
 recipes-kernel/linux/linux-handheld_4.4.bb         |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/mmc-pxamci-fix-again-read-only.patch

diff --git a/recipes-kernel/linux/linux-handheld-4.4/mmc-pxamci-fix-again-read-only.patch b/recipes-kernel/linux/linux-handheld-4.4/mmc-pxamci-fix-again-read-only.patch
new file mode 100644
index 0000000..06def8c
--- /dev/null
+++ b/recipes-kernel/linux/linux-handheld-4.4/mmc-pxamci-fix-again-read-only.patch
@@ -0,0 +1,36 @@
+From 8d95a16273994a4cf12f4a6cb05fac0da8a5ad96 Mon Sep 17 00:00:00 2001
+From: Robert Jarzmik <robert.jarzmik@free.fr>
+Date: Thu, 28 Jan 2016 13:10:03 +0100
+Subject: [PATCH] mmc: pxamci: fix again read-only gpio detection polarity
+
+The commit fixing the conversion of pxamci to slot-gpio API fixed the
+inverted the logic of the read-only gpio. Unfortunately, the commit was
+tested on a non-inverted gpio, and not on the inverted one. And the fix
+did work partially, by luck.
+
+This is the remaining missing part of the fix, trivial but still necessary.
+
+Fixes: Fixes: 26d49fe71953 ("mmc: pxamci: fix read-only gpio detection polarity")
+Reported-by: Andrea Adami <andrea.adami@gmail.com>
+Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
+Cc: stable@vger.kernel.org
+---
+ drivers/mmc/host/pxamci.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
+index ce08896b9d69..28a057fae0a1 100644
+--- a/drivers/mmc/host/pxamci.c
++++ b/drivers/mmc/host/pxamci.c
+@@ -804,7 +804,7 @@ static int pxamci_probe(struct platform_device *pdev)
+ 		dev_err(&pdev->dev, "Failed requesting gpio_ro %d\n", gpio_ro);
+ 		goto out;
+ 	} else {
+-		mmc->caps |= host->pdata->gpio_card_ro_invert ?
++		mmc->caps2 |= host->pdata->gpio_card_ro_invert ?
+ 			0 : MMC_CAP2_RO_ACTIVE_HIGH;
+ 	}
+ 
+-- 
+2.1.4
+
diff --git a/recipes-kernel/linux/linux-handheld_4.4.bb b/recipes-kernel/linux/linux-handheld_4.4.bb
index 55ffc92..59a54cf 100644
--- a/recipes-kernel/linux/linux-handheld_4.4.bb
+++ b/recipes-kernel/linux/linux-handheld_4.4.bb
@@ -9,6 +9,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v4.x/linux-${PV}.tar.xz;name=kernel"
 SRC_URI[kernel.md5sum] = "9a78fa2eb6c68ca5a40ed5af08142599"
 SRC_URI[kernel.sha256sum] = "401d7c8fef594999a460d10c72c5a94e9c2e1022f16795ec51746b0d165418b2"
 
+SRC_URI += "file://mmc-pxamci-fix-again-read-only.patch"
+
 LOCOMO_PATCHES = "\
            file://locomo/0001-mfd-add-new-driver-for-Sharp-LoCoMo.patch \
            file://locomo/0002-leds-port-locomo-leds-driver-to-new-locomo-core.patch \
-- 
1.9.1



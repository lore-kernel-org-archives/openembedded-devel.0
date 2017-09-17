Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4FAD0782A4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Sep 2017 20:21:38 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e64so7066929wmi.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Sep 2017 13:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=H7/iEf6mW0+n07vmH0mlgrZIKMlEr2MtjpVZYEICFzo=;
	b=LGF4igxc346IADuoLmntdagjT44xYXcYaOuiGo1ZqJ6cBt4rSu8if42zI3Zc8TTusU
	dTKvCKD8gbxIAOaDYv7iy+Ipg/n5BH0xsrfwlzoxhLqajP6riWGGUgxQTUnwfwlmE222
	pO6Ppoxc6O+nNGlDPn5bi//xwQiYJwjR935Mj9XnyDr54IU3iZjsW/D51p0o+85pznr9
	gSK8Ks61EgnWQj+7yZTPoEJ//dgXkGnQkVHV9yEdHHsD57/xL7c67dwwL9i1MSUx6HMY
	N34dh0oBdtdggcAsIY3eai0QWtIKopWxHnFkpw8XRoEZ0ntSfXibKZ3xtIl9/dwiZCpo
	ML1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=H7/iEf6mW0+n07vmH0mlgrZIKMlEr2MtjpVZYEICFzo=;
	b=s97XxFRx2CiIKvCcKTGkQDS02YzAcjo6J9KYONckWp2Q/5kFCUc4xZzAWkvU4i2hFf
	hdnMxDFY0J3Y10iwJOdvAHPcQhgPQnfdPMoEpdbu/xmHhnbAxJyD9i/Yt81MyI8snnYS
	K3MM7tcn+TaISpYOleVn7GTo051EYmm4NfCr395b6fhuzT942l5WTalxOSUSv7BdYGql
	4059vUmdeQQhzA0gaPj+0xV1JRYqmLpaoBBirDt957PHBae6vvHARf8ieb7nTQQUz6Lj
	Wl4Fz0SOfiPMJ0ewSUzakE6ECBUFSCBVnndJ196m3vjEw1A2aBqh9WCQgYABf3eu+gM5
	8rNw==
X-Gm-Message-State: AHPjjUjCiRN0rdg7mPJw4UDY3eFHXwvWxbcamJOBLEpB6E6laAiQQKE0
	xtPdREOn6ekQT7HQY+RfbZoxVg==
X-Google-Smtp-Source: AOwi7QADDrTqnu64F8kTRSuhMgIP2wROeJI3wAUNQEwayxWncrQzJscLRbwOGuoPGdxEnhoyL/6k5w==
X-Received: by 10.28.131.131 with SMTP id f125mr6574842wmd.137.1505679699860; 
	Sun, 17 Sep 2017 13:21:39 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host224-10-dynamic.249-95-r.retail.telecomitalia.it.
	[95.249.10.224]) by smtp.gmail.com with ESMTPSA id
	q19sm5833025wrb.17.2017.09.17.13.21.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Sep 2017 13:21:39 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Sep 2017 22:21:28 +0200
Message-Id: <1505679691-3610-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505679691-3610-1-git-send-email-andrea.adami@gmail.com>
References: <1505679691-3610-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/5] linux-handheld(-kexecoot)_4.4: update to 4.4.72 stable patchset
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
X-List-Received-Date: Sun, 17 Sep 2017 20:21:39 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-handheld_4.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-handheld_4.4.bb b/recipes-kernel/linux/linux-handheld_4.4.bb
index 68d1d66..a7c158e 100644
--- a/recipes-kernel/linux/linux-handheld_4.4.bb
+++ b/recipes-kernel/linux/linux-handheld_4.4.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 COMPATIBLE_MACHINE = "akita|c7x0|collie|h3600|hx4700|poodle|spitz|tosa"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v4.x/linux-${PV}.tar.xz;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v4.x/patch-${PV}.68.xz;apply=yes;name=stablepatch \
+           ${KERNELORG_MIRROR}/linux/kernel/v4.x/patch-${PV}.72.xz;apply=yes;name=stablepatch \
            "
 SRC_URI[kernel.md5sum] = "9a78fa2eb6c68ca5a40ed5af08142599"
 SRC_URI[kernel.sha256sum] = "401d7c8fef594999a460d10c72c5a94e9c2e1022f16795ec51746b0d165418b2"
-SRC_URI[stablepatch.md5sum] = "def995f7c91d6682256b24d0ba5933fb"
-SRC_URI[stablepatch.sha256sum] = "ca4fdd5cb4336a07f8ba7ea08a812b47278b43db3060a2f76623bab91b454e1a"
+SRC_URI[stablepatch.md5sum] = "706589ba15cc3b1635c8bb1bc8938b14"
+SRC_URI[stablepatch.sha256sum] = "9343e9452502827dd92b9fc466861f48753e131167c92a008cc28e8b40a27e2b"
 
 SRC_URI += "\
            file://ASoC-pxa-fix-module-autoload-for-platform-drivers.patch \
-- 
2.7.4



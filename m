Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UWZOx-0002uS-Dj
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Apr 2013 23:45:00 +0200
Received: by mail-ee0-f44.google.com with SMTP id t10so2435162eei.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Apr 2013 14:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=lCAv/4qC2qdLd8Vo8GpOJu9fwFs5tMCr9Bzzq8ygA3I=;
	b=ib6nL7FX4refwW+GsO0dN9Pj8mtbhRhE29kHoRXAjhtQ5cQN27PKvRgFRdZMQPjIGQ
	uEpwc40j41m1MQUh3uGhWh7UbAd1ODhMcuOO4i2tpulrTcSOaGNUW8d68t07NWlfcidD
	NLyFVIRBxVClSdafgbdUusfrFST6RGaEbRonSy/60JYTucGBeavtzPhtZdDLbh9P3exK
	BW0iNuDPT5Wd7AiTWLhAOVTTFHy+/aDoXw+75TWtQQOeESsINOrhV+/WL3/Bu7uMCcLQ
	ss0ifvd4xbh7OwAFTojE3W3CCdQbqNFjH+ve9Hxd/vA3dpJoZkpwiOb0CMU321T9W+ss
	jaQg==
X-Received: by 10.15.24.68 with SMTP id i44mr27397810eeu.19.1367184427462;
	Sun, 28 Apr 2013 14:27:07 -0700 (PDT)
Received: from mizar.localdomain
	(host80-250-dynamic.0-87-r.retail.telecomitalia.it. [87.0.250.80])
	by mx.google.com with ESMTPSA id
	r10sm11473291eez.10.2013.04.28.14.27.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 28 Apr 2013 14:27:06 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Apr 2013 23:26:43 +0200
Message-Id: <1367184404-4572-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1367184404-4572-1-git-send-email-andrea.adami@gmail.com>
References: <1367184404-4572-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 2/3] initramfs-kexecboot-klibc-image: mask recipe for x86 and x86-64
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
X-List-Received-Date: Sun, 28 Apr 2013 21:45:13 -0000

* kexec-tools fails to compile against klibc so we have
* to mask the image pulling it

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
index e4e52cf..92f387c 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
@@ -3,3 +3,8 @@ require initramfs-kexecboot-image.bb
 IMAGE_INSTALL = "kexec-klibc kexecboot-klibc ubiattach-klibc"
 
 export IMAGE_BASENAME = "initramfs-kexecboot-klibc-image"
+
+# current version is known to fail on x86 and x86-64
+# due to missing vfscanf() in klibc
+COMPATIBLE_MACHINE_x86 = "(-)"
+COMPATIBLE_MACHINE_x86-64 = "(-)"
-- 
1.8.1.5




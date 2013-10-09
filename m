Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4488F6CDA7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 22:16:24 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so735187eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Oct 2013 15:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=EVaenViwdOtGpMUg5EAx9pdpTTfDmlKksCYngs1e06U=;
	b=YUzl9uaarZZP81oEyHYHOEnI9ZgD+cWMSMF494fiwB92P0PSKHLaUscFKV9y7PxPYP
	wj4BP3T9SpXqJwn7a6k5jd5V6oG+DADkZR7hNtxKHry5DmpPO1dEBghQ54DVIjGwfaDP
	ZqjLLwWO/lvlTk26rhuGoF+58RSobgiGNfEpEHGuTrji0rb8ABDeUezniAhjTL1z1w+g
	NXp9RDs3Tp9Plzynfp8Cqzr5G56KNKLFZvCL5eWivm1M/XgP5Cp6VHn+bz3efYGXY9Ro
	jWftLvjUGDvJSRngOADcni/6tRINg64ZPE4qOD0AckrOLzBJN6L2Xi30ARXGKT9yvfoU
	qeqg==
X-Received: by 10.14.115.133 with SMTP id e5mr14918299eeh.27.1381356985741;
	Wed, 09 Oct 2013 15:16:25 -0700 (PDT)
Received: from mizar.localdomain
	(host138-252-dynamic.0-87-r.retail.telecomitalia.it. [87.0.252.138])
	by mx.google.com with ESMTPSA id b45sm93470970eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Oct 2013 15:16:25 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Oct 2013 00:16:18 +0200
Message-Id: <1381356978-8699-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH] klibc.bbclass: add a note about default of building -static
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
X-List-Received-Date: Wed, 09 Oct 2013 22:16:24 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/classes/klibc.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index ee49879..ca741cd 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -1,6 +1,9 @@
 # klcc-cross depends on klibc
 DEPENDS =+ "klcc-cross"
 
+# Default for klcc is to build static binaries.
+# Set CC = "${TARGET_PREFIX}klcc -shared" to build the dynamic version.
+
 export CC = "${TARGET_PREFIX}klcc"
 export CC_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc -march=armv4 -mthumb-interwork"
 
-- 
1.8.1.5



Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1U5mDi-0001iK-T8
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 00:58:34 +0100
Received: by mail-ea0-f169.google.com with SMTP id d13so731825eaa.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2013 15:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=xDUqdLamtygWenknf8C3oiUrpydHY/1LBw69O0OPcrM=;
	b=feyTgx4RCg4/2UXqCg2wXDVzQnhbTOWen+4L75Zd/sfjon9HKQr/faRk5VBdzpSrds
	fKmM5PvV2NN+59x1YyrMP7FAsd8Q7WX4YkdiaErquKKOq6ziMqKPoOAaGF/XizbA//9i
	RvXRtYLO6nUW4tLtAG9t+nt98xhru4LgBGClGpGvnlTMXfx8FXc27fpTJZ3oOxB8J2ZQ
	FqQlQvkt5MvFEcICVTUlH4EyQQ/tVuWoIQnfBf18OIbZgfyYGBVzMu81hPVcJ/fFjmVt
	JLJbSLS89BYyOF2SNK3YzKj32uecx+N1pglQZYoyRrsRa1TkDgLC9TB6QYRMjj5mqA8k
	iXyg==
X-Received: by 10.14.0.135 with SMTP id 7mr57135545eeb.5.1360798953588;
	Wed, 13 Feb 2013 15:42:33 -0800 (PST)
Received: from mizar.localdomain
	(host124-251-dynamic.0-87-r.retail.telecomitalia.it. [87.0.251.124])
	by mx.google.com with ESMTPS id s3sm5280415eem.4.2013.02.13.15.42.31
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Feb 2013 15:42:32 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Feb 2013 00:42:27 +0100
Message-Id: <1360798947-726-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [meta-oe][meta-initramfs][PATCH] klibc.bbclass: force thumb-interworking for eabi builds on armv4
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
X-List-Received-Date: Wed, 13 Feb 2013 23:58:35 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/classes/klibc.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index e8cdb6d..ee49879 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -2,6 +2,8 @@
 DEPENDS =+ "klcc-cross"
 
 export CC = "${TARGET_PREFIX}klcc"
+export CC_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc -march=armv4 -mthumb-interwork"
+
 export CPP = "${CC} -E"
 
 # klcc uses own optimizations by default. See klcc(1) man file.
-- 
1.7.12.4




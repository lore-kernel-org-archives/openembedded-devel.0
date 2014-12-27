Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9B1867258B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:16 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id kx10so14794731pab.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=qy4T3QF2bmFIvPpvJsaaghtkERMMGmc1i5yo/2AaiiI=;
	b=kpHXsRruygjjvuftqRC/rUrZb11wDV/FkV0AItIebDbJQUdX5abBdTjgjxwoYVnMzf
	8YnXMEsRODUlRRvU9WYlbfZ6MLR2Y1W3qaM5anM6PoKtyjHq8iDO5rTIWdw+RtRPYUWr
	VPf32G9ALrICjNUEx4FdKHQS5cI+e0n5WlaJS4Jg5eZGciP6krRz0QfegAblD5AhNduw
	EKMbPgJGXum36RoBlM0kgpPBUq4py5bRcQyoZeEpO0eYZd+KYEgDUn981IO8fdhyF6Bc
	mdYsmcRLYojb+ojtFUW3IALYgiPGZpFKWhhNcO8ErgglYdQoL+GHH6RybEzJChsEVNqy
	LDAQ==
X-Received: by 10.70.41.134 with SMTP id f6mr76760578pdl.25.1419700936764;
	Sat, 27 Dec 2014 09:22:16 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:21:49 -0800
Message-Id: <3d563139b0ff4c29ecfdd6bb026fc1e84167b03d.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 02/27] polarssl: add dependency openssl
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:18 -0000

From: Kai Kang <kai.kang@windriver.com>

polarssl compiles with openssl to build unit test cases. If openssl
doesn't exist, native libssl.so will be used. Then causes error:

| .../bitbake_build/tmp/sysroots/x86_64-linux/usr/lib/libssl.so: error adding symbols: File in wrong format

Add dependency openssl for polarssl to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb b/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
index 8ca1b1c..7a496b7 100644
--- a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
+++ b/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://polarssl.org/download/polarssl-${PV}-gpl.tgz"
 SRC_URI[md5sum] = "d1a2b4f21727e888f143414d2e3144e6"
 SRC_URI[sha256sum] = "318171db41335cacbb5b0047c94f1faf91442ab70a223b5223436703c9406ff1"
 
+DEPENDS = "openssl"
 RDEPENDS_${PN} += "libcrypto"
 EXTRA_OECMAKE = "-DUSE_SHARED_POLARSSL_LIBRARY=on"
 
-- 
1.9.1



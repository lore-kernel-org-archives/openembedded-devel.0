Received: from mail-pd0-f172.google.com ([209.85.192.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQ2Kg-0008TQ-Oy
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 23:13:33 +0200
Received: by mail-pd0-f172.google.com with SMTP id 5so473077pdd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 13:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=v9RAiyb05kPYubF8+5k7nfYqprvABJInc+zIdVYYWB4=;
	b=CMK5rSFPIjsmD18iQDYVHsFp0pbEoGtaodVfgdpjanYh7EuzS1xkqH9DxIu0i143x8
	Q4kV1QVlAQ7mrG/H7Cd+6Hz/AvPwxZCjuWJGtVx1kpkA31Qt1R5Nl8JDPxxOmYgbl8Ob
	bmguF9VurB1OzQdvIHVU07GSU5rt7BdlCfI+KfD4GDPBbGSHfuTw0epBGy29M2eoKLWu
	NAu0JDfTTm3BFTa1DR/XzSa6CPVdE5+4ouREWsObIR2t6I9f6k8+KxkkRGLRMfcQAQWf
	300MajhV1XVHJegItZZxWnvu/i0mdCmBqwHAN8nxT7uiCKHJ9Xn42lZwICkXG2LhCjI3
	wleA==
X-Received: by 10.68.17.230 with SMTP id r6mr5018592pbd.187.1365627368056;
	Wed, 10 Apr 2013 13:56:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d6sm1255918pbr.6.2013.04.10.13.56.05
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 13:56:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Apr 2013 22:55:58 +0200
Message-Id: <1365627358-25863-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-oe][PATCH] live555: Add MIRROR for older versions
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
X-List-Received-Date: Wed, 10 Apr 2013 21:13:33 -0000

---
 meta-oe/recipes-multimedia/live555/live555.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/recipes-multimedia/live555/live555.inc
index 0301635..523d5de 100644
--- a/meta-oe/recipes-multimedia/live555/live555.inc
+++ b/meta-oe/recipes-multimedia/live555/live555.inc
@@ -12,6 +12,8 @@ INC_PR = "r0"
 URLV = "${@d.getVar('PV',1)[0:4]}.${@d.getVar('PV',1)[4:6]}.${@d.getVar('PV',1)[6:8]}"
 SRC_URI = "http://www.live555.com/liveMedia/public/live.${URLV}.tar.gz \
            file://config.linux-cross"
+# only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
+MIRRORS += "http://download.videolan.org/pub/videolan/testing/contrib/live555/"
 
 S = "${WORKDIR}/live"
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.8.1.5




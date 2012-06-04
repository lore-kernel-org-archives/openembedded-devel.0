Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel.mcdougall@liftoffsoftware.com>)
	id 1SbbJG-00082v-6e for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jun 2012 19:43:18 +0200
Received: by ggnp4 with SMTP id p4so3226034ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2012 10:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=o/ZSReYzdByjHttM9SZ7YyltiBEN/a7/0WdHppzF2cE=;
	b=CMMf8wD72+tOEya2YYyxoPdV0DFiCUU9DyycNSUszx9tW1Z97aBf59Xejf3b5wLlar
	xfCbbpSjyIPLYPFPXJHFmhSWirLoKjYlcUc3/nzrUDglgLgHTt0u93E2o508T/t8JKkq
	wlBiWTw7ESOStrq63ZCb92iZYYIpComhv82Sdx6hkRLARN1xpzkQqF+N3bwU7BbaVEMs
	LSqPa5hVBQ1830sbqPdH5+zfRidf8b8HImUmQZ6eTYJ05h1vTyH7bCM/o+Q0ceVJQsbe
	KCHD0Ckd75rP0mpKAmJmp7PpBteEQ7munxXO88oPWYGTn+lhNENOkm+b2Qo+12w0Uxlh
	cdjQ==
Received: by 10.101.165.15 with SMTP id s15mr3821822ano.36.1338831172931;
	Mon, 04 Jun 2012 10:32:52 -0700 (PDT)
Received: from htpc.lan (c-69-180-64-152.hsd1.fl.comcast.net. [69.180.64.152])
	by mx.google.com with ESMTPS id
	y63sm40063563yha.9.2012.06.04.10.32.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 10:32:51 -0700 (PDT)
From: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Jun 2012 13:32:40 -0400
Message-Id: <1338831160-14023-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQmK/i/dLtk4Pj9uzvX9OH0/vkTe6jtLcHKQ7imlUDiyM118166iSNKw25UOmxg0XrfZeA2C
Subject: [meta-oe][PATCH] python-numpy: Fixed numpy dependencies.
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
X-List-Received-Date: Mon, 04 Jun 2012 17:43:18 -0000

Numpy was missing a number of dependencies in the .bb file without which it will
not work.

Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
---
 .../recipes-devtools/python/python-numpy_1.4.1.bb  |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
index 36ab622..bae624e 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
@@ -24,3 +24,8 @@ do_compile_prepend() {
 
 SRC_URI[md5sum] = "5c7b5349dc3161763f7f366ceb96516b"
 SRC_URI[sha256sum] = "2e7bb84573e5123e07f3c919fd433bc09b78d606252b6b719e385c2a981d8e06"
+
+RDEPENDS_${PN} = "python-unittest \
+                  python-diffutils \
+                  python-pprint \
+                 "
-- 
1.7.9.5




Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel.mcdougall@liftoffsoftware.com>)
	id 1ScIC3-00049G-Pa for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2012 17:30:44 +0200
Received: by ggnp4 with SMTP id p4so5006642ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2012 08:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=o/ZSReYzdByjHttM9SZ7YyltiBEN/a7/0WdHppzF2cE=;
	b=bwHKwhmKyIUeL3ZS2WZv7iPxSm9kRkDLBjYhByCG/10Llm71qhEHIJRwGqbLmNuQBU
	szf+33LDdcYmrz5NWpkt+MZEKisvz5hdcsFfDQrjxqtKRKBLddy0GDhgWdIUpjb2yWhj
	A+cb5Uuw58UnCJ+Zu00akjVqfJvs/a2CGWnyh2Ns3B1pnzx+gmuwzOqPl06d6xf3Wjys
	KonZPjjeRRc17wSjtV5m99mB4a1lPM1Auk15wvUXJNBtmeZQ38jX37+K8Vr9s2/THvua
	ltnoyL1CcSVhPpXvmK2yGFyIMkXxNqe/YKLS3ET5FhvR+Tg9M0ahyjvDBTKJcbSx7EAJ
	Hqkg==
Received: by 10.236.77.134 with SMTP id d6mr16472913yhe.79.1338996016110;
	Wed, 06 Jun 2012 08:20:16 -0700 (PDT)
Received: from htpc.lan (c-69-180-64-152.hsd1.fl.comcast.net. [69.180.64.152])
	by mx.google.com with ESMTPS id v16sm186559anh.22.2012.06.06.08.20.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jun 2012 08:20:15 -0700 (PDT)
From: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Jun 2012 11:20:03 -0400
Message-Id: <1338996004-32583-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQlmHbv/jXNqR7Jt9HXDCGncxSaKOHvLpFBa/cJyDB5I/3El8jQwPvovLon2hntSJfxtYlYz
Subject: [meta-oe][PATCH v2 1/2] python-numpy : Add missing dependencies.
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
X-List-Received-Date: Wed, 06 Jun 2012 15:30:44 -0000

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




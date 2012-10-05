Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TK4wJ-0000a0-SP
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 12:15:27 +0200
Received: by mail-bk0-f47.google.com with SMTP id jk7so759016bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2012 03:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=adaAu1frzldMqvtSoO24ptwaf/cde1YyqflC1YW78zk=;
	b=NYsczYSC+YwD058006j6HYKVwt0Tea8jnOOUdgeCztobQGzo79lh0XJ68fWlYQKcYY
	RISzSvYSCXMh7amWQdQmL22ic0wTC7nJ3Z6Fibi8RDc57K7uYeJyTjFxNDlZ7D5Vz2HW
	B87yx95DwkxMWmeSdz275IXMq2oeFKNBJZEa8XaYQNu/uTRyOI5LrfotL95ATuJjKPYZ
	c24kPgZz46kxfrYhom1u4kYV07JDr9dMHMvtkPeeyYexpuHRNaHFcxjezcjZaNexYnBI
	rAeqmernkz0crkTMQt7yK1Nd9AH5N81ev6/AwtKp4h98lE34/19iKd7JB/0g4A6YZ0tm
	AP6g==
Received: by 10.205.136.2 with SMTP id ii2mr2527643bkc.114.1349431345807;
	Fri, 05 Oct 2012 03:02:25 -0700 (PDT)
Received: from localhost (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id g8sm7235960bkv.6.2012.10.05.03.02.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 03:02:24 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Oct 2012 12:02:20 +0200
Message-Id: <1349431340-8045-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkdtrxr6fle/Oy9Gy2mwyrrzhvSzlaiLBotT/t/mybAk97OsRXqbIVMNukckWNpbvK4BxDy
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] python-numpy 1.4.1: update hack to find the new location for python-native
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
X-List-Received-Date: Fri, 05 Oct 2012 10:15:27 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
index c1923f7..bb4e78a 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
@@ -24,7 +24,7 @@ inherit distutils
 # This is a ugly, ugly hack - Koen
 do_compile_prepend() {
          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-         ${STAGING_BINDIR_NATIVE}/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
+         ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
          true
 	 cp ${WORKDIR}/*config.h ${S}/build/$(ls ${S}/build | grep src)/numpy/core/include/numpy/
 }
-- 
1.7.10




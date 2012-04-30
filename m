Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOxj2-0006Wp-F6
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 23:01:40 +0200
Received: by dakh32 with SMTP id h32so4274886dak.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2012 13:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=UFx42ddN0L72a3Eg2H86/tHxvZ2TiZX9DXGp7M3HMHk=;
	b=SicsK1F2W9V4kXf7jCtTv01D+Mdsj0mdjKaKhJvPKNrNCIWCvW7XzG8a43DdFIAqlb
	uWNv7SxVMrkca1EKRvJCe+alppDfJ7ap/6gzZofXfmF/Fc1b20ouBciofEwUGirQwUnT
	yXWhXnLSqk+cZNaW5kNZL8WL4zeHpwDPl6FfTqtbHRyaQNUYDHSwW+bnw0JoaI1OMck2
	wkjwuNqjN4Wq9oF7ydqbWxPiw9TzvcTTJ6AgkoXwH5c8+en9LtSkWwatjG98+Uo/kcJ4
	5F1o6tZsG4B33SS6t3yLyXIWiwsWkRRxUxf7GqkguviAiilTFgYqC6fbYKyyruaEA+UK
	43aA==
Received: by 10.68.228.195 with SMTP id sk3mr41500353pbc.20.1335819117594;
	Mon, 30 Apr 2012 13:51:57 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pk5sm7012726pbb.68.2012.04.30.13.51.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 13:51:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 13:51:03 -0700
Message-Id: <1335819064-29468-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1335819064-29468-1-git-send-email-raj.khem@gmail.com>
References: <1335819064-29468-1-git-send-email-raj.khem@gmail.com>
Subject: [toolchain-layer][PATCH 2/3] gcc-crosssdk-intermediate_4.5.bb: with-headers has been moved from common include
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
X-List-Received-Date: Mon, 30 Apr 2012 21:01:40 -0000

To accomodate gcc 4.7 which needed a different option
than --with-header this option setting has been moved
into version specific recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc/gcc-crosssdk-intermediate_4.5.bb           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb b/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb
index 971f3ba..61a0dfb 100644
--- a/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb
@@ -1,3 +1,3 @@
 require recipes-devtools/gcc/gcc-cross-intermediate_${PV}.bb
 require recipes-devtools/gcc/gcc-crosssdk-intermediate.inc
-
+EXTRA_OECONF += " --with-headers=${STAGING_DIR_TCBOOTSTRAP}${SYSTEMHEADERS} "
-- 
1.7.5.4




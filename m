Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIoB-0007bn-NB
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:19:27 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1966324eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 10:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=W5OefxCZH5SOkYbWPW18S50qhsV4fqAe8w59kYvTIVI=;
	b=E/K0njrg7LIFjvFwQniVvaZR+lAV0TEQmtLFz4YYQhlt+Uv8zc2nH3Z4TDEQdIqljy
	hEmFEUTnNCGU9FPtykFRgY4O0uq2Om7+VO6AX8eVHH1BQhaleNjJavRTe0XRE1x6iQpv
	oBgOJ2VLd2EuE6pkO+GyPU+X2kCVHZKFdHAGYI6b6QULgPTcWu7Xdb4Z0QwttjpUk56K
	WCrucvfofeOfW0aCyznsynh5wl2EiFXwTXTkzgG0Yv1e211f7bqnttbIuAdqhUPw4kl2
	nhN9Iu1KpC5kQpBb/lyELjw0IMP/FNCLuRP7xkccDj5d9jcygPRSzBN3aTGTfzmH3oPk
	vVJw==
Received: by 10.14.2.196 with SMTP id 44mr33845179eef.25.1355680717994;
	Sun, 16 Dec 2012 09:58:37 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 6sm23878820eea.3.2012.12.16.09.58.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:58:03 +0100
Message-Id: <bb1398ef35597e8d053165310575f7735970bb59.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 20/26] libgcc: s/virtclass/class/ to make it up-to-date
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
X-List-Received-Date: Sun, 16 Dec 2012 18:19:27 -0000

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bb b/toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bb
index 8529755..4dade08 100644
--- a/toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bb
+++ b/toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bb
@@ -5,7 +5,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
 
 PKGSUFFIX = ""
-PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
+PKGSUFFIX_class-nativesdk = "-nativesdk"
 
 PACKAGES = "\
   ${PN} \
-- 
1.8.0.2




Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 40DB06E7CC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 16:28:29 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id f73so7160546yha.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 09:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=ymAqIXhxPxr/LM5BUbBnfdKxfIbRnBLAScn+bNAz7Ro=;
	b=Y6zlGbRSxsE0bY686aZynsvxevCxe4nQAmOcYIzajlIehKIC2fPYHZUst4ehA29xPV
	fJ5fW1O0Xd8J7Jky0W3WV4C/zeAGzP3BIKHSRvGJ2m0NSP4K0cGcD+s3Pid0IjA3WUFB
	q3Epk/lv3WEXG1S0VrvXHqfRiODkD59x0FG8oF3JQPLOHFiE++Cg9FzhvYOZ8jNC2du6
	Wqf8k/N1vL2U4vx4XQ1YdwpFtpBK9NPxoqRhANzOk0xPWSVz/kL2jPKgeWWkCJP848Lw
	R7mOwP/V1TmKZrV/7I0I9Uc2Md85u9KwzBgH98IbES8jN+zJmdKOQV/C48AklCsUlhKV
	tW4g==
X-Received: by 10.236.86.113 with SMTP id v77mr2840409yhe.125.1395160110656;
	Tue, 18 Mar 2014 09:28:30 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id n4sm38991236yhc.13.2014.03.18.09.28.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Mar 2014 09:28:30 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 8C108197CAE2B; Tue, 18 Mar 2014 13:28:26 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Mar 2014 13:28:22 -0300
Message-Id: <1395160103-15730-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/2] glmark2: Rework recipe to use the 'waf' class
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
X-List-Received-Date: Tue, 18 Mar 2014 16:28:31 -0000

This removes the duplicated code and uses the OE-Core waf class.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb
index 9edee14..031e3b3 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb
@@ -15,21 +15,9 @@ SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
 SRC_URI[md5sum] = "4f306664aa3886fa0cf93853603603f8"
 SRC_URI[sha256sum] = "bea6f9de2cdce376195bd91e4a2fdfdf80bf3e480abff8e05b90a6458c1deb47"
 
-inherit pkgconfig
+inherit waf pkgconfig
 
 PACKAGECONFIG ?= "gl gles2"
 
 PACKAGECONFIG[gl] = "--enable-gl,,virtual/libgl"
 PACKAGECONFIG[gles2] = "--enable-glesv2,,virtual/libgles2"
-
-do_configure() {
-	./waf configure --prefix=${prefix} ${EXTRA_OECONF}
-}
-
-do_compile() {
-	./waf build ${PARALLEL_MAKE}
-}
-
-do_install() {
-	./waf install --destdir=${D}
-}
-- 
1.9.0



Received: from mail-da0-f44.google.com ([209.85.210.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2LRy-0003Jc-QL
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 13:47:07 +0100
Received: by mail-da0-f44.google.com with SMTP id z20so2641525dae.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 04:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=kH4I1U/JzT8xpFvCjN5q3azHWgKLSl2Y1XG0o8i5xOg=;
	b=Kvg3MCRSr9rOyZ4trmuiiNgCa0MR663+66iKFe8hO7Mz6M4e6OJLUoByz19ErQLav8
	pyz132kQm04+zQrFlfWJxZnZkN+pxPgXIlWceiMqHv5ooYenlBgvA9RmeQcTux589SyK
	cTsIsryknPaa0b2Gski/rH1NGbZmGShP5+89HdCmJWJpWqQPpvLtcO197HsZ+FWzy1Kl
	dBFYfsN+6RnUZ3p7phm3wbZIR9b304moCJGN6HkMDLWCPDetxctsDGxWA0rUf3w9evSk
	QnqO2vviv4IXDibcB0OaWPit6QWBMbLg5bNvmhBcsc1xeLt/t3Me3G+hkcAYi19Yt2wR
	bZvw==
X-Received: by 10.66.88.164 with SMTP id bh4mr52552155pab.41.1359981078024;
	Mon, 04 Feb 2013 04:31:18 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id y9sm21055573paw.1.2013.02.04.04.31.15
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 04:31:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 12:31:02 +0100
Message-Id: <1359977464-19529-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <keem7q@ger.gmane.org>
References: <keem7q@ger.gmane.org>
Subject: [PATCH 1/3] nodejs-0.8.18: export DESTDIR to fix build with dash
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
X-List-Received-Date: Mon, 04 Feb 2013 12:47:08 -0000

* when building on machine with /bin/sh -> /bin/dash
  DESTDIR is empty in install and it's trying to write to /usr/include and fails

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
index 9b39251..1a1c66b 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
@@ -54,7 +54,8 @@ do_compile () {
 }
 
 do_install () {
-  DESTDIR=${D} oe_runmake install
+  export DESTDIR=${D}
+  oe_runmake install
 }
 
 RDEPENDS_${PN} = "curl python-shell python-datetime python-subprocess python-crypt python-textutils python-netclient "
-- 
1.8.1.2




Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UZqro-0003c4-Q0
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 01:00:17 +0200
Received: by mail-ee0-f43.google.com with SMTP id b15so596883eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2013 15:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=kdSW+2DmzFcOVJpkO9GkGVNFCtgIT4uvN+ovmevFWWg=;
	b=mf3ZLsZ8ZNb4y6MiON2Uufxzr5dugsnStgwVPOdo8AlsC4g4qf8alnKTUcOVUoHNgK
	fw21X9rDDZN2XH9Iwd6veTmlBj7NcNJN2o4juMAbDkSzHf+DRnl888RSS+G7hQ7jJdOs
	rtQRFMgOG+Eai+81TNpxQd/GUcQGjUBwbbQJlnCZsn9uv7qBUAxOiY6XZKMznU53v8V8
	DAt3dbWsNg8wvfGoJKDhLiGJqrMc8krzH6qRCigFs5YMaymU6PsnYAzpzey824pWLHvq
	NEjHCqrcv9a+on0TTHQtXXucxpbwE95XD/+ql0sMKe/QKPeG81+/5CA3tmUw7RdmDmxJ
	/EnA==
X-Received: by 10.14.100.1 with SMTP id y1mr10232789eef.9.1367966535640;
	Tue, 07 May 2013 15:42:15 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0896.dip0.t-ipconnect.de.
	[91.10.8.150])
	by mx.google.com with ESMTPSA id i3sm41969409eev.1.2013.05.07.15.42.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 15:42:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2013 00:41:44 +0200
Message-Id: <1367966513-12566-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-gnome 06/15] poppler: remove unrecognized configure options
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
X-List-Received-Date: Tue, 07 May 2013 23:00:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

warning was:

| configure: WARNING: unrecognized options: --disable-poppler-qt, --disable-abiword-output

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/poppler/poppler.inc       |    1 -
 meta-oe/recipes-support/poppler/poppler_0.18.4.bb |    2 --
 2 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/poppler/poppler.inc b/meta-oe/recipes-support/poppler/poppler.inc
index d0c0074..11286bc 100644
--- a/meta-oe/recipes-support/poppler/poppler.inc
+++ b/meta-oe/recipes-support/poppler/poppler.inc
@@ -11,7 +11,6 @@ EXTRA_OECONF = "\
     --enable-xpdf-headers \
     --disable-gtk-test \
     --disable-poppler-qt \
-    --disable-poppler-qt4 \
     --enable-zlib \
 "
 
diff --git a/meta-oe/recipes-support/poppler/poppler_0.18.4.bb b/meta-oe/recipes-support/poppler/poppler_0.18.4.bb
index 2f4927b..6a9dbbe 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.18.4.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.18.4.bb
@@ -2,8 +2,6 @@ require poppler.inc
 
 DEPENDS += "lcms"
 
-EXTRA_OECONF_append = " --disable-abiword-output "
-
 RDEPENDS_${PN} = "poppler-data"
 
 SRC_URI[md5sum] = "12658f3308597e57f3faff538cc73baf"
-- 
1.7.4.4




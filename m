Received: from mail-qe0-f50.google.com ([209.85.128.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steven.w.warren@gmail.com>) id 1USE8z-0003C2-VY
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 00:14:30 +0200
Received: by mail-qe0-f50.google.com with SMTP id a11so574749qen.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 14:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=ja84hFFuQ2fKCF0cWOVrKUnORYmk2ZPvyzRjNbaqJjQ=;
	b=I7fzLJAl9kfYC970Rj24/0v2oqiPnbjXCSeNXpTvFgdrIef4bOWP6GSrnAZSPYXZ0e
	9z0UarmP1p6swZh3IrvYsmmE52ZYoChvV9ib3inbZch0sibrYH4es8nFwPhYmUGrYxRA
	x6alifmZNZscUeC2GSXxh4TU7ySwcoaay57tNbvDB4C1ar1dy81gn+vCPnLZqrY0JKa0
	7+d+H2WI1Zrrb3WEpYSK1e0jBq7LssRTT9+qk0xMOErOTERi6AZE6xDfyCIPZKQaPf+/
	VqghazCxB6KYk/kre1ucdRs/tK2foJdMmeVU9Ravnpg6k76JpsVIOd6QIR97KitfWyws
	KB2g==
X-Received: by 10.224.173.6 with SMTP id n6mr2600959qaz.46.1366149418957;
	Tue, 16 Apr 2013 14:56:58 -0700 (PDT)
Received: from engineering0.emacinc.com (watcher.emacinc.com. [66.186.100.194])
	by mx.google.com with ESMTPS id ed8sm4987789qeb.7.2013.04.16.14.56.56
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 14:56:57 -0700 (PDT)
From: Wayne Warren <steven.w.warren@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2013 16:56:49 -0500
Message-Id: <1366149409-3168-1-git-send-email-steven.w.warren@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Wayne Warren <steven.w.warren@gmail.com>
Subject: [PATCH] qwt: Adjusted SRC_URI to point to a URL + PATH that works.
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
X-List-Received-Date: Tue, 16 Apr 2013 22:14:30 -0000

Signed-off-by: Wayne Warren <steven.w.warren@gmail.com>
---
 meta-oe/recipes-qt/qwt/qwt.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qwt.inc
index d9d47f0..e771b01 100644
--- a/meta-oe/recipes-qt/qwt/qwt.inc
+++ b/meta-oe/recipes-qt/qwt/qwt.inc
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "QWTv1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dac2743472b0462ff3cfb4af42051c88"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=qwt \
+SRC_URI = "http://sourceforge.net/projects/qwt/files/qwt/${PV}/qwt-${PV}.tar.bz2;name=qwt \
            file://qwt6.patch \
            file://qwt6-fix-linking-with-ld-gold.patch"
 
-- 
1.7.9.5




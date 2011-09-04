Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R0Ghz-0001NL-Qe
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Sep 2011 19:42:16 +0200
Received: by bkbzu17 with SMTP id zu17so3716930bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Sep 2011 10:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=qh7pj3TGK7nVCrQ2CsP7JAzDJbBODVIDp23oaqWS+t4=;
	b=m6sBfhrafbUaNDu4tIZLmTfYeXjgXvKZ4YUyhAOf06NGcif8qyiLARCVIx0v3OHsmq
	LsnvfLfu+a5RBg3xPcj9nQ6Ot94oKU+Fh1LYbjEB8gt2qQXhD3LvBH2szlfqswFpASQ+
	SjndOTIkWuOpejQpJE9FvMd9wBqFuzSiylm4E=
Received: by 10.204.137.77 with SMTP id v13mr1693023bkt.344.1315157833081;
	Sun, 04 Sep 2011 10:37:13 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id v16sm396213bkd.6.2011.09.04.10.37.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Sep 2011 10:37:12 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Sep 2011 21:37:04 +0400
Message-Id: <1315157824-29946-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1315157824-29946-1-git-send-email-dbaryshkov@gmail.com>
References: <1315157824-29946-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-oe 2/2] tcp-wrappers: drop emptying PARALLEL_MAKE
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
X-List-Received-Date: Sun, 04 Sep 2011 17:42:16 -0000

As tcp-wrappers are now fixed regarding parallel builds, stop recipe
from emptying PARALLEL_MAKE.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/tcp-wrappers/tcp-wrappers_7.6.bb b/meta-oe/recipes-support/tcp-wrappers/tcp-wrappers_7.6.bb
index 96448a9..b8081f1 100644
--- a/meta-oe/recipes-support/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta-oe/recipes-support/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -39,7 +39,6 @@ SRC_URI[sha256sum] = "9543d7adedf78a6de0b221ccbbd1952e08b5138717f4ade814039bb489
 
 S = "${WORKDIR}/tcp_wrappers_${PV}"
 
-PARALLEL_MAKE = ""
 EXTRA_OEMAKE = "'CC=${CC}' \
 		'AR=${AR}' \
 		'RANLIB=${RANLIB}' \
-- 
1.7.2.5




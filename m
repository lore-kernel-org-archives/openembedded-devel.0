Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel.mcdougall@liftoffsoftware.com>)
	id 1SaWhM-0001MJ-Qe for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jun 2012 20:35:44 +0200
Received: by ghbz2 with SMTP id z2so3291009ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2012 11:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=qwUhIMSJ93CA8u9L8HJ9yhiTSRi5HOpok9aL9IS/VW0=;
	b=aK0adcmdc264lFPdUSALky/Kc+gMg8qTzFW89ij6mUGwEqmmry0KZWDVijxWerOhgW
	y0H5Ih+DFirQ4VDbRf7PO4BWdOJ4MivLoYsT441LfMsv48K/a2o69J/oseVN+vCwge4w
	Uw6RZWBiccMDQsNO3olcBrc1SKzs6LUN/OPOkbhUeYYDNbEiFh4exfmwwDXbddvgV2iK
	pL/SGA92cjObc3ZPPqmKgyQhvUtgfe0ATvyCrGKxuPCDyNj9UfLdtOqkFEgsuN8qY0dF
	hlhNCI/pR8j9UM5lvxu6owvwuFsrw4sexxinLoYosdCi2FPOzzfZjHZKqhJ2Xt/T42jd
	0nZg==
Received: by 10.236.115.163 with SMTP id e23mr3548652yhh.95.1338575123166;
	Fri, 01 Jun 2012 11:25:23 -0700 (PDT)
Received: from htpc.lan (c-69-180-64-152.hsd1.fl.comcast.net. [69.180.64.152])
	by mx.google.com with ESMTPS id y10sm8836581yha.4.2012.06.01.11.25.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jun 2012 11:25:22 -0700 (PDT)
From: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jun 2012 14:25:06 -0400
Message-Id: <1338575106-25700-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQlEiteXMhsghyNbomyrkPTKUTyd01qHLGkMbtDuVktUYuqoeroUjhkd6sQjwDqzVtJx8oyV
Subject: [PATCH] Fixed numpy dependencies.
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
X-List-Received-Date: Fri, 01 Jun 2012 18:35:45 -0000

Numpy was missing a number of dependencies in the .bb file without which it will
not work.

Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
---
 .../recipes-devtools/python/python-numpy_1.4.1.bb  |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

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
1.7.7




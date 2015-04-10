Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 969216E277
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Apr 2015 16:58:57 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so26939000pab.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Apr 2015 09:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=qSk/0ID8sXrxaVVeg+QbtpL4GAxTosYAgJ7YsnB3y6A=;
	b=R/vEihSpO2pATwkc2bwnhjb5PO4kA/UMl0scGx4qZOqfnV2roUVS2bPua8c68UPYLd
	otTdYZAEYaTFGKEURoZp46wRubUI+bFoqB5KbZiy+ATlXrpPpGjqNLz9yc8K1asK47ns
	y/OotXOt/m0sbYvnEOSRCitXpE7+xUaZfyjrfEQZGtMywvBsBjJn1sbObPsG8AJmZ9qj
	rWQV/AYLoRQ5FfqAkl7cQtbPt8yJDOindkbbD7T2qBy9Dw7Y8fKe3AlBEXxJrb9s7bp0
	WP2VeV7vVlAuFAaGjzYVD9YCaC9+y2o9c+EAyV6aVzm6tbH0EIDXHUyKd/gTzLKAbfKR
	ac3Q==
X-Received: by 10.68.113.131 with SMTP id iy3mr4332610pbb.40.1428685138264;
	Fri, 10 Apr 2015 09:58:58 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id kq3sm2781581pbc.74.2015.04.10.09.58.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 09:58:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Apr 2015 09:58:45 -0700
Message-Id: <1428685125-20255-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-ruby][PATCH] v2 bundler: Fix QA new Error
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
X-List-Received-Date: Fri, 10 Apr 2015 16:58:57 -0000

V2: drop version value in file path

ERROR: QA Issue: bundler: Files/directories were installed but not shipped
  /usr/lib/ruby/gems/2.2.0/build_info
  /usr/lib/ruby/gems/2.2.0/extensions [installed-vs-shipped]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-ruby/recipes-devtools/ruby/bundler_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ruby/recipes-devtools/ruby/bundler_git.bb b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
index 2adde4d..fc73001 100644
--- a/meta-ruby/recipes-devtools/ruby/bundler_git.bb
+++ b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
@@ -26,4 +26,6 @@ SRC_URI = " \
 
 inherit ruby
 
+FILES_${PN} += "${libdir}/ruby/gems"
+
 BBCLASSEXTEND = "native"
-- 
2.3.5



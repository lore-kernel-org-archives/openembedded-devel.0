Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4A3D178348
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 19:37:14 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id q130so10828352qka.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 12:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=c6cP0dpQiv5Lx5VuIcy5eQUMxuxlSMxIwdMgugLXk3s=;
	b=oLXHLSactTkDb7wGsTijd4xXJik6K81hdkoLBA7jFV73kBWMfV6UoP7vDxJE3ouQcO
	kUluf5od8Gia0PtaadeF+KjPq9h9VLFg20oc9E8JXttJO0PqO5Gt9R2NrZZtIhZniiRX
	mlehkbG661rj+9Pci+73dqk77vVeWpHX1SUWXBh3JhyhhUTyCFTJbIycPBJbl345tWJp
	S0H0q5DCQZhetjGxt+TPSwKjgty47YAIch6E4DS/1Qonunct4VjrzFLl0Iywnnb2lXDf
	2Me8MGa/IBmJMa3j5QUzYVhsIHaj52tA8Y0AD4bKuSeFWJY2kyp7rg4Dndpd9fm9itFy
	mLPA==
X-Gm-Message-State: AIVw1106XeD//PbNu+CiS8xP2eLxw4vrUHzVy4jfS0mtayE9WqwLcme6
	jX/+gLXgWWA5jXlc840=
X-Received: by 10.55.198.145 with SMTP id s17mr20463088qkl.105.1500925035994; 
	Mon, 24 Jul 2017 12:37:15 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.81.71])
	by smtp.gmail.com with ESMTPSA id 5sm8590961qkk.75.2017.07.24.12.37.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 12:37:15 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 15:37:08 -0400
Message-Id: <1500925028-848-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-ldap: update to version 2.4.41
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Jul 2017 19:37:15 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-ldap_2.4.32.bb => python-ldap_2.4.41.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-ldap_2.4.32.bb => python-ldap_2.4.41.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python-ldap_2.4.32.bb b/meta-python/recipes-devtools/python/python-ldap_2.4.41.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python-ldap_2.4.32.bb
rename to meta-python/recipes-devtools/python/python-ldap_2.4.41.bb
index f25ad1e..3dbc8b1 100644
--- a/meta-python/recipes-devtools/python/python-ldap_2.4.32.bb
+++ b/meta-python/recipes-devtools/python/python-ldap_2.4.41.bb
@@ -15,8 +15,8 @@ PYPI_PACKAGE = "python-ldap"
 inherit pypi setuptools
 
 LIC_FILES_CHKSUM = "file://LICENCE;md5=a41c82edffa04912007cae1d20cac555"
-SRC_URI[md5sum] = "7c46c8a04acc227a778c7900c87cdfc7"
-SRC_URI[sha256sum] = "5810f1b5a9ae9255df99fb9c2dcab7352fed325687efda56c0faae1a82c5e3cb"
+SRC_URI[md5sum] = "18db2d009150ec1864710fea3ed76173"
+SRC_URI[sha256sum] = "6d430ecf040f2fc704ee316d3390cb1f5419c191371e1e131baef54a0e42cef0"
 
 do_configure_prepend() {
     sed -i -e 's:^library_dirs =.*::' setup.cfg
-- 
2.7.4



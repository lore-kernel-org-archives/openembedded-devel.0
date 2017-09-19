Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 749617806E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 14:45:11 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id f24so2447529qte.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 07:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Tc2x1o6zbZBewfKdpYGJ0OyafguDIANEcIKve3ZhtmU=;
	b=VqE5kyUz3GSRwIsqMD2EOIUZFLH8pB7DiXlSH0wOAUR1LOLGTwhX95lb1xR8xxsI3L
	3q4PgqEyLi2XKUWgyEH3umCj+7fb6eMSKz4K6E3iIoVq0u6jduHr6b2sThyb3G6iAnvB
	sT2iR/wDYKkEcd1KtOQFUzAg7KHkTkpml+XGJe8/MifoIhMwmF4kvDFtQQx74xIb/Ej2
	HS8C0JMbpHSmIOMqo7qzJ/jcE8dDXBVy3uVLsgBKPTBKlf2AahUKTHoZzGQDBTKy/+j4
	cj9axkYm3EmItUQKXUezR0kDUg7mGmumTyqYVewjh6xyaKmBAAZRZc36abkm8fysGLNv
	l2Zg==
X-Gm-Message-State: AHPjjUhsGYokPIEUV57w0Ce31TKpxrZuL0Ff9kxJa3uux4wKdNKRe6fU
	6XK2XNMx/dWdTdtJvCLZSWzknR4J
X-Google-Smtp-Source: AOwi7QD4Lw7ROFEGMYEdau0pF6eEn5/T05vLMDggrqd5fJdVNlyZRFpkosgVGSHEvtPjq0L+fUFVDA==
X-Received: by 10.200.44.207 with SMTP id 15mr2442605qtx.259.1505832312223;
	Tue, 19 Sep 2017 07:45:12 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	s37sm7042767qts.27.2017.09.19.07.45.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 07:45:11 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 10:45:06 -0400
Message-Id: <1505832306-9135-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-protobuf: update to version 3.4.0
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
X-List-Received-Date: Tue, 19 Sep 2017 14:45:11 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-protobuf_3.3.0.bb => python-protobuf_3.4.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-protobuf_3.3.0.bb => python-protobuf_3.4.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python-protobuf_3.3.0.bb b/meta-python/recipes-devtools/python/python-protobuf_3.4.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python-protobuf_3.3.0.bb
rename to meta-python/recipes-devtools/python/python-protobuf_3.4.0.bb
index 61b8fef..cde62b7 100644
--- a/meta-python/recipes-devtools/python/python-protobuf_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python-protobuf_3.4.0.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "27941e8e42e83d5183605054576882dd"
-SRC_URI[sha256sum] = "1cbcee2c45773f57cb6de7ee0eceb97f92b9b69c0178305509b162c0160c1f04"
+SRC_URI[md5sum] = "bfc0c61c156a995e909521697e755780"
+SRC_URI[sha256sum] = "ef02609ef445987976a3a26bff77119c518e0915c96661c3a3b17856d0ef6374"
 
 # For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
 BBCLASSEXTEND = "native"
-- 
2.7.4



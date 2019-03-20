Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB766B50A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2019 17:49:39 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id v14so98995wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2019 10:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=uzgXzU7yIgY6yoZ1b/3+Q54TJ1ZcwF679MgDTjP6B+U=;
	b=brualpjL0LztrKfVUjkd8D60oukt1ImVYqcvSr6sOHmAEycbMFsFFZuzmYRQms9N7X
	qE/omOO7SdrIzUhbNnUGzoomQZ60WYq7IZq+MYtcyFH6zYx1mkovy/Lvpt4Zd/p2uLmy
	Q436ieQPFZqWnsxSrmY1V33A6jAeB6Fs4fj+cPu/MP4q2JvfNPa6GBtbLaoFcirkh2P9
	UtYH8XHoGUuVuZX4642iZ04ar2PjukDOzsr4sRSmxypAcZilfw55ub+OnOtEXNESzWzb
	O5XJTDkkQHXEGZDCe69jmoSrif7/yewGOf+U6jWi7k7+LY41GtpKUrJB0uzyOAVYqpJt
	7uZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uzgXzU7yIgY6yoZ1b/3+Q54TJ1ZcwF679MgDTjP6B+U=;
	b=F4Mkst341d+eBcjHnXOexIxRyTRi9J2ji1pFY9OdzO5xkduFgGYI29w2Ot/pFdCsRn
	4dAEEPtaGO9bjRJ1We1f5+ta5hE9NIubiJEskAkPQDWrNkkVjcUvCWGAdVcgGYf0nNsf
	AT4flaiZQ9c20QbKubDV3ha6mhu4SSQP8pa4QC3KkdKFS6V6/4zPYqNhVucIH4sny1rc
	nr3fNxGV+nOiiqxxwn+Ipm70evQurQLxv3TftzglfYoCbn7ck0uOcxYFFlgfnknAietU
	y4E/3OJzVAQVwR/xHRQ18cMFMLYQ5NBiI2JGob0dNuIXk12jWFEOm7yEmCxGRMT8s/nh
	gFpA==
X-Gm-Message-State: APjAAAVjiaUt7NMC1/gYRqDjllKDvv5z58bcv5HvMJQONj7E4HS89FIJ
	gKT28vbH2M47X96CefVmWM3EPSZf
X-Google-Smtp-Source: APXvYqwB/TPnHJCVcMysm5xOp474BLivazydU55WrKMK1lwOEtipYw1hgv4yyqQXM4X9rYZSnf+lkQ==
X-Received: by 2002:a7b:c111:: with SMTP id w17mr9564908wmi.6.1553104179595;
	Wed, 20 Mar 2019 10:49:39 -0700 (PDT)
Received: from localhost.localdomain ([5.171.136.12])
	by smtp.gmail.com with ESMTPSA id
	a82sm3799778wmf.11.2019.03.20.10.49.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Mar 2019 10:49:38 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Mar 2019 18:49:33 +0100
Message-Id: <20190320174933.29364-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] cpprest: update to 2.10.11
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
X-List-Received-Date: Wed, 20 Mar 2019 17:49:39 -0000

---
 .../cpprest/{cpprest_2.10.10.bb => cpprest_2.10.11.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.10.bb => cpprest_2.10.11.bb} (89%)

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.10.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.11.bb
similarity index 89%
rename from meta-oe/recipes-support/cpprest/cpprest_2.10.10.bb
rename to meta-oe/recipes-support/cpprest/cpprest_2.10.11.bb
index cc9d5e105..8ab72ff5f 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.10.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.11.bb
@@ -10,8 +10,8 @@ EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake -DCPPREST_EXCLUDE_BROTLI=OFF"
 SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master \
            "
 
-# tag 2.10.10
-SRCREV= "91f66c625b6361d2edabf76eae30887b326b2447"
+# tag 2.10.11
+SRCREV= "a325079f7e1976e0485a212d8921ce9b837c1f2f"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1



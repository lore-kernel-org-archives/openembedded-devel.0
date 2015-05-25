Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id B0BE06AC95
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 21:14:31 +0000 (UTC)
Received: by wifw1 with SMTP id w1so8763264wif.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 14:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=++Y/zUzqwhX321mCBwKiPaJTvyhCLCigO1ZaljJ1Pxo=;
	b=bDG8A928PTU/j4+pF1f7P3X2E7Xjo9IU+iB4tngaplOcWB4EqMpT3hId6S7VE9Nbx9
	wzTHi0a/FplledFFQQHlLy7TJSV7gyqWR8qdtsJcW7iUKl9fE7TLVn06Onu0eaeCf6xV
	r0asCO2v9e4mlJGMnZHWVupYcrQ6JRwljkdqACHSF934lZjoBqB5+33lYQd7dECjcxbd
	0cral9fZqGcKgEsUGXJq1v9i0XxIRfpIPkBDS4sHSem9iV+Yp/4uc4WPmvOFeF6ktwcR
	MWoTnyMcyp1p+EYI/u3VDbfzPHe7/fUfHKWYf6lrD+3LKp7Dc7oNia572vsHmxvJQ0o/
	wDmg==
X-Received: by 10.194.9.6 with SMTP id v6mr43024976wja.13.1432588471940;
	Mon, 25 May 2015 14:14:31 -0700 (PDT)
Received: from localhost.localdomain (p5B0A35C6.dip0.t-ipconnect.de.
	[91.10.53.198])
	by mx.google.com with ESMTPSA id 16sm18515406wjs.41.2015.05.25.14.14.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 14:14:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2015 23:14:01 +0200
Message-Id: <1432588449-31413-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 04/12] poppler-data: update to 0.4.7
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
X-List-Received-Date: Mon, 25 May 2015 21:14:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../poppler/{poppler-data_0.4.6.bb => poppler-data_0.4.7.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler-data_0.4.6.bb => poppler-data_0.4.7.bb} (78%)

diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.6.bb b/meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb
similarity index 78%
rename from meta-oe/recipes-support/poppler/poppler-data_0.4.6.bb
rename to meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb
index 014ba7c..4f55e9f 100644
--- a/meta-oe/recipes-support/poppler/poppler-data_0.4.6.bb
+++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4870b98343f0bbb25fa43b9d2ba59448 \
 inherit allarch
 
 SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.gz"
-SRC_URI[md5sum] = "a8a7ca808827dd674faba6e4fc73b471"
-SRC_URI[sha256sum] = "f306901dfa5bda90cd6663d4eedb1c773c3c709de78018c79f1282b2c8f90afa"
+SRC_URI[md5sum] = "636a8f2b9f6df9e7ced8ec0946961eaf"
+SRC_URI[sha256sum] = "e752b0d88a7aba54574152143e7bf76436a7ef51977c55d6bd9a48dccde3a7de"
 
 do_compile() {
 }
-- 
1.9.3



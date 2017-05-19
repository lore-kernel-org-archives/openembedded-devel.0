Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id CE1D272F62
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 17:19:29 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id r58so10458790qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 10:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VqODhToU5dMUu/BOwq3GXhesNKTCyt/ltBX4uvio/Y4=;
	b=DsMEtzBShzEAvXL5jFVXMANBypTRZzUTocKdatt/r3nqS9vhv5stqmnrTR4iN6ZVxZ
	8w8RmozHAqfQfVNck7WsRLtif2cYezEC5lB3l0YAhS31P0eeD5Yru/Aq8cFzgSSv/sqE
	l9go2E1s++vOSVMOv9rzaWxoz/b86CznvtTAwH9R+cmQI64DH3yQ/qIOmK6TS3qLXMMp
	1wZlog0xmFgyX6DvA2/4GFQ1JXHolp9Zk2mPLjbbfZhCakS5Au/FjAX80FuaBU3aWCpQ
	mvqTDNjw8U2Cb8qM+bpO5mQbnjPw9Bzm76lRKxLe5eDfDYgk1Ucd4isrseisYSKY0R+M
	UGKQ==
X-Gm-Message-State: AODbwcB0dWD7vhN7rQsZoxosr+r7S6/Q8bQ63NNxq3vxFTABy7fpog7n
	ACl2ih1PI7W+bA==
X-Received: by 10.200.55.145 with SMTP id d17mr10719367qtc.57.1495214370829;
	Fri, 19 May 2017 10:19:30 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	k86sm6674736qkh.12.2017.05.19.10.19.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 10:19:30 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 13:19:22 -0400
Message-Id: <1495214362-30544-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-jinja: update to version 2.9.6
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
X-List-Received-Date: Fri, 19 May 2017 17:19:30 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-jinja2.inc                 | 4 ++--
 .../python/{python-jinja2_2.9.5.bb => python-jinja2_2.9.6.bb}         | 0
 .../python/{python3-jinja2_2.9.5.bb => python3-jinja2_2.9.6.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-jinja2_2.9.5.bb => python-jinja2_2.9.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-jinja2_2.9.5.bb => python3-jinja2_2.9.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python-jinja2.inc
index cf8010e..35cbb0b 100644
--- a/meta-python/recipes-devtools/python/python-jinja2.inc
+++ b/meta-python/recipes-devtools/python/python-jinja2.inc
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=20c831f91dd3bd486020f672ba2be386"
 
 PYPI_PACKAGE = "Jinja2"
 
-SRC_URI[md5sum] = "9e55f0db6620dd99a1b366183a94270d"
-SRC_URI[sha256sum] = "702a24d992f856fa8d5a7a36db6128198d0c21e1da34448ca236c42e92384825"
+SRC_URI[md5sum] = "6411537324b4dba0956aaa8109f3c77b"
+SRC_URI[sha256sum] = "ddaa01a212cd6d641401cb01b605f4a4d9f37bfc93043d7f760ec70fb99ff9ff"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-io ${PYTHON_PN}-pickle ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-math ${PYTHON_PN}-netclient ${PYTHON_PN}-re ${PYTHON_PN}-textutils \
diff --git a/meta-python/recipes-devtools/python/python-jinja2_2.9.5.bb b/meta-python/recipes-devtools/python/python-jinja2_2.9.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-jinja2_2.9.5.bb
rename to meta-python/recipes-devtools/python/python-jinja2_2.9.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.9.5.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.9.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-jinja2_2.9.5.bb
rename to meta-python/recipes-devtools/python/python3-jinja2_2.9.6.bb
-- 
2.7.4



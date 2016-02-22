Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id A688B771B6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:35:35 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id s5so55449470qkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:35:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JH2EhalKFOTuRK65m4yd9aJTuCOxDCagRfErHI/k7kk=;
	b=RrHwTgvQcKlzICidbY7KwMnTVW6eGo96NCQtUyQOKe/smLM4CiBxcgQXXn55wpJe5M
	78Ow4w0hhQgFbEmfWhf5k2Uqu5nYOVyHGABYbHW2FqrZqqB5QU4MADlvkX6yCiR5fp4C
	2lRNfY1hPkXcXznJUoUH//JKp+Bp9+x9mPgEIF4jHP8WcyP0WGNPNm5eyXk6HgLTW7/x
	8cX7ZnAfdhHCQ783RdR9JSsvbRlIUL06Byrn80QqQggxiW9rg3giluj/0NpFTm9f0mqX
	WNtdN9cft7spDz/XAgAotd0pNmHZ8iVUY4l9RodWZu/Ks6h2nwXo6GeXcD+ZTKDnSgjl
	pDKg==
X-Gm-Message-State: AG10YOR9Y8vp0Vl8xUL0V5iJOOMvjpsBxkimAGPAruPBn3Aez72Mf5Ms1AdpGTo05i0TqA==
X-Received: by 10.55.78.207 with SMTP id c198mr33720056qkb.34.1456148136559;
	Mon, 22 Feb 2016 05:35:36 -0800 (PST)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id w1sm10232368qha.3.2016.02.22.05.35.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 05:35:36 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 08:35:04 -0500
Message-Id: <1456148105-9644-10-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456148105-9644-1-git-send-email-derek@asterius.io>
References: <1456148105-9644-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 10/11] python-msgpack: update to 0.4.7
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
X-List-Received-Date: Mon, 22 Feb 2016 13:35:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-msgpack_0.4.5.bb => python-msgpack_0.4.7.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-msgpack_0.4.5.bb => python-msgpack_0.4.7.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb b/meta-python/recipes-devtools/python/python-msgpack_0.4.7.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
rename to meta-python/recipes-devtools/python/python-msgpack_0.4.7.bb
index 55a2ff1..3b7853e 100644
--- a/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
+++ b/meta-python/recipes-devtools/python/python-msgpack_0.4.7.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 
 PR = "r0"
 
-SRC_URI[md5sum] = "3b82bc542d5599896695512e7c32f42d"
-SRC_URI[sha256sum] = "a07cd6615a6bf38cfa2f010b121c7e77b74a3e7b971ef3e475c3d33308014cbb"
+SRC_URI[md5sum] = "eb2aad1081534ef3a9f32a0ecd350b9b"
+SRC_URI[sha256sum] = "5e001229a54180a02dcdd59db23c9978351af55b1290c27bc549e381f43acd6b"
 
 PYPI_PACKAGE = "msgpack-python"
 inherit pypi setuptools
-- 
1.9.1



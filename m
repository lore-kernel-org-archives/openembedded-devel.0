Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
	[209.85.167.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1B96460273
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 00:12:53 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id a142so7605000oii.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 16:12:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9sBd3kUk6+HuVG7x0XKotga2oxyZ2N2XQhpiG0Kc2GY=;
	b=LClhpWX9tp9OL58EAzD7waNXp/DdGrbgo0hSO+X5dNyklrC6dU3bh+Qjj1gbMe8eW2
	csHdQwfLFRhwUu+FLhZK7GFs/QJWJrg4lb4X9ceTFNeyymDWBQFyVpcDCuvVsWjNZUbb
	UYtW7jY88Gc+8ijW+/q5KgLeWf53bNguxyPKN1w7Obj0SmnE3nhJvY9vQJRHgoaKh7b2
	CBPVGBkMum1U+mBKUF0Za+e3I8raLTf8GeEYmyp3FFxGZWmrNnZ2lhBkprR8++9jl32w
	iE7lqtBJlsINU73dyz+yvxdpkhNzUm1J/p8UVaX8PoCEgeSN4m99MgnJ3/QvGa/CPX/g
	K5Uw==
X-Gm-Message-State: APjAAAW+auUzZRMbaay8nSq7C8C7DhIsR32tAlXVg/RLQM8vCGSr7mea
	zMLNMVP19savwQsO68FOACpA/d7lVAo=
X-Google-Smtp-Source: APXvYqwuFlWvFTcpIait8qTlOhWWDhsaWGsGmgHLWis87yjBWYqV61VzCbok9p5mDfaYiiKETXDzug==
X-Received: by 2002:aca:4c9:: with SMTP id 192mr9429313oie.105.1581293573607; 
	Sun, 09 Feb 2020 16:12:53 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	v23sm3886521otj.61.2020.02.09.16.12.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 16:12:53 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 19:12:36 -0500
Message-Id: <20200210001236.5421-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-anyjson: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Mon, 10 Feb 2020 00:12:53 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-anyjson.inc    | 13 -------------
 .../python/python3-anyjson_0.3.3.bb               | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-anyjson.inc

diff --git a/meta-python/recipes-devtools/python/python-anyjson.inc b/meta-python/recipes-devtools/python/python-anyjson.inc
deleted file mode 100644
index a0d20ff4d0..0000000000
--- a/meta-python/recipes-devtools/python/python-anyjson.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Wraps the best available JSON implementation available in a common interface"
-DESCRIPTION = "Anyjson loads whichever is the fastest JSON module installed and  \
-provides a uniform API regardless of which JSON implementation is used."
-HOMEPAGE = "https://bitbucket.org/runeh/anyjson"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=989aa97e73c912a83a3c873fa11deb08"
-
-inherit pypi
-
-SRC_URI[md5sum] = "2ea28d6ec311aeeebaf993cb3008b27c"
-SRC_URI[sha256sum] = "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba"
-
-RDEPENDS_${PN} += "${PYTHON_PN}-simplejson"
diff --git a/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb b/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
index 199e225b23..91c66724f5 100644
--- a/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
@@ -1,2 +1,13 @@
-inherit setuptools3
-require python-anyjson.inc
+SUMMARY = "Wraps the best available JSON implementation available in a common interface"
+DESCRIPTION = "Anyjson loads whichever is the fastest JSON module installed and  \
+provides a uniform API regardless of which JSON implementation is used."
+HOMEPAGE = "https://bitbucket.org/runeh/anyjson"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=989aa97e73c912a83a3c873fa11deb08"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "2ea28d6ec311aeeebaf993cb3008b27c"
+SRC_URI[sha256sum] = "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-simplejson"
-- 
2.17.1



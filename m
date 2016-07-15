Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id AF576606D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 19:27:32 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id p126so1780710qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 12:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+e735G1IAloowDqltx308K1Arr/4Qp33TSgO4lCtlFM=;
	b=AdJTnXhT1KHImDYX1JO/q8ITWIWP2ee6cPtBXGTDsquSjGvMmKy2L7bDqCGGwRgzQl
	9roBHxVG+bBADeuloojiCuHvffd0U82+i0+SphKirihS+gQUhT840nQPYLtPaiOJ6wGs
	I/ImU9lcmixdOcjK17Bt7cAKefOqZeZjmJWtatnBeVq+bzsjmmjGp0BUH5Hhl4nWE1+E
	iWsXlNH5cETKW6AA57XgBpnHe7kUuhRz9BfRXUifdK8HtwxjNT2kgWvgE4jsqX9e9k9I
	MJJwsG2CAakTeV7k6Xd3xF65DpBcFBsNsKHpUVYWyitOFxp17S+RgY1+XpYD7HOcgpiI
	dNKg==
X-Gm-Message-State: ALyK8tKy5I/fD73ajWFxAPItpZvrH2xur7QYE70zUi9L8HbWapDG3YaRdtAlfd5Cc4tOyQ==
X-Received: by 10.55.3.143 with SMTP id 137mr27962711qkd.154.1468610853257;
	Fri, 15 Jul 2016 12:27:33 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id u57sm235549qta.20.2016.07.15.12.27.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Jul 2016 12:27:32 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2016 15:27:23 -0400
Message-Id: <1468610843-9480-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-django-south: add package RDEPENDS
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
X-List-Received-Date: Fri, 15 Jul 2016 19:27:34 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-django-south_1.0.2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-django-south_1.0.2.bb b/meta-python/recipes-devtools/python/python-django-south_1.0.2.bb
index 4d071c4..3a27758 100644
--- a/meta-python/recipes-devtools/python/python-django-south_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-django-south_1.0.2.bb
@@ -8,6 +8,10 @@ SRC_URI[md5sum] = "c76a9758b2011bc3b6c39f881bba2f66"
 SRC_URI[sha256sum] = "d360bd31898f9df59f6faa786551065bba45b35e7ee3c39b381b4fbfef7392f4"
 
 PYPI_PACKAGE = "South"
-inherit pypi distutils
+inherit pypi setuptools
 
 BBCLASSEXTEND = "nativesdk"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-django \
+    "
-- 
1.9.1



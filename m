Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
	[209.85.210.51])
	by mail.openembedded.org (Postfix) with ESMTP id 005A660CE4
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 16:21:27 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id p8so3954707oth.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 08:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bBzWEcWYQMc5GZpvssoOetsXG+kFyHcyGOTPhU7lgKA=;
	b=ix1p8KlUhJrZI4fvHenpbph2t4U29x+mtA3kDI05NlBlBGJsV7c0O1g5gL30g5Zbic
	3ks5GJs30BjBxHVpuqn30ZEJtzTTg1igDCa0pR/T7XmV+1bRpHfqm8Cv7Uup1d46m4xt
	05RgeWEIA4A0GkQBUU6k1OleCOSZ5kkweRcLNz8+441WAWsE+ePOX5SxOagCTKyHc6yj
	I9jquS6BcZ/4+L3+Rhqc/Sp3xWqpjIkFZxhL2jlDsMyNCbH7oQJDtnbwE6vuWLm7jIzm
	XZVQYWRHsg4lG1r52VqVlBlebd7kv9m8sqaqu1DcbxdETEgFIliLMLg4j6pcwbysQiHE
	7Lgg==
X-Gm-Message-State: APjAAAUxydUH7GQug4MsCWQnuNrLXicA0tUsIP7rleNLGLoFHPT022sI
	nrtvjy0Odjya0WBRfXvOP9R7bfCllik=
X-Google-Smtp-Source: APXvYqw63Tr+VVvcbFBO68KE1jJleQvr9x9e6Ok4EtkO0xBzZQ2sDp+iPtNmgLm78GhWINwcptX3LA==
X-Received: by 2002:a9d:6a4f:: with SMTP id h15mr7317358otn.86.1581265288566; 
	Sun, 09 Feb 2020 08:21:28 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	k201sm1339532oih.43.2020.02.09.08.21.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:21:28 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 11:20:59 -0500
Message-Id: <20200209162059.18011-2-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200209162059.18011-1-derek@asterius.io>
References: <20200209162059.18011-1-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python3-aiohttp: alphabetize RDEPENDS for readability
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
X-List-Received-Date: Sun, 09 Feb 2020 16:21:28 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-aiohttp_3.6.2.bb        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
index 979acc9cff..6a466acb10 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
@@ -11,11 +11,11 @@ PYPI_PACKAGE = "aiohttp"
 inherit setuptools3 pypi
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-async-timeout \
+    ${PYTHON_PN}-attrs
     ${PYTHON_PN}-chardet \
     ${PYTHON_PN}-idna-ssl \
+    ${PYTHON_PN}-misc
     ${PYTHON_PN}-multidict \
-    ${PYTHON_PN}-yarl \
     ${PYTHON_PN}-typing \
-    ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-attrs \
+    ${PYTHON_PN}-yarl \
 "
-- 
2.17.1



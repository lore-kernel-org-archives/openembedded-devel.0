Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id C0A6578914
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 14:21:39 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o64so103637qkl.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 07:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=k2ZYCzHQWFVGA04DuCo6hYTkFuXh8ve22s8Z84DLlHg=;
	b=XX0sxahv4t3P9lYcveDzWkVf1/f8YS+lBvgnmEf3OUO7++3SMOhz1kNNXVLf8753v0
	x5z2FcAXWboN7Ia0mVuYV/OrctNp0Fva2oIaXDIkoBF9cZcA01Y099sJH/MSXmaAuW4V
	xY4bBo8cFpp5XwdToX30TdfxpCVstR4TGv6GhSjLEsetLXCutSMZfJPD61fcNzQ7oEOG
	IH5lMf9URwZPSxOsmju4wm/bHKFv4tQaB6KIoOFHCNvj+02cPLb08qSMJomBCHJwG7h/
	TCq8WAlkzy5+5ZU6oduZjNkRyAaHtxeQXPkSpZNRTDCoVqN4pjBQbN8IjuhKKieke5jy
	4kng==
X-Gm-Message-State: AElRT7Gkx8/ZnynyzS3noDpUk0J3Zc76401va/cPY6U0joBpdPExvV02
	S1cIgWnnd87iwGxIVSOiWEU6PpHS
X-Google-Smtp-Source: AG47ELtIumo4oAoknS4LMliMUZu5EziznhG7hanAZjKC9ZEYy80oorrz0XOCB0zNfYhbRNOOgJly/g==
X-Received: by 10.55.160.139 with SMTP id j133mr13209978qke.18.1521382900586; 
	Sun, 18 Mar 2018 07:21:40 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	s49sm6235994qth.50.2018.03.18.07.21.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Mar 2018 07:21:39 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 10:21:28 -0400
Message-Id: <1521382888-6059-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-msgpack: update to version 0.5.6
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
X-List-Received-Date: Sun, 18 Mar 2018 14:21:40 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-msgpack.inc                | 4 ++--
 .../python/{python-msgpack_0.5.5.bb => python-msgpack_0.5.6.bb}       | 0
 .../python/{python3-msgpack_0.5.5.bb => python3-msgpack_0.5.6.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-msgpack_0.5.5.bb => python-msgpack_0.5.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-msgpack_0.5.5.bb => python3-msgpack_0.5.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-msgpack.inc b/meta-python/recipes-devtools/python/python-msgpack.inc
index 2e852cc..fdc8926 100644
--- a/meta-python/recipes-devtools/python/python-msgpack.inc
+++ b/meta-python/recipes-devtools/python/python-msgpack.inc
@@ -2,8 +2,8 @@ SUMMARY = "MessagePack (de)serializer"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 
-SRC_URI[md5sum] = "62640290ea856420d83b7f9dc1dd789d"
-SRC_URI[sha256sum] = "7f5d6e59228b65c47cfdae76a4aea71f6902525f18256862cda69888a686b5f9"
+SRC_URI[md5sum] = "6d644c06a87a5a111bbbf5b34b4be440"
+SRC_URI[sha256sum] = "378cc8a6d3545b532dfd149da715abae4fda2a3adb6d74e525d0d5e51f46909b"
 
 PYPI_PACKAGE = "msgpack-python"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.5.5.bb b/meta-python/recipes-devtools/python/python-msgpack_0.5.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-msgpack_0.5.5.bb
rename to meta-python/recipes-devtools/python/python-msgpack_0.5.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-msgpack_0.5.5.bb b/meta-python/recipes-devtools/python/python3-msgpack_0.5.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-msgpack_0.5.5.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_0.5.6.bb
-- 
2.7.4



Return-Path: <keton22@gmail.com>
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
	[209.85.210.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA847ED7E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 08:02:47 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id 41so13370690oti.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 01:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=whaLa6JanEr2acg1oC/DwDwFW8G//P/SFVyuGIQoK3A=;
	b=uKB3/58/0Hcxrv7W+K7eMPZn71iFFX/WyRfd1RI/ISbIOqlsHgpQDZPgMZg/Zv3HiP
	OwU2hEJ0HZ2oZjwnhFNJ31l9d+ntdMAjcT88bq1mco6R7JVDzdMkSEbXLqxSXTv9JkDx
	XRTOgCbBU9ObHln96yDgvx+8iQOSuj8Gu8HkFKnnBYaJKj70Q0XJ7BHA+dbxekrMs9Sd
	PI6G+6ov1ZaDlyDhugS/JPP1nhsK3a3NPlaLw+JjQ4j0dL2SXjvCWonlmUYRY3a8C9sW
	KPlPEqwIQ0nZLOyM/PpEHHgzMt1jnXk+ZT6hX0c3syl4P0QeDOBpI5xozbvxts+J49iX
	fGKA==
X-Gm-Message-State: APjAAAWqeVYVdHtjIPA0n3MriFI2xMB9wFQRtBAWQgv2yyRGvGP/ZAC7
	XPqNZdRLMof6GB+ej9pe+WBEUmsezN0=
X-Google-Smtp-Source: APXvYqwRONL3+SJHSmwDg2cNDh4KjNvK0yI8OFSOkhz/Dlc7F8U6noxAMsNegjKhpji5lGLndWrmjw==
X-Received: by 2002:a9d:1f4:: with SMTP id e107mr1654944ote.288.1571731367823; 
	Tue, 22 Oct 2019 01:02:47 -0700 (PDT)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com.
	[209.85.167.171])
	by smtp.gmail.com with ESMTPSA id j21sm895773otp.47.2019.10.22.01.02.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 22 Oct 2019 01:02:47 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id v186so604801oie.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 01:02:47 -0700 (PDT)
X-Received: by 2002:a54:4f87:: with SMTP id g7mr1854377oiy.100.1571731366974; 
	Tue, 22 Oct 2019 01:02:46 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Micha=C5=82_Lower?= <michal@pcb.red>
Date: Tue, 22 Oct 2019 10:02:34 +0200
X-Gmail-Original-Message-ID: <CAJNJ+3e6C_gwQ7Oyq0xKTiDCo47SHcr5naChERq0wFrk+r7N9w@mail.gmail.com>
Message-ID: <CAJNJ+3e6C_gwQ7Oyq0xKTiDCo47SHcr5naChERq0wFrk+r7N9w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] update python setuptools-scm from 2.1.0 to 3.3.3
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
X-List-Received-Date: Tue, 22 Oct 2019 08:02:47 -0000
Content-Type: text/plain; charset="UTF-8"

Previous version fails to compile for zeus branch. Upgrading fixes that.

Signed-off-by: Michal Lower <michal at pcb.red>
---
 meta-python/recipes-devtools/python/python-setuptools-scm.inc | 4 ++--
 ...setuptools-scm_2.1.0.bb => python-setuptools-scm_3.3.3.bb} | 0
 ...etuptools-scm_2.1.0.bb => python3-setuptools-scm_3.3.3.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-setuptools-scm_2.1.0.bb
=> python-setuptools-scm_3.3.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-setuptools-scm_2.1.0.bb
=> python3-setuptools-scm_3.3.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm.inc
b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
index 98883ec39..a7e1bf6ad 100644
--- a/meta-python/recipes-devtools/python/python-setuptools-scm.inc
+++ b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
@@ -2,8 +2,8 @@ SUMMARY = "the blessed package to manage your versions
by scm tags"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM =
"file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"

-SRC_URI[md5sum] = "cfec5d2dbbd0a85c40066f79035b5878"
-SRC_URI[sha256sum] =
"a767141fecdab1c0b3c8e4c788ac912d7c94a0d6c452d40777ba84f918316379"
+SRC_URI[md5sum] = "50b2199082fe808d032ec1710c9d7415"
+SRC_URI[sha256sum] =
"bd25e1fb5e4d603dcf490f1fde40fb4c595b357795674c3e5cb7f6217ab39ea5"

 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_2.1.0.bb
b/meta-python/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-setuptools-scm_2.1.0.bb
rename to meta-python/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_2.1.0.bb
b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-setuptools-scm_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
-- 
2.17.1


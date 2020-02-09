Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
	[209.85.167.176])
	by mail.openembedded.org (Postfix) with ESMTP id 257AE60CA0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 16:33:10 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id c16so6983390oic.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 08:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4O28/Lejm/UjGWdRvr7HygLUvt785uNgirC3Mo/yQzg=;
	b=O75A+oodv9kFMXSHTJRRBh4TSxNta58Dl530VkK6ILs6f+dL/2YmREi/u3M0YpDzgf
	mk2jVu5LOgPs9xjdPbXq6ORFfjd/EYRmpTTHZEmlEXiake+yRKjgfBQdRG/mJy6XkZke
	SgI/94QultP07wLNW3UBfOXeNXynWE9jUNkeuPm0Dz2AqV2lB+VpPDQtgwY+5gkil5C0
	90V/wWN6CNPXWAATga9V1M566YQfxNMgNybpRmlwM0GKwOBPP0d6M9s1OhOJDdD04ta8
	Dhg/I3CoCGZIndw4ZgXuxQeDL7PZfIxRdVYn8CslPHKrMaf+SziUEMjI9xn4y8R9/pKI
	unfw==
X-Gm-Message-State: APjAAAWTMz3VxjYsJWA6oK2QQDUIT1/jf20USbX9r/HXlcSaLAGhkyai
	4FhukZHB/xk3F5kYg4NFhn66yN1EKRs=
X-Google-Smtp-Source: APXvYqwYfS/IgKfbRQv7gD+LvU78Bi1uQwWxdjRUEbbHcJzUJD0weDltDQ9PaAmxUPwsOTc+uLRWCw==
X-Received: by 2002:a05:6808:218:: with SMTP id
	l24mr7924361oie.108.1581265991794; 
	Sun, 09 Feb 2020 08:33:11 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	p83sm3136547oia.51.2020.02.09.08.33.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:33:11 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 11:32:59 -0500
Message-Id: <20200209163300.19063-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH][v2 1/2] python3-aiohttp: update to version 3.6.2
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
X-List-Received-Date: Sun, 09 Feb 2020 16:33:11 -0000

Consolidate inc & bb file into a single python3 version

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-aiohttp_3.5.4.bb        | 2 --
 .../python/{python-aiohttp.inc => python3-aiohttp_3.6.2.bb} | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-aiohttp_3.5.4.bb
 rename meta-python/recipes-devtools/python/{python-aiohttp.inc => python3-aiohttp_3.6.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.5.4.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.5.4.bb
deleted file mode 100644
index cd0303f05b..0000000000
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.5.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-aiohttp.inc
diff --git a/meta-python/recipes-devtools/python/python-aiohttp.inc b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python-aiohttp.inc
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
index e711ad71da..979acc9cff 100644
--- a/meta-python/recipes-devtools/python/python-aiohttp.inc
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cf056e8e7a0a5477451af18b7b5aa98c"
 
-SRC_URI[md5sum] = "85fe5c9037256c58d4678148bd91b3f3"
-SRC_URI[sha256sum] = "9c4c83f4fa1938377da32bc2d59379025ceeee8e24b89f72fcbccd8ca22dc9bf"
+SRC_URI[md5sum] = "ca40144c199a09fc1a141960cf6295f0"
+SRC_URI[sha256sum] = "259ab809ff0727d0e834ac5e8a283dc5e3e0ecc30c4d80b3cd17a4139ce1f326"
 
 PYPI_PACKAGE = "aiohttp"
-inherit pypi
+inherit setuptools3 pypi
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-async-timeout \
     ${PYTHON_PN}-chardet \
-- 
2.17.1



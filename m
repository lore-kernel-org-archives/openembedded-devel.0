Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id BC86D6011F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 20:00:45 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id b1so1068427qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wPzDQ0ydz5BEZqIou5u4Re5oNtBIbT7qgdmlex1csjk=;
	b=YWjlP1kTeic6LudNKK4Jh3CdzAcKKtg/joMpP+gpG74ZKXpdE/zr/hnrhFtzNWq/DE
	EmXviWwfhUVOr1wiB24YqbK3s4uLGuwwqzCdf8srYzBalCb0Dpl4d0VrXFApd6Omyhns
	FeZqHLsrAMxSbgvqM0lvuHOi7O17HFb7+kl/Oqh4hIsTxHTvuLcvM8a4PWbg4DXAlEa2
	tB9AAh1Rgf79K+KkxbCAGUvPRJ3ARi9Ey609teBADuh+f8ZEeJAvZ1f88KGH7cVBOn/z
	eXuZGSAkwq/EJoiCXfKNJOg73iKEGh/rwIXOLyC8v0gwFuCdwsbwcyIjUsVlotjAwXOq
	WZuA==
X-Gm-Message-State: AHPjjUijRT9WBeS9E/3Q+MSweqNx69hj5Z4UP3J5us6adl7082PXIGU3
	W6RY6qZlOvwow9Yi/W8=
X-Google-Smtp-Source: AOwi7QCdNo2dm0oZZgu7xIeteZFevGbWxEAZIdR2jJqDWVlH3Egbpkzi/AbZJ8K5RUKZ8RzWH1Ua5Q==
X-Received: by 10.200.45.208 with SMTP id q16mr54428520qta.103.1505764846097; 
	Mon, 18 Sep 2017 13:00:46 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	u49sm5846172qta.85.2017.09.18.13.00.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Sep 2017 13:00:45 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Sep 2017 16:00:39 -0400
Message-Id: <1505764839-6142-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-psutil: update to version 5.3.1
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
X-List-Received-Date: Mon, 18 Sep 2017 20:00:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-psutil.inc                 | 4 ++--
 .../python/{python-psutil_5.2.2.bb => python-psutil_5.3.1.bb}         | 0
 .../python/{python3-psutil_5.2.2.bb => python3-psutil_5.3.1.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-psutil_5.2.2.bb => python-psutil_5.3.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.2.2.bb => python3-psutil_5.3.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index cd6df26..c9a7f6d 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -2,8 +2,8 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
 
-SRC_URI[md5sum] = "bb98d48796cd76d9ccee871aad720f9c"
-SRC_URI[sha256sum] = "44746540c0fab5b95401520d29eb9ffe84b3b4a235bd1d1971cbe36e1f38dd13"
+SRC_URI[md5sum] = "529244aea5d32fb0c2ea46d80ce54abc"
+SRC_URI[sha256sum] = "12dd9c8abbad15f055e9579130035b38617020ce176f4a498b7870e6321ffa67"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
diff --git a/meta-python/recipes-devtools/python/python-psutil_5.2.2.bb b/meta-python/recipes-devtools/python/python-psutil_5.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-psutil_5.2.2.bb
rename to meta-python/recipes-devtools/python/python-psutil_5.3.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.2.2.bb b/meta-python/recipes-devtools/python/python3-psutil_5.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-psutil_5.2.2.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.3.1.bb
-- 
2.7.4



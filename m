Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id D38B460EC2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 02:42:31 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a6so235110plm.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Feb 2020 18:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fl48AvKYLlK2AMji4oFtUsCLjxQ9lG18ObJ4TlQWwqw=;
	b=FSHt8TTkHNx6a1i0UjDj9pxdIbo8OrJ6MUH3O45ZpbtF7lTBicQ36/E1/9QU56zhye
	OwJiaAYg7WrFKkRYO3qyGYVeU4l6tOsXhmx680Db1Hj463Eh6ZvopvKgl52IDQ+ueXmI
	O3nFqNtEFbWFETde8SrvQyqdHVWP3l92HwQtf9eeX5zi4AIGn9xEmxAR8fUn/HJBMupX
	iUjgIDnh4IPWW7MkqWMxy5hKQPRELhlccXsKUb/+SZJQVaG1XCKwHV1U+f5nWH0h1nPt
	ED1+fwpSmIWJUux/onKBqIegDRLMxzD+MQ2vB5OxoCWJyOLkoIygPrVkioXmN0jlkti9
	XHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fl48AvKYLlK2AMji4oFtUsCLjxQ9lG18ObJ4TlQWwqw=;
	b=YyLLqMvWinqUDhDwnyYcSJt2tnyC6L/BD1mkEEVDaB+PqNCIsT6+mfaj+iRYxrZlr4
	GD+Kjz6D5LHykyOX8Oc0B2KiD9Pugwg2s1ts8AWiuHlu359gPodf83AIaHeCp64Onryo
	mnacnzKCzXYwkrgrXduewwuw4w3hm9DBx9oRSmrEOBg1sAghBI7Q+Y615hvaFgy4i6Rv
	N8x9bMwgslqhlWVGVUuKMGf5I+5iDFpgi3jBeINIsOYCMljkT6uriNJ9IRgoTzEaoPkZ
	xUra331pOaX2yrLhM/2EK1m7RnHjBctDNJx9nSxBOz2YkRI12yjCZHr4hirSdenN0OA3
	w0Hw==
X-Gm-Message-State: APjAAAX2UQ44IBlSL6kZZCXxetrV2G65bmj0X5wglULUAWMs3gi49+gj
	bYEfyDfivy8qECcyLYdbDepQc//4jWc=
X-Google-Smtp-Source: APXvYqytZOqTSEngYfFBTbDSBXMrSr2r4bGmpcPbosbQsjGiVZfv88XBdqmGZufw6kDbWK03sFXVtg==
X-Received: by 2002:a17:902:6902:: with SMTP id
	j2mr3830803plk.235.1580870552390; 
	Tue, 04 Feb 2020 18:42:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1852])
	by smtp.gmail.com with ESMTPSA id
	70sm25952747pfw.140.2020.02.04.18.42.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 18:42:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Feb 2020 18:42:36 -0800
Message-Id: <20200205024236.1113324-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] cpuid: Upgrade to 20200203 and use perlnative for pod2man
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
X-List-Received-Date: Wed, 05 Feb 2020 02:42:32 -0000
Content-Transfer-Encoding: 8bit

Fixes
/bin/sh: pod2man: command not found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cpuid/{cpuid_20180519.bb => cpuid_20200203.bb}          | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/cpuid/{cpuid_20180519.bb => cpuid_20200203.bb} (83%)

diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20180519.bb b/meta-oe/recipes-devtools/cpuid/cpuid_20200203.bb
similarity index 83%
rename from meta-oe/recipes-devtools/cpuid/cpuid_20180519.bb
rename to meta-oe/recipes-devtools/cpuid/cpuid_20200203.bb
index 533a00026e..b0540e541a 100644
--- a/meta-oe/recipes-devtools/cpuid/cpuid_20180519.bb
+++ b/meta-oe/recipes-devtools/cpuid/cpuid_20200203.bb
@@ -8,11 +8,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz \
            "
-SRC_URI[md5sum] = "b3b4e44ef49575043a91def0207dcc76"
-SRC_URI[sha256sum] = "967823be36f23cbc972eb0aa882d069c1d155a5978990ac3bcf425e6a2e7ff9a"
+SRC_URI[md5sum] = "93e99fd3d0d6cd5401c0f84f2cce1d8f"
+SRC_URI[sha256sum] = "ebbd6448a1e416d95889a252f7e03a5429ad4f30bc84c7e8ede8086433e86c55"
 
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 
+inherit perlnative
+
 # The install rule from the Makefile has hardcoded paths, so we duplicate
 # the actions to accommodate different paths.
 do_install () {
-- 
2.25.0



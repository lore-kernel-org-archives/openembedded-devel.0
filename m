Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 29BE56004D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 08:07:48 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id a6so11890010plm.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 00:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KlWUqaqD4F3rdHcubW8+/2JXyGikeZchluwTolpoVA4=;
	b=sC47Ts+BqyiD8PpnaAB9dEDd2cDY7dhNX2MPGRcI35FD932Ufp3/T2NcGy/h0qeE5q
	8xa5hjOV24dqIa8irWFMfa6AddfwWGg3XZwIniQcBH7VzALnUlO7yCyLmxCkAKQexZRC
	v27D3HY7pRi/oFIewGhQyOo4xDa9OcQgMFy92rybwcVnlj+bEMOJAy9Co/uZr13jlPmh
	esbNDzvQbusH+LuY7MMM5F989dVVcWXW0KYe7UHkn9nfLcyY0Fuk+xgzIl3DRN1TzVmU
	8hbf8d3p3LB6zwJm7mXZwgUf9MZr44n2qDQ1lifb0gH+2EkhelTIytwDkqrYMLIAm5Xb
	JMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KlWUqaqD4F3rdHcubW8+/2JXyGikeZchluwTolpoVA4=;
	b=K7rngkxaDaEEPnP7wqC0Oz0s1xs/lqbF9jqCKqPqo+DPOqLTr/d4mUtYFilJRQoeHm
	+6WibArBelQbY7m6etNEn7ed5EsOU1oo5xF93E+h8daFiQ3ndFMWUnpQxE+5yxxPgg7n
	0ZvSbF89ihD9bunH1OnkbupzP2+9sPWwHsgdRlhEP+jfkyEzneaNPE7e3H6xrTtuR76C
	7kXbwY1wZymTeZypBuh23K6eZETjKg7VYGKUl2722q6lgnApg0OjgUewFNB8Df66+u4R
	zusf+IPfu4zgqf014krFsGkBF8ATQGBLKko0/9ML0JAKARO+byKgDa1+j5Z/O83abFXs
	d/1A==
X-Gm-Message-State: APjAAAW+ByIVficzuS/wqwy/o+F+S/TjH0t2U/bBTCSxr+o8TX/ivsUG
	k7dWIg6eca9Bl+unwcgGvvSSZXCfIcM=
X-Google-Smtp-Source: APXvYqz/Cv41HHgjIklyQRGW8kVL32kwpEHCRaD4jpvoktVow2LqwiRiEkvKfWwyOXT92fEgMhkK7Q==
X-Received: by 2002:a17:902:8c91:: with SMTP id
	t17mr55018488plo.225.1577520468669; 
	Sat, 28 Dec 2019 00:07:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	r66sm44135124pfc.74.2019.12.28.00.07.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Dec 2019 00:07:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Dec 2019 00:07:36 -0800
Message-Id: <20191228080740.63169-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/5] jsoncpp: Upgrade to 1.9.2
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
X-List-Received-Date: Sat, 28 Dec 2019 08:07:48 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../jsoncpp/{jsoncpp_1.8.4.bb => jsoncpp_1.9.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.8.4.bb => jsoncpp_1.9.2.bb} (93%)

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
similarity index 93%
rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb
rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
index 97fc6c73b2..a88410f2ff 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
@@ -11,7 +11,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"
 
-SRCREV = "ddabf50f72cf369bf652a95c4d9fe31a1865a781"
+SRCREV = "d2e6a971f4544c55b8e3b25cf96db266971b778f"
 SRC_URI = "git://github.com/open-source-parsers/jsoncpp"
 
 S = "${WORKDIR}/git"
-- 
2.24.1



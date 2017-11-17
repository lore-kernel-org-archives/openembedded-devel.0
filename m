Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3196978835
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 18:25:47 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id v137so428976qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 10:25:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8OLiQD/ZdxFBvC8PzVsR6xT2H5Mue+MyY1grvzOJgpw=;
	b=kC0ZGoDBLAtxXVpkAEy5zWSH4tIjsf8Q9JZTDKLKEZDD66tNJu/gaD2rNiNq9IZsU4
	vxJ13k/samY6s7aa9q/hpqDsafpz+/Rf92tOua48h6d0fpv7LTi14bMupuEXX6ALmAaW
	e3EP37kybWoVuMzIAz1s1MQIoQxWAESm7GJQyQc2dN6eIMdb1R7DR1EEAW3ojHaLkn6E
	29on0x/agAsFT/O6uNH++VMcDG/DZF+qdFMnK3v2A/CtoEw47M+PQR/eft13vXxYCOIe
	V2hTVSXbWFMV8G+JdiV/nUlsO1xp7w46nY39EwPs6aOPNPsJp0xA5XQ+RZghX95vcdNz
	gb5w==
X-Gm-Message-State: AJaThX6dQfI0n9hjNlcqCm2GtjUU9kKAKoB864p4UW9zgLGVR1KWeB6l
	1I7J70EtSgA5vGJqXzpzYLP1JeXz
X-Google-Smtp-Source: AGs4zMbtNx4GIbtg6essHBrISoh+daWmjjJHIgOxo+JVHVS4XKeDdjfu4kLVOZLNuRV2ePIASvR5jg==
X-Received: by 10.55.43.156 with SMTP id r28mr9737442qkr.316.1510943148741;
	Fri, 17 Nov 2017 10:25:48 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	f126sm2804124qkd.20.2017.11.17.10.25.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Nov 2017 10:25:48 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Nov 2017 13:25:41 -0500
Message-Id: <1510943141-24038-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510943141-24038-1-git-send-email-derek@asterius.io>
References: <1510943141-24038-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-grpcio-tools: update to version 1.7.0
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
X-List-Received-Date: Fri, 17 Nov 2017 18:25:48 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-grpcio-tools_1.6.3.bb => python-grpcio-tools_1.7.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-grpcio-tools_1.6.3.bb => python-grpcio-tools_1.7.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools_1.6.3.bb b/meta-python/recipes-devtools/python/python-grpcio-tools_1.7.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python-grpcio-tools_1.6.3.bb
rename to meta-python/recipes-devtools/python/python-grpcio-tools_1.7.0.bb
index 0fb136b..bb69973 100644
--- a/meta-python/recipes-devtools/python/python-grpcio-tools_1.6.3.bb
+++ b/meta-python/recipes-devtools/python/python-grpcio-tools_1.7.0.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "835f19142e26cb7ad68cec3a083ecda2"
-SRC_URI[sha256sum] = "57b3110ced50a18f1b2bf7da58ed011f57278b48084ed8013c67a34d42a5ca37"
+SRC_URI[md5sum] = "b2a25251b829aae9865aa77970fc1703"
+SRC_URI[sha256sum] = "217b1a6f7ef10b79d4c98585a10a81027311cb5ef1c95d82880e819da4655e52"
 
 # For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
 BBCLASSEXTEND = "native"
-- 
2.7.4



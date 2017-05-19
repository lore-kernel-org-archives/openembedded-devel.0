Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 205F2780C4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 18:00:47 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id u75so67182774qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 11:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vwfnB6vcgmvVZo0yDEZ+f1b4XPCTDqbR1QZtB5drJCM=;
	b=U8V9sJZS61w2rgTITPKYstF0v2odZCsn7tyBCIx7/Z8XpZkUZ2o012cW68OLgCdQGm
	W5EaQYcOsAwrAdsCup/HEoFwt86IEYk1Q06WKzv4VKR+fSO9NT70zEVr+FJZAGjhOG5b
	U2AYWbVnyWl7Su854pmh+6Ddz9P9/HWjdLPTi+/rxEJN0PQKvlnaPkLG0JJVYzN0H2TW
	k9OmdFKy7H0HqTSp3yf7zW6R9Y5+dO7JrBDZakkbe8Ar9Mz363IXGROnfFBK9bnMw/zc
	F/C1y5xghU8FqCeZZlqZH2B3jf8caJRRhJyynBErM5/pIE+3Q6f5lcFGkMCCB+S/xJI1
	SRlg==
X-Gm-Message-State: AODbwcCz5Gvw+e0R04Da1vWqlOki/jwasQfn9Vz+rINdCbp22NxHsm4q
	FERCvfd59mHlVg==
X-Received: by 10.55.110.132 with SMTP id j126mr11174871qkc.227.1495216848026; 
	Fri, 19 May 2017 11:00:48 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	o13sm6427899qke.30.2017.05.19.11.00.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 11:00:47 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 14:00:39 -0400
Message-Id: <1495216839-26220-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-certifi: update to version 2017.4.17
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
X-List-Received-Date: Fri, 19 May 2017 18:00:48 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-certifi.inc                | 4 ++--
 .../{python-certifi_2017.1.23.bb => python-certifi_2017.4.17.bb}      | 0
 .../{python3-certifi_2017.1.23.bb => python3-certifi_2017.4.17.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-certifi_2017.1.23.bb => python-certifi_2017.4.17.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-certifi_2017.1.23.bb => python3-certifi_2017.4.17.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-certifi.inc b/meta-python/recipes-devtools/python/python-certifi.inc
index 1df23cf..0318f7f 100644
--- a/meta-python/recipes-devtools/python/python-certifi.inc
+++ b/meta-python/recipes-devtools/python/python-certifi.inc
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRC_URI[md5sum] = "b72521a8badff5e89a8eabea586d79ab"
-SRC_URI[sha256sum] = "81877fb7ac126e9215dfb15bfef7115fdc30e798e0013065158eed0707fd99ce"
+SRC_URI[md5sum] = "db40445044feda1437ce3ccd5fc28a57"
+SRC_URI[sha256sum] = "f7527ebf7461582ce95f7a9e03dd141ce810d40590834f4ec20cddd54234c10a"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-certifi_2017.1.23.bb b/meta-python/recipes-devtools/python/python-certifi_2017.4.17.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-certifi_2017.1.23.bb
rename to meta-python/recipes-devtools/python/python-certifi_2017.4.17.bb
diff --git a/meta-python/recipes-devtools/python/python3-certifi_2017.1.23.bb b/meta-python/recipes-devtools/python/python3-certifi_2017.4.17.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-certifi_2017.1.23.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2017.4.17.bb
-- 
2.7.4



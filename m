Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id BC66379CB3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Apr 2019 22:00:37 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id y67so6951827ede.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Apr 2019 15:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=cde6vpKd2tvyUMzbhobcjsKJBwW+e2ok5MtY984UErM=;
	b=tU8JKpTys2eKB4BQzzX3ZTIpwqvPWxsnHVWTPf1ga4Qdypc6MuxtxYCGCNhdOPfFpb
	riaQbMqCcSw1UmLkQA1tQCghRSQ7lHu8FAPYPq26e+uWNjlia9robizlR4oVuF/56Oat
	9MGCwJ0eKTbrouH58qVLTBxzGJ05Z0MpSeD2hVSxCq5iS+nqPH/MsZeL0JnzAwIs+yZL
	D/eZLT4gi0Afe4i+e9LTIvNRqfuXIbSO1yHUbLXMMcFvny5J7YUtLRmX9n9iyPXISZf4
	Hpa7ouJNEVcBFwhxYzx+fYectCwsaDy3Xpq9VOy0XeAcZqzn9khGxQcfcpDeUHj/GzSs
	I/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cde6vpKd2tvyUMzbhobcjsKJBwW+e2ok5MtY984UErM=;
	b=gbwzsBDXYvRQimiWegI12VF0oWTEvdE9W2udwK2BAzI3js/Fg8iayKiKdoSnENlsTu
	j2PlZbin0uxnbYZAB8uWcTVLhZC7utp7mfnO+TVLiPGQDGlDCPjb+MmC7X4VOtWj6kLH
	BmtVEsI0uC/X9/7Fj7F9BIqoShW5q2CUMiio8rDgYUz2HMGDPzHFQSUPS9b/Kzbsl936
	xjyaIrSJ8f2Cxg4GxjT3U/PFaHfVXG+Cv2cZH+FEPgMdZhq9t25hu3o9B0K2Y0ODC0Ha
	MA4mVJgULixTLAsO7sII35VG1T0CZC560P1atuNTANm7bKoLshw2lY1LUW3DuZVczhUT
	Rm2A==
X-Gm-Message-State: APjAAAVEUbWJTVXHfyJ1T2PZTLRi1GXt0nnCJpYL0f99NrLoD+JECeOQ
	9mavtAR6RkY55ztXL4T0vnuaTeWO7qc=
X-Google-Smtp-Source: APXvYqwJPbwA6Kwbly+TZW4rsbZpj0EviCz5Hh9xdN0bjianyDnih3L1BZZg48Iq/sH5oFs8TLUYaA==
X-Received: by 2002:aa7:c715:: with SMTP id i21mr7012163edq.66.1555797637977; 
	Sat, 20 Apr 2019 15:00:37 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id 30sm2483037edr.2.2019.04.20.15.00.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 Apr 2019 15:00:37 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Apr 2019 00:00:21 +0200
Message-Id: <20190420220021.20694-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] nghttp2: update to 1.38
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
X-List-Received-Date: Sat, 20 Apr 2019 22:00:38 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../nghttp2/{nghttp2_1.37.0.bb => nghttp2_1.38.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/nghttp2/{nghttp2_1.37.0.bb => nghttp2_1.38.0.bb} (72%)

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.37.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.38.0.bb
similarity index 72%
rename from meta-networking/recipes-support/nghttp2/nghttp2_1.37.0.bb
rename to meta-networking/recipes-support/nghttp2/nghttp2_1.38.0.bb
index 50196d669..42b437933 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.37.0.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.38.0.bb
@@ -5,8 +5,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz"
-SRC_URI[md5sum] = "dc7536d02aa7d4883c20eaf637747381"
-SRC_URI[sha256sum] = "aa090b164b17f4b91fe32310a1c0edf3e97e02cd9d1524eef42d60dd1e8d47b7"
+SRC_URI[md5sum] = "45b47086ee6da8171e11887c1665f275"
+SRC_URI[sha256sum] = "ef75c761858241c6b4372fa6397aa0481a984b84b7b07c4ec7dc2d7b9eee87f8"
 
 DEPENDS = "libxml2 openssl zlib jansson cunit c-ares"
 
-- 
2.17.1



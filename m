Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6AA80719A1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jan 2017 02:50:50 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 194so32927pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 18:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ee2/Hwx62/dGFqbl412o1q2siZr1XLXPbiemDxr2Jgc=;
	b=o9zVYCsdKpCy0XNf+zZixbTJ06XTfuaIp1pmHOCXuEvAy764TYTUdz01AHF1vFv833
	Mwp/hehsb1XrL4dZCCov3cz9MQuFoKHn6X/IO1iC/GIpaFMFI98IgVMry3Qq+iviFWKx
	FQAbsUBSYpg6db8s0puzKT/cb+3jTSFHAHxquQ9LQXe8XAhl/lmZTXhl3/1EjnP8oZ8b
	JNrrEXuH4SuGdVpCUhROONTE0kCRRWJHoe57jA74tvi7cCv6f3Wftc87eLFx2EtcKa8F
	w9p3aDxK8SZ0nqaUHGljd9JfvPtJt8ubaRmifbWb5Nv+dwXNnKeBpdCvnW7oV1Kgn+3H
	oG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ee2/Hwx62/dGFqbl412o1q2siZr1XLXPbiemDxr2Jgc=;
	b=c3AMYS4DdeIz5nxB/UtMlAlx5x7EDCYX0QMfvf1Qs9z3xCcV/4lYeNXTb0tpYJD2Th
	4gP8YS5xRVJmscd1AdVcceO33pMp8Yd27XJvSqQ/fQRfL+mZDiZ1JeR8U/Vz1dfOLp5Y
	9x/c+ZY7jjAtPKpfahl6as4z2+371+mGfed7K/Bg3autqPnmwVAo1NHVTTmMDVHAWZfm
	21sqYQ+RH+T58y894EyHXyJDtuItpEPX0laCssohar3Qs0nzkLk20+BKrvT1SdvxoWxz
	CApUc78DgVfY4VnVhmLl7QkCdDS0REuIJ+eAgNIMhAr4FQmUFDZNdUJRR1mCEcs1xdd8
	0VTw==
X-Gm-Message-State: AIkVDXI+9CEbHYcA/u8E/6MgcSBaJusKkSd3Ti7xBl4jVVrTgqqPYIy2+g+auhYPyre3Gg==
X-Received: by 10.99.222.17 with SMTP id f17mr28057916pgg.2.1484362251113;
	Fri, 13 Jan 2017 18:50:51 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	w65sm31962739pfw.9.2017.01.13.18.50.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Jan 2017 18:50:50 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jan 2017 18:50:44 -0800
Message-Id: <1484362244-22391-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] rapidjson: explicitly disable unit tests
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
X-List-Received-Date: Sat, 14 Jan 2017 02:50:51 -0000

Normally the unit tests don't get compiled as gtest sources are not
available. However it's possible that gtest sources may be found on
the host, so make it explicit that unit tests should not be enabled.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
index 1a9abc8..dd6b896 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF"
+EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF"
 
 # RapidJSON is a header-only C++ library, so the main package will be empty.
 
-- 
1.9.1



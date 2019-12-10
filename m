Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id CDE687FC65
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 17:06:25 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id b11so4081074wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 09:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Gc1rlhBEnhadx2U4uQvcRA3PDDN3EwGdPi0eM31P/XU=;
	b=mZrgzAsXVc5trCKQ2VuRzwM81oEqD7ng0sqR0cb+dsKnWco7qZTRbCGrw4tlr3SufW
	FuBQIs1OD0hIweSPsbzr2TGv/2JF6LOvamHZlRAS4XnPZiy06thUcDiUo8cIcAAVwpF4
	ISLXBVwu7kG2bh46v6bp6sAIm0KcIQdnEuypmMEnuxSRAG+QsE+Ar0AHTTaMURZU9EFM
	Gq/jNWJNErrrF0kmz2xTS2/e/znZrBgeAM/YpKewSCW13nV9fg10Za3D1tcgz6OtwWdS
	xKlYnI2pIECMVoyQOMcmbRFEBBb1ldfUg6InwqZPmSnso+RDII9lfo8lQT5q5rK3sk6t
	CQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Gc1rlhBEnhadx2U4uQvcRA3PDDN3EwGdPi0eM31P/XU=;
	b=MM9hKQ+ziXnW/F3PVXVrBy8HPV7K7bVRwRANcMs8uQzp1Pd6cZlLE/WD/KVVvw2iDM
	F39Q3ziVVIx3fJZ3kS0QXFlkhuRudF/dkW/oejNyPwjFVEDEXUDZ9IQbgjs9cbpbA4H7
	FFXhxEj6J5u8vQ9GoPN4FV2hSMJ8wIEgLV9hxIRyhjEZRn0ex4rrfsAyY/PD/loJvSNr
	OaGqeReIK6CpYtkzXvOsaJnB/KP48tUhLBTqzjPyFjA0/7jWQzTBfXxduvcd2q/cEkgB
	25sEExhkIJWgmKBvUxyFedc/Rhk7tKIl9IU+FwS5jQmFBvdxmNcB2yRmLHBa1BWhLD55
	v+9A==
X-Gm-Message-State: APjAAAV/X4B83bFK34FJsqw1JAyQiqAeNAtD7PGi1y5ojsPXUXKnjI0Q
	PTALIuVeRFmWKlEQD9YE8uAQqgJSTaw=
X-Google-Smtp-Source: APXvYqwUGWSblo7sScCvhI2gRVXHe7ZwGyfAwAMtbzHXzHhIEkaIKfb4Vla1AFbiWffmgHMDprYmrQ==
X-Received: by 2002:a1c:9903:: with SMTP id b3mr6143869wme.139.1575997586416; 
	Tue, 10 Dec 2019 09:06:26 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q3sm3998443wrn.33.2019.12.10.09.06.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 09:06:25 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Dec 2019 17:06:18 +0000
Message-Id: <20191210170618.29764-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210170618.29764-1-ross.burton@intel.com>
References: <20191210170618.29764-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH][meta-python 5/5] python-lxml: remove redundant RDEPENDS_class-native
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
X-List-Received-Date: Tue, 10 Dec 2019 17:06:26 -0000
Content-Transfer-Encoding: 8bit

python3-native RPROVIDES python3-compression, so the class-native override isn't
required anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-python/recipes-devtools/python/python-lxml.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 5dc95e5026..df9573b433 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -48,4 +48,3 @@ BUILD_OPTIMIZATION_append_mipsel = " -O"
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS_${PN} += "libxml2 libxslt ${PYTHON_PN}-compression"
-RDEPENDS_${PN}_class-native = "libxml2-native libxslt-native"
-- 
2.20.1



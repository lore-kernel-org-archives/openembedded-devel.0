Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id DD26D786D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 11:08:33 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r78so2818276wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 03:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=OdgYuaNbJpWOznaKGKr8HK8qr2rQdafvMrnXPrFldmY=;
	b=da4EFZtagtEd/1XkYO6hARO0aNqBSwW3PIKiX4lw+yevQFeyfWde6mxipW5QpxXcJ0
	KNqRQelTwlEImihUskRtBl+iu59y9OZyayf9jJrTyHvq9bNs5lFHuEfWKFva6HT2clUn
	XT91sl4Ezoe4GgmNZ3v4R8b0790R5MMb/C4bIgb4pBcsvIjYCw77qJ5T3s1qNjkeC7RU
	ng2p0J/q4RTGryYoJL3VpRc6KMGXrxrAmiuQu+REyP788c4L7Woq6Z4H+6Eiqe1u1zRW
	ummRoa4wBP49PQK2K7AuX4/g9p/mKAspjZF32RdFB1Kdb9eurUEQgwGQikk6wcDvIYOx
	dRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OdgYuaNbJpWOznaKGKr8HK8qr2rQdafvMrnXPrFldmY=;
	b=HWFHOnxdnDjDYEeretwVw/XtTh2N2wLPAjohWnJWm+pSXdK1ymC/o5vZLdtV9QafR1
	IN16GooYWhRaHLeH1Y+Gg+Q9VHuPI9EAtIvyHaYAvaRkVQNzmiuxcIPdS3pM5x3gLXkP
	nA4vnBVStOEhwvgNNHZe8XCQn1sr2DhloL1gOtoKpa/tlssRWlIV8fr+Olod/N9Lc3uJ
	pBevL268qhwYxJObWAIvZClqEzhoQSR2SdnOUfVTM/Cf8ly+pjzIs+fuNcD6bEO5OCIj
	3IIJgYsy7QUxr8VgWYj/KfxwoNnrel6Fq6cpi2HNbAIp2Vx3zVussW3D+PFNAZsaJOri
	M21w==
X-Gm-Message-State: AKGB3mK0Yxn5KonK1wTQkPY4OlHsysrvSs/+e1+oTtJRA+cuB50h4jVa
	XtV6ZZKBp1rjRekVF0fq2PRJ8A==
X-Google-Smtp-Source: AGs4zMZsOneahAV6CbAZYt923lhJaxd3dGjrjmsJ3VIiDzCnd8hRc6yF/3FMI/OPFEiG0s+jghn89g==
X-Received: by 10.28.19.1 with SMTP id 1mr908306wmt.20.1512126514034;
	Fri, 01 Dec 2017 03:08:34 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.gmail.com with ESMTPSA id
	a126sm791054wma.11.2017.12.01.03.08.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Dec 2017 03:08:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 12:08:14 +0100
Message-Id: <20171201110816.13519-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171201110816.13519-1-schnitzeltony@gmail.com>
References: <20171201110816.13519-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/10] glm: update 0.9.8.4 -> 0.9.8.5
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
X-List-Received-Date: Fri, 01 Dec 2017 11:08:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend to build native recipe - meta-office says thanks.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-graphics/glm/{glm_0.9.8.4.bb => glm_0.9.8.5.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-graphics/glm/{glm_0.9.8.4.bb => glm_0.9.8.5.bb} (79%)

diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.8.4.bb b/meta-oe/recipes-graphics/glm/glm_0.9.8.5.bb
similarity index 79%
rename from meta-oe/recipes-graphics/glm/glm_0.9.8.4.bb
rename to meta-oe/recipes-graphics/glm/glm_0.9.8.5.bb
index 2d2e9ad..a174f2a 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.8.4.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.8.5.bb
@@ -10,13 +10,13 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://copying.txt;md5=4431606d144252143c9c3df384a74cad"
 
-SRC_URI = "git://github.com/g-truc/glm;protocol=https"
-
-SRCREV = "5dcc56489e1b66dfd5bca751fa9b8dc68059e008"
-
+SRC_URI = "git://github.com/g-truc/glm;branch=0.9.8"
+SRCREV = "6fa203eeb7fbcbb6f620501fad40359c8a456049"
 S = "${WORKDIR}/git"
 
 inherit cmake
 
 FILES_${PN}-dev += "${libdir}/cmake"
 RDEPENDS_${PN}-dev = ""
+
+BBCLASSEXTEND = "native"
-- 
2.9.5



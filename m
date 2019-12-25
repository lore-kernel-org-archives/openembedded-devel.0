Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 412CC7DDA5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Dec 2019 16:57:17 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id m13so2493201pjb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Dec 2019 08:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sHN0f8lbq9dnCSGBqnpGVMz7s52/TLbRdbVAIEoYWI8=;
	b=l9pRYa+ZVEQndeJcYe9MJIIH2eJwzU7A1yYjV8zy4zJfUU1HKCNr8XykKrNFX+ndiQ
	iL8rExX4wnK/dQ9fmpMAMtwsaJg7JSRYT0V7y2weCcck7Ym8qQlfOLdo6TIRk6n6tbj2
	thpyYNE0zJQtGt8mYubJ/OTIeymYynpSTPp8Df2AxtSR5afhUpU53ckDgDzej14yu6+Q
	PaR1E5s/lta5GXLelnq7iIYXtoML/tf5kYMqimT95p/XSFYKym0HWw5gNkLYfjnA+Xuk
	bMh2Acd4CJtg76WvckXaWg43sXHDgLgquVaGJuw3Mozne2vZbMo3uUuJBU7RPbP4xrYy
	oq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sHN0f8lbq9dnCSGBqnpGVMz7s52/TLbRdbVAIEoYWI8=;
	b=SJcebJ+ZnOXp+HDHwD4ZB7NhbkRYWu0g90xxesCrm3QDw+NMU5XOiPe4qVi1RaIAZp
	tV04IEO7xvXRsbNfuxiHUKBW5eCrn6lGazqeiQ4sPVhFjYTkQ0OXKI4ZJNYJeRshNeE4
	qWOQ3PqVgH8Op58ywMQQRFe6LwHkSeeGhdMm/SROQmL6FFwYdPUEndV9/DbSdW80Or+k
	r9dzQflBZT0w0Z1sfPsGauulboycN6XTlc+ZxQFfSgtzlNPqr1ovVeyNvknxFTts5RiG
	fl1VAeosfaeySrHEFjznZ1RNVY8W3+LQxJRECfJDaGj8vV0cio53js4Bx5vNF/STtkYQ
	zlNA==
X-Gm-Message-State: APjAAAVJctVcP3/6NKMQAJmQpe+hL0zvGXZnJao5DpvMU+gLILF4NeJl
	RdsO1YTVlI9CRBUrXBMp7XcwSzAdMns=
X-Google-Smtp-Source: APXvYqwxEU0On3dqqzJbb1qnvfxi+poN9R3v3uxq1RTLEaYR19sH3UTCqWXMsS0Ly7ufiqVYhGr4ww==
X-Received: by 2002:a17:90a:c588:: with SMTP id
	l8mr13647777pjt.69.1577293037842; 
	Wed, 25 Dec 2019 08:57:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	p23sm30380829pgh.83.2019.12.25.08.57.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Dec 2019 08:57:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Dec 2019 08:57:08 -0800
Message-Id: <20191225165709.2123137-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191225165709.2123137-1-raj.khem@gmail.com>
References: <20191225165709.2123137-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/3] memcached: upgrade to 1.5.20
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
X-List-Received-Date: Wed, 25 Dec 2019 16:57:17 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../memcached/{memcached_1.5.10.bb => memcached_1.5.20.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/memcached/{memcached_1.5.10.bb => memcached_1.5.20.bb} (92%)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.5.10.bb b/meta-networking/recipes-support/memcached/memcached_1.5.20.bb
similarity index 92%
rename from meta-networking/recipes-support/memcached/memcached_1.5.10.bb
rename to meta-networking/recipes-support/memcached/memcached_1.5.20.bb
index d2cafc9f6d..37a77c3648 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.5.10.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.5.20.bb
@@ -22,8 +22,8 @@ RDEPENDS_${PN} += "perl perl-module-posix perl-module-autoloader \
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
            "
-SRC_URI[md5sum] = "8462616b554183a75845b03c56837cca"
-SRC_URI[sha256sum] = "494c060dbd96d546c74ab85a3cc3984d009b4423767ac33e05dd2340c01f1c4b"
+SRC_URI[md5sum] = "4b64296ea0eeccdee9168c035e0488ab"
+SRC_URI[sha256sum] = "cfd7b023a9cefe7ae8a67184f51d841dbbf97994ed0e8a55e31ee092320ea1e4"
 
 # set the same COMPATIBLE_HOST as libhugetlbfs
 COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64|arm).*-linux'
-- 
2.24.1



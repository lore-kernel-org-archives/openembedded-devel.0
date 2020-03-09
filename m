Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id F087561147
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2020 19:37:02 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id m15so5162843pgv.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2020 12:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Vu0SEuOfBRhZCoVdhLPXcJfJzMi5ttSlSwFJDqptxEM=;
	b=nHSJhs+ShsMQEr4NoP3jmM06E6ohLIHkGpliLWjIrhIEN2hRo2ilLlXwWkSJ3+JRY3
	8Uqf7JNZjEox+jDummcbIDcAMGlnHPkf+WBLXGJcE73w4fEj2Ow1t8Hmhiq35T90yLJe
	QYEuVjY8UqOgQjv3y5sFNBRwLkjCegSlkI4Dy9T/G+hPiCpddY+0oVi9w5I9v8UvPtmB
	v0MAPRXqOe/KIlvCaku0z4fyDdaoLmhbmDp4AE+w8dlvztAEUpLHOCa7cRLv1SbOiJg8
	c9DJWs/VlXoeDkzDLnFiSkPcyjS3b5ZsHQJ6ABlIP6cTabu2Gl5BzFotFdj5FAf/dc0P
	UJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Vu0SEuOfBRhZCoVdhLPXcJfJzMi5ttSlSwFJDqptxEM=;
	b=SzVLmwRR06s1KYPcDZ74l41Nhn0fGxvpcCWO6OXRNxpQnf/SD0rlZhVCYKomN/1QHJ
	x7a1TtbEZ0sBbb/phRIX3y79KHhWwt4IpGsnblZX5J1NIrdNUe2K2wwdW1ZxAoqynIv6
	ePOOc0g8d3RA4AQfzVvejn6kGpWnY6ahveiZtoO4UzNgOmHqB0M3CHgpQd/OKKIP3+eg
	SaQV9ztDbJUJwd1/e34J7VLerd3Q9v6XksYxLJwFkVswfUFq2gCRFE5YNUAjFVy0nKz5
	CQDuzLNSD7MISncIv694QE3Z69mmLOPzNOrp4iHwDcsc6YHzIrJdp/pW33iKnYfif7Qm
	MHeA==
X-Gm-Message-State: ANhLgQ1lLFOX+Xmt8blPmN/A6H2SiXLXOQd9NOARetxXNJsTRS9F7rm+
	JR+yhKS+bGDqhES+FjfV8k34weII/eI=
X-Google-Smtp-Source: ADFU+vvaI8N/dhHkdrq4Cbc8U1WNUq6TOnd3iXKPj1Z0kah3VyPmrDuYeUthAVztbfMgj6MdT939zQ==
X-Received: by 2002:a63:155c:: with SMTP id 28mr17146286pgv.176.1583782623677; 
	Mon, 09 Mar 2020 12:37:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id
	s11sm16221436pfh.7.2020.03.09.12.37.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 12:37:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Mar 2020 12:37:12 -0700
Message-Id: <20200309193712.1028142-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200309193712.1028142-1-raj.khem@gmail.com>
References: <20200309193712.1028142-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 5/5] libde265: Update to 1.0.5
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
X-List-Received-Date: Mon, 09 Mar 2020 19:37:03 -0000
Content-Transfer-Encoding: 8bit

License-Update: Examples are now MIT see [1]

[1] https://github.com/strukturag/libde265/commit/4488ae0c3b287ef6f24a958004481b2b337abc76

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libde265/{libde265_1.0.2.bb => libde265_1.0.5.bb}      | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.2.bb => libde265_1.0.5.bb} (69%)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.2.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb
similarity index 69%
rename from meta-multimedia/recipes-multimedia/libde265/libde265_1.0.2.bb
rename to meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb
index cd075ffe1b..613dcc71bf 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.2.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb
@@ -4,13 +4,12 @@ simple integration into other software."
 HOMEPAGE = "http://www.libde265.org/"
 SECTION = "libs/multimedia"
 
-LICENSE = "LGPLv3"
+LICENSE = "LGPLv3 & MIT"
 LICENSE_FLAGS = "commercial"
-LIC_FILES_CHKSUM = "file://COPYING;md5=852f345c1c52c9160f9a7c36bb997546"
+LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
 SRC_URI = "https://github.com/strukturag/libde265/releases/download/v${PV}/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "93520b378df25f3a94e962f2b54872cc"
-SRC_URI[sha256sum] = "eaa0348839c2935dd90647d72c6dd4a043e36361cb3c33d2b04df10fbcebd3cb"
+SRC_URI[sha256sum] = "e3f277d8903408615a5cc34718b391b83c97c646faea4f41da93bac5ee08a87f"
 
 EXTRA_OECONF = "--disable-sherlock265 --disable-dec265"
 
-- 
2.25.1



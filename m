Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id CC1636012F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 02:45:29 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id f16so10509977plj.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 19:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ru2XJNvt2+1MKgXBeK6Kk7wtGHMQc6i/oSs3O0gs5Gs=;
	b=nbCpiozHO1fOxjeh8JWYW/tUqjnmU7GHDviGUy1TwTF8dOkwzbJ5+LNnzGiMtHjyig
	cO2lDrJgebD1BYOzV1+Eha24rjqiuiJTGjm7BI1kKnQePrNX+dsLEv/mYW57F4F3Pa3S
	9JzSa51F4gZp/wEqKEqITZa/9OA/28yH2RtLcgSrgLdN6B4iF9pdrLOKiLnEL2VI+b5d
	aCjIKqrZTY3oOcDRTuzxXI7g2AqUVN12d7ZNrkbnIITI0+uC+gt5kbgt9qgrqaOgF7qa
	YFSe9r8r0/RNC4G05doWngP8xgr5DSY6YebatRI/h3G96d+Rb4V6oRtfO1tR88rWgYDa
	WUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ru2XJNvt2+1MKgXBeK6Kk7wtGHMQc6i/oSs3O0gs5Gs=;
	b=bbKcaODbRkEwPfTmTn7PG1/GgVGtvoTBuBxoyqEq7TUjCQDYKIEbt5lTmzB3yjQYmf
	oDtIjy3+Dxf187P85W5AdzaYevgJeC004htw55lG+ShQmTyBBIAV5xRWly3hxOE4nJB8
	B+jtVHjNqKoK2ePvSFEo9BGIsfNecVs413g5QwA6aTc2EIGsfZfokKld+KdEGFZgqytf
	eF0p+7heJs1Grp8BProI4I4R55QG04jrZDi4yVWbiMN1tYFwfwi24l05PJ8P3Os0UN1o
	3SYYvYIDAIlc255b5KOloNSyvjLzJ5UYhFWb6LW+D9SFqhFOPZyccCc3SgxE+xevzckC
	aZOQ==
X-Gm-Message-State: ANhLgQ0PnY90ebSlfJXbiTcbtiym3ASXKo0Sx0t+utS8h5fVfXChwt87
	mjhsOTMMJkrf7YPvVmGZhgmo0hXiz5Y=
X-Google-Smtp-Source: ADFU+vuoC0PVee948p9TAfryv0iGU+Qr7bho9pFVGw4hcu4s1SCN6sQ60yvHObz2ceZOZdBuPTZ+3A==
X-Received: by 2002:a17:90b:3645:: with SMTP id
	nh5mr2400523pjb.150.1584499527931; 
	Tue, 17 Mar 2020 19:45:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::593])
	by smtp.gmail.com with ESMTPSA id
	y143sm4444922pfb.22.2020.03.17.19.45.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 19:45:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Mar 2020 19:45:40 -0700
Message-Id: <20200318024540.3962610-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] botan: Define --libdir to fix multilib build issues
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
X-List-Received-Date: Wed, 18 Mar 2020 02:45:29 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-crypto/botan/botan_2.13.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-crypto/botan/botan_2.13.0.bb b/meta-oe/recipes-crypto/botan/botan_2.13.0.bb
index 0854bd6728..4143264b44 100644
--- a/meta-oe/recipes-crypto/botan/botan_2.13.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_2.13.0.bb
@@ -19,14 +19,15 @@ CPU_armv7ve = "armv7"
 
 do_configure() {
 	python3 ${S}/configure.py \
-	--prefix="${D}${prefix}" \
+	--prefix="${D}${exec_prefix}" \
+	--libdir="${D}${libdir}" \
 	--cpu="${CPU}" \
 	--cc-bin="${CXX}" \
 	--cxxflags="${CXXFLAGS}" \
 	--ldflags="${LDFLAGS}" \
 	--with-endian=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
 	${@bb.utils.contains("TUNE_FEATURES","neon","","--disable-neon",d)} \
-	--with-sysroot-dir=${STAGING_DIR_TARGET} \
+	--with-sysroot-dir=${STAGING_DIR_HOST} \
 	--with-build-dir="${B}" \
 	--optimize-for-size \
 	--with-stack-protector \
-- 
2.25.1



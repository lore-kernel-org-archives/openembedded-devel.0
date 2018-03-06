Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5E71978A5C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 14:06:03 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id s188so24940112qkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 06:06:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Fs1QMe9UVVeF8qzISWZRG7E+y/cLCbTfFn4uLSMjztw=;
	b=fOv5dL80WUFcJIhIJGCKS2BaDe/Ju28Sei8XwuB4IJhJJ0n6iBXcho6H1Mg1dKrYZN
	e5u3CaKXHkpZPsRh+5C/BO8n/H5jjNG2s08RiL2umQVNIYu6wzCl322ItI3RIlPAjM3n
	/JBQx2ZvcGteVSVj33g3Ssip2CoXvWLKTlEfNUZ6yzG3mUb6oCcwLt32vWs4LNYVlhjQ
	5RcycGoW5BzufxuPO9jVQiFwzB0tsXUyRSXe/mclg1DrftTNLu9YLgyW/ht/nZ0wIusq
	xUWjw7HwUboKlcR++QBFs/UKqi+nRcgD4T6hAfg5+zCvOAcDOs8hKowaLCnvrIs0MzRI
	IZkA==
X-Gm-Message-State: AElRT7HrmTxnyQDH9fdB3azhqSTJldmXQgMVUTNZKluzceM1MybQHl3q
	fJ/CFO0r9XFO+zjRR3iQVzdeq7e2
X-Google-Smtp-Source: AG47ELtAYFSveWoZufsp1aBN7dTl7Y7K83XvG0dmGY9CUAztbm8N+715M/oK3GlhsKBpLW9AQjnu2Q==
X-Received: by 10.55.27.18 with SMTP id b18mr26591045qkb.355.1520345164762;
	Tue, 06 Mar 2018 06:06:04 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	n28sm10716798qki.49.2018.03.06.06.06.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 06:06:03 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 09:05:57 -0500
Message-Id: <1520345157-12212-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] soci: update to version 3.2.3
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
X-List-Received-Date: Tue, 06 Mar 2018 14:06:04 -0000

Add dos2unix as the source now has windows line endings

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-dbs/soci/{soci_3.2.2.bb => soci_3.2.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/soci/{soci_3.2.2.bb => soci_3.2.3.bb} (91%)

diff --git a/meta-oe/recipes-dbs/soci/soci_3.2.2.bb b/meta-oe/recipes-dbs/soci/soci_3.2.3.bb
similarity index 91%
rename from meta-oe/recipes-dbs/soci/soci_3.2.2.bb
rename to meta-oe/recipes-dbs/soci/soci_3.2.3.bb
index 1f5a485..3f22d38 100644
--- a/meta-oe/recipes-dbs/soci/soci_3.2.2.bb
+++ b/meta-oe/recipes-dbs/soci/soci_3.2.3.bb
@@ -12,8 +12,8 @@ DEPENDS = "boost"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BP}/${BP}.tar.gz \
            file://soci_libdir.patch \
           "
-SRC_URI[md5sum] = "bc3c35f6cd3f80a1be19fe30b3c111bf"
-SRC_URI[sha256sum] = "30ea2f4d26639ef5b5cdc24fb300b3896746243dbb77b743582de2ff443ccb1c"
+SRC_URI[md5sum] = "acfbccf176cd20e06833a8037a2d3699"
+SRC_URI[sha256sum] = "2c659db0f4f7b424bbcffe195c03c293a1dbf676189a27b077fb2aab4d53a610"
 
 TESTCONFIG = '-DSOCI_TEST_EMPTY_CONNSTR="dummy" -DSOCI_TEST_SQLITE3_CONNSTR="test.db" \
               -DSOCI_TEST_POSTGRESQL_CONNSTR:STRING="dbname=soci_test" \
@@ -38,7 +38,7 @@ PACKAGECONFIG ??= "empty"
 EXTRA_OECMAKE = "${EXTRA_OECONF} -DSOCI_LIBDIR=${libdir}"
 DISABLE_STATIC = ""
 
-inherit cmake
+inherit dos2unix cmake
 
 PACKAGES += "${PN}-sqlite3 ${PN}-mysql ${PN}-postgresql ${PN}-odbc ${PN}-oracle"
 
-- 
2.7.4



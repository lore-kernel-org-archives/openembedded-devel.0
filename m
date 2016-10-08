Return-Path: <igor.socec@pelagicore.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA5A6014F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Oct 2016 10:10:00 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id b75so56925089lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Oct 2016 03:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=STaofX5lu33Uakwy8xQ/5xaqDIdM09lvD7IZiEiSKSw=;
	b=MSRSyPYdxKCgoeb7xbGY0K/0wc7Ct/m9Q/ECB+EqsKB3jR/xXQOBkbOG0W6zzDBA6U
	KRgUhL7skSeIZterlt+35VvUUIy/+glhvJPIJCPy9AhhSdbDilIAiLrbGGjkjXkxdLaR
	pKRgpv3YBa/Zxu6NXepgwQ12pTFweG04q7QLlabzfIHKdG3RiR16gs8Ev68gF+4IL+O7
	ssqVJnfc1fI2sdMcEteQf72VL3v0tS5b4OCyAC6p41maAw+hOQFGJvHx+so5LfYXgE0r
	10s1g2bzRfq/zGxVkeksXE2A0LxrVnNDBfMU6MHxMJ9H4YigHQGjBmgeVJNsbWg6QclB
	ftDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=STaofX5lu33Uakwy8xQ/5xaqDIdM09lvD7IZiEiSKSw=;
	b=K71mfr8Dcvx1rS/HuVFnJNTU6QX4kkK4qcwRqKPVhiI0J4V5HE73sa0tolzjH5v6pe
	vC0EkVlNuanNQBVVrd8qnT6ynl9nBkMmeXHyIBqLjW7px/22bZuILkeGhUNkLYWsiq5Y
	pHpYHX239hEecRfoBm7Ur/BimfQ6E8/WvvciBJ4x2gprQ3v2aKzwk72kazQ/bb/ryDU0
	ZVzEdaREBHa0kkA72yaPA3hX5vvhKrRazx4nAzPqjV1ZvBE3nnLtqNHzWTXTvVQvYEAC
	aYY5Swyr2Ad6eLAXCHyL3+viEfeqtXNFYA35JBMYB5NqqMoE6l0nMI4W43AwjJNbpv/I
	SfsA==
X-Gm-Message-State: AA6/9Rk9Q0hrbTJB8jaALrgM99F7ARjKSkK3GhpCyIjvYGxptpptY7/1eoV1Kr4urCGtSXHi
X-Received: by 10.46.0.133 with SMTP id e5mr3283839lji.50.1475921401257;
	Sat, 08 Oct 2016 03:10:01 -0700 (PDT)
Received: from localhost.localdomain (c83-248-119-238.bredband.comhem.se.
	[83.248.119.238])
	by smtp.gmail.com with ESMTPSA id i80sm4282442lfg.6.2016.10.08.03.10.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Oct 2016 03:10:00 -0700 (PDT)
From: Igor Socec <igor.socec@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Oct 2016 12:09:50 +0200
Message-Id: <20161008100950.5978-2-igor.socec@pelagicore.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <CFF7DF6C-0418-4E89-BC99-98A7101F5237@gmail.com>
References: <CFF7DF6C-0418-4E89-BC99-98A7101F5237@gmail.com>
Subject: [meta-oe][PATCH v2] jansson: update to 2.9
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
X-List-Received-Date: Sat, 08 Oct 2016 10:10:03 -0000

Improved build, tests and documentation.

New features: functions and macros (*pack, *foreach, *string*, *alloc*)

Security fixes: CVE-2013-6401

Bugfixes:
- Number parsing and overflows
- Fix l_isxdigit() macro (#97).
- Check for NULL key in json_object_get() and json_object_del() (#151).
- Enhance hashtable seeding on Windows (#162).
- json_unpack(): Allow mixing JSON_STRICT with optional keys (#162, #163).
- Fix int/int32 mismatch (#142).
- Parse subnormal numbers correctly (#202).
- Fix a crash when parsing inputs consisting of very deeply nested arrays or objects (#282, #284).
- Never convert numbers to integers in the parser when JSON_DECODE_INT_AS_REAL is set (#212).
- Handle out-of-memory situations gracefully in the hashtable implementation (#298).

The copyright date in the LICENSE file was updated for 2016.

Signed-off-by: Igor Socec <igor.socec@pelagicore.com>
---
 meta-oe/recipes-extended/jansson/{jansson_2.4.bb => jansson_2.9.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/jansson/{jansson_2.4.bb => jansson_2.9.bb} (53%)

diff --git a/meta-oe/recipes-extended/jansson/jansson_2.4.bb b/meta-oe/recipes-extended/jansson/jansson_2.9.bb
similarity index 53%
rename from meta-oe/recipes-extended/jansson/jansson_2.4.bb
rename to meta-oe/recipes-extended/jansson/jansson_2.9.bb
index c235729..455b374 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.4.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.9.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Jansson is a C library for encoding, decoding and manipulating JSON data"
 HOMEPAGE = "http://www.digip.org/jansson/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6946b728e700de875e60ebb453cc3a20"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8b70213ec164c7bd876ec2120ba52f61"
 
 SRC_URI = "http://www.digip.org/jansson/releases/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "c4629b89bf0432f3158c461e88fe0113"
-SRC_URI[sha256sum] = "1fcbd1ac3d8b610644acf86a5731d760bb228c9acbace20a2ad0f23baec79b41"
+SRC_URI[md5sum] = "84abaefee9502b2f2ff394d758f160c7"
+SRC_URI[sha256sum] = "0ad0d074ca049a36637e7abef755d40849ad73e926b93914ce294927b97bd2a5"
 
 inherit autotools pkgconfig
 
-- 
2.9.3



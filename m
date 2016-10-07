Return-Path: <igor.socec@pelagicore.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id A83D36FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 08:51:31 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id b81so35783894lfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2016 01:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=M/jTmnEQNZfNIewQoTZajs3OknBEwDE42n93B8dgikY=;
	b=HxznFUYwlAQCT11pJkS+8euYWTtjq7J3tJchkzIw2D3Vinro8O9F5vCILdz+O6mA6b
	5YUL8OlporYpGPEBG2hXpPJUtTsbtVp3jUQx4o2zFgcR2elDHdGtkRcDJ9tFtgx96dSJ
	7HWDwb9cQ8PwtheauNQqisugdbQnwLqvfukps4y4w1k8PVnhQmr5d/XMV1H2bNXW61Wf
	ciNBeAtNX1Hr6vrHK2CQW0in/GBZwJTS6JUhFycIbSzbjL/tsZGZtTZS6GHUbu+o+/ye
	KAovmBoxO1kPsNmY8m8JyVEY4AGp25pcQfAzqIyEXDhPfrGbtImGbtDm8XD+svYkh4TY
	SI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=M/jTmnEQNZfNIewQoTZajs3OknBEwDE42n93B8dgikY=;
	b=GY+ScLyb6yrED4NV84PMhXusBNPLnNY063OlGOw7R2tvtake+jYBl20GV11xVLaRAo
	WlQLd4w3nyLJYNFLOnHTFp0YuKixkoERQCMwqG5LgFO3HjAzfnuqpMbYoubCaI2jhYg0
	9bMgWWM4rki/s9j4vl/yBentIxQdZ6e8tSGc8oEJ9u9H/mTHQOWE34bOu69JGSHxnq0G
	e5fzzHezaLy4ct+JBut+Ld6EnwLSRUd5CyTm8/T/OD61SwoE9Z+YWRZrZ+/ASQNsH2+i
	du6B72Lcf2fk/xFxBv6SjQGjafOnAqfzqCmj0vKI0/uaT7smwEc8zW9LGvrfwAmEvlTH
	iFpA==
X-Gm-Message-State: AA6/9RmmWPbCm+D5LG1LmtRAp0wLc6PhpCa/fM6YGFtTxhpQfARigKaIb9qREN10ec6uSAqY
X-Received: by 10.25.203.141 with SMTP id b135mr8072684lfg.169.1475830291908; 
	Fri, 07 Oct 2016 01:51:31 -0700 (PDT)
Received: from mydeb.mecel.net (static-212-247-53-108.cust.tele2.se.
	[212.247.53.108])
	by smtp.gmail.com with ESMTPSA id 204sm3421774ljj.2.2016.10.07.01.51.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Oct 2016 01:51:30 -0700 (PDT)
From: Igor Socec <igor.socec@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Oct 2016 10:51:21 +0200
Message-Id: <20161007085121.16502-2-igor.socec@pelagicore.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <CAMKF1soNE54yHLS5tm25yZa68d=vitr7ETHjEWbqK10_-etxFw@mail.gmail.com>
References: <CAMKF1soNE54yHLS5tm25yZa68d=vitr7ETHjEWbqK10_-etxFw@mail.gmail.com>
Subject: [meta-oe][PATCH] jansson: update to 2.9
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
X-List-Received-Date: Fri, 07 Oct 2016 08:51:32 -0000

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



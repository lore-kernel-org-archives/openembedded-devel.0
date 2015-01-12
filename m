Return-Path: <akuster808@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8CED265C85
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 12:30:40 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id t59so9381993yho.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 04:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Ovn0LvDVDVzeT1cwmoE5/ClocGXW1yGpuY8w6UgfROM=;
	b=mmFSGkS5wJ2qgtSD+U+Ok30E5n06YxO+CbPir38aJWQNjKiYh1a3KjnU2QxddFwGl3
	hZgmRGM+FDbkFS2BT7t/ZgOg9IUZvfaVeZQrvDDLJmNwnxnn5p47ymJ8ntDT23fjQmM+
	utQmbxWVVWz6m/29QmsL8zkXSRLNxJeofCzRNTsrQi06Ac9goiMQ5tY5ay/Xf5Kt5Ex0
	bHgOL+S6IhODMln6AhXfKqGsmggMJ2fOwjNn8ZF14DITKjnoShjW9etVCh4fu7L0/MtR
	ItCk/MVubA8asfsywebRg7XmcGS5oaN9NKqOLJv04L3vKtrrQ8o5cYnLYKsqyCCRi/RA
	ioeQ==
X-Received: by 10.170.91.194 with SMTP id i185mr25448803yka.20.1421065840303; 
	Mon, 12 Jan 2015 04:30:40 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	l70sm10438809yha.18.2015.01.12.04.30.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Jan 2015 04:30:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jan 2015 04:30:34 -0800
Message-Id: <1421065834-29221-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: otavio@ossystems.com.br
Subject: [meta-oe][dizzy]PATCH] php5: update to later minor version 5.4.36
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Jan 2015 12:30:52 -0000

Dizzy is missing several CVE's and upgrading to a later version within the same
series seems reasonable since most changes are bugfixes or Security releated.

if you are ok with this approach, please Ack and I will stage this with the next series of updates I am working on.

- armin

18-Dec-2014
Core:
    Upgraded crypt_blowfish to version 1.3.
    Fixed bug #68545 (NULL pointer dereference in unserialize.c).
    Fixed bug #68594 (Use after free vulnerability in unserialize()). (CVE-2014-8142)

Mcrypt:
    Fixed possible read after end of buffer and use after free.

13 Nov 2014
Core:
    Fixed bug #68365 (zend_mm_heap corrupted after memory overflow in zend_hash_copy).
Fileinfo:
    Fixed bug #68283 (fileinfo: out-of-bounds read in elf note headers). (CVE-2014-3710)
GMP:
    Fixed bug #63595 (GMP memory management conflicts with other libraries using GMP).
PDO_pgsql:
    Fixed bug #66584 (Segmentation fault on statement deallocation).

16 Oct 2014
Fileinfo:
    Fixed bug #66242 (libmagic: don't assume char is signed).
Core:
    Fixed bug #67985 (Incorrect last used array index copied to new array after unset).
    Fixed bug #68044 (Integer overflow in unserialize() (32-bits only)). (CVE-2014-3669)
cURL:
    Fixed bug #68089 (NULL byte injection - cURL lib).
EXIF:
    Fixed bug #68113 (Heap corruption in exif_thumbnail()). (CVE-2014-3670)
OpenSSL:
    Reverted fixes for bug #41631, due to regressions.
XMLRPC:
    Fixed bug #68027 (Global buffer overflow in mkgmtime() function). (CVE-2014-3668)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_5.4.33.bb => php_5.4.36.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_5.4.33.bb => php_5.4.36.bb} (97%)

diff --git a/meta-oe/recipes-devtools/php/php_5.4.33.bb b/meta-oe/recipes-devtools/php/php_5.4.36.bb
similarity index 97%
rename from meta-oe/recipes-devtools/php/php_5.4.33.bb
rename to meta-oe/recipes-devtools/php/php_5.4.36.bb
index 6fdfe0f..43c7736 100644
--- a/meta-oe/recipes-devtools/php/php_5.4.33.bb
+++ b/meta-oe/recipes-devtools/php/php_5.4.36.bb
@@ -30,8 +30,8 @@ SRC_URI_append_class-target += " \
             file://php-fpm-apache.conf \
           "
 
-SRC_URI[md5sum] = "c6878bb1cdb46bfc1e1a5cd67a024737"
-SRC_URI[sha256sum] = "1a75b2d0835e74b8886cd3980d9598a0e06691441bb7f91d19b74c2278e40bb5"
+SRC_URI[md5sum] = "70e223be4bb460e465b7a9d7cb5b9cac"
+SRC_URI[sha256sum] = "b0951608c3e8afb978a624c7f79a889980210f5258f666c1d997bd6491e13241"
 
 S = "${WORKDIR}/php-${PV}"
 
-- 
1.9.1



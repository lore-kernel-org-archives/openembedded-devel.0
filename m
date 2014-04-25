Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo02.lge.com (lgeamrelo02.lge.com [156.147.1.126])
	by mail.openembedded.org (Postfix) with ESMTP id 399C965D2A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 07:00:31 +0000 (UTC)
Received: from unknown (HELO CHBae0915) (10.177.232.191)
	by 156.147.1.126 with ESMTP; 25 Apr 2014 16:00:31 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: "Changhyeok Bae" <changhyeok.bae@lge.com>
To: <openembedded-devel@lists.openembedded.org>
References: <1398409067-31641-1-git-send-email-changhyeok.bae@lge.com>
	<1398409067-31641-2-git-send-email-changhyeok.bae@lge.com>
In-Reply-To: <1398409067-31641-2-git-send-email-changhyeok.bae@lge.com>
Date: Fri, 25 Apr 2014 16:00:49 +0900
Message-ID: <013501cf6054$17016340$450429c0$@lge.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQICY4QvDwn3ObWduOAN3+9pTPiI0ACjDw8SmrbIXuA=
Subject: Re: [PATCH 2/2] lzip: Upgrade to 1.15
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
X-List-Received-Date: Fri, 25 Apr 2014 07:00:34 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: ko

Those 2 patches should merge after 
"[PATCH v3] mirrors.bbclass: Add mirror site for savannah" in oe-core

-----Original Message-----
From: Changhyeok Bae [mailto:changhyeok.bae@lge.com] 
Sent: Friday, April 25, 2014 3:58 PM
To: openembedded-devel@lists.openembedded.org
Cc: Changhyeok Bae
Subject: [PATCH 2/2] lzip: Upgrade to 1.15

lzip v1.14 is not available in SRC_URI.

Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
---
 .../lzip/{lzip_1.14.bb => lzip_1.15.bb}            |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)  rename
meta-oe/recipes-support/lzip/{lzip_1.14.bb => lzip_1.15.bb} (81%)

diff --git a/meta-oe/recipes-support/lzip/lzip_1.14.bb
b/meta-oe/recipes-support/lzip/lzip_1.15.bb
similarity index 81%
rename from meta-oe/recipes-support/lzip/lzip_1.14.bb
rename to meta-oe/recipes-support/lzip/lzip_1.15.bb
index 5a7f3fc..3d64695 100644
--- a/meta-oe/recipes-support/lzip/lzip_1.14.bb
+++ b/meta-oe/recipes-support/lzip/lzip_1.15.bb
@@ -8,10 +8,9 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
 
 # Only the latest version is available in .tar.gz format from
savannah.gnu.org,  # FreeBSD distfiles is known to have version 1.13.
-MIRRORS += "http://download.savannah.gnu.org/releases/lzip/
ftp://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/"
 
-SRC_URI[md5sum] = "39a4b06952ee45274525dc0582cdd651"
-SRC_URI[sha256sum] =
"7ff5cc521560edb2a0a6cdf258cf3afdaeb1dbcc354d96d011d0dd7ec584cbe7"
+SRC_URI[md5sum] = "e83a364c8544fc66cccb552369d93220"
+SRC_URI[sha256sum] =
"7cd3fcda68fc9900efcf7784313e3bdd1303fef1a0546db9723f5e5564dd05b6"
 
 CONFIGUREOPTS = "\
     '--srcdir=${S}' \
--
1.7.9.5



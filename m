Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZsXK-0007Q0-Q7
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Jun 2011 00:38:11 +0200
Received: by pwi1 with SMTP id 1so1621271pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2011 15:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=KUPHXO9Cweo7xKpCxmy6OdA5McEHg7RUuvvg1IgmjMY=;
	b=LSkwWF/WP66ZOjF4JfpAW+tFKxy5mpc9p2uwarjulBpUvO7eGIT28o1qQk96QJ1zVt
	QA30LUcL74Yw67WMDKM/kxMKLN83aZQJrPgVQk0L7KzkHF3HrLTO1m49WclgfZNhhFUU
	J7gbdfiMz5mkozWws761/iZNRo83yzZNd9AgY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=uol8V46F2bWjE8JORg6j9PB5IOhSX7Ctjj4HCg9ztsezEgSF+2fsPU7eqqs9I3ZD1/
	cPUYJF/ujMDfXga5GCvIs+4lT56PsGrJNP6fb9rcex9JICZ7nF9L8c9mW1P1zxKtbiLy
	KhLZwrBUFP+Kr9uaqs+oki2ldSlnGw8ejBiVY=
Received: by 10.68.37.69 with SMTP id w5mr1459641pbj.422.1308868473995;
	Thu, 23 Jun 2011 15:34:33 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p5sm1536158pbd.92.2011.06.23.15.34.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Jun 2011 15:34:33 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jun 2011 15:34:29 -0700
Message-Id: <1308868469-32653-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] gcc-4.6: Change the bbappend to match oe-core changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jun 2011 22:38:12 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../linaro/gcc-4.6-linaro-r106720.patch            |    0
 .../linaro/gcc-4.6-linaro-r106723.patch            |    0
 .../linaro/gcc-4.6-linaro-r106729.patch            |    0
 .../linaro/gcc-4.6-linaro-r106733.patch            |    0
 .../linaro/gcc-4.6-linaro-r106737.patch            |    0
 .../linaro/gcc-4.6-linaro-r106738.patch            |    0
 .../linaro/gcc-4.6-linaro-r106739.patch            |    0
 .../linaro/gcc-4.6-linaro-r106740.patch            |    0
 .../linaro/gcc-4.6-linaro-r106741.patch            |    0
 .../linaro/gcc-4.6-linaro-r106742.patch            |    0
 .../linaro/gcc-4.6-linaro-r106743.patch            |    0
 .../linaro/gcc-4.6-linaro-r106744.patch            |    0
 .../linaro/gcc-4.6-linaro-r106746.patch            |    0
 .../linaro/gcc-4.6-linaro-r106747.patch            |    0
 .../linaro/gcc-4.6-linaro-r106750.patch            |    0
 .../linaro/gcc-4.6-linaro-r106751.patch            |    0
 .../linaro/gcc-4.6-linaro-r106753.patch            |    0
 .../linaro/gcc-4.6-linaro-r106754.patch            |    0
 .../linaro/gcc-4.6-linaro-r106755.patch            |    0
 meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc    |    2 +-
 ....0.bbappend => gcc-cross-canadian_4.6.bbappend} |    0
 ...6.0.bbappend => gcc-cross-initial_4.6.bbappend} |    0
 ...bappend => gcc-cross-intermediate_4.6.bbappend} |    0
 ...cross_4.6.0.bbappend => gcc-cross_4.6.bbappend} |    0
 ....bbappend => gcc-crosssdk-initial_4.6.bbappend} |    0
 ...pend => gcc-crosssdk-intermediate_4.6.bbappend} |    0
 ...dk_4.6.0.bbappend => gcc-crosssdk_4.6.bbappend} |    0
 ...ime_4.6.0.bbappend => gcc-runtime_4.6.bbappend} |    0
 .../gcc/{gcc_4.6.0.bbappend => gcc_4.6.bbappend}   |    0
 .../{libgcc_4.6.0.bbappend => libgcc_4.6.bbappend} |    0
 30 files changed, 1 insertions(+), 1 deletions(-)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106720.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106723.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106729.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106733.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106737.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106738.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106739.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106740.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106741.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106742.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106743.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106744.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106746.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106747.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106750.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106751.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106753.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106754.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/linaro/gcc-4.6-linaro-r106755.patch (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-cross-canadian_4.6.0.bbappend => gcc-cross-canadian_4.6.bbappend} (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-cross-initial_4.6.0.bbappend => gcc-cross-initial_4.6.bbappend} (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-cross-intermediate_4.6.0.bbappend => gcc-cross-intermediate_4.6.bbappend} (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-cross_4.6.0.bbappend => gcc-cross_4.6.bbappend} (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-crosssdk-initial_4.6.0.bbappend => gcc-crosssdk-initial_4.6.bbappend} (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-crosssdk-intermediate_4.6.0.bbappend => gcc-crosssdk-intermediate_4.6.bbappend} (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-crosssdk_4.6.0.bbappend => gcc-crosssdk_4.6.bbappend} (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc-runtime_4.6.0.bbappend => gcc-runtime_4.6.bbappend} (100%)
 rename meta-oe/recipes-devtools/gcc/{gcc_4.6.0.bbappend => gcc_4.6.bbappend} (100%)
 rename meta-oe/recipes-devtools/gcc/{libgcc_4.6.0.bbappend => libgcc_4.6.bbappend} (100%)

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106720.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106720.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106723.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106723.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106729.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106729.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106733.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106733.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106737.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106737.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106738.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106738.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106739.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106739.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106739.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106739.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106740.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106740.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106740.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106740.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106741.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106741.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106742.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106742.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106743.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106743.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106743.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106743.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106744.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106744.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106744.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106744.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106746.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106746.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106746.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106746.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106747.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106747.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106747.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106747.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106750.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106750.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106750.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106750.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106751.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106751.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106751.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106751.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106753.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106753.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106753.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106753.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106754.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106754.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106754.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106754.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106755.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106755.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106755.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106755.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc b/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
index 38167bf..059f441 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
@@ -1,3 +1,3 @@
 # this will prepend this layer to FILESPATH
-FILESEXTRAPATHS := "${THISDIR}/gcc-4.6.0"
+FILESEXTRAPATHS := "${THISDIR}/gcc-4.6"
 PRINC = "0"
diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross-canadian_4.6.0.bbappend b/meta-oe/recipes-devtools/gcc/gcc-cross-canadian_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-cross-canadian_4.6.0.bbappend
rename to meta-oe/recipes-devtools/gcc/gcc-cross-canadian_4.6.bbappend
diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.6.0.bbappend b/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.6.0.bbappend
rename to meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.6.bbappend
diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.6.0.bbappend b/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.6.0.bbappend
rename to meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bbappend
diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross_4.6.0.bbappend b/meta-oe/recipes-devtools/gcc/gcc-cross_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-cross_4.6.0.bbappend
rename to meta-oe/recipes-devtools/gcc/gcc-cross_4.6.bbappend
diff --git a/meta-oe/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.0.bbappend b/meta-oe/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.0.bbappend
rename to meta-oe/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.bbappend
diff --git a/meta-oe/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.0.bbappend b/meta-oe/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.0.bbappend
rename to meta-oe/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.bbappend
diff --git a/meta-oe/recipes-devtools/gcc/gcc-crosssdk_4.6.0.bbappend b/meta-oe/recipes-devtools/gcc/gcc-crosssdk_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-crosssdk_4.6.0.bbappend
rename to meta-oe/recipes-devtools/gcc/gcc-crosssdk_4.6.bbappend
diff --git a/meta-oe/recipes-devtools/gcc/gcc-runtime_4.6.0.bbappend b/meta-oe/recipes-devtools/gcc/gcc-runtime_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-runtime_4.6.0.bbappend
rename to meta-oe/recipes-devtools/gcc/gcc-runtime_4.6.bbappend
diff --git a/meta-oe/recipes-devtools/gcc/gcc_4.6.0.bbappend b/meta-oe/recipes-devtools/gcc/gcc_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc_4.6.0.bbappend
rename to meta-oe/recipes-devtools/gcc/gcc_4.6.bbappend
diff --git a/meta-oe/recipes-devtools/gcc/libgcc_4.6.0.bbappend b/meta-oe/recipes-devtools/gcc/libgcc_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/libgcc_4.6.0.bbappend
rename to meta-oe/recipes-devtools/gcc/libgcc_4.6.bbappend
-- 
1.7.4.1




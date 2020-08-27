Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.9340.1598491027827905969
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 18:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,357,1592841600"; 
   d="scan'208";a="98596710"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Aug 2020 09:17:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A695F48990F3
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2020 09:17:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 27 Aug 2020 09:17:06 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libidn: upgrade 1.35 -> 1.36
Date: Thu, 27 Aug 2020 21:17:04 +0800
Message-ID: <1598534226-115864-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A695F48990F3.AA650
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

-License-Update: Copyright year updated to 2020.

Refresh the following patch:
0001-idn-format-security-warnings.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../0001-idn-format-security-warnings.patch   | 45 +++++++++----------
 .../libidn/{libidn_1.35.bb => libidn_1.36.bb} |  8 ++--
 2 files changed, 26 insertions(+), 27 deletions(-)
 rename meta-oe/recipes-extended/libidn/{libidn_1.35.bb => libidn_1.36.bb} (81%)

diff --git a/meta-oe/recipes-extended/libidn/libidn/0001-idn-format-security-warnings.patch b/meta-oe/recipes-extended/libidn/libidn/0001-idn-format-security-warnings.patch
index 5adc7d9fd..d5fb8e7c8 100644
--- a/meta-oe/recipes-extended/libidn/libidn/0001-idn-format-security-warnings.patch
+++ b/meta-oe/recipes-extended/libidn/libidn/0001-idn-format-security-warnings.patch
@@ -1,6 +1,3 @@
-From 82f98dcbc429bbe89a9837c533cbcbc02e77c790 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
-Date: Tue, 28 Jun 2016 12:43:31 +0100
 Subject: [PATCH] idn: fix printf() format security warnings
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -48,35 +45,37 @@ Content-Transfer-Encoding: 8bit
 |      ^
 
 Signed-off-by: André Draszik <adraszik@tycoint.com>
----
+Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+
 Upstream-Status: Pending
 
+---
  src/idn.c | 27 ++++++++++++++-------------
  1 file changed, 14 insertions(+), 13 deletions(-)
 
 diff --git a/src/idn.c b/src/idn.c
-index be1c7d1..68e4291 100644
+index f2fee11..c6e5caa 100644
 --- a/src/idn.c
 +++ b/src/idn.c
-@@ -170,7 +170,7 @@ main (int argc, char *argv[])
+@@ -169,7 +169,7 @@ main (int argc, char *argv[])
        (args_info.idna_to_unicode_given ? 1 : 0) +
        (args_info.nfkc_given ? 1 : 0) != 1)
      {
--      error (0, 0, _("only one of -s, -e, -d, -a, -u or -n can be specified"));
-+      error (0, 0, "%s", _("only one of -s, -e, -d, -a, -u or -n can be specified"));
+-      error (0, 0,
++      error (0, 0, "%s",
+ 	     _("only one of -s, -e, -d, -a, -u or -n can be specified"));
        usage (EXIT_FAILURE);
      }
+@@ -183,7 +183,7 @@ main (int argc, char *argv[])
  
-@@ -185,7 +185,7 @@ main (int argc, char *argv[])
    if (!args_info.quiet_given
-       && args_info.inputs_num == 0
-       && isatty (fileno (stdin)))
+       && args_info.inputs_num == 0 && isatty (fileno (stdin)))
 -    fprintf (stderr, _("Type each input string on a line by itself, "
 +    fprintf (stderr, "%s", _("Type each input string on a line by itself, "
  		       "terminated by a newline character.\n"));
  
    do
-@@ -197,7 +197,7 @@ main (int argc, char *argv[])
+@@ -195,7 +195,7 @@ main (int argc, char *argv[])
  	  if (feof (stdin))
  	    break;
  
@@ -85,7 +84,7 @@ index be1c7d1..68e4291 100644
  	}
  
        if (strlen (line) > 0)
-@@ -215,7 +215,7 @@ main (int argc, char *argv[])
+@@ -213,7 +213,7 @@ main (int argc, char *argv[])
  	  if (!q)
  	    {
  	      free (p);
@@ -94,7 +93,7 @@ index be1c7d1..68e4291 100644
  		     _("could not convert from UTF-8 to UCS-4"));
  	    }
  
-@@ -240,7 +240,7 @@ main (int argc, char *argv[])
+@@ -238,7 +238,7 @@ main (int argc, char *argv[])
  	  if (!q)
  	    {
  	      free (r);
@@ -103,7 +102,7 @@ index be1c7d1..68e4291 100644
  		     _("could not convert from UTF-8 to UCS-4"));
  	    }
  
-@@ -277,7 +277,7 @@ main (int argc, char *argv[])
+@@ -275,7 +275,7 @@ main (int argc, char *argv[])
  	  q = stringprep_utf8_to_ucs4 (p, -1, &len);
  	  free (p);
  	  if (!q)
@@ -112,7 +111,7 @@ index be1c7d1..68e4291 100644
  		   _("could not convert from UTF-8 to UCS-4"));
  
  	  if (args_info.debug_given)
-@@ -336,7 +336,7 @@ main (int argc, char *argv[])
+@@ -334,7 +334,7 @@ main (int argc, char *argv[])
  	  r = stringprep_ucs4_to_utf8 (q, -1, NULL, NULL);
  	  free (q);
  	  if (!r)
@@ -121,7 +120,7 @@ index be1c7d1..68e4291 100644
  		   _("could not convert from UCS-4 to UTF-8"));
  
  	  p = stringprep_utf8_to_locale (r);
-@@ -360,7 +360,7 @@ main (int argc, char *argv[])
+@@ -358,7 +358,7 @@ main (int argc, char *argv[])
  	  q = stringprep_utf8_to_ucs4 (p, -1, NULL);
  	  free (p);
  	  if (!q)
@@ -130,7 +129,7 @@ index be1c7d1..68e4291 100644
  		   _("could not convert from UCS-4 to UTF-8"));
  
  	  if (args_info.debug_given)
-@@ -438,7 +438,7 @@ main (int argc, char *argv[])
+@@ -436,7 +436,7 @@ main (int argc, char *argv[])
  	  if (!q)
  	    {
  	      free (p);
@@ -139,7 +138,7 @@ index be1c7d1..68e4291 100644
  		     _("could not convert from UCS-4 to UTF-8"));
  	    }
  
-@@ -494,7 +494,7 @@ main (int argc, char *argv[])
+@@ -492,7 +492,7 @@ main (int argc, char *argv[])
  	  r = stringprep_ucs4_to_utf8 (q, -1, NULL, NULL);
  	  free (q);
  	  if (!r)
@@ -148,7 +147,7 @@ index be1c7d1..68e4291 100644
  		   _("could not convert from UTF-8 to UCS-4"));
  
  	  p = stringprep_utf8_to_locale (r);
-@@ -523,7 +523,7 @@ main (int argc, char *argv[])
+@@ -521,7 +521,7 @@ main (int argc, char *argv[])
  	      if (!q)
  		{
  		  free (p);
@@ -157,7 +156,7 @@ index be1c7d1..68e4291 100644
  			 _("could not convert from UTF-8 to UCS-4"));
  		}
  
-@@ -537,7 +537,8 @@ main (int argc, char *argv[])
+@@ -535,7 +535,8 @@ main (int argc, char *argv[])
  	  r = stringprep_utf8_nfkc_normalize (p, -1);
  	  free (p);
  	  if (!r)
@@ -167,7 +166,7 @@ index be1c7d1..68e4291 100644
  
  	  if (args_info.debug_given)
  	    {
-@@ -547,7 +548,7 @@ main (int argc, char *argv[])
+@@ -545,7 +546,7 @@ main (int argc, char *argv[])
  	      if (!q)
  		{
  		  free (r);
@@ -177,5 +176,5 @@ index be1c7d1..68e4291 100644
  		}
  
 -- 
-2.8.1
+2.25.1
 
diff --git a/meta-oe/recipes-extended/libidn/libidn_1.35.bb b/meta-oe/recipes-extended/libidn/libidn_1.36.bb
similarity index 81%
rename from meta-oe/recipes-extended/libidn/libidn_1.35.bb
rename to meta-oe/recipes-extended/libidn/libidn_1.36.bb
index 105740354..4c6c8fde4 100644
--- a/meta-oe/recipes-extended/libidn/libidn_1.35.bb
+++ b/meta-oe/recipes-extended/libidn/libidn_1.36.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=df4be47940a91ee69556f5f71eed4aec \
                     file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                     file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://lib/idna.h;endline=21;md5=37cffad24807f446a24de3e7371f20b9 \
-                    file://src/idn.c;endline=20;md5=09e97034a8877b3451cb65065fc2c06e"
+                    file://lib/idna.h;endline=21;md5=c381d797e2d7fbdace7c147b1285d076 \
+                    file://src/idn.c;endline=20;md5=7d88aa87b0494d690bdf7748fe08d536"
 DEPENDS = "virtual/libiconv autoconf-archive"
 
 inherit pkgconfig autotools gettext texinfo gtk-doc
@@ -19,8 +19,8 @@ SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://0001-idn-format-security-warnings.patch \
            "
 
-SRC_URI[md5sum] = "bef634141fe39326cb354b75e891fead"
-SRC_URI[sha256sum] = "f11af1005b46b7b15d057d7f107315a1ad46935c7fcdf243c16e46ec14f0fe1e"
+SRC_URI[md5sum] = "813c7b268d1051ca02c3610986126f38"
+SRC_URI[sha256sum] = "14b67108344d81ba844631640df77c9071d9fb0659b080326ff5424e86b14038"
 
 # command tool is under GPLv3+, while libidn itself is under LGPLv2.1+ or LGPLv3
 # so package command into a separate package
-- 
2.25.1




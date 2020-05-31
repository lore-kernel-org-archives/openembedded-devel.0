Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.18127.1590941797550992620
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nX2B3/f7;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id a4so2301664pfo.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version:in-reply-to:references
         :content-transfer-encoding;
        bh=a36AHHsOip78alX+k4vXX7I3/uovPZb6VNhKffF2lUQ=;
        b=nX2B3/f7RPSmuIUjRC3GJ+Fw6BvuFnAWcCjv6mewC27nXUXtWBP5bqKG4+L1W37DOQ
         UeLAuSCzFPI8zIzfDvMXjeJ0zosLE/M/0RcTWBttFVCB+rRhy9QdMa8yx35TSwQW8SOW
         uXzK9/i5lrSgk2TTfx7uuriOSs2kCMQ0qIYro9CgYTXyM6Jiy0CflDJUcgklPXOZGdt9
         +HeP5s7/Grgol3/5bCu9OqzJcyWO1eAjX8VAr8lKIA2iEZasocFfgqiWOvyT3qj1+fRB
         rIQfRfaxDhFwAFVkS2LhrJ/wzYMdkhRru/CBrooLtFVl2hai6HzOHmExDurjw7RLX9Lx
         JHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :in-reply-to:references:content-transfer-encoding;
        bh=a36AHHsOip78alX+k4vXX7I3/uovPZb6VNhKffF2lUQ=;
        b=MwGzUAF3I+UvpiG0k78xZ9Xo1aalElwz/M1fNjwR0NeLnUbBTNjcsExxk4H3PmjuXV
         ZcPU0SGJ9UlNDzVPTnN8EL0cu2j2HoNT+jmK3BN0cVl9my2ec+WF8lZDaYnPLiB2wooc
         ArEJXSze8NxBs+TME1YH178Rd3tG545BW2xt+YTGk9gE+PcRhQtHLBhPFJqwHj4J/Hck
         JFgXGBpgN8FUYnVLzNqJHCdFTrj0BdcTjAvKSl5SuLPQdtyci1xg2O9AqPNVHQw3pP7G
         BOik1wXOlYWkCyVbc1eWQcRRH6pAelJyMjk3myQI0r4whAygkNScIqEBNq2Y7uHIEhb7
         BQkA==
X-Gm-Message-State: AOAM532CzbUu7z5gFJtki3PXSwxYFBhxqFtv7umAUvuaC11X9lGSDgLH
	UfANnATh8F2PkHUdG6v46odoLlPl
X-Google-Smtp-Source: ABdhPJyTwCruXw0ca0T2g/bCPVoOZENMnrKFV0QDKtlWzAl7vw6OjyBtb9LyT8QUDKnX/6ze3irCzQ==
X-Received: by 2002:a63:368c:: with SMTP id d134mr16000724pga.393.1590941796829;
        Sun, 31 May 2020 09:16:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:36 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 09/35] unicode-ucd: Stop broken license downloading
Date: Sun, 31 May 2020 09:15:56 -0700
Message-Id: <e00eb979c5017692c71ccd75ccdf324248a6b5f7.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Adrian Bunk <bunk@stusta.de>

WARNING: unicode-ucd-12.1.0-r0 do_fetch: Checksum mismatch for local file /home/bunk/yoctomaster/yocto-tmp/downloads/unicode.org.license.html
Cleaning and trying again.
WARNING: unicode-ucd-12.1.0-r0 do_fetch: Renaming /home/bunk/yoctomaster/yocto-tmp/downloads/unicode.org.license.html to /home/bunk/yoctomaster/yocto-tmp/downloads/unicode.org.license.html_bad-checksum_e9dd7d435db23241be3be21b5fca729b5cf883c8c039a70ea093031420d06abb
WARNING: unicode-ucd-12.1.0-r0 do_fetch: Checksum failure encountered with download of https://www.unicode.org/license.html;name=license;subdir=unicode-ucd-12.1.0;downloadfilename=unicode.org.license.html - will attempt other sources if available

This downloaded a license file from upstream.
The upstream file did not match (copyright year changed).
A stale copy was downloaded from a mirror instead and checked.
The stale file with known contents never changes.

Replace with a dummy check on a local copy of the license file.

License checksum changed due to dos2unix conversion.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a2719b02e11e6bf13b23796a3d07ada005dd6f8e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../unicode-ucd/files/license.html            | 98 +++++++++++++++++++
 .../unicode-ucd/unicode-ucd_12.1.0.bb         |  7 +-
 2 files changed, 100 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/unicode-ucd/files/license.html

diff --git a/meta-oe/recipes-support/unicode-ucd/files/license.html b/meta-oe/recipes-support/unicode-ucd/files/license.html
new file mode 100644
index 0000000000..a02442ad97
--- /dev/null
+++ b/meta-oe/recipes-support/unicode-ucd/files/license.html
@@ -0,0 +1,98 @@
+<!doctype HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"><html>
+
+
+
+<head>
+
+<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
+<meta http-equiv="Content-Language" content="en-us">
+<meta name="VI60_defaultClientScript" content="JavaScript">
+<meta name="GENERATOR" content="Microsoft FrontPage 12.0">
+<meta name="keywords" content="Unicode Standard, copyright">
+<meta name="ProgId" content="FrontPage.Editor.Document">
+<title>Unicode License Agreement</title>
+<link rel="stylesheet" type="text/css" 
+
+href="http://www.unicode.org/webscripts/standard_styles.css">
+
+<style type="text/css">
+pre {
+	FONT-FAMILY: Arial, Geneva, sans-serif;
+}
+</style>
+
+
+</head>
+
+
+<body text="#330000">
+
+  <table width="100%" cellpadding="0" cellspacing="0" border="0">
+    <tr>
+
+      <!-- BEGIN CONTENTS -->
+
+      <td>
+
+
+<blockquote>
+<h2><a name="License">UNICODE, INC. LICENSE AGREEMENT - DATA FILES AND SOFTWARE</a></h2>
+
+<pre>
+See <a href="https://www.unicode.org/copyright.html">Terms of Use</a> for definitions of Unicode Inc.'s
+Data Files and Software.
+
+NOTICE TO USER: Carefully read the following legal agreement.
+BY DOWNLOADING, INSTALLING, COPYING OR OTHERWISE USING UNICODE INC.'S
+DATA FILES ("DATA FILES"), AND/OR SOFTWARE ("SOFTWARE"),
+YOU UNEQUIVOCALLY ACCEPT, AND AGREE TO BE BOUND BY, ALL OF THE
+TERMS AND CONDITIONS OF THIS AGREEMENT.
+IF YOU DO NOT AGREE, DO NOT DOWNLOAD, INSTALL, COPY, DISTRIBUTE OR USE
+THE DATA FILES OR SOFTWARE.
+
+COPYRIGHT AND PERMISSION NOTICE
+
+Copyright © 1991-2019 Unicode, Inc. All rights reserved.
+Distributed under the Terms of Use in https://www.unicode.org/copyright.html.
+
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of the Unicode data files and any associated documentation
+(the "Data Files") or Unicode software and any associated documentation
+(the "Software") to deal in the Data Files or Software
+without restriction, including without limitation the rights to use,
+copy, modify, merge, publish, distribute, and/or sell copies of
+the Data Files or Software, and to permit persons to whom the Data Files
+or Software are furnished to do so, provided that either
+(a) this copyright and permission notice appear with all copies
+of the Data Files or Software, or
+(b) this copyright and permission notice appear in associated
+Documentation.
+
+THE DATA FILES AND SOFTWARE ARE PROVIDED "AS IS", WITHOUT WARRANTY OF
+ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
+WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+NONINFRINGEMENT OF THIRD PARTY RIGHTS.
+IN NO EVENT SHALL THE COPYRIGHT HOLDER OR HOLDERS INCLUDED IN THIS
+NOTICE BE LIABLE FOR ANY CLAIM, OR ANY SPECIAL INDIRECT OR CONSEQUENTIAL
+DAMAGES, OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
+DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
+TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
+PERFORMANCE OF THE DATA FILES OR SOFTWARE.
+
+Except as contained in this notice, the name of a copyright holder
+shall not be used in advertising or otherwise to promote the sale,
+use or other dealings in these Data Files or Software without prior
+written authorization of the copyright holder.
+</pre>
+
+</blockquote>
+
+
+
+      </td>
+
+    </tr>
+
+  </table>
+</body>
+</html>
diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
index 89ab565ce5..b29bb784e4 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
@@ -1,18 +1,15 @@
 SUMMARY = "Unicode Character Database"
 HOMEPAGE = "https://unicode.org/ucd/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://unicode.org.license.html;beginline=42;endline=85;md5=67619d0c52706853c0256514e7fd04cd"
+LIC_FILES_CHKSUM = "file://../license.html;beginline=42;endline=85;md5=ddcaebcc17ab633995f12c383599f377"
 
 SRC_URI = " \
     https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd \
-    https://www.unicode.org/license.html;name=license;subdir=${BP};downloadfilename=unicode.org.license.html \
+    file://license.html \
 "
 SRC_URI[ucd.md5sum] = "430cbdac2615451571dd69a976dd08f6"
 SRC_URI[ucd.sha256sum] = "25ba51a0d4c6fa41047b7a5e5733068d4a734588f055f61e85f450097834a0a6"
 
-SRC_URI[license.md5sum] = "f03bafb623258f85ff2032c1ce567b7c"
-SRC_URI[license.sha256sum] = "983225207de8a707d0903a8d70fb7a4b28c5e0f64f2366e84a6192a2d618fed4"
-
 inherit allarch
 
 do_configure[noexec] = "1"
-- 
2.17.1


Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.10157.1601975139190907336
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2020 02:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59138 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kPiuf-0007g5-E9; Tue, 06 Oct 2020 12:05:38 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-prettytable: Upgrade 0.7.2 -> 1.0.0
Date: Tue,  6 Oct 2020 12:05:24 +0300
Message-Id: <20201006090526.24310-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006090526.24310-1-leon.anavi@konsulko.com>
References: <20201006090526.24310-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add a dependency on setuptools-scm and upgrade to release 1.0.0:

- Dropped support for EOL Python 2.4-2.6 and 3.0-3.4.
- Added support for Python 3.5-3.9.
- Added del_column(field_name).
- Added get_csv_string with delimiter option (comma or tab) and
  optional header.
- Use wcwidth for better wide char support.
- New paginate method can be used to produce strings suitable for
  piping to lp/lpr.
- from_html now handles HTML tables with colspan, rather than
  choking on them.
- Added min_width, min_table_width and max_table_width
  attribute/options for better control of table sizing.
- Added "title" attribute/option for table titles.
- When slice syntax is used to create a new sub-table out of an
  existing table, the rows are sorted before, not after, the
  slicing. The old behaviour (slice then sort) can be achieved
  by setting oldsortslice=True.
- The from_csv table factory now accepts CSV format parameters as
  keyword arguments (e.g. delimiter, doublequote, escapechar, etc.)
- Added 0x000f to the list of special characters with width 0, to
  fix problems with coloured strings produced by the Blessings
  library.
- Fixed constructor argument float_format to work as intended.
- Removed print_html() from README.
- Added from_json and get_json_string to PrettyTable.
- Fixed PLAIN_COLUMN to PLAIN_COLUMNS in README.
- Added Markdown and Org mode styles.

License-Update: Use wcwidth for better wide char support

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-prettytable_0.7.2.bb => python3-prettytable_1.0.0.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_0.7.2.bb => python3-prettytable_1.0.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb b/meta-python/recipes-devtools/python/python3-prettytable_1.0.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_1.0.0.bb
index 18f3390619..e5688a3866 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_1.0.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Python library for displaying tabular data in a ASCII table format"
 HOMEPAGE = "http://code.google.com/p/prettytable"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3e73500ffa52de5071cff65990055282"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c9a6829fcd174d9535b46211917c7671"
 
-SRC_URI[md5sum] = "a6b80afeef286ce66733d54a0296b13b"
-SRC_URI[sha256sum] = "2d5460dc9db74a32bcc8f9f67de68b2c4f4d2f01fa3bd518764c69156d9cacd9"
+SRC_URI[md5sum] = "fb31d4c94fef42f2caf9784c44d8ea82"
+SRC_URI[sha256sum] = "98a3b74b1980e6a9392498e3a2a5406f6bd836f412843c2be23d9c88671747ac"
 
 do_install_append() {
     perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
@@ -23,6 +23,8 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
 RDEPENDS_${PN} += " \
 	${PYTHON_PN}-math \
 	${PYTHON_PN}-html \
-- 
2.17.1


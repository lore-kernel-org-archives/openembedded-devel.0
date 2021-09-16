Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.8541.1631784166481599355
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Sep 2021 02:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ankcyiiX;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631784164; i=@fujitsu.com;
	bh=ATWAh35MJjxXqkwUHFcgXi6izrmG7fVY2nnYuo6+cws=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ankcyiiXNXGOz6GKiZdXfwVtjpf+M/WBEI6qCt2EPBLRh9k7dxshT+JuvOols/aUo
	 9uzdXRhZBmH1skEC5K2JOvSBPQi0DwGPAnBZjpEXjVjsraEYSDrRNAfEN5UxaUb0R7
	 Ha8ICUAoTEeDjO8T1XEDAQvb2pjx8GdkGSw1wlbHzyikjKIij1NS5KGzH22BZ2XR7G
	 FzkS5KNDuHY+MXIhPMmIDzb0j3xv+nd3/FCmkm62FE/ZZN94bPUVvZ1ErDVKU34WAj
	 9WA8rRDQiEaJOcTgxENanwRVPt+MRRIy2QW2qyvEjmla7dJbFdIrn5TRGmEgc6gYpR
	 XX1XdLQjkoUoA==
Received: from [100.113.7.40] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 2E/5F-23595-3EC03416; Thu, 16 Sep 2021 09:22:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI1X3M45x
  oMLNV3OLi4aXMDowe5zauYAxgjGLNzEvKr0hgzWicK1jwRaPi3e8VTA2MF5S6GLk4hARmM0m0
  dPxngnBOMEps+LGCtYuRk4NNQEei40U3C4gtIqAvsXT2HmYQW1ggWGLh7nNsIDaLgKrEg4k7w
  Op5BdwkTpx8yQ5iSwgoSEx5+J4ZIi4ocXLmE7A5zAISEgdfvGCGqFGU2L7zDAuEXSHx+vAl5g
  mMPLOQtMxC0rKAkWkVo2VSUWZ6RkluYmaOrqGBga6hobGuqa6RsYVeYpVukl5qqW5yal5JUSJ
  QVi+xvFivuDI3OSdFLy+1ZBMjMJBSClnf7WB89vqD3iFGSQ4mJVHegzedEoX4kvJTKjMSizPi
  i0pzUosPMcpwcChJ8D7gck4UEixKTU+tSMvMAQY1TFqCg0dJhLcAJM1bXJCYW5yZDpE6xagoJ
  c47nxsoIQCSyCjNg2uDRdIlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8riDjeTLzSuCmvw
  JazAS0+Mh+B5DFJYkIKakGpq7+Ha5u8ecsNprlfJP6pGJl8jCVf+59jU4BS9cjnov75qR8v/D
  w1nrWGzvnP09Zte7kt7/F717JXeS6Pen52o0SCnMyFmr/fV7K+23JkT2MJyI+rl22x9+1KSK2
  dfOt/XnuP/a9eSIXe+fmipUVViKnF1Y2ic7r0jy85sIKL00+1xXP79yW4w/U7uS0rQiwK6+Wb
  eJ4WsS9WffBkXeTis9tc79eZT0748sivuzELxVVX8/sMV3b3qH8bFNWwl9/pis5nRxl3oIROW
  2lEWYJ9TFcsokt845pfGxIet/7306hyi7v2ZrLdulPzSV2ypt8lG+vWibO8/GCRkD33bkK0z1
  0N1w7Ynq6uy2y/2IugxJLcUaioRZzUXEiAJrCYdcfAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-245.messagelabs.com!1631784163!168169!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4487 invoked from network); 16 Sep 2021 09:22:43 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-18.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Sep 2021 09:22:43 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18G9MgNZ023330
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Sep 2021 10:22:42 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 16 Sep 2021 10:22:41 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-beautifulsoup4: upgrade 4.9.3 -> 4.10.0
Date: Fri, 17 Sep 2021 05:22:35 +0800
Message-ID: <1631827355-4441-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

= 4.10.0 (20210907)

* This is the first release of Beautiful Soup to only support Python
  3. I dropped Python 2 support to maintain support for newer versions
  (58 and up) of setuptools. See:
  https://github.com/pypa/setuptools/issues/2769 [bug=1942919]

* The behavior of methods like .get_text() and .strings now differs
  depending on the type of tag. The change is visible with HTML tags
  like <script>, <style>, and <template>. Starting in 4.9.0, methods
  like get_text() returned no results on such tags, because the
  contents of those tags are not considered 'text' within the document
  as a whole.

  But a user who calls script.get_text() is working from a different
  definition of 'text' than a user who calls div.get_text()--otherwise
  there would be no need to call script.get_text() at all. In 4.10.0,
  the contents of (e.g.) a <script> tag are considered 'text' during a
  get_text() call on the tag itself, but not considered 'text' during
  a get_text() call on the tag's parent.

  Because of this change, calling get_text() on each child of a tag
  may now return a different result than calling get_text() on the tag
  itself. That's because different tags now have different
  understandings of what counts as 'text'. [bug=1906226] [bug=1868861]

* NavigableString and its subclasses now implement the get_text()
  method, as well as the properties .strings and
  .stripped_strings. These methods will either return the string
  itself, or nothing, so the only reason to use this is when iterating
  over a list of mixed Tag and NavigableString objects. [bug=1904309]

* The 'html5' formatter now treats attributes whose values are the
  empty string as HTML boolean attributes. Previously (and in other
  formatters), an attribute value must be set as None to be treated as
  a boolean attribute. In a future release, I plan to also give this
  behavior to the 'html' formatter. Patch by Isaac Muse. [bug=1915424]

* The 'replace_with()' method now takes a variable number of arguments,
  and can be used to replace a single element with a sequence of elements.
  Patch by Bill Chandos. [rev=605]

* Corrected output when the namespace prefix associated with a
  namespaced attribute is the empty string, as opposed to
  None. [bug=1915583]

* Performance improvement when processing tags that speeds up overall
  tree construction by 2%. Patch by Morotti. [bug=1899358]

* Corrected the use of special string container classes in cases when a
  single tag may contain strings with different containers; such as
  the <template> tag, which may contain both TemplateString objects
  and Comment objects. [bug=1913406]

* The html.parser tree builder can now handle named entities
  found in the HTML5 spec in much the same way that the html5lib
  tree builder does. Note that the lxml HTML tree builder doesn't handle
  named entities this way. [bug=1924908]

* Added a second way to pass specify encodings to UnicodeDammit and
  EncodingDetector, based on the order of precedence defined in the
  HTML5 spec, starting at:
  https://html.spec.whatwg.org/multipage/parsing.html#parsing-with-a-known-character-encoding

  Encodings in 'known_definite_encodings' are tried first, then
  byte-order-mark sniffing is run, then encodings in 'user_encodings'
  are tried. The old argument, 'override_encodings', is now a
  deprecated alias for 'known_definite_encodings'.

  This changes the default behavior of the html.parser and lxml tree
  builders, in a way that may slightly improve encoding
  detection but will probably have no effect. [bug=1889014]

* Improve the warning issued when a directory name (as opposed to
  the name of a regular file) is passed as markup into the BeautifulSoup
  constructor. [bug=1913628]

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...utifulsoup4_4.9.3.bb => python3-beautifulsoup4_4.10.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.9.3.bb => python3-beautifulsoup4_4.10.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.3.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.10.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.3.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.10.0.bb
index cf92c8e9cf..ba89e9db33 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.3.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.10.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1"
 
-SRC_URI[md5sum] = "57fd468ae3eb055f6871106e8f7813e2"
-SRC_URI[sha256sum] = "84729e322ad1d5b4d25f805bfa05b902dd96450f43842c4e99067d5e1369eb25"
+SRC_URI[sha256sum] = "c23ad23c521d818955a4151a67d81580319d4bf548d3d49f4223ae041ff98891"
 
 inherit pypi setuptools3
 
@@ -12,6 +11,8 @@ RDEPENDS:${PN} = "\
     ${PYTHON_PN}-html5lib \
     ${PYTHON_PN}-lxml \
     ${PYTHON_PN}-soupsieve \
+    ${PYTHON_PN}-html \
+    ${PYTHON_PN}-logging \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


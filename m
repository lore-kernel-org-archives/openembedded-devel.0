Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 125FCEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:37 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.4902.1688699670287778377
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="111930542"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="111930542"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:14:16 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 10B73CD7E9
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:14 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 344BED9A7B
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:13 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 61399881D9;
	Fri,  7 Jul 2023 12:14:12 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pillow: upgrade 9.5.0 -> 10.0.0
Date: Fri,  7 Jul 2023 11:13:43 +0800
Message-Id: <1688699627-2519-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10--9.023100-10.000000
X-TMASE-MatchedRID: kfHlHSjlGDOjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwgGVRwx2V/pHcuq
	l5PpRcegDvbi8EVfanr1efIXU9xSN9zZGrP764sORcGHEV0WBxCZmLDnd2pI39xGVXFEKe3WdYJ
	3pC9XNt5wyAsxHJUAlE9RoI0apcYjd54D6vJLI21URfNbW2avkLokfe+wSDLl4zsIwTCr5hae1T
	cu/lFv/dTrrkr2uDyV0H6nMFx+EsWF7cGOAABiMXphyxW7io1uSl7Mg8DR4I9OKZLuSzNY+ynNY
	SmpHzdZXveFl4p6OlZPaSCGuTUzHB1YpEPWJiyzP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwUe
	vDt+uW7v0LMVKXbDRTKHYLsR4q0LHxPMjOKY7A8LbigRnpKlKSPzRlrdFGDwCQazp6DIMa36gK8
	yYFoFj5He8nKMX59XCR+bFsYv963AAKZssU5Dtw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103708

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Fixed deallocating mask images #7246
    Added ImageFont.MAX_STRING_LENGTH #7244
    Fix Windows build with pyproject.toml #7230
    Do not close provided file handles with libtiff #7199
    Convert to HSV if mode is HSV in getcolor() #7226
    Added alpha_only argument to getbbox() #7123
    Prioritise speed in _repr_png_ #7242
    Do not use CFFI access by default on PyPy #7236
    Limit size even if one dimension is zero in decompression bomb check #7235
    Use --config-settings instead of deprecated --global-option #7171
    Better C integer definitions #6645
    Fixed finding dependencies on Cygwin #7175
    Changed grabclipboard() to use PNG instead of JPG compression on macOS #7219
    Added in_place argument to ImageOps.exif_transpose() #7092
    Fixed calling putpalette() on L and LA images before load() #7187
    Fixed saving TIFF multiframe images with LONG8 tag types #7078
    Fixed combining single duration across duplicate APNG frames #7146
    Remove temporary file when error is raised #7148
    Do not use temporary file when grabbing clipboard on Linux #7200
    If the clipboard fails to open on Windows, wait and try again #7141
    Fixed saving multiple 1 mode frames to GIF #7181
    Replaced absolute PIL import with relative import #7173
    Replaced deprecated Py_FileSystemDefaultEncoding for Python >= 3.12 #7192
    Improved wl-paste mimetype handling in ImageGrab #7094
    Added _repr_jpeg_() for IPython display_jpeg #7135
    Use "/sbin/ldconfig" if ldconfig is not found #7068
    Prefer screenshots using XCB over gnome-screenshot #7143
    Fixed joined corners for ImageDraw rounded_rectangle() odd dimensions #7151
    Support reading signed 8-bit TIFF images #7111
    Added width argument to ImageDraw regular_polygon #7132
    Support I mode for ImageFilter.BuiltinFilter #7108
    Raise error from stderr of Linux ImageGrab.grabclipboard() command #7112
    Added unpacker from I;16B to I;16 #7125
    Support float font sizes #7107
    Use later value for duplicate xref entries in PdfParser #7102
    Load before getting size in __getstate__ #7105
    Fixed type handling for include and lib directories #7069
    Remove deprecations for Pillow 10.0.0 #7059, #7080
    Drop support for soon-EOL Python 3.7 #7058

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pillow_9.5.0.bb => python3-pillow_10.0.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_9.5.0.bb => python3-pillow_10.0.0.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.5.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.0.0.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-pillow_9.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_10.0.0.bb
index 7ec43c60d3..8683ef2287 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.0.0.bb
@@ -62,4 +62,4 @@ do_install_ptest() {
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "204590600c6a8c5246d0564d3312abd6e6b0ed70"
+SRCREV = "6e28ed1f36d0eb74053af54e1eddc9c29db698cd"
-- 
2.34.1



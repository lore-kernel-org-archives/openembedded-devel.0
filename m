Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3955C3A59D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:42:05 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.16287.1666593717435768553
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WGIKBpQn;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666593715; i=@fujitsu.com;
	bh=tEf5yfmaNcsF0x2lJFVF9Zh+CZv1EReheuhuLkgU0SA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WGIKBpQnu6NUIDCIMalxNZmMe3a3XNaT0ee8W+PDe4pf/dhJnQz3pT9ZAjErYzm+g
	 4UgjruxKYB257MwEqF9aFvHpAtdAfYApDINj9BMieNnAkblLJU+bWDqujDPdrBSxMM
	 hyHWSnNVhm9RfAxBPkg18/oM9+tFEsc8PXzwLvzLKW9u8gMfYoeNSBX5160zNIQZf3
	 fBMfLDKQmv6+ebN6Xvan8eMIbY1ZSCOWmeXIOPuCJQB+DTzuwOmrxlsd0sTo8DhuNT
	 0iMKwV20AUwHjLNl7sQ4bDUET4O2FEbW/3KEDHKldaRJOCJtBvlxmAKGyX8S/S17y4
	 uvjuJDa8/UVzA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8MxSXezcVi
  ywdePkhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aUzotsBbvEKg4sm83YwHhGuIuRi0NI4Amj
  RPvWaUxdjJxAznUmie9roiASexglnradZQVJsAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSwQJrGi+SRQnIODRUBV4m5bMojJK+AksXeaDUiFhICCxJSH78E6eQUEJU7OfMICMUVC4u
  CLF8wQNYoSsy83s0DYFRKzZrUxQdhqElfPbWKewMg/C0n7LCTtCxiZVjGaFacWlaUW6Roa6CU
  VZaZnlOQmZuboJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWWbGIEBmJKsUrfDsa3
  y/7oHWKU5GBSEuVlEA9LFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBW6MFlBMsSk1PrUjLzAFGB
  UxagoNHSYR3lhFQmre4IDG3ODMdInWKUZdj5te2A8xCLHn5ealS4rx8IEUCIEUZpXlwI2AReo
  lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO9sA6ApPJl5JXCbXgEdwQR0xKUVQSBHlCQipKQ
  amHq0r/0WO+KTEbg179+d97NzuRZzcH5aslOp4VjJhSoBhrrJ0rvqXx957jPn9EbvghuLqyyL
  X+WLGei6d6zizzm5M9X+/cfavuh5a9gd/ge8uBtXa5a/+H3n8cgkvm05m/8XM5+61T69fzqTF
  9OqxS08fyfqT1B3NmCVMD9WlFkovu/hj5LW1Ce5aYcF719+HTTZ5f6D51Vvv99SO355yZk3+W
  Vf3zz5tc2u6U5E3eH0DeeVVhvyabSwyt4Oy0l/f4n3TuIDruVPr51w+tEQ/OXXlSKpslullZo
  5bWcle/YL8tvqaDl9TRaI7Xu61fVD+OeaIp4HGl+v+oV94Jw4WW6xsLrqhC+cx/vWK+tz7lZi
  Kc5INNRiLipOBAB4+l1dSwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1666593715!111544!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13832 invoked from network); 24 Oct 2022 06:41:55 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 06:41:55 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 22FC21000E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:41:55 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 15CEF1000DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:41:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 07:41:53 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-charset-normalizer: upgrade 2.1.1 -> 3.0.0
Date: Mon, 24 Oct 2022 14:41:36 +0800
Message-ID: <1666593696-28739-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99274

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Added

    Extend the capability of explain=True when cp_isolation contains at most two entries (min one), will log in details of the Mess-detector results
    Support for alternative language frequency set in charset_normalizer.assets.FREQUENCIES
    Add parameter language_threshold in from_bytes, from_path and from_fp to adjust the minimum expected coherence ratio
    normalizer --version now specify if current version provide extra speedup (meaning mypyc compilation whl)

Changed

    Build with static metadata using 'build' frontend
    Make the language detection stricter
    Optional: Module md.py can be compiled using Mypyc to provide an extra speedup up to 4x faster than v2.1

Fixed

    CLI with opt --normalize fail when using full path for files
    TooManyAccentuatedPlugin induce false positive on the mess detection when too few alpha character have been fed to it
    Sphinx warnings when generating the documentation

Removed

    Coherence detector no longer return 'Simple English' instead return 'English'
    Coherence detector no longer return 'Classical Chinese' instead return 'Chinese'
    Breaking: Method first() and best() from CharsetMatch
    UTF-7 will no longer appear as "detected" without a recognized SIG/mark (is unreliable/conflict with ASCII)
    Breaking: Class aliases CharsetDetector, CharsetDoctor, CharsetNormalizerMatch and CharsetNormalizerMatches
    Breaking: Top-level function normalize
    Breaking: Properties chaos_secondary_pass, coherence_non_latin and w_counter from CharsetMatch
    Support for the backport unicodedata2


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-normalizer_2.1.1.bb => python3-charset-normalizer_3.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_2.1.1.bb => python3-charset-normalizer_3.0.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_2.1.1.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.0.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.0.0.bb
index 1ab72e53d1..895f88a62e 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0974a390827087287db39928f7c524b5"
 
-SRC_URI[sha256sum] = "5a3d016c7c547f69d6f81fb0db9449ce888b418b5b9952cc5e6e66843e9dd845"
+SRC_URI[sha256sum] = "b27d10ad15740b45fd55f76e6901a4391e6dca3917ef48ecdcf17edf6e00d770"
 
 inherit pypi setuptools3
 
-- 
2.25.1



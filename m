Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE447C7115A
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.77954.1749526430938462080
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j8EEg5jO;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526431; x=1781062431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RcRGWU3/kAU6v8hW/OJzsa0n8SEy0q0StWcYnDJRyt4=;
  b=j8EEg5jOiw17unl6x0U74/gWVuMS21MFCa43YYXNBWAoOHKoxqUeAX5B
   MuJgCeVTnyLbbQtgYipbG3/MDX+qYbYGG453kyoa6RC/srl5E0F4Iwhp3
   d1CTdao7m6oQbjMCql6yF4xagYyK8NTQ0nqMIoHq4NbO+poE4xbLv4vE0
   V97yq0fuFOMP3YjUu0kHJfF4DwjEQD0Ph82zIsqNiVAtUCdFgWATv79QH
   ubfyOn6ZIFMjgv8wWzlSrnl5A3+ytV48SK4RJaZRzvt4vEZG3k9WLLnkl
   C//kAdBoPZkP2oK+29EdpRXz5AqVEStukgv+c62uOaP1gY3LT0AotDNFm
   w==;
X-CSE-ConnectionGUID: 0/mPbOZvRQ6FvHUaaOvdJw==
X-CSE-MsgGUID: Ui1ip+47SOGalT1VqJVClg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="190206640"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="190206640"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:48 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4EB4DD4C24
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F2659BF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:44 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 880171A0071;
	Tue, 10 Jun 2025 11:33:44 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/64] python3-bitarray: upgrade 3.4.1 -> 3.4.2
Date: Tue, 10 Jun 2025 11:32:55 +0800
Message-ID: <20250610033330.924-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117826

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* extend documentation of
  [compression of sparse bitarrays](sparse_compression.rst)
* 'util.sc_decode()' and 'util.vl_decode()' now raise 'StopIteration'
  instead of 'ValueError' when unexpected end of stream is encountered
* add debug mode tests for 'read_n()', 'write_n()' and 'count_from_word()'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.4.1.bb => python3-bitarray_3.4.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.4.1.bb => python3-bitarray_3.4.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.4.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.4.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.4.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.4.2.bb
index 36babb5d0b..f78901f140 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.4.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "e5fa88732bbcfb5437ee554e18f842a8f6c86be73656b0580ee146fd373176c9"
+SRC_URI[sha256sum] = "78ed2b911aabede3a31e3329b1de8abdc8104bd5e0545184ddbd9c7f668f4059"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6473AC27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:10:14 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.6131.1692864611012138992
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="117044959"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="117044959"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:10:06 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E65D1C68E4
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:10:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E585D3F2E
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:10:02 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B364920093544;
	Thu, 24 Aug 2023 17:10:01 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] php: upgrade 8.2.8 -> 8.2.9
Date: Thu, 24 Aug 2023 16:09:45 +0800
Message-Id: <1692864585-2297-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27832.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27832.006
X-TMASE-Result: 10--17.272700-10.000000
X-TMASE-MatchedRID: VzjocKpNZJyjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwh9avChsELqKJ/b
	umQx78u3FSSWT+IInLQjD//ESJOgu7HsBpPqgdy5Shw8vFddGdyp/958oU3WcHXHQq6zBeSUmaP
	XwDG+OHR0vsTsi+XrkaS6UDs/n0a6BZpGZUPET3HU+FgZu0rgDuC1p3r9o3NFe/eKgB30qtIXMz
	GRmrrl7khkzE7I8pG4IMuFrDGWl2R7g4ZY3xtN6zllFsU0CXSPHgcbZv4UDyn5HR+QztgdYE43e
	ugqjixl4PKuGN+8yk3vdEEr3Wzll5wsaabgZtY0MB2m5K0KuImy2aVB7PCjFfIxBL11I8HLUbHf
	6nVM6Pv3NoUOIWAhekSCcJaN/HUmxZDUGI7pII+qFx2c/3V5cZhqxsBO7lrLXtXt17pSeWBvKpx
	ZPgVlF6ANPwJm4czwbnJMM15Oaw775cEN6/qvTCoiRKlBVkYIZ/pzkZFXmlTYcqMquhsQnO79DJ
	RUi35poiRiRqJbjhYBXdtZPWfJ2i/7QU2czuUNA9lly13c/gElJy85NfiMczKv4QSPP2GxjkCq+
	5FtZluxfbhqGxLk+4Ay6p60ZV62fJ5/bZ6npdiQZS2ujCtcuA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:10:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104564

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Build:
  . Fixed bug GH-11522 (PHP version check fails with '-' separator).
- CLI:
  . Fix interrupted CLI output causing the process to exit.
- Core:
  . Fixed oss-fuzz #60011 (Mis-compilation of by-reference nullsafe operator).
  . Fixed line number of JMP instruction over else block.
  . Fixed use-of-uninitialized-value with ??= on assert.
  . Fixed oss-fuzz #60411 (Fix double-compilation of arrow-functions).
  . Fixed build for FreeBSD before the 11.0 releases.
- Curl:
  . Fix crash when an invalid callback function is passed to
    CURLMOPT_PUSHFUNCTION.
- Date:
  . Fixed bug GH-11368 (Date modify returns invalid datetime).
  . Fixed bug GH-11600 (Can't parse time strings which include
    non-breaking space characters).
  . Fixed bug GH-11854 (DateTime:createFromFormat stopped parsing datetime with
    extra space).
- DOM:
  . Fixed bug GH-11625 (DOMElement::replaceWith() doesn't replace node with
    DOMDocumentFragment but just deletes node or causes wrapping <></>
    depending on libxml2 version).
- Fileinfo:
  . Fixed bug GH-11298 (finfo returns wrong mime type for xz files).
- FTP:
  . Fix context option check for "overwrite".
  . Fixed bug GH-10562 (Memory leak and invalid state with consecutive
    ftp_nb_fget).
- GD:
  . Fix most of the external libgd test failures.
- Intl:
  . Fix memory leak in MessageFormatter::format() on failure.
- Libxml:
  . Fixed bug GHSA-3qrf-m4j2-pcrr (Security issue with external entity loading
    in XML without enabling it). (CVE-2023-3823)
- MBString:
  . Fix GH-11300 (license issue: restricted unicode license headers).
- Opcache:
  . Fixed bug GH-10914 (OPCache with Enum and Callback functions results in
    segmentation fault).
  . Prevent potential deadlock if accelerated globals cannot be allocated.
- PCNTL:
  . Fixed bug GH-11498 (SIGCHLD is not always returned from proc_open).
- PDO:
  . Fix GH-11587 (After php8.1, when PDO::ATTR_EMULATE_PREPARES is true
    and PDO::ATTR_STRINGIFY_FETCHES is true, decimal zeros are no longer
    filled).
- PDO SQLite:
  . Fix GH-11492 (Make test failure: ext/pdo_sqlite/tests/bug_42589.phpt).
- Phar:
  . Add missing check on EVP_VerifyUpdate() in phar util.
  . Fixed bug GHSA-jqcx-ccgc-xwhv (Buffer mismanagement in phar_dir_read()).
- PHPDBG:
  . Fixed bug GH-9669 (phpdbg -h options doesn't list the -z option).
- Session:
  . Removed broken url support for transferring session ID.
- Standard:
  . Fix serialization of RC1 objects appearing in object graph twice.
- Streams:
  . Fixed bug GH-11735 (Use-after-free when unregistering user stream wrapper
    from itself).
- SQLite3:
  . Fix replaced error handling in SQLite3Stmt::__construct.
- XMLReader:
  . Fix GH-11548 (Argument corruption when calling XMLReader::open or
    XMLReader::XML non-statically with observer active).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.8.bb => php_8.2.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.8.bb => php_8.2.9.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.8.bb b/meta-oe/recipes-devtools/php/php_8.2.9.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.8.bb
rename to meta-oe/recipes-devtools/php/php_8.2.9.bb
index 407b1a7bcb..27d3be1b00 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.8.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.9.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "995ed4009c7917c962d31837a1a3658f36d4af4f357b673c97ffdbe6403f8517"
+SRC_URI[sha256sum] = "48460b994ae7eb5096a310f44d13e865de1771104d4a550d53072be58a6f176c"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.34.1



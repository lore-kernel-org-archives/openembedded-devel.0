Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F71CCFA02
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:52:45 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.2272.1693965157731296622
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="119204154"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="119204154"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:52:35 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 37775DDC66
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:52:33 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 67E45BF49C
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:52:32 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7259C2FC7C3F;
	Wed,  6 Sep 2023 10:52:31 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dialog: upgrade 1.3-20210509 -> 1.3-20230209
Date: Wed,  6 Sep 2023 09:52:24 +0800
Message-Id: <1693965144-13772-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.003
X-TMASE-Result: 10--9.303600-10.000000
X-TMASE-MatchedRID: 82BO9bqjodKjz0nOeth/yUIIxwDaU5mra9qiaDSLgo1X5bL9foRcMOZO
	y8vmsc/pUNRbIfx+Uhl7QcXSi5EFWMgqWOFh1Y7mGqSG/c50XgOZWPwlDsNQO0ZCAhWuYEvk/iY
	emsxpwf8Dn7Bdvf4NTFfkqDtabvJve3zUD/39EGhtN2GsBybzwvUORLBtNVveikvLPxTKpjhuI+
	hyUk4LLUV2+a1Xbb1nzqAr3/L/PtLXmFwnBfht+TiEPRj9j9rvC//1TMV5chNAzPYUSDzxTHMWf
	mr8UEU8A/oe4NwFf2patvUzMDckKqqrJ2yPRGzpYrc32n84WHowJwB9TKmJWOpY5BJPoYQHRJkW
	V0vtUTW90igsQ32uTQhBeNJICtc+SrSMtFY6t8eQJOFc+qyqKxCE2NlBjIjclPH7Ysio2a3TI48
	G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDTsKXyzHgcEb+KgiyLtJrSDczjWtUbKcdxtKqD
	nNa0HKu3APcFaek9Uua2HxxNDjveVHGbcDbAq6gxsfzkNRlfJjttZtPQewZvoLR4+zsDTtFEAkL
	aTcFnrqNUynLXaJubsrgd+IwQk06D2DTRcW6q2s27nTZ7+Ksw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104732

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 + update test-package for Debian to use debhelper.
 + adjust character-offset in editbox.c in case it is past the end of
   the string after trimming (Debian #1003185).
 + updated ro.po from
         http://translationproject.org/latest/dialog/
 + fix some inconsistent #if vs #ifdef.
 + correct off-by-one limit for month when validating parameters of the
   calendar widget
 + modify dlg_yes_labels to not switch to ok/cancel labels if the
   extra button is used
 + move leak-checking definitions from dialog.h to dlg_internals.h
 + use mktemp utility rather than tempfile for temporary filename in
   the sample scripts
 + updated id.po, lt.po from
         http://translationproject.org/latest/dialog/
 + update config.guess, config.sub
 + directly include stddef.h for systems which need it for offsetof().
 + modify gauge's handle_input function to use the file pointer in the
   object in preference to the global dialog_state.
 + correct height-computation for fselect and timebox, broken by fixes
   for auto-layout (Debian #990043, cf: 2019/11/10).
 + improve configure --with-no-leaks option
 + amend adjustment to inputbox height so the autosized dimensions match
   older versions
 + improve configure checks, to reduce warnings during those checks
 + updated fr.po from
         http://translationproject.org/latest/dialog/
 + update config.guess, config.sub
 + change shared-library configuration in test-packages to use the
   ABI version in the library filename to match its SONAME.
 + add sample scripts to test-packages, using new makefile rule
   "install-examples".
 + corrected cdialog*.install helper scripts in test-package for Debian
 + change ftp URLs in test-packages to https
 + updated configure script, e.g., for compiler-warning fixes.
 + updated fur.po, zh_TW.po from
         http://translationproject.org/latest/dialog/
 + modify slackware.rc to match dialog's output from "make check" using
   this configuration file (FreeBSD #267777).
 + fix shellcheck warnings in helper-scripts for building/installing.
 + updated configure script, e.g., for compiler-warning fixes.
 + updated hu.po from
         http://translationproject.org/latest/dialog/
 + update config.guess, config.sub, install-sh
 + initialize color-settings before --create-rc option is processed.
 + add "use_scrollbar" setting in rc-file to use in whiptail.rc
 + improve manual page discussion of "--" token.
 + updated configure macro for math-library functions.
 + updated ca.po from
         http://translationproject.org/latest/dialog/
 + update config.guess
 + fix links in manpages (FreeBSD #264660).
 + document the built-in key bindings which are not part of widgets.
 + updated da.po fa.po is.po, added ka.po from
         http://translationproject.org/latest/dialog/
 + update config.sub
 + adjust fallback bindings for backspace/delete to match the curses
   library's sense of backspace (Arch #74379).
 + amend limit-checks to make --max-input work for sizes greater than
   2048 (Debian #1004874).
 + corrected limit-checks in checklist.c, menubox.c, and treeview.c when
   resizing while the data is scrolled (Debian #1004868).
 + improve logic for updating form-height after screen-resizing.
 + move most of the non-API definitions from dialog.h to dlg_internals.h
 + updated configure macros.
 + update config.guess, config.sub
 + updated es.po, tr.po from
         http://translationproject.org/latest/dialog/
 + install ".pc" files in the test-packages.
 + add pkg-config ".pc" file, for use with the development library.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dialog/{dialog_1.3-20210509.bb => dialog_1.3-20230209.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20210509.bb => dialog_1.3-20230209.bb} (92%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20210509.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20230209.bb
similarity index 92%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20210509.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20230209.bb
index d67156e1fd..444b97c4e6 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20210509.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20230209.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "https://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
-SRC_URI[sha256sum] = "ae478fe7d5fca82bcf4b51684641e07d2ee68489d319710fe1e81f41a197bd66"
+SRC_URI[sha256sum] = "0c26282305264be2217f335f3798f48b1dce3cf12c5a076bf231cadf77a6d6a8"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.34.1



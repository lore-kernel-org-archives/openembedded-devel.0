Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A99AC77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:08:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.103575.1683540487798705440
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xBb+IByr;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540485; i=@fujitsu.com;
	bh=/JbNZKPDdERYmAJdre6Si6mH+I8FhVKNLnUWada3pj0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=xBb+IByrQE11lmLT+rHoIYRStKm/KXnB2ndNu6mhiTVN+ZoCxNvj/qznIR3gBNG3G
	 5BUr5AI2F1AQBJkdtMfrrkrK4Kcg+GvMfDIcx++z0TbnltI7vWR6wX8tZfn+h9V/MR
	 RN7sa2eMTJ06SHIiXGlzqKpIekJN4PIxXGCl7/ywJrLtmr8nwNxwZ/UtO2qE1g6YN9
	 MR78iT9jwqV05pN5ZGhaV0O2VETr4F2tUHK02N6iCb/QcxuMiV04q0NCiMjoMCjSrV
	 THcy1YNO0A2DmnubJAKcMSjTfFVqNyqNIO0FFgPKQoS+ywVYARYYGfquN0FwGQFzEx
	 rfBmejoC/LZGA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRWlGSWpSXmKPExsViZ8ORpMt6KiL
  FYN4SEYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPKvD7GgrO8FYeedTI1MN7h7mLk4hAS2Mgo
  sWXJJiYIZxqTxPyde1i6GDk52AQkJKbvPckOYosI6Ep8/DCXEcRmFlCRmDH5CBOILSzgILF35
  gxWEJtFQFXiyve5YPW8Ak4St/5cZQaxJQQUJKY8fA9kc3BwCjhL3F4gABIWAirpPHmcCaJETe
  LquU3MExh5FjAyrGI0K04tKkst0jXXSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1ks
  tLtYrrsxNzknRy0st2cQIDImU4lTPHYxtu/7qHWKU5GBSEuU1PRiWIsSXlJ9SmZFYnBFfVJqT
  WnyIUYaDQ0mCt21bRIqQYFFqempFWmYOMDxh0hIcPEoivLJHgNK8xQWJucWZ6RCpU4yKUuK8I
  ieAEgIgiYzSPLg2WExcYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMuxlkCk9mXgnc9FdAi5
  mAFvtfDgdZXJKIkJJqYNLJPij3eNK8rp4dFcn7FY55RyT0KCrxXDn6+MbJuu8JHjV5tXcffFP
  786vVKl5qrlPR67kNhp53itJOh/L35M+VOv/86b26Y7UzpTcXvZ2R9mwxj2eCgoh42rWdtnYt
  5n/ZpM4mTVDkS3rw0Zstni34wiLvXx7JIkfC/HO6Dx2/5vLlwtLl6mYFn9cEXY/j/OMdbanmG
  Sv0K3PzU4dPpzZFMS+z8LGP+mKbck///JdH52ZmRC5Z8fPxi2CGG3dyxCVLgu5U5u6t5kk8+C
  Fq2uNKBpuWJQf+P/RYcV3k29uq07JLducveHR1wpLkDUGTZmTs625169q7du4How+6VxLubgr
  a5RH/Ln1i//+75jOVWIozEg21mIuKEwFNAeAJBAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-732.messagelabs.com!1683540484!497384!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7222 invoked from network); 8 May 2023 10:08:05 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:08:05 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id BD1A01D5;
	Mon,  8 May 2023 11:08:04 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E39EF1C2;
	Mon,  8 May 2023 11:08:03 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libplist: upgrade 2.2.0 -> 2.3.0
Date: Mon,  8 May 2023 18:07:49 +0800
Message-Id: <1683540471-25268-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683540471-25268-1-git-send-email-wangmy@fujitsu.com>
References: <1683540471-25268-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102397

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Changes:
  * Rename PLIST_UINT to PLIST_INT and add plist_new_int() and plist_get_int_val()
  * Add support for JSON format
  * Add support for OpenStep format
  * Introduce error codes and format constants
  * Add return value to import/export functions to allow returning error codes
  * Add new plist_sort function
  * Add several human-readable output-only formats
  * Add new plist_write_to_string/_stream/_file functions
  * Add new plist_print function
  * Add new plist_read_from_file function
  * Add new plist_mem_free() function
  * Add a few C++ methods
  * Add C++ interface test
  * Add PLIST_NULL type
  * Some code housekeeping (mostly clang-tidy)
- Breaking:
  * plist_from_memory() gets additional parameter
- Bugfixes:
  * Fix multiple bugs in all of the parsers
  * Fix handling of PLIST_UID nodes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-extended/libimobiledevice/libplist_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
index 82f3e4d0c9..8f5a7f166f 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
@@ -8,9 +8,9 @@ DEPENDS = "libxml2 glib-2.0 swig python3"
 
 inherit autotools pkgconfig python3native python3targetconfig
 
-PV = "2.2.0+git${SRCPV}"
+PV = "2.3.0"
 
-SRCREV = "db93bae96d64140230ad050061632531644c46ad"
+SRCREV = "72480212cd8ec0ab8d0b5064df52c146cac603b4"
 SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.34.1



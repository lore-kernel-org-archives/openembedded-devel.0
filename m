Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7576CCD18F
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:28 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.11102.1760433615330039716
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iVscmLRz;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433624; x=1791969624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DmWWfxydlaboKXwenfOiT2gMN6z5funhJkeNxAp5Ifk=;
  b=iVscmLRzJrLKTROSqSOExdz/QtcLWGZOcke6WPfz1lEGba2GTvIjXtG5
   /ZSuLTlhRFMRZv7u3kroiYiM5/qAlt27X1atTCuXY3+3B6rOvN8oAAmgT
   ZnaFkvwO3aEmLL3lQWNGkJnmTccqp5gJTRrAgZfqydmh+V2KgvAxGS4dS
   s4WhGE9A06hpVmpZHrWHu9t4R3tP239IqUM3dAdgdObvSW69D3GQipXRv
   R9UxRTxL0yO6xTrV59ZQTX2iApckqFTNkNBkc5BW6Y7C6esXjhmTqB3SR
   s2Z4IR26H5yhwIGOBVfAlw+fN4ifS3vCxrsY1wndKju62HA7QaHdKhWyR
   A==;
X-CSE-ConnectionGUID: u97SQLEqTt6xdQa1OGaoRg==
X-CSE-MsgGUID: 1LZ+dTZkTEOLDbGa/9x0Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="203275711"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="203275711"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:20:23 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 9AB6A1002B9A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:23 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 550C08D29FC
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id C4E76101BB76;
	Tue, 14 Oct 2025 09:20:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/44] python3-nltk: upgrade 3.9.1 -> 3.9.2
Date: Tue, 14 Oct 2025 17:19:11 +0800
Message-ID: <20251014091927.493-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120585

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
* Update download checksums to use SHA256 in built index
* Fix percentage escape in new-style string formatting
* replace shortened URLs using goo.gl
* Make Wordnet interoperable with various taggers and tagged corpora
* Fix saving PerceptronTagger
* Document how to reproduce old Wordnet studies
* properly initialize Portuguese corpus reader
* support for mixed rules conversion into Chomsky Normal Form
* only import tkinter if a GUI is needed
* issue #2112 with Corenlp
* new environment variable NLTK_DOWNLOADER_FORCE_INTERACTIVE_SHELL
* Lesk defaults to most frequent sense in case of ties

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-nltk_3.9.1.bb => python3-nltk_3.9.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-nltk/{python3-nltk_3.9.1.bb => python3-nltk_3.9.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.1.bb b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.1.bb
rename to meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.2.bb
index 464e578ba9..8a1e0cc047 100644
--- a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.1.bb
+++ b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.2.bb
@@ -21,4 +21,4 @@ RRECOMMENDS:${PN} = "\
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "87d127bd3de4bd89a4f81265e5fa59cb1b199b27440175370f7417d2bc7ae868"
+SRC_URI[sha256sum] = "0f409e9b069ca4177c1903c3e843eef90c7e92992fa4931ae607da6de49e1419"
-- 
2.43.0



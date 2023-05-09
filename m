Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B755C7EE23
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 08:45:11 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.26973.1683621905353906002
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 01:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dVH/sWDA;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683621903; i=@fujitsu.com;
	bh=2avZJgp5Z0buvg05BHf2frSYhQZqwfrQSVdN98dLOJA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=dVH/sWDA0bvCmq8tpEn/C9/oaBI0dBWlrSrdkGtsATseRKoWZPOMSwTJ8ItIaAUam
	 xyPcnHBk0z2JO3oFz2Z4NRue8VLXaTpCgB3hAW4MzAhmEfQonWgzPQNSg9cg71iw0u
	 dijcIJGcDq2z9ZNovKIiz+8o6WUeoEXbAR1yA6P21C53JAJ1zl+eq/PVLqBD57S+vg
	 +sIphLerzAMGj2zSDXidQp7n1NjbLKcTRcJL9OWoANGVKZV+BtJD4pW1wTqtxqxT/c
	 ySgcI/2m6qGgjufA0EOCuYa6oAfSH6ghJBKJc8txBjaTUvBq7OuuDHHj80UjjMf2SO
	 djnb3vRYHNE4Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLLMWRWlGSWpSXmKPExsViZ8ORpMvDEZV
  icHCdjcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHv73WWgvmiFf+6G5kbGJ8KdTFycQgJbGSU
  uHF4LwuEM5VJYseVw8xdjJwcbAISEtP3nmQHsUUEdCU+fpjLCGIzC6hIzJh8hAnEFhZwlti94
  idYPYuAqkTTnt+sIDavgKPEkwULweISAgoSUx6+B7M5BZwk/m2YxAJiCwHV/Jm1mQ2iRk3i6r
  lNzBMYeRYwMqxiNC1OLSpLLdI100sqykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtY
  rrsxNzknRy0st2cQIDImUYpa3Oxg/7fyrd4hRkoNJSZS3a19kihBfUn5KZUZicUZ8UWlOavEh
  RhkODiUJXmfWqBQhwaLU9NSKtMwcYHjCpCU4eJREeE+wAKV5iwsSc4sz0yFSpxh1Oa5eubKXW
  YglLz8vVUqcV4gdqEgApCijNA9uBCxWLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5tUBWc
  WTmVcCt+kV0BFMQEf4Xw4HOaIkESEl1cC0Kr38qL7neWU5y89G4nxOhpuro8sLT5za8PX/1kn
  X5r56Pj9ZyKl5av+P+oMFi0vkl9mu41/e8/C8rCO3t7LHX5vmLLZbPHs+rXoXNuX6WocFbNvf
  uTZb7e5MWMbCuejdvA3ZhpPOXHzBosn5K8tBapHjfjfL268Pxi3sW26VNXnaqc31Z59rl5TGq
  55huMS8cNbxlB2zd71YaTG1aoN8vpjhlyTzTweX8j/ivaW1Ii95TfRxrsoDC/UehW+IC0r137
  Pzg2iGxYlZW3Nu3d7H+rC7aF2krcXO36+OWU8w7FwYs+qT+OwFSYq6UU3LOwz+KrKUS7MWp+b
  W/NY4dqPrUW/Z7D0Ol9vOC3RN6rRcpsRSnJFoqMVcVJwIAP/el1QQAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-585.messagelabs.com!1683621900!14865!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11255 invoked from network); 9 May 2023 08:45:00 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 May 2023 08:45:00 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 798A01B1;
	Tue,  9 May 2023 09:45:00 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B7A3B7B;
	Tue,  9 May 2023 09:44:59 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH V2] libplist: upgrade 2.2.0 -> 2.3.0
Date: Tue,  9 May 2023 16:44:48 +0800
Message-Id: <1683621888-1304-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683621888-1304-1-git-send-email-wangmy@fujitsu.com>
References: <1683621888-1304-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 08:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102494

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
 .../libimobiledevice/{libplist_2.2.0.bb => libplist_2.3.0.bb} | 2 +-
 meta-oe/recipes-extended/libimobiledevice/libplist_git.bb     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/libimobiledevice/{libplist_2.2.0.bb => libplist_2.3.0.bb} (95%)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
similarity index 95%
rename from meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
rename to meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
index daaff00395..0ca21314ac 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
@@ -8,7 +8,7 @@ DEPENDS = "libxml2 glib-2.0 swig python3"
 
 inherit autotools pkgconfig python3native python3targetconfig
 
-SRCREV = "c5a30e9267068436a75b5d00fcbf95cb9c1f4dcd"
+SRCREV = "72480212cd8ec0ab8d0b5064df52c146cac603b4"
 SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
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



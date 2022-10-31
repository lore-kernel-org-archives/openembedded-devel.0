Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFD6C38A02
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 08:42:40 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.6969.1667205755719598452
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 01:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZMBvklBo;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667205753; i=@fujitsu.com;
	bh=GsZz8RckjPXKBSVxdtbHMEirWf60+Qz/epwRYrJ42XE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ZMBvklBop3Sp4xCrC3X0YnhOv6e3sJ/5O8SumYhLMimgt9/9/2JXVl3H2WEvjzqyT
	 lrs/ci9AaYFNZ5ldMRGGL0kt+yZBlc+CXFgOVXkh6jndSqBqlAdDW2tWspApnIAgXt
	 I2Zgwcutax9YSictIwatsQqTObLYQb+ui/Qv9OtIx8aXH62tTshIQQJR77WEfZDV8Z
	 X+z0C4dTS0I3+c4z/m+2wXQs/cTHVxAzh7nmcyWHa6ROBP319/8qzHu1iDe3P8s5R/
	 k7FW/aczaJh5LcStvTDRx5O3IcRtyciVYxIbam/kLpkvBrHtwq3eBqBgH+qSveGueC
	 mOEVA215IOmVw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpFvZFZ9
  ssPyStMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHr4wrWgmbeipMXHjE3MG7j7mLk4hASeMgo
  sf78ekYI5zKTxN69f5ggnD2MEs8+32HvYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  rAaYQEniTnXl7OA2CwCqhId+/8C2RwcvAKOErv3l4OEJQQUJKY8fA/WyglUfuHUDSYQWwio5O
  6906wgNq+AoMTJmU9YIMZLSBx88YIZoldRYvblZhYIu0Ji1qw2JghbTeLquU3MExgFZyFpn4W
  kfQEj0ypGs+LUorLUIl1LvaSizPSMktzEzBy9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src
  5JwUvbzUkk2MwOBNKU7P3cF4adkfvUOMkhxMSqK871rik4X4kvJTKjMSizPii0pzUosPMcpwc
  ChJ8DK2A+UEi1LTUyvSMnOAkQSTluDgURLh7W0FSvMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy
  9VSpy3rBOoSACkKKM0D24ELKovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLm3QpyCU9mXgn
  cpldARzABHcHWHgdyREkiQkqqgcnfMchOVCtSv7nLWzxur2VPzeePx4Q/v9zd0MO7tGATY8wP
  r1tNxVP3ndDa9G+Sgk/cYas0XaOjjc+WM/Y93Mxyf/H6c01ZMxlNj5dbPmGdcOMTf8rHPZNUp
  F4yODExvH5kdi322qkeDjcx1b0efhpnPim+3B6cWc37fRnLru9RkapLD8x8KLUn3tvy/OmUpZ
  IfHu88ZPPJOiNHXqNx3aanM6fG1N3YKWvle3RvVb7LW1auJ4abj4Wuvmq5qfbW2vfzjphtUQ3
  O43QPuHP4XSPfMwaOJPOWoMVh883Uf5mxM8puPTnXjHVnjtF+/pPPTjtnl5XWdYp4h1ncdopY
  285mIKV0dMICpcW6SbzzDJVYijMSDbWYi4oTAb7dYoZlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-728.messagelabs.com!1667205753!182413!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24762 invoked from network); 31 Oct 2022 08:42:33 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Oct 2022 08:42:33 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id EBD721AB
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:42:32 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E09C673
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:42:32 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 31 Oct 2022 08:42:31 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] tracker: upgrade 3.4.0 -> 3.4.1
Date: Mon, 31 Oct 2022 16:42:12 +0800
Message-ID: <1667205733-3829-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667205733-3829-1-git-send-email-wangmy@fujitsu.com>
References: <1667205733-3829-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99373

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  * Fixes to VAPI file
  * Fixes to IRI escaping checks in TrackerResource
  * Move fts: prefix definition to base ontology
  * Improve memory usage of already executed TrackerBatch objects
    for GC languages
  * Replace deprecated egrep tool usage in bash completion script
  * Fixes for memory leaks and invalid memory access
  * Fix endpoint-side cancellation of client-side D-Bus cancelled
    queries

Translations: ab, bg, hr, sk, tr

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tracker/{tracker_3.4.0.bb => tracker_3.4.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.4.0.bb => tracker_3.4.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.4.0.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.4.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.4.0.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.4.1.bb
index ed0fbb6f01..1428159ce3 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.4.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.4.1.bb
@@ -22,7 +22,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check python3native
 
-SRC_URI[archive.sha256sum] = "b3b380c9571d7c7423b5f401e4a2f2d78de47143b035eb2c1281e2423c59218b"
+SRC_URI[archive.sha256sum] = "ea9d41a9fb9c2b42ad80fc2c82327b5c713d594c969b09e1a49be63fb74f4fae"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.25.1



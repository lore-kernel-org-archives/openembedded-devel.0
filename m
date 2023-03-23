Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E10BC761AF
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 05:17:08 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web10.65779.1679548621645633033
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 22:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mMhR4jqo;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679548620; i=@fujitsu.com;
	bh=gHgvYLakULTf5Oig3/dfydA0/Y+CIDXMVhXBfFvR2LE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mMhR4jqojSNGvqyiDQr38CollCzTwRFExW9AYxbltPLADtowMLybPXbMdnZwuup3q
	 lqnpxpvMAOfHuuvVVp8GEoQPVxHotNoME7biQeN6nwf1b69MNeUDE7L0AtjE6FkmXc
	 Iw3dGTec97vLpNfw8dh8KiIRO8clKAyxWX6RY2jbLhwvIPYWKAsA4AnSwzz4si6zAp
	 2C+g+jWcMt4OnTzSCBHYAZNk/ZaVWMIMRft+wm2zfLWa/mpLYVnmHqhLqSXUd9imaq
	 fJwRddkBCWzix299t24lMq2KzKrwhMrLCC/E97aK+1H5YTC90aAYWB3eYfkqHEYl8K
	 mLEURNTb+G4HQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORpHv6gXS
  KwYbJ3BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bEuV+ZC35yV2yccp69gfE0VxcjF4eQwENG
  iVurbrFDOFeYJC4cXwbkcAI5exglpl8qArHZBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48bsHr
  F5YwEliz9VdTF2MHBwsAqoSl3eAlfAChR9fncAEYksIKEhMefgeLM4p4Czxu/cm1ConiQfTDz
  FB1AtKnJz5hAVivITEwRcvmCF6FSVmX25mgbArJBqh6iUE1CSuntvEPIFRcBaS9llI2hcwMq1
  iNC1OLSpLLdI110sqykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st
  2cQIDNyUYqZ3OxiX9/3VO8QoycGkJMorESqdIsSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV+AOU
  E6wKDU9tSItMwcYRTBpCQ4eJRHeuQeB0rzFBYm5xZnpEKlTjIpS4rxM94ESAiCJjNI8uDZY5F
  5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMyrcw9oCk9mXgnc9FdAi5mAFsfNkABZXJKIkJJ
  qYLpp+Ol4Bt+8DbNU54Z4mu+MzHfifV1assn+dOCkrFLZgpJ1Mt4SrD5fPnVM+TZXdf1XM/kv
  bCELjXNVXvy583x30obOVu/XCzPNNkntelC9XMjsxKFH+hy1Rjli7j5zd5Ukma0pUkvnLA0Wm
  Xno8JOirL1hdzWfnaoS8WJiP2V5dJdnUJi/c3a09PPIxBWnLombNU/L0FzcHdLK2FAvUZr8gu
  3IJ7eUlFzH3by5X+8rPJVu4stqqN3evdxq1fVTTmptijov9hY/urnV5dqdkjsZzqdqVc5fn1d
  qsfoo75z02rlRf39x161U4Ltw3vg/36ElBQ+evVnUElsj8ftIUdEuHzY2hZRXsbER5q+9lFiK
  MxINtZiLihMBq9tWV1cDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-585.messagelabs.com!1679548618!171163!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5862 invoked from network); 23 Mar 2023 05:16:59 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 05:16:59 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id C30331B4
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:16:58 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B81EB1AF
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:16:58 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 05:16:57 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] tracker: upgrade 3.4.2 -> 3.5.0
Date: Thu, 23 Mar 2023 13:16:36 +0800
Message-ID: <1679548598-20478-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679548598-20478-1-git-send-email-wangmy@fujitsu.com>
References: <1679548598-20478-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101664

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  * Dark theme fixes in documentation
  * It is now possible to use TrackerSparqlStatement for SPARQL
    updates for massive performance improvements.
  * JSON-LD is now supported as a RDF format
  * New auto-generated VAPI file. Updates might be necessary.
  * Reworked documentation, based on gi-docgen

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tracker/{tracker_3.4.2.bb => tracker_3.5.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.4.2.bb => tracker_3.5.0.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.4.2.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.5.0.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.4.2.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.5.0.bb
index 0cc6089ae..6b0e75b55 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.4.2.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.5.0.bb
@@ -22,7 +22,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check python3native
 
-SRC_URI[archive.sha256sum] = "4e6df142a4f704878fca98ebb5a224750e5ea546aa2aaabaa726a73540bd1731"
+SRC_URI[archive.sha256sum] = "13294275dbbbad9634b3a8390c08e6f12bebfe84f6ccafb72b27b0c23ba8da2f"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.34.1



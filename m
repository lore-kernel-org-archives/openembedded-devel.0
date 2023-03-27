Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF725C761AF
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 03:04:36 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.26476.1679886272071910135
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 20:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TIWGyliO;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679886270; i=@fujitsu.com;
	bh=CfxWGXkymYS1lB0SIe/sJ+UCHyUicnQ9URgRBArBdqc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TIWGyliOaGLhVcecAcP4jFc/+MfJzoUQoHvEcXsjzty1dA6YZYKSN8nwsaiXLV7sS
	 Ypi+H1stLGJyaksxvB2ng7ra5bCrcplgHJn5B3p4+NuAsGrFAp/R3QlD/1ExJI2gB4
	 I8wATN0o4Y1au4OfwsZdZn16cLO7rrXa9vyMNLBvRalyBQmOHiXv09KDM8r3f9JB3Y
	 hgnECRTLWVoMmwtk3R4HJeq1kWLseJuC/3TafcRwKzyUxxjq51Znk/S6D7sIPb0r5/
	 JYVocDlDsImh8X+KHWN9WHigLBqR498ldDIFIq+wXGquvDqhLwEnTaVYqgm7uwnN2F
	 KeAeg+VbfkB3A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpLuXXTH
  FYO9eKYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePqlPPMBbe5Kj5Me8bawLiXs4uRi0NI4CGj
  xL3Lb1ggnCtMEi0zfwA5nEDOHkaJd/3OIDabgJTEjfv/2UBsEQF9iaWz9zCD2MwCKhIvfvewg
  9jCAk4Ss2/sBKthEVCVOND4jAnE5gWKd1w8AlYvIaAgMeXhezCbU8BZ4vr2flaIXU4SR48+ZI
  OoF5Q4OfMJC8R8CYmDL15A9SpKzL7czAJhV0g0Tj/EBGGrSVw9t4l5AqPgLCTts5C0L2BkWsV
  oVpxaVJZapGtooJdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5da
  sokRGLwpxYzJOxiv9v3VO8QoycGkJMob7SafIsSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC14VNM
  UVIsCg1PbUiLTMHGEkwaQkOHiUR3jW/FFKEeIsLEnOLM9MhUqcYFaXEeT+B9AmAJDJK8+DaYN
  F7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwbyvIFJ7MvBK46a+AFjMBLf5WALa4JBEhJdX
  A5H5q4v+y6reuLix7nyZXHAu9FtT5efsWjzCeyC8ePCcOhK3ucYkqy56k909wi37N7Dv3XWIr
  P+1mbK4oZ3v2svXwJ5G/u25omUmITrkeLSWn8jH/2STmL3yLavg/7+W6o+CeY3dJT/4S10qpq
  rteSc7M3Y9M97Kbpgu950713//fdtbyucu8H9kG1OmVCX/IrD8zaeLjTl6VQt6ZPgnLL196F1
  B4LHzGmglmkxe7S/1on9Q5jeV2+cwfXG8WZEtvzJnZEa4gzbuT44/Bg2uTzwWsSL/y4xMP64H
  Zbzy0+W9pST8t61PfLBkhcKheZe7HBjmfedyfBPY/3agtyXVsPo9Xo+WG6Tx7xPOC8zQ7lFiK
  MxINtZiLihMBTeHEJFkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-585.messagelabs.com!1679886269!451855!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5727 invoked from network); 27 Mar 2023 03:04:29 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Mar 2023 03:04:29 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 0BB2B1AF
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:04:29 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 003BD1AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:04:29 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Mar 2023 04:04:27 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] folks: upgrade 0.15.5 -> 0.15.6
Date: Mon, 27 Mar 2023 11:03:33 +0800
Message-ID: <1679886213-20913-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679886213-20913-1-git-send-email-wangmy@fujitsu.com>
References: <1679886213-20913-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 03:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101758

From: Wang Mingyu <wangmy@fujitsu.com>

Major changes:
  * Projects should be able to use the typelib-based bindings
  * sysprof is now used for profiling
  * Lots of translation updates
  * Several smaller Meson changes

Bugs fixed:
  * folks-generics: Add missing generic type argument
  * tests/bluez: Follow PairDevice API change in python-dbusmock

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../folks/{folks_0.15.5.bb => folks_0.15.6.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/folks/{folks_0.15.5.bb => folks_0.15.6.bb} (92%)

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.5.bb b/meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb
similarity index 92%
rename from meta-gnome/recipes-connectivity/folks/folks_0.15.5.bb
rename to meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb
index ad61ee610..c94a9590f 100644
--- a/meta-gnome/recipes-connectivity/folks/folks_0.15.5.bb
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb
@@ -26,4 +26,4 @@ PACKAGECONFIG ??= ""
 
 inherit pkgconfig gnomebase gettext gobject-introspection vala features_check
 
-SRC_URI[archive.sha256sum] = "0fff8a896330cd82aee4598324f7e541c884d0337536212723b4beb38c759086"
+SRC_URI[archive.sha256sum] = "c866630c553f29ce9be1c7a60267cb4080a6bccf4b8d551dc4c7e6234d840248"
-- 
2.34.1



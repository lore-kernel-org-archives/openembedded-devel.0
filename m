Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B15FC433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 15:05:00 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web09.7503.1637593499535118956
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 07:04:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PTDYkbwE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637593497; i=@fujitsu.com;
	bh=EGngwmHZPXA++dkbfgaMvhNpUhyWFFfet4x+ZKENOLc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PTDYkbwEKd6pHt0eFhVQb57H3MzS/ebkezrH1tVvM+54PytHGxeIiA8mlH/kpu2yr
	 0DNGW3hVxbEhWxSJJBEETJW+eSQIGgjXbrzNuWLlLg7aJSxPPgkpRFEcayPkVrGjOr
	 3p8Iohl9O78txujp8E+pOFTwSpO3JVha6puN6pGoV3FBqFvFW7ofq/AYICebjjRYSA
	 bwmLWGLeDGksS+JmyOglp94d/kJbujSdXbfQ3c+9Iqf33cCRNtX1NtyT1nXwU/hU35
	 0AkVR2nmywo8pTFFtYCLnCzv+9ASeMjgCKty0dKxSDzbEaMzjkXKn1et1NGL431T3E
	 EfsbdnE5OuN4g==
Received: from [100.112.197.207] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 36/5F-08711-891BB916;
 Mon, 22 Nov 2021 15:04:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8MRojtj4+x
  Eg7dn1C0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozj9/YyFZzhrnh0+CJ7A+M5ri5GLg4hgZlM
  Eu3X+pkhnBOMEj/fr2DvYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvHrAaYQF/iZPrp
  4DZLAKqEgcmLwar4RVwkljy+TMTiC0hoCAx5eF7sDingLPEoTP3wOJCQDXLXyyFqheUODnzCQ
  vEfAmJgy9eMEP0KkrMvtzMAmFXSMya1cY0gZF/FpKWWUhaFjAyrWI0TyrKTM8oyU3MzNE1NDD
  QNTQ00jW0tNA1NtBLrNJN0kst1S1PLS7RNdRLLC/WK67MTc5J0ctLLdnECAzHlIJjcjsYe998
  0DvEKMnBpCTKazR7dqIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd7H64BygkWp6akVaZk5wNiAS
  Utw8CiJ8DqApHmLCxJzizPTIVKnGHU5rqxasohZiCUvPy9VSpz34AagIgGQoozSPLgRsDi9xC
  grJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYdxXIFJ7MvBK4Ta+AjmACOuL08ekgR5QkIqSkGpg
  Uo2IX9fN4PlrQcXbJly8u8eHC2XWVn11K+SzSZn65cqgtX2+D5V2F5dp35fflTuTjk3d/F86+
  cEL7M2/d+Y3OMVtXH7xfOE/oxH/lc+KXk0/80At4Ka+9IYA7SFfiF/9mhraeTT5uPu/8zJRTD
  Rp6XixgEBeqEng4RXapg4/mv9zrhllv/riV9d865HPW/cRLzh0zr93M4F23O2N5pJWV4o+I6J
  +mcdslZTfwmE1t55/vwzvL+uenxyqHn28SWrLjiW3vybvrl020fbYoPa+Of67Jaon/6Xe0Esu
  Xp6zcPMWDqUxZ5+lPjn7OqzNDfB5UcB2YcWmv3YmZka2Rt0WOhAQE/F3Tf+TGi9vXqoSVWIoz
  Eg21mIuKEwFE6T9fTgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-287.messagelabs.com!1637593496!432325!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8507 invoked from network); 22 Nov 2021 15:04:56 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-16.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Nov 2021 15:04:56 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1AMF4up6003720
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 15:04:56 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 22 Nov 2021 15:04:54 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] thin-provisioning-tools: upgrade 0.8.5 ->
 0.9.0
Date: Mon, 22 Nov 2021 23:04:19 +0800
Message-ID: <1637593460-99443-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637593460-99443-1-git-send-email-wangmy@fujitsu.com>
References: <1637593460-99443-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Nov 2021 15:05:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94101

Changelog is as follows:
======
- New support tools: thin_metadata_{pack,unpack}.
- thin_check can now check metadata snapshots.
- some metadata space map bug fixes.
- thin_check --auto-repair
- Stop thin_dump --repair/thin_repair ignoring under populated nodes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...isioning-tools_0.8.5.bb => thin-provisioning-tools_0.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/thin-provisioning-tools/{thin-provisioning-tools_0.8.5.bb => thin-provisioning-tools_0.9.0.bb} (92%)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.9.0.bb
similarity index 92%
rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
rename to meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.9.0.bb
index 5bcbea4600..0588e9be7b 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.9.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/jthornber/thin-provisioning-tools;branch=main;protoc
            file://use-sh-on-path.patch \
 "
 
-SRCREV = "5e5409f48b5403d2c6dffd9919b35ad77d6fb7b4"
+SRCREV = "d6d93c3157631b242a13a81d30f75453e576c55a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1



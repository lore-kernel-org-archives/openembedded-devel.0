Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5028AC64ED6
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 02:47:36 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.8888.1677206854213595031
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 18:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xQoc6oxZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677206852; i=@fujitsu.com;
	bh=kiSTxiCMBsaugtxRkMKIRVzKrvvz+2TpmQJxPXOZRlA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xQoc6oxZ2xInQp7l7gfwfN7cUFyzft6Bw7hSR26SEGQTg5pwuvt4Y6Heo+6Wqkl8C
	 c7G4fY5rE96d42t/Wjq8+ucycucWAlRlB2nkuo9xVEijCcIMc9I9RnoOmLo3N7W9k+
	 pIGfW8DlRyDsvG8iVNFivPG9va84cgJTB9ljWwTryKsjD/Mbzs9jmYQaDkyTQvr9kB
	 5gzmfNoQp6+1/bVqOj+EramK157Dhj5jgUvfDTg5LN2OikrMszQHaVnNeOhAUCs+4D
	 iBctzdvpavVtrp+fjdkJU9K1vf6Qn/plRaLrER+IOeXoSh4Woez5YtFR/3po/uY+2F
	 oaUXLZzb/kFdg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqOus+iP
  ZYFKPisXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH2/GGmgmdsFf2bVjI3ME5j62Lk4hASeMIo
  sX/+QhYI5waTxMZHXYwQzl5GifON35i6GDk52ASkJG7c/88GYosI6Essnb2HGcRmFlCRePG7h
  x3EFhYIk9j5YR4LiM0ioCpx9cxlsHpeASeJ66+bwGwJAQWJKQ/fA/VycHAKOEu8+loKEhYCKu
  l/uJgRolxQ4uTMJywQ4yUkDr54wQzRqigx+3IzC4RdKdH64ReUrSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo2lxalFZapGuhV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6K
  Xl5qySZGYOimFKs93sG4te+v3iFGSQ4mJVFeXZkfyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQke
  F8pAuUEi1LTUyvSMnOAcQSTluDgURLhZQNp5S0uSMwtzkyHSJ1iVJQS59VSBkoIgCQySvPg2m
  Cxe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG+7CtAUnsy8Erjpr4AWMwEt/v7mC8jikkS
  ElFQD01RugZ64GOu7CRyzZ3V6rblUs4X5Y316yoejbdoNxyOX8bx4LXtI2GSbxZTpBpqXfsT4
  Mutc5T5xdH6o+9IQJrbOvs8PN804Z1T9ffHDZmfBE69dXC9KV1ysfhXZf/+vo9K9W+Kash7W/
  gHHzzJOOBsXOK2e68b+xzHJe6QMyrIEmxn3NiWXmOUbHd/X+/2nwOmnyTquNxdPEmr7pGt/b8
  adu7szPTdXc3FdfMkZIDfx16mFSzaUfBeOU16npmSXftui2MXHZr1QA/OasoVte+d05prFV9R
  O1Q/WfbXTamLy7LXPp1zij//wYMIRuR0HrU6ZOM6pmaKymKmJMdinVuZpRe/VFXrL84V+zz3Z
  psRSnJFoqMVcVJwIAPCeS61YAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-571.messagelabs.com!1677206851!110627!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 362 invoked from network); 24 Feb 2023 02:47:31 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Feb 2023 02:47:31 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4A402100195
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Feb 2023 02:47:31 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3DCA0100182
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Feb 2023 02:47:31 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Feb 2023 02:47:29 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 2/3] libnet: Fix install conflict when enable multilib.
Date: Fri, 24 Feb 2023 10:47:17 +0800
Message-ID: <1677206838-16882-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677206838-16882-1-git-send-email-wangmy@fujitsu.com>
References: <1677206838-16882-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Feb 2023 02:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101243

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
file /usr/bin/libnet-config conflicts between attempted installs of libnet-dev-1.2-r0.aarch64 and lib32-libnet-dev-1.2-r0.armv7ahf_neon

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/libnet/libnet_1.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.2.bb b/meta-oe/recipes-connectivity/libnet/libnet_1.2.bb
index a996f9404..eaa0a0445 100644
--- a/meta-oe/recipes-connectivity/libnet/libnet_1.2.bb
+++ b/meta-oe/recipes-connectivity/libnet/libnet_1.2.bb
@@ -16,4 +16,6 @@ SRCREV = "deeeeaeb84f8bc5d2299913d4ccf53d0d4c26966"
 
 S = "${WORKDIR}/git"
 
-inherit autotools binconfig
+inherit autotools binconfig multilib_script
+MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/libnet-config"
+
-- 
2.34.1



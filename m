Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC364C77B7F
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:04:25 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.66544.1684069463206664297
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HmE9Ivth;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069463; i=@fujitsu.com;
	bh=RTW1hIknwN31h5bcHsP/uccS2E8/IdGHYnolqLBWkOE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=HmE9Ivth2C/uOZU2HT74Zh1IFfr/zilB7UJEucHW6nMdDTSbEzWJOc5g6r9NglSXz
	 GKh2zevmoPlLtNr0hWfO+IvXPMkbZTznoY4gnZ9eCrjs/+AJ9KPmRrDzxHldL4eZ6N
	 IqjzSXCTaOcYJUTc0NkX9uNHU6d6Y9FwHAy7VGve5MfOYkmeHZuTv1dWtW5DPvb8xd
	 kqWyHssSxYdJ8ZrCkMM0uedUMOUdWfdG/whAk+lWAguVA3zwAHpOasBFBI3jj/8BA/
	 HVDSaBsuzzq1Ax5StCKnpdmGrysv6Y0CXlTHOvG2q/xyMKjWgyiA76szUfF4WIMbm+
	 JF8ynfYtBiWTA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRWlGSWpSXmKPExsViZ8ORpBt2JyH
  F4F6TkMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrH5zwSWghdcFR+mdTM1MH7i7GLk4hAS2Mgo
  MePoLDYIZyqTxK+DKxi7GDk52AQkJKbvPckOYosI6Ep8/DAXLM4soCIxY/IRJhBbWMBd4vei8
  2wgNouAqsSWfwfAangFnCQOPV0AFpcQUJCY8vA9M4jNKeAssWrbQVYQWwioZtqC24wQNWoSV8
  9tYp7AyLOAkWEVo2lxalFZapGuuV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6hXmJ5sV5qcbF
  ecWVuck6KXl5qySZGYEikFLNv3MHYuOuv3iFGSQ4mJVHeayVxKUJ8SfkplRmJxRnxRaU5qcWH
  GGU4OJQkeHVuJqQICRalpqdWpGXmAMMTJi3BwaMkwht3FSjNW1yQmFucmQ6ROsWoKCXOewCkT
  wAkkVGaB9cGi4lLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5eW4ATeHJzCuBm/4KaDET0O
  Jbe+JBFpckIqSkGpiC99c+lmWTN5fY1Xcy6MrjnfNV7CpFZyv+mfrudkjL8YTlqWei/jIunnF
  pX5rkwc8Hxe8csq46xPO6U3RL5hHPZL7up1cvhV26MoGDJ/xivqbs3aLdWzJqbl3dKfGRb/f+
  dx96H+n77ktpm7LUo01PxmZ+QdYbKZkGfrtVtd8NBOvmxcr2r6hWidh3z7FCTrnUUNZ8d1Pzh
  XlKHa9KH0rI3+Vllli1NmxX1rYpRVz9C++XrWzqCp3z4t5bjtMXH2+/XTLRhaek7EW181Gf00
  55vHy/42+uZMsPn7TdzfR8w7wspYKghKwM75gpL9bohot9cE+c/7r9Oo+7joqUjVsOs9TtxuN
  T46JT58zqYVRiKc5INNRiLipOBACfTDbvBAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1684069462!582439!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17943 invoked from network); 14 May 2023 13:04:22 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:04:22 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E23351AC;
	Sun, 14 May 2023 14:04:21 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 14E8C7B;
	Sun, 14 May 2023 14:04:20 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libnet-dns-perl: upgrade 1.37 -> 1.38
Date: Sun, 14 May 2023 21:04:00 +0800
Message-Id: <1684069442-12244-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684069442-12244-1-git-send-email-wangmy@fujitsu.com>
References: <1684069442-12244-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102568

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Fix rt.cpan.org #148274
	Multicast DNS flag breaks Net::DNS::Parameters::classbyval

Fix rt.cpan.org #148273
	EDNS extended rcode not handled correctly

Fix rt.cpan.org #147507
	Nameserver.pm: peerhost undefined after $sock->accept

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnet/{libnet-dns-perl_1.37.bb => libnet-dns-perl_1.38.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.37.bb => libnet-dns-perl_1.38.bb} (95%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.37.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.38.bb
similarity index 95%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.37.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.38.bb
index e20e84d2a0..fcba788fbc 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.37.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.38.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "e672031158942a7016c0480ab3c1fd0d7f81ea5dd650d1ecca7116d5fd348565"
+SRC_URI[sha256sum] = "d8a34341649882d6e2bdf95d046e74c83a150b5e5d818941c1e341f48fba88e0"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.34.1



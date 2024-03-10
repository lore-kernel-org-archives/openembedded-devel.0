Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74530C54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 09:03:11 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.30515.1710061384706664321
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Mar 2024 01:03:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=pkxXofvc;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TnN1dT3lsY1EJ6Ax+4hsnZmLRMY8gYN5oRRpHyjBcS4=; b=pkxXofvc7N1qqu/S2U+HDksqwA
	tDgtxguEiwEtOCBPVx1PCdYX5U+P+sxV6nhUWsfGeMwPVtQf1G7buMgsErxaoxZJqlC5IVqKxOF07
	XxWehZtev8erVWtI12Wtd5WX26UOEqs79TK3Vn804ble7VjxAPk/OChe55WlRfAhGRu0qpHCmjMOk
	E+iLygnz1LCC4UJGCrmLeYYueLxxnUMVqUp8vRSTZ1IFgof3li2RPz0F24gq+NQmdU44lq4QfZra/
	vFimKrpLvIYxVJcVYGGbE/Ia1xigmoawQ+5ddSGqiYWnVZgTqML9q64V0QvYG/ysHh+CEo3U8NUHy
	pnYQe8lw==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:49234 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rjF59-00C89M-0a
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Mar 2024 05:03:03 -0400
Date: Sun, 10 Mar 2024 05:02:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] fmt: remove unnecessary "inherit ptest" directive
Message-ID: <3333aa41-27c-d4cc-cd30-99b4ce3f968@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Mar 2024 09:03:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109250


Given that the recipe does not provide the standard ptest
infrastructure, remove the superfluous inherit of ptest.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta-oe/recipes-support/fmt/fmt_10.2.1.bb b/meta-oe/recipes-support/fmt/fmt_10.2.1.bb
index c2f19c43a..1437eb480 100644
--- a/meta-oe/recipes-support/fmt/fmt_10.2.1.bb
+++ b/meta-oe/recipes-support/fmt/fmt_10.2.1.bb
@@ -9,7 +9,7 @@ SRCREV = "e69e5f977d458f2650bb346dadf2ad30c5320281"

 S = "${WORKDIR}/git"

-inherit cmake ptest
+inherit cmake

 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"



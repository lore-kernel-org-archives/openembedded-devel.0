Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCACC433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 15:16:00 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.4753.1643037357980239841
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 07:15:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=k0HvYGgm;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UTtOim0Qsk07NORSHJNP8mCagvSWGkDmNWojU9CDLfk=; b=k0HvYGgm2jRSoRzQCkDXJvxFAa
	MuNtCzOXNeouB2JvAhajvGhVC5s5KvG8KcNbssbC3mdd4EEKwTYpXz6fDAV93ySFeUZoCEaYo8jX/
	lt8SdztvDsUxpvi4D5zT9Fzp5yHnc6W5o9vRyBeCY4RG9g6Ooy6rwdtlliUJ9DhyM9zQTdpL0xcDk
	MnLygJp2bWrzhw3LK9uESzlf4efUnCrA4zKlM9e7npPBYSFRB9sM5P0AeTSYUAFdUYoJMC51UKPcH
	JrCvtVEcnpYVFRnCuf2eVx9EAnh8rr81rO2f+g32pY5r0c3oYj/NXSApbpnCwItJYy0QhWWAU/lu4
	JeJekqiQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:54618 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nC14m-0009G6-Q3; Mon, 24 Jan 2022 17:15:56 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-imageio: Upgrade 2.14.0 -> 2.14.1
Date: Mon, 24 Jan 2022 17:15:41 +0200
Message-Id: <20220124151544.876177-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jan 2022 15:16:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95035

Upgrade to release 2.14.1:

- Avoid raw bytes in exception message

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.14.0.bb => python3-imageio_2.14.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.14.0.bb => python3-imageio_2.14.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.14.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.14.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.14.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.14.1.bb
index f0ac37026..736a18262 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.14.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d"
 
-SRC_URI[sha256sum] = "1a612b46c24805115701ed7c4e1f2d7feb53bb615d52bfef9713a6836e997bb1"
+SRC_URI[sha256sum] = "709c18f800981e4286abe4bd86b6c9b5bb6e285b6b933b5ba0962ef8e7994058"
 
 inherit pypi setuptools3
 
-- 
2.30.2



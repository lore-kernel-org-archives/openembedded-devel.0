Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590F6C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 13:11:35 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.26131.1646658693695542562
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 05:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=BxAmm31c;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=e6X5e1v+n+zcTkoofC4Gi9qmbph/CVs7RKdf6I7OqYE=; b=BxAmm31c3hD3PN3ZR3zVvPULUm
	nb6Rs3KaIQW6ahYba/zu8Ox5w8X7ncdLGIot0TPfWEdXUhP+yy02oFAIkOAoP1WIUsZ9pgMHAPLSN
	WQZRFFSugX8C/j+HBry62ea0hhnE95xTbbWXqSxN5DygU9B6JZBdDUvxHUD/Nw9EIKvxvrnaWyTA+
	rYPm/xWX2kDwiXdPG7OZ2IzCeR5pLKxEYdYfnKz02zR5XUW4mjWQh3vv90Z7YRvo0xxnrEHS8jRiC
	A0vNahPixZrPHBquLGW9pTqdqUv6rAGkUXmU3QICrTAaflVdOKMbWjXgm4Q5g9Q/fA9yDCmTGChtK
	+WZqC9WQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:35064 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nRD9e-0002GR-6m; Mon, 07 Mar 2022 15:11:32 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-waitress: Upgrade 2.0.0 -> 2.1.0
Date: Mon,  7 Mar 2022 15:11:20 +0200
Message-Id: <20220307131120.3899473-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220307131120.3899473-1-leon.anavi@konsulko.com>
References: <20220307131120.3899473-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 13:11:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95859

Upgrade to release 2.1.0:

- Python 3.6 is no longer supported by Waitress
- Python 3.10 is fully supported by Waitress
- wsgi.file_wrapper now sets the seekable, seek, and tell
  attributes from the underlying file if the underlying file is
  seekable. This allows WSGI middleware to implement things like
  range requests for example
- In Python 3 OSError is no longer subscriptable, this caused
  failures on Windows attempting to loop to find an socket that
  would work for use in the trigger.
- Fixed an issue whereby BytesIO objects were not properly closed,
  and thereby would not get cleaned up until garbage collection
  would get around to it.
- When the WSGI app starts sending data to the output buffer, we
  now attempt to send data directly to the socket. This avoids
  needing to wake up the main thread to start sending data.
  Allowing faster transmission of the first byte.
- Add REQUEST_URI to the WSGI environment. REQUEST_URI is similar
  to request_uri in nginx. It is a string that contains the
  request path before separating the query string and decoding
  %-escaped characters.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-waitress_2.0.0.bb => python3-waitress_2.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-waitress_2.0.0.bb => python3-waitress_2.1.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb b/meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb
index 490dcee6c..99e483962 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb
@@ -6,6 +6,6 @@ SECTION = "devel/python"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
-SRC_URI[sha256sum] = "69e1f242c7f80273490d3403c3976f3ac3b26e289856936d1f620ed48f321897"
+SRC_URI[sha256sum] = "ec8a8d9b6b15f3bb2c1a82b8f3929a029c333c35fcafb08c185a9e562d8cc9c2"
 
 inherit setuptools3 pypi
-- 
2.30.2



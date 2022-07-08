Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DD6C43334
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 13:20:05 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.7328.1657286399436125746
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jul 2022 06:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=I1jgMC/h;
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
	bh=awPiUGYAIRfXNHZ9U0v62w62ZsWrl//5TEJG3SPtuLU=; b=I1jgMC/hUCc+SB+G3KG74VcTvj
	y2uxpU10QEQBfo3AOEdTtf4CkyVzAQpogbpdmfKQaLg7S6GkzNJxMuJ9XvFKn9jePVtJLKdVJPrQ/
	7VLANr5jCRV0eAQdVlRLIwcAS1y72rSTcXVrv26MGMFCMuBGUtZb/1EEYlfchqe/rB9T2lhJ8Fkhy
	FAACsCXSjl9MnT84dK+hl5OJ+ZMRMht0TnEQmL8/vXFaq3mirio617TRqufyuuBI/Mt9TJ2fCv4qR
	GH0Vf4NYwXTVOSQTYbbX3X5OcRiUZK+1dgYYjPAoWKI36SsnP3Ehm4S7uku3kXeQKoOa+lPekAQra
	H+rYnZeA==;
Received: from lan.nucleusys.com ([92.247.61.126]:50708 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1o9nux-00083b-CQ;
	Fri, 08 Jul 2022 16:19:58 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-tornado: Upgrade 6.1 -> 6.2
Date: Fri,  8 Jul 2022 16:19:47 +0300
Message-Id: <20220708131949.48129-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Jul 2022 13:20:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97787

Upgrade to release 6.2:

- The minimum supported Python version is now 3.7.
- Wheels are now published with the Python stable ABI (abi3) for
  compatibility across versions of Python.
- SSL certificate verfication and hostname checks are now enabled
  by default in more places (primarily in client-side usage of
  SSLIOStream).
- Various improvements to type hints throughout the package.
- CI has moved from Travis and Appveyor to Github Actions.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tornado_6.1.bb => python3-tornado_6.2.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.1.bb => python3-tornado_6.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.1.bb b/meta-python/recipes-devtools/python/python3-tornado_6.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-tornado_6.1.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.2.bb
index 1dedc5102..d94fd3927 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.2.bb
@@ -6,8 +6,7 @@ HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "f324f5e7607798552359d6ab054c4321"
-SRC_URI[sha256sum] = "33c6e81d7bd55b468d2e793517c909b139960b6c790a60b7991b9b6b76fb9791"
+SRC_URI[sha256sum] = "9b630419bde84ec666bfd7ea0a4cb2a8a651c2d5cccdbdd1972a0c859dfc3c13"
 
 inherit pypi setuptools3
 
-- 
2.30.2



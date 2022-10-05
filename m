Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D82C4332F
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 10:16:24 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.22024.1664964979832246610
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 03:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=amBBF9xh;
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
	bh=0MbyWRQ85jQ8LgQKkXfWQjCndxR/OW+qj/3FRIatE7g=; b=amBBF9xh4ZNI3+y9Gu6AeTOaOt
	PYOIIrASq4gf27tKTKybcVzA5TDjr0SIdUWjliaXbafoQEGnHmvuA6senZ/6+zdFiECZ+eRmsLsyH
	IJZGwlwVmPK9Q68FPA3+mRbT7lVifHkKBRKDKnxf4UgA0r0S/Za5vRj8u/Np75JfXkFrF/W6xx4FD
	JQQNaBaeTH7xJlf9LR9v5QoshU4IaOhA6sK1mxEf0t8GxMq9998c78/IRSeVTbriFaIqGNaxBYqE9
	t2z9Pmj5Uwc2K4drqUsWZEh6WWxY41gbxqvg51N74sRpLBHA0Wr9EFyHAvuy8AfpAOAD3fXg/TbXO
	5GroZ20w==;
Received: from lan.nucleusys.com ([92.247.61.126]:56146 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1og1Rr-000BY3-RP;
	Wed, 05 Oct 2022 13:16:17 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-networkx: Upgrade 2.8.6 -> 2.8.7
Date: Wed,  5 Oct 2022 13:16:07 +0300
Message-Id: <20221005101609.3571273-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Oct 2022 10:16:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99069

Upgrade to release 2.8.7:

- Fixed unused root argument in has_bridges
- docstring updates for union, disjoint_union, and compose
- Updated networkx/classes/function.py
- Improved documentation for all_simple_paths
- Change is_path to return False when node not in G instead of
  raising exception

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-networkx_2.8.6.bb => python3-networkx_2.8.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_2.8.6.bb => python3-networkx_2.8.7.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.8.6.bb b/meta-python/recipes-devtools/python/python3-networkx_2.8.7.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-networkx_2.8.6.bb
rename to meta-python/recipes-devtools/python/python3-networkx_2.8.7.bb
index 3eebfcf98..2212c2764 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_2.8.6.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_2.8.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=44614b6df7cf3c19be69d0a945e29904"
 
-SRC_URI[sha256sum] = "bd2b7730300860cbd2dafe8e5af89ff5c9a65c3975b352799d87a6238b4301a6"
+SRC_URI[sha256sum] = "815383fd52ece0a7024b5fd8408cc13a389ea350cd912178b82eed8b96f82cd3"
 
 inherit pypi setuptools3
 
-- 
2.30.2



Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB06CECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 11:58:53 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.5406.1663156730826783764
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 04:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=j1fp535t;
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
	bh=0lG0qFhJr+I+qHLp2Iawy0AJbIw68p2KGUVZMZLa2Bg=; b=j1fp535tlEyvYalpJ3KfL2ADTd
	jGNMLsMcB6Ye/cFDHuIKldKVshCgjr9mZdcbIZuDEuvOy7Pal5e/WuicIVjUEJWy0+DlKKK8iwQwc
	pFeAL6oY8JJbQnnj8EUz5spg9OmYrQm/ld1n+AwhFBqSp9Mbt99C4eK7q90HurfvQ4NQkPKn4jEzM
	7e1YvvP4ZSuVIawO0DGcltv21VzKs8bnsp3FjDLUOf0fpaN6T9D8DH2cLAyrS3SFtEHKIKMFTW9wr
	fVRSBnQFtFnh/K8UOtMR+5uSP4BrrnOvoduXMWv4dT4LyRDKqKVo8X0liA9R7a7HZRtQ+DBHt47Yi
	lCnxsoAg==;
Received: from lan.nucleusys.com ([92.247.61.126]:58898 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oYR2U-0002R1-Jm;
	Wed, 14 Sep 2022 14:58:48 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-networkx: Upgrade 2.8.5 -> 2.8.6
Date: Wed, 14 Sep 2022 14:58:32 +0300
Message-Id: <20220914115833.177477-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220914115833.177477-1-leon.anavi@konsulko.com>
References: <20220914115833.177477-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 11:58:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98793

Upgrade to release 2.8.6:

- Add random_spanning_tree to documentation
- Add warning to nx_agraph about layout nondeterminism
- Add cache reset for when G._node is changed
- Allow unsortable nodes in approximation.treewidth functions
- Add examples for the condensation function
- Improve LCA input validation
- Replace LCA with naive implementations

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-networkx_2.8.5.bb => python3-networkx_2.8.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_2.8.5.bb => python3-networkx_2.8.6.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.8.5.bb b/meta-python/recipes-devtools/python/python3-networkx_2.8.6.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-networkx_2.8.5.bb
rename to meta-python/recipes-devtools/python/python3-networkx_2.8.6.bb
index 8d0b8dbb3..3eebfcf98 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_2.8.5.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_2.8.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=44614b6df7cf3c19be69d0a945e29904"
 
-SRC_URI[sha256sum] = "15a7b81a360791c458c55a417418ea136c13378cfdc06a2dcdc12bd2f9cf09c1"
+SRC_URI[sha256sum] = "bd2b7730300860cbd2dafe8e5af89ff5c9a65c3975b352799d87a6238b4301a6"
 
 inherit pypi setuptools3
 
-- 
2.30.2



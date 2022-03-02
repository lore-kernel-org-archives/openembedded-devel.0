Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68711C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 22:27:52 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.4124.1646260070145816812
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 14:27:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=t51EeMVu;
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
	bh=G1qTrsGqnzCEiwJLmnGtfqghlqpfz1rROuVE5RIY7yg=; b=t51EeMVuq4K+YWxCUff86154+6
	k65LTB7atWhBTCxNrLIbJJcWfIw9mmzWX1GgxyyXj1x8NohrbUGVTIia4kD0Rs35MfUqM2hHc/e4n
	yS7dZIA4wdoWqSCTETp7Uwev4khf6eBNJPSmx0zeCGtxYru05fdnk+twjrVRJZUqQcFW+wONfzgA4
	Kx3z547gcMUrRpSudOWYIEhuPNMSIxqUoHnE6h7HVbX8ZCVzdJLk0gGqjt/UAPVVa32nbooBvBYhg
	OXcQ6hHQORTZPUV0Voyq2Uh1dyld3NcCYxdW58yUqWueo+ZD72WH4lmSk4YhxSt7VaaSOzW4p4dD5
	WA+Eryag==;
Received: from lan.nucleusys.com ([92.247.61.126]:32944 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nPXRu-000BsC-5D; Thu, 03 Mar 2022 00:27:50 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-networkx: Upgrade 2.6.3 -> 2.7
Date: Thu,  3 Mar 2022 00:27:35 +0200
Message-Id: <20220302222738.1047918-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220302222738.1047918-1-leon.anavi@konsulko.com>
References: <20220302222738.1047918-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 22:27:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95715

Upgrade to release 2.7:

- Dropped support for Python 3.7
- Added the Asadpour algorithm for solving the asymmetric traveling
  salesman problem
- Removed all internal usage of the numpy.matrix class, and added a
  FutureWarning to all functions that return a numpy.matrix
  instance
- Added support for the scipy.sparse array interface
- Added generic dtype support to
  ~networkx.convert_matrix.to_numpy_array
- Added support for computing betweenness centrality on multigraphs
- Added support for directed graphs and multigraphs to
  greedy_modularity_communities

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-networkx_2.6.3.bb => python3-networkx_2.7.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_2.6.3.bb => python3-networkx_2.7.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.6.3.bb b/meta-python/recipes-devtools/python/python3-networkx_2.7.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-networkx_2.6.3.bb
rename to meta-python/recipes-devtools/python/python3-networkx_2.7.bb
index 1608e0380..10030074d 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_2.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_2.7.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Python package for creating and manipulating graphs and networks"
 HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5cfa4d8f5881e0d053bb497130b9c73a"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=44614b6df7cf3c19be69d0a945e29904"
 
-SRC_URI[sha256sum] = "c0946ed31d71f1b732b5aaa6da5a0388a345019af232ce2f49c766e2d6795c51"
+SRC_URI[sha256sum] = "effb7d9cd5c36e1e0d33f42a3aef5badde5030535826a367d5cf608a170af515"
 
 inherit pypi setuptools3
 
-- 
2.30.2



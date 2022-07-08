Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4CECCA480
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 09:35:04 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.5558.1657272893199756769
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jul 2022 02:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=E0Iz5q3R;
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
	bh=bk8ibt/lQcDUXiYaucCmylp1VuIq61K2PgPrSHhh2Xw=; b=E0Iz5q3RlWkVvN/BS+IX5tntgR
	1Z7bEcrKiST46NNynF6pJtSjvIXq0ZtQqsIqQQSGys5/TnU7Z3otMzU/brNngOD7DyfkmKHLEsNdp
	Bocr1rF/cdmGBkJN7D81WMQchELNp8/5CzAIzHUBaMgeQTPKtmYOQ+imm6JooTS9mFIJcLVoWKQD3
	xzIjWs2XopjKyBRV0eJ7BNmGuhbD2uzzfJKvtkLqDNnZUOE8mA8jMS4RaMaPvNNM5REE1nBN2jbt3
	X2ce1FzuKPorpdI/IAq3Mnls5znThJGE3cmI472pqJLeTlsiw2BB7XXbA9Cbca/a0+nS87xGFeOWO
	10IePJ4g==;
Received: from lan.nucleusys.com ([92.247.61.126]:50666 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1o9kP7-0002uR-9V;
	Fri, 08 Jul 2022 12:34:52 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-networkx: Upgrade 2.7.1 -> 2.8.4
Date: Fri,  8 Jul 2022 12:34:34 +0300
Message-Id: <20220708093434.4110274-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220708093434.4110274-1-leon.anavi@konsulko.com>
References: <20220708093434.4110274-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Jul 2022 09:35:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97786

Upgrade to release 2.8.4:

- Clean up maximal_independent_set tests
- MAINT: Cleanup centrality module, remove unused variables
- importorskip scipy instead of numpy for total spanning tree
- Add initial_graph parameter to scale_free_graph and deprecate
  create_using
- Add docstring example for attr transfer to linegraph.
- Update ISMAGS.analyze_symmetry docstring.
- Add default value p=2 for minkowski distance metric.
- Update inline code to inline math in docstring
- Update multigraph docstrings to reflect remove_edges_from
  behavior.
- Update simple_cycles docstring w/ yields and examples
- Chromatic polynomial
- Catch ':' explicitly while working with pydot
- Revert "Add workaround for pytest failures on 3.11b2"
- Default to lightmode for documentation
- Dont compute all biconnected components in is_biconnected()
- Some more changes to make pytest-randomly happy
- Add durations flag to coverage run on CI.
- Recover order of layers in multipartite_layout when layers are
  sortable
- Update doc requirements
- Touchups to MG and MDG edges docstrings.
- Add PendingDeprecation for pydot
- Add example of topo_order kwarg to dag_longest_path

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-networkx_2.7.1.bb => python3-networkx_2.8.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_2.7.1.bb => python3-networkx_2.8.4.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.7.1.bb b/meta-python/recipes-devtools/python/python3-networkx_2.8.4.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-networkx_2.7.1.bb
rename to meta-python/recipes-devtools/python/python3-networkx_2.8.4.bb
index 9e5b086a9..8181d90c0 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_2.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_2.8.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=44614b6df7cf3c19be69d0a945e29904"
 
-SRC_URI[sha256sum] = "d1194ba753e5eed07cdecd1d23c5cd7a3c772099bd8dbd2fea366788cf4de7ba"
+SRC_URI[sha256sum] = "5e53f027c0d567cf1f884dbb283224df525644e43afd1145d64c9d88a3584762"
 
 inherit pypi setuptools3
 
-- 
2.30.2



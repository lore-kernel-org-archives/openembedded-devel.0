Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BB5C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 10:16:34 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.21906.1664964983689358289
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 03:16:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=FgHw6ww5;
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
	bh=yCzEfVYrkzv9VJF7JXZoctPK/2bYJ9uAZN2QjAN8s1A=; b=FgHw6ww5oAc5SOnQTSThVdAW8U
	N5UFbOE4zT7UVStPUsBIhmlu86QdrBku+GRok6vkOg/CTPZ9pKf/oEGAzQ30EyJAUqvGWPVl0L8kf
	c+h1AdftumEKLJn1F/EGBEgOUOKv5amRY8PBAwL6lUhnucTnikUY0/gdUskKe9NGoPmWH4dFn/ejO
	QGHt0JN4a2iXgOJgM4mXmZaqBnevB9NjWvWMNdgoCct/+11L64DJMQjDk6CyXdqA12bfTOWaQFWIE
	OkiOZ9AVkT2X/noBmec0sSYAyXWZaLXQZ9G3znQwO/dKQ9OXCSFdJo8T23r6Av909C5n0nG5WL8DR
	N1C/w/Jw==;
Received: from lan.nucleusys.com ([92.247.61.126]:56146 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1og1Rx-000BY3-5q;
	Wed, 05 Oct 2022 13:16:22 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-rdflib: Upgrade 6.1.1 -> 6.2.0
Date: Wed,  5 Oct 2022 13:16:09 +0300
Message-Id: <20221005101609.3571273-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221005101609.3571273-1-leon.anavi@konsulko.com>
References: <20221005101609.3571273-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Oct 2022 10:16:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99071

Upgrade to release 6.2.0:

- SPARQL: Fixed handing of HAVING clause with variable composition
- JSON-LD parser: better support for content negotiation
- Removed the following functions that were marked as deprecated
  and scheduled for removal in version 6.0.0: Graph.load,
  Graph.seq, Graph.comment, Graph.label
- Use functools.total_ordering to implement most comparison
  operations for rdflib.paths.Path
- Fixed error handling for invalid URIs
- InfixOWL: Fixed handling of cardinality 0
- Added quad support to handling to
  rdflib.graph.ReadOnlyGraphAggregate.quad
- Fixed base validation used when joining URIs
- Add GEO defined namespace for GeoSPARQL
- Fixed some issues with SPARQL Algebra handling/translation
- Fix SPARQL CSV result serialization of blank nodes
- Added a URIRef.fragment property
- Remove superfluous newline from N-Triples output
- Added a bunch of type hints

License-Update: Update years.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-rdflib_6.1.1.bb => python3-rdflib_6.2.0.bb}    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-rdflib_6.1.1.bb => python3-rdflib_6.2.0.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-rdflib_6.1.1.bb b/meta-python/recipes-devtools/python/python3-rdflib_6.2.0.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-rdflib_6.1.1.bb
rename to meta-python/recipes-devtools/python/python3-rdflib_6.2.0.bb
index 27f65dced..282d40709 100644
--- a/meta-python/recipes-devtools/python/python3-rdflib_6.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rdflib_6.2.0.bb
@@ -1,8 +1,8 @@
 SUMMARY = "RDFLib is a pure Python package for working with RDF"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b6cde159c801514e0e45a40cf0a9d3d9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bcae79bd3c84b857f42a98a7ccf6ad47"
 
-SRC_URI[sha256sum] = "8dbfa0af2990b98471dacbc936d6494c997ede92fd8ed693fb84ee700ef6f754"
+SRC_URI[sha256sum] = "62dc3c86d1712db0f55785baf8047f63731fa59b2682be03219cb89262065942"
 
 inherit pypi setuptools3
 
@@ -12,6 +12,8 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-xml \
+    ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-core \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2



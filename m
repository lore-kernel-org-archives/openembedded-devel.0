Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB253C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 12:19:15 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.5555.1642594754043403055
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 04:19:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=IL/uozE9;
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
	bh=kyMIXkBHNcIxmO2oPgmUXdEY3lV++V75f00tCxml8To=; b=IL/uozE9ZLBdEeXupmoI7u2BhQ
	m3AO+EkT833PCOoRm8Qh1lNlFrq0gq9tfrFf4J4+PRn3mlEZcYVpxcTGOl0QkOREVzgYlLS2DSCCZ
	eDsOs70ajygPIncw0ncZZd1dgXSl7urDASwL9d9njt+4zd1Hx6qnsVR4KqmLhS+3G/6c7syGn9IAt
	XnPzQVKUv5Kr0Fk+7qCKbJfCgJxGw7An/JVpkB9agzrOh6Zgcj0ymVNMP0aeC8F0q8sZdzMLjPHXg
	9xk74biNJWAxjPKfMgqs2ekqC/rSlku5SzKeJhuyF1Y4/8hQAfERw2DeIGgYk767xgbDtXn5DnKl1
	5OY0MbQw==;
Received: from lan.nucleusys.com ([92.247.61.126]:45782 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nA9vj-0006gb-C0; Wed, 19 Jan 2022 14:19:13 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-dnspython: Upgrade 2.1.0 -> 2.2.0
Date: Wed, 19 Jan 2022 14:18:57 +0200
Message-Id: <20220119121858.1575699-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220119121858.1575699-1-leon.anavi@konsulko.com>
References: <20220119121858.1575699-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 12:19:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94944

Upgrade to release 2.2.0:

- SVCB and HTTPS records have been updated to track the evolving
  draft standard.
- The ZONEMD type has been added.
- The resolver now returns a LifetimeTimeout exception which
  includes an error trace like the NoNameservers exception. This
  class is a subclass of dns.exception.Timeout for backwards
  compatibility.
- DNS-over-HTTPS will try to use HTTP/2 if the httpx and h2
  packages are installed.
- DNS-over-HTTPS is now supported for asynchronous queries and
  resolutions.
- dns.zonefile.read_rrsets() has been added, which allows rrsets
  in zonefile format, or a restrition of it, to be read. This
  function is useful for applications that want to read DNS data
  in text format, but do not want to use a Zone.
- On Windows systems, if the WMI module is available, the resolver
  will retrieve the nameserver from WMI instead of trying to
  figure it out by reading the registry. This may lead to more
  accurate results in some cases.
- The CERT rdatatype now supports certificate types IPKIX, ISPKI,
  IPGP, ACPKIX, and IACPKIX.
- The CDS rdatatype now allows digest type 0.
- Dnspython zones now enforces that a node is either a CNAME node
  or an "other data" node. A CNAME node contains only CNAME,
  RRSIG(CNAME), NSEC, RRSIG(NSEC), NSEC3, or RRSIG(NSEC3) rdatasets.
  An "other data" node contains any rdataset other than a CNAME or
  RRSIG(CNAME) rdataset. The enforcement is "last update wins". For
  example, if you have a node which contains a CNAME rdataset, and
  then add an MX rdataset to it, then the CNAME rdataset will be
  deleted. Likewise if you have a node containing an MX rdataset
  and add a CNAME rdataset, the MX rdataset will be deleted.
- Extended DNS Errors, as specified in RFC 8914, are now supported.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-dnspython_2.1.0.bb => python3-dnspython_2.2.0.bb} | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dnspython_2.1.0.bb => python3-dnspython_2.2.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.1.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-dnspython_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb
index 5466b4061..ee670af82 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb
@@ -3,9 +3,7 @@ HOMEPAGE = "http://www.dnspython.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
 
-SRC_URI[sha256sum] = "e4a87f0b573201a0f3727fa18a516b055fd1107e0e5477cded4a2de497df1dd4"
-
-PYPI_PACKAGE_EXT = "zip"
+SRC_URI[sha256sum] = "e79351e032d0b606b98d38a4b0e6e2275b31a5b85c873e587cc11b73aca026d6"
 
 inherit pypi setuptools3 ptest
 
@@ -22,6 +20,11 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
+DEPENDS += "\
+    ${PYTHON_PN}-wheel-native \
+    ${PYTHON_PN}-setuptools-scm-native \
+"
+
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-io \
-- 
2.30.2



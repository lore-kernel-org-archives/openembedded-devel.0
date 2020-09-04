Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by mx.groups.io with SMTP id smtpd.web12.2485.1599243450460694517
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2020 11:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=nFQJzWJ+;
 spf=pass (domain: igalia.com, ip: 178.60.130.6, mailfrom: jdapena@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; s=20170329;
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From; bh=z9nqh0rtRDVGaPs8xQaH0YuplYLPZe/pdge4iKrcfuc=;
	b=nFQJzWJ+wavlaEE3/ODPsd9N0ccyWVGus07+lqZ0g6g5Y0zEW7jTAnAiUS3/uFZUNi0prdQxU+f5H6IoXsH9iQ8rz2WVGoarroeWzRqeBhG/K1OIHzmfg/M1K2uu13ZJnunZwhG6zdMgeWDFb7f3SD69MQ9tbO1osNehkYbUeu/KWteCuSvh9di3T/7w3ZSdFOLxZi+5Qn+MX1+YTk81Yao+QuPfwAIDkk5UPLred/9iCwqyx8XAvqStYBb4fvAx+hVGT0MzKe07ILJp65KYXjAQ+qyvWzzskQMJ3dsiKSwAkzP5sqlsKDKV7zebThzdarolUvz5IBl3tzCGUPlkyA==;
Received: from 120.red-83-51-59.dynamicip.rima-tde.net ([83.51.59.120] helo=localhost.localdomain)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1kEGHA-0004bw-0a; Fri, 04 Sep 2020 20:17:28 +0200
From: jdapena@igalia.com
To: openembedded-devel@lists.openembedded.org
Cc: Jose Dapena Paz <jdapena@igalia.com>
Subject: [meta-oe][dunfell][PATCH] xmlsec1: do not use system libraries for non nss
Date: Fri,  4 Sep 2020 20:16:42 +0200
Message-Id: <20200904181642.252108-1-jdapena@igalia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case PACKAGECONFIG[nss] is not set, in case system includes
nss or nspr, it will still try to compile using system libraries.

To avoid that, this change explicitely uses --with-nss=no and
--with-nspr=no so configure does not try to find those libraries
if they are disabled.
---
 meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb
index 20c7b2d37..93b0d6a67 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb
@@ -32,7 +32,7 @@ inherit autotools-brokensep ptest pkgconfig
 PACKAGECONFIG ??= "gnutls libgcrypt nss openssl des"
 PACKAGECONFIG[gnutls] = ",,gnutls"
 PACKAGECONFIG[libgcrypt] = ",,libgcrypt"
-PACKAGECONFIG[nss] = "--with-nss=${STAGING_DIR_HOST} --with-nspr=${STAGING_DIR_HOST},,nss nspr"
+PACKAGECONFIG[nss] = "--with-nss=${STAGING_DIR_HOST} --with-nspr=${STAGING_DIR_HOST},--with-nss=no --with-nspr=no,nss nspr"
 PACKAGECONFIG[openssl] = ",,openssl"
 PACKAGECONFIG[des] = ",--disable-des,,"
 
-- 
2.25.1


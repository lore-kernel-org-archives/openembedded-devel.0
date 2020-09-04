Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by mx.groups.io with SMTP id smtpd.web11.2765.1599244571986350824
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2020 11:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=qKE0Wqpu;
 spf=pass (domain: igalia.com, ip: 178.60.130.6, mailfrom: jdapena@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; s=20170329;
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From; bh=/vNS75BLAVQRzH57+8XfjKt4XDEKAgtbM7WPTL57R/g=;
	b=qKE0Wqpu4NZK45kNbmGxmDweDctTI6T+e9N1Hh5Q6XPx7mxpB/pICT/Nuz1OtQ3Ylsu8osTt8K//Efuan5V5RwqVy1Om1Sm0qroRdo/YZ215Ld8bTVs93V585S/1PaIlzZyOHDSpnSK5isuIJC1d7emg8g+wAFqwdU1Qf3ilruvQa0Pq34g5GGJpWLfinS3hb1+6xuh16/o3JnwBAKdXMpNxmk3/TY42nJ/LhpbqtTBbxFBqxrgc+SqE9EdHGJReT6UAN6es5g7xJHKNoQV72THB3WTxB1DnDUxcQraD4L/kq685mGXrzmw1dh1ngwx6O9CIwlmIO0T8WZ4w/q8hRg==;
Received: from 120.red-83-51-59.dynamicip.rima-tde.net ([83.51.59.120] helo=localhost.localdomain)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1kEGZF-0006P8-Op; Fri, 04 Sep 2020 20:36:09 +0200
From: "Jose Dapena Paz" <jdapena@igalia.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Dapena Paz <jdapena@igalia.com>
Subject: [meta-oe][PATCHv2] xmlsec1: do not use system libraries for non nss
Date: Fri,  4 Sep 2020 20:35:25 +0200
Message-Id: <20200904183525.293480-1-jdapena@igalia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case PACKAGECONFIG[nss] is not set, in case system includes
nss or nspr, it will still try to compile using system libraries.

To avoid that, this change explicitely uses --with-nss=no and
--with-nspr=no so configure does not try to find those libraries
if they are disabled.

Signed-off-by: Jose Dapena Paz <jdapena@igalia.com>
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


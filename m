Return-Path: <ruisebastiao@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 75F046AC24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 12:24:56 +0000 (UTC)
Received: by widdi4 with SMTP id di4so213619357wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 05:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rCInw5Rdg6wo1AaJmocxx0wMBYPdmyvk//OhsvGBvCk=;
	b=Aem3W26ruPdlTIqPgSQPQMpI8f/DL9l/fnbGhLw07Kwo5qP11hCmdNNJmCPB9QfVL/
	1TO3LMYYx7WkkT1+cPw1lbAtrJEOBPJNJVl8y3/afusDHXytfNrgjTeAwqFQH9JBd/b7
	khwjIFe23BtZXg0KYnUzJFeK30kpeNcEHJR8dN/pRqXGq6zH/0u17twkgOZ3Y1+Z2ZNY
	/PyKioo+LkIjrfrJvZZ22hT5ieiRNQvQps6QnIXXRKm5xP3WtD6uXDMKSbz73N8nhI2S
	fQeyRJezmcqbkzdmFy/lnVJfbgkahjz2Jbp6P7PDafooiSPfmUifWTRasF1xKO0UIvc6
	bB/g==
X-Received: by 10.180.80.38 with SMTP id o6mr14482003wix.80.1429791897940;
	Thu, 23 Apr 2015 05:24:57 -0700 (PDT)
Received: from localhost.localdomain (pt.smtp.keyplastics.com. [62.28.172.42])
	by mx.google.com with ESMTPSA id
	e18sm11905149wjz.27.2015.04.23.05.24.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Apr 2015 05:24:57 -0700 (PDT)
From: Rui Sebastiao <ruisebastiao@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Apr 2015 13:24:52 +0100
Message-Id: <1429791892-30865-1-git-send-email-ruisebastiao@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt5][PATCH]] qtwebchannel md5 error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Apr 2015 12:24:57 -0000

---
 recipes-qt/qt5/qtwebchannel.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebchannel.inc b/recipes-qt/qt5/qtwebchannel.inc
index 3cd22cf..3ed5808 100644
--- a/recipes-qt/qt5/qtwebchannel.inc
+++ b/recipes-qt/qt5/qtwebchannel.inc
@@ -4,4 +4,7 @@ DEPENDS += "qtdeclarative qtwebsockets"
 
 # There are no LGPLv3-only licensed files in this component.
 # There are no GPLv2 licensed files in this component.
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
+LIC_FILES_CHKSUM = "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+		    "
-- 
1.9.1



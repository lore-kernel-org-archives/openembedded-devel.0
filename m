Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 373F360673
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Dec 2014 10:03:11 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so4281096wid.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Dec 2014 02:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Za1bj1iKo9KkyA9gIP1spJ2ZOKdoUbsxkCYQFSYCdS8=;
	b=HOmrx8xg8Fautq6QxAie3iT+QMsUCiaXX1rTofJHPcaIy1iK5WLEX4vAs5YWrHenkb
	jtY57h1KnBwfKPYrJYrWTUiYXxk1OZwlleq2jh04Ys6FcqCcocDvxRVi9Xtjj+V76H+O
	qCGXVQNTpdJ9CErcshnVbaDNjGFvEBqs0LLx9DXNmAZE5KOUloZxvViwB92RZNeInAfI
	nEezNe8HcRrQU88tjEeqK5TbhfXZw7Page4Oj8TAOi0Fvh33snlCmX7w8EFcYHAV80WT
	yHm0V9G7Pb9UPv4mFdjBnWJcjr+8Yp6XQ8D/XBgy7tuQ2pMv489upsA148dp0SwPNNMm
	SccQ==
X-Received: by 10.194.103.232 with SMTP id fz8mr6066268wjb.110.1417600992012; 
	Wed, 03 Dec 2014 02:03:12 -0800 (PST)
Received: from localhost.localdomain (pD9F9B8B2.dip0.t-ipconnect.de.
	[217.249.184.178])
	by mx.google.com with ESMTPSA id l9sm8943183wic.21.2014.12.03.02.03.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Dec 2014 02:03:10 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Dec 2014 11:02:10 +0100
Message-Id: <1417600930-29201-1-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
Subject: [meta-networking][PATCH v2] stunnel: Update to Version 5.07
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
X-List-Received-Date: Wed, 03 Dec 2014 10:03:14 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta-networking/recipes-support/stunnel/stunnel_4.56.bb | 17 -----------------
 meta-networking/recipes-support/stunnel/stunnel_5.07.bb | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 17 deletions(-)
 delete mode 100644 meta-networking/recipes-support/stunnel/stunnel_4.56.bb
 create mode 100644 meta-networking/recipes-support/stunnel/stunnel_5.07.bb

diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
deleted file mode 100644
index 74f2234..0000000
--- a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Program for providing universal TLS/SSL tunneling service"
-DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
-SECTION = "net"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f41ebed8571077706fee0b860c4d6666"
-DEPENDS = "openssl zlib tcp-wrappers"
-
-RDEPENDS_${PN} += "perl"
-
-SRC_URI = "https://www.stunnel.org/downloads/archive/4.x/${BP}.tar.gz"
-
-SRC_URI[md5sum] = "ac4c4a30bd7a55b6687cbd62d864054c"
-SRC_URI[sha256sum] = "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec8d2778a01c871293"
-
-inherit autotools
-
-EXTRA_OECONF += "--with-ssl='${STAGING_EXECPREFIXDIR}' --disable-fips"
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.07.bb b/meta-networking/recipes-support/stunnel/stunnel_5.07.bb
new file mode 100644
index 0000000..70420bf
--- /dev/null
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.07.bb
@@ -0,0 +1,15 @@
+SUMMARY = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
+SECTION = "net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=45e8e7befe9a0f7e0543b78dfeebde20"
+
+DEPENDS = "openssl zlib tcp-wrappers"
+SRC_URI = "https://www.stunnel.org/downloads/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "c10edd84ecbc676a5a48c7e34ab3d1c5"
+SRC_URI[sha256sum] = "505c6c63c4a20fc0cce8c35ef1ab7626c7b01071e3fca4ac6ea417afe8065309"
+
+
+inherit autotools
+
+EXTRA_OECONF += "--with-ssl='${STAGING_INCDIR}' --disable-fips"
-- 
1.8.1.rc3



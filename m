Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 48CF265C90
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 07:11:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9S7BwlG029159
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 00:11:59 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 28 Oct 2016 00:11:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Oct 2016 00:11:58 -0700
Message-ID: <20161028071158.37696-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH] lftp: fix PACKAGECONFIG[readline]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Oct 2016 07:11:58 -0000
Content-Type: text/plain

The --with-readline means check readline automatically, and will cause build
failures when there is /usr/include/readline:

ERROR: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.

Use --with-readline=${STAGING_INCDIR}/.. to fix the problem. And also add
--with-readline=no when PACKAGECONFIG is not set for readline.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
index e4a8e49..b0cd399 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
@@ -21,7 +21,7 @@ PACKAGECONFIG[libidn] = "--with-libidn, --without-libidn, libidn"
 PACKAGECONFIG[openssl] = "--with-openssl, --without-openssl, openssl"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_INCDIR}/.., --without-zlib, zlib"
 PACKAGECONFIG[gnutls] = "--with-gnutls, --without-gnutls, gnutls"
-PACKAGECONFIG[readline] = "--with-readline --with-readline-inc=${STAGING_INCDIR} --with-readline-lib=-lreadline, , readline"
+PACKAGECONFIG[readline] = "--with-readline=${STAGING_INCDIR}/.. --with-readline-inc=${STAGING_INCDIR} --with-readline-lib=-lreadline, --with-readline=no, readline"
 PACKAGECONFIG[expat] = "--with-expat=${STAGING_INCDIR}/.. --with-expat-inc=${STAGING_INCDIR} --with-expat-lib=-lexpat, , expat"
 
 FILES_${PN}-dbg += "${libdir}/lftp/${PV}/.debug"
-- 
2.9.0



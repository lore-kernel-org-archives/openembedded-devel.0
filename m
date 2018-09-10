Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2308F74743
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 06:35:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8A6ZWbP004856
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 9 Sep 2018 23:35:33 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 9 Sep 2018 23:35:32 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 10 Sep 2018 14:24:56 +0800
Message-ID: <1536560696-25005-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH V2] cyrus-sasl: do not set CLEANBROKEN
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
X-List-Received-Date: Mon, 10 Sep 2018 06:35:32 -0000
Content-Type: text/plain

A previous commit set CLEANBROKEN to "1" to claim to fix the following
error.

Fixed rebuild error:
configure: error: changes in the environment can compromise the build
configure: error: run `make distclean' and/or `rm .././config.cache' and start over
configure: error: ./configure failed for saslauthd

However, I'm still seeing these errors!

The actual problem is about autotools.bbclass not cleaning things up. It just
uses 'make clean' while maybe 'make distclean' and 'rm -f ${B}/config.cache' also
needs to be there.

In fact, setting CLEANBROKEN will do no cleanup except removing some .la files.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
index 8692829..a03712c 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
@@ -20,7 +20,6 @@ UPSTREAM_CHECK_URI = "https://github.com/cyrusimap/cyrus-sasl/archives"
 
 S = "${WORKDIR}/git"
 
-CLEANBROKEN = "1"
 inherit autotools pkgconfig useradd systemd
 
 EXTRA_OECONF += "--with-dblib=berkeley \
-- 
2.7.4



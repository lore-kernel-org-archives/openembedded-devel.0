Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 926CF796DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 08:26:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8C8QhR4018320
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Sep 2018 01:26:43 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 12 Sep 2018 01:26:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 12 Sep 2018 01:26:42 -0700
Message-ID: <20180912082642.35624-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH] cyrus-sasl: use autotools-brokensep to build in sources
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
X-List-Received-Date: Wed, 12 Sep 2018 08:26:43 -0000
Content-Type: text/plain

The makefile of cyrus-sasl does not support build out of tree very well,
while using `--enable-ldapdb', there is a compile failure
[snip]
| powerpc-wrs-linux-gcc [snip] -I../common
|../../git/saslauthd/lak.c:58:10: fatal error: crypto-compat.h:
No such file or directory
[snip]

The crypto-compat.h locates in git/common/, it should be
`-I../../git/common'

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
index a03712c..4c26989 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_URI = "https://github.com/cyrusimap/cyrus-sasl/archives"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig useradd systemd
+inherit autotools-brokensep pkgconfig useradd systemd
 
 EXTRA_OECONF += "--with-dblib=berkeley \
                  --with-plugindir='${libdir}/sasl2' \
-- 
2.10.2



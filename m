Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F265D6012A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2015 10:36:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAQAasNq006547
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 Nov 2015 02:36:54 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 26 Nov 2015 02:36:53 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 26 Nov 2015 18:36:46 +0800
Message-ID: <1448534206-31940-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] postfix.inc: fix start postfix failed while hostname is numeric
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
X-List-Received-Date: Thu, 26 Nov 2015 10:36:54 -0000
Content-Type: text/plain

While hostname is numeric, start postfix failed
...
root@localhost:~# hostname
128.224.163.251
root@localhost:~# postfix start
postfix: warning: valid_hostname: numeric hostname: 128.224.163.251
postfix: fatal: unable to use my own hostname
...

The postfix define a macro SLOPPY_VALID_HOSTNAME to allow the
numeric hostname.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 6d39570..f8b8e43 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -67,7 +67,7 @@ export CCARGS-sasl_class-native = ""
 export AUXLIBS-sasl_class-native = ""
 
 # PCRE, TLS support default
-export CCARGS  = "${CFLAGS} -DHAS_PCRE -DUSE_TLS ${CCARGS-ldap} ${CCARGS-sasl}"
+export CCARGS  = "${CFLAGS} -DHAS_PCRE -DUSE_TLS -DSLOPPY_VALID_HOSTNAME ${CCARGS-ldap} ${CCARGS-sasl}"
 export AUXLIBS = "-lpcre -lssl -lcrypto ${AUXLIBS-sasl} ${AUXLIBS-ldap}"
 export POSTCONF = "${STAGING_DIR_NATIVE}${sbindir_native}/postconf"
 
-- 
1.9.1



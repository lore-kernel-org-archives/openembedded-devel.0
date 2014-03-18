Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 84BE86E717
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 16:28:30 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 142so19676075ykq.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 09:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=JvF92Dhw9IUtbBLRilVJry9ZG+K3K+JfDMML9jRX1Cg=;
	b=Z6kcwLD2wyvve7A5nNFaQXssC0TJQIg1KC9POz+IRRhyNmz/qMtD0J0GkQf5uNFvFE
	KkVdSf/s6HDg+LMXRgj1AUYuqBBfddtr07oQNuW9tICohpZGkjVn+eskZHGlHLPuStwP
	Un+xGr+W32ipH7lTcnXY0fibU1oQjsRdjuaV3mB3wpXLksMWwps1xYGK1Rypsg5HqwQ8
	btHPzrQl+tO3VDOpAezJanNbJrD/eo5yaG8xECTWFwVbfIosvaUMsCMnYVwPnkPR8OSW
	eEp0VWC/Y9EbtdWl/uuLMaHNRR6BfGqyZ39p0OMCcYnnsktGd0NBngLWt9nMI56sYO9F
	mNBw==
X-Received: by 10.236.46.5 with SMTP id q5mr18987561yhb.21.1395160111204;
	Tue, 18 Mar 2014 09:28:31 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	u63sm17479771yhf.31.2014.03.18.09.28.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Mar 2014 09:28:30 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 905D9197CAE2D; Tue, 18 Mar 2014 13:28:26 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Mar 2014 13:28:23 -0300
Message-Id: <1395160103-15730-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1395160103-15730-1-git-send-email-otavio@ossystems.com.br>
References: <1395160103-15730-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/2] libmicrohttpd: Update to 0.9.34
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
X-List-Received-Date: Tue, 18 Mar 2014 16:28:30 -0000

This update fixes the following build error:

,----[ Build error ]
| ...
| .../libmicrospdy.so: undefined reference to `SSL_get_error'
| .../libmicrospdy.so: undefined reference to `SSL_write'
| .../libmicrospdy.so: undefined reference to `SSL_free'
| ...
`----

Reported-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../{libmicrohttpd_0.9.33.bb => libmicrohttpd_0.9.34.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.33.bb => libmicrohttpd_0.9.34.bb} (85%)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
similarity index 85%
rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb
rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
index 523b8dd..5de9390 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
@@ -6,8 +6,8 @@ SECTION = "net"
 DEPENDS = "libgcrypt gnutls"
 
 SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "013b10f9de1cda5448b29c81305354a3"
-SRC_URI[sha256sum] = "d9587e8497548f820650cd607daf3615ea3272435779378983032c570f1cd559"
+SRC_URI[md5sum] = "2947eee13c2c8affb95023a0cb6fda0c"
+SRC_URI[sha256sum] = "29a2bfd4fd2ddf60c756b8c283291a134898e3cc143843be421a040be1b25a88"
 
 inherit autotools lib_package
 
-- 
1.9.0



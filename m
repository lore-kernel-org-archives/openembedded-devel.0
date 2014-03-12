Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1503E610D8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 13:22:28 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id f73so4485669yha.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 06:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=JvF92Dhw9IUtbBLRilVJry9ZG+K3K+JfDMML9jRX1Cg=;
	b=zxBA+CfQprlKsknn0XdUg10bsBCUqXLetJYeoAlnors0Wso7C4XGhGYupv3nJonB4+
	E+j7wcDKunjQup+lXui9hm09HRt/8cBfHcna+WbbPWvuxmAGlE+DrJj6IH904L7EEXOp
	oV5uDhpq10Vw0EpfBGV3zvJw4hL0EME4okUavS09z66bKCM6V0Jtq1EkQL+Nw3wE08Tq
	c2Uf0k6VQ8exsP+m5/7ox89R3Sp5ECyFAw3Pzfh3CC1WLdOf19HVMdGq1Khq7YFwbCmW
	N6ksYJqzoAZrvHcuE2F4y8ldn0oLfqxgTpuY93N2Q+csY9SZlRHGx3ftA2lCg1+T+d0B
	bWVg==
X-Received: by 10.236.131.19 with SMTP id l19mr61778812yhi.0.1394630549066;
	Wed, 12 Mar 2014 06:22:29 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	d32sm74573983yhq.27.2014.03.12.06.22.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Mar 2014 06:22:28 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 757CC19415FB9; Wed, 12 Mar 2014 10:22:24 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Mar 2014 10:22:23 -0300
Message-Id: <1394630543-14620-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] libmicrohttpd: Update to 0.9.34
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
X-List-Received-Date: Wed, 12 Mar 2014 13:22:33 -0000

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



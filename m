Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 18F106012C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:01:21 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id 90so56328480qgz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=Sry9L4GhG1zUIe0J7HWqk7uhCBq55azOw+9FIK1NboU=;
	b=kFWyRLoC7Bh7YP3o/D7QJlvd8WYiO8jO55BCjVMlUcB01TER4Yc2qsR4YTGkTJXOB3
	Ox2rU9oDY3uSsWElVB0pyCLoOjAKW/qJfPO1JDbO/wywDAKB08p4kbtROPja3TZeoK5i
	JgsHaV5A9ziVIvXAmiyx3BDGwEFxicWNSp7Ts8R8/+70x30LTQt9jYI0bs98yESgldua
	kXgEGoDowqbX+peCHvsZ+i+5czQB0U+H1xqeu9jjhRxLoonZ5nwtFPtSEtYKAHHOU3cf
	8AreUxBpxFDJQb2nimCWK1sBSezvAaWMhCIIzNnbcV/C24UiQ7t7fUyfJkPSdhX0XCr5
	Ihqg==
X-Gm-Message-State: AOPr4FUDoZWg1ZR7zBhGXUy1R3IiDa8o/205Jbix/LrN1KOqWk2QeyX1nYHlt3H4vp/6Lw==
X-Received: by 10.140.175.193 with SMTP id v184mr21307862qhv.23.1462543282392; 
	Fri, 06 May 2016 07:01:22 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id y89sm5763519qgd.5.2016.05.06.07.01.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:01:21 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:01:16 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:41 -0300
Message-Id: <1462543259-7206-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 04/22] openconnect: add missing dependencies
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
X-List-Received-Date: Fri, 06 May 2016 14:01:24 -0000

From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>

They were autodetected and triggered QA warnings

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-networking/recipes-connectivity/openconnect/openconnect_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
index 0a8b875..6d3c252 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Open client for Cisco AnyConnect VPN"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=243b725d71bb5df4a1e5920b344b86ad"
 
-DEPENDS = "vpnc libxml2 gnutls"
+DEPENDS = "vpnc libxml2 gnutls lz4 krb5 libproxy pcsc-lite"
 RDEPENDS_${PN} = "vpnc"
 
 PV = "7.06"
-- 
2.8.2



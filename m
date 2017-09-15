Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 40EBE78674
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 18:45:38 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id r66so1944794qke.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 11:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7g6PWJHncPDMp7iDSvXHU6NVSNXK4ICqGHOFI7VmXgo=;
	b=RHB1trShSWC/C2/kCHsEOIO5RepYOuvII5Dem6BQZzqI2SX6F1JFhMQFUiEXlPOeIt
	85uV7GQqn6woekP9e4wVIhcJ89jGWLQddQe1bRuz0mMESJQSwVXc5W4oKuLZWfsU/OBa
	XfGDyrcqrTodweY/JeWHpauYouCT9qIehaRwEnCKoTeVv5VlFwlKyT2zrEVJyNtcAOvq
	p365qraWXPu7axHsey2NuATGfzSH2b8OVtF/Q/3s2N459zx9Kvd3XQp5NAx3t27lJek0
	53L2zSIMhpWyihZSvFRVLKUNLPebKNgcnEsO749k9OBxm+lKXKa4XdiVWM6RXe+ymnA+
	eakA==
X-Gm-Message-State: AHPjjUibZnO7066VgfE31av4SVXWkn4GTtZNsmH4JQvWgj9UoE40RnYy
	4ewU1Tvu+c0en87MqUc=
X-Google-Smtp-Source: AOwi7QBD92nj0Vj7pMtQsn3mTMQsN+TJiiTqa6mFfyqF1NslCn857TyMCswQOKHm2ob9b4kgQD4Z1w==
X-Received: by 10.233.232.13 with SMTP id a13mr9110251qkg.83.1505501139712;
	Fri, 15 Sep 2017 11:45:39 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id u54sm991934qtj.44.2017.09.15.11.45.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Sep 2017 11:45:39 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Sep 2017 14:45:30 -0400
Message-Id: <1505501130-15515-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] nginx: update development version to 1.13.5
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
X-List-Received-Date: Fri, 15 Sep 2017 18:45:39 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-httpd/nginx/{nginx_1.13.3.bb => nginx_1.13.5.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.13.3.bb => nginx_1.13.5.bb} (64%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.13.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.13.5.bb
similarity index 64%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.13.3.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.13.5.bb
index 479ace6..9f2c117 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.13.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.13.5.bb
@@ -6,5 +6,5 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
 
-SRC_URI[md5sum] = "1f8529568f825dfa4da4e99ba483678e"
-SRC_URI[sha256sum] = "5b73f98004c302fb8e4a172abf046d9ce77739a82487e4873b39f9b0dcbb0d72"
+SRC_URI[md5sum] = "f193722159adfb1eb8117c0491fd17ec"
+SRC_URI[sha256sum] = "0e75b94429b3f745377aeba3aff97da77bf2b03fcb9ff15b3bad9b038db29f2e"
-- 
2.7.4



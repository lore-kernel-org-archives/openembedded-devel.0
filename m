Return-Path: <straka.derek@gmail.com>
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 30B4673204
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2017 16:18:53 +0000 (UTC)
Received: by mail-yb0-f193.google.com with SMTP id w194so11824088ybe.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2017 08:18:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gTanSRf/Jq2dOivP2HNxvT3aZd18+0Usu7cnt4hJVWk=;
	b=fd+Js7CI/jFO6AZYfjCfi9n5Zsh+JIioI4fUZsdwlTyyerEfKXRDYL5FaBSCiEYIZw
	IzE36o1nsrN4IZ903pfIcCIIFJvLitw6SYcpI8x1jpLpAKHeHKcauac6kTAwnphtPifE
	GJqzUietC3rxe4TkYeE77dPzwSITd3SsSuejLgcWcBZnyov9QFBgbzURuTIAWOPD01OR
	RPhpaZFFt3dD2Ml/9V7MLMYW9bpyfIdIGNE2pwgD6Wj1+os0Zrhif+Aa3ljFuygqnWtm
	Lxh4HR7nkOfJb/0gmRuWpgfQuKbaG7tDFf68i/t59YjgnFSLXAcPd6rX+6cGgJCC4jJO
	UCGA==
X-Gm-Message-State: AIkVDXKPevLBI3oePQDdkwQNfWQ705fGoWDgRWRMCO8juv/f4IUwXtd4wrdoS3R4GJmLzQ==
X-Received: by 10.55.198.149 with SMTP id s21mr26998871qkl.196.1485188333829; 
	Mon, 23 Jan 2017 08:18:53 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	c198sm13472195qka.48.2017.01.23.08.18.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jan 2017 08:18:53 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jan 2017 11:18:40 -0500
Message-Id: <1485188320-8255-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] nginx: update to version 1.11.8
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
X-List-Received-Date: Mon, 23 Jan 2017 16:18:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-httpd/nginx/{nginx_1.11.6.bb => nginx_1.11.8.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.11.6.bb => nginx_1.11.8.bb} (64%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.11.6.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.11.8.bb
similarity index 64%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.11.6.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.11.8.bb
index 18b7017..44249a9 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.11.6.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.11.8.bb
@@ -6,5 +6,5 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
 
-SRC_URI[md5sum] = "4e29a07a7c74376fa032e5af0d1c5369"
-SRC_URI[sha256sum] = "3153abbb518e2d9c032e1b127da3dc0028ad36cd4679e5f3be0b8afa33bc85bd"
+SRC_URI[md5sum] = "8f68f49b6db510e567bba9e0c271a3ac"
+SRC_URI[sha256sum] = "53aef3715d79015314c2dcb18f2b185a0c64368cc01b30bdf0737a215f666b34"
-- 
2.7.4



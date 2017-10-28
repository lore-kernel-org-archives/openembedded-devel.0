Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 344117828D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Oct 2017 12:36:20 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id f199so11330059qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Oct 2017 05:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y//AH1g6Nt6dtmc51vjfKTR9OBnVVL89++KNriolOKI=;
	b=UzMgZhwhjILdxJsqSCS35iCwbnqWQKzNJ+cA/xGsltES/uOuUAuHwU3AnXK8J9mzow
	cFf70MEWN3gaHZwXzw3SbrfROgrRXMAfTSwjYHus4EHg9zuqmpsTQf8ksBXMKPESNYDw
	PDdrSSlqEq/ZYp54+QtTvKaufsZiujhUt9cnwDpJ5VYu3XTYz4rT5hAn2dlax+22v5Q9
	lJJPjC4TtaX6wuBBDVSUMaOyFrmO0w8mlPIjqYQU52k0c5RxF5li1WWNoHP1NH2E0J79
	SvWXEe0CXJo4YNSbZRvaNDxipTJxgpFY9WVLgd4II0Sw5xZxd5HLFjb/Ej40ZoEhqYBJ
	imAA==
X-Gm-Message-State: AMCzsaXCF+31Q1QRERWOINffSYiITDbG7uQx097as6SLgpoR3i6VWc8l
	sfdNaaXGmzUzBJhvWHgaZAJyGifq
X-Google-Smtp-Source: ABhQp+THdv21YtvU7kAl3W1c/QkkR2I5hBL+Ztbi+7bYnsTNI4vz+UVqK84kSCctQ6isGuP+k42XEA==
X-Received: by 10.55.137.196 with SMTP id l187mr5074448qkd.134.1509194181306; 
	Sat, 28 Oct 2017 05:36:21 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	f126sm2012420qkd.20.2017.10.28.05.36.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 Oct 2017 05:36:20 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Oct 2017 08:35:55 -0400
Message-Id: <1509194155-22009-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509194155-22009-1-git-send-email-derek@asterius.io>
References: <1509194155-22009-1-git-send-email-derek@asterius.io>
Subject: [meta-webserver][PATCH 2/2] nginx: update development version to 1.13.6
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
X-List-Received-Date: Sat, 28 Oct 2017 12:36:20 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-httpd/nginx/{nginx_1.13.5.bb => nginx_1.13.6.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.13.5.bb => nginx_1.13.6.bb} (64%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.13.5.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.13.6.bb
similarity index 64%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.13.5.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.13.6.bb
index 9f2c117..d255f1f 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.13.5.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.13.6.bb
@@ -6,5 +6,5 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
 
-SRC_URI[md5sum] = "f193722159adfb1eb8117c0491fd17ec"
-SRC_URI[sha256sum] = "0e75b94429b3f745377aeba3aff97da77bf2b03fcb9ff15b3bad9b038db29f2e"
+SRC_URI[md5sum] = "f84d3f782c168bfdfb734700e51a929f"
+SRC_URI[sha256sum] = "8512fc6f986a20af293b61f33b0e72f64a72ea5b1acbcc790c4c4e2d6f63f8f8"
-- 
2.7.4



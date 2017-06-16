Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id ECDB2784BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 20:32:06 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id u8so20624qka.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qpeVpBT9eBsHPKIOnmg68y6n3EKNUyhhjTg+6j+ESm8=;
	b=Dnu7vnslordrJTlYY8vCvFKnLIfyThv/rYn9Gj9yXiu0CentZA+wmfymDwMfAq1Pjn
	NIjunjyPZq1DzFhg1JDuXgpj4ShgQ2YVES4Ae2Rvl7bhw/7Rg1daLhOK27ar3/lHx46Y
	hFXGr6e0sOVg7SwWGoDFcv4gRs/0POynPgy3e4F0Adq3JhWasOIUs6v1BspFpY6S8bRc
	UQmdslG+9GIimD3dFLtyYldTQbfT1963MXazmD/8XjiCvLEEsZG+ybGSMbhNA0eJGaio
	/2uPA47rUPVa69Smzo4I2851Pm00h5dxRaSYrVsBb191XAdVtG02q/m96VYJnWjnUyhj
	SKEA==
X-Gm-Message-State: AKS2vOw1lgyiz6npBpxWv8kXTlIMZXE9/rO8b0xS7QxCcpo8jCjPLNgO
	YN5SSkULIaNhsbmIEXU=
X-Received: by 10.55.20.30 with SMTP id e30mr14120966qkh.51.1497645127432;
	Fri, 16 Jun 2017 13:32:07 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4])
	by smtp.gmail.com with ESMTPSA id e4sm2158416qkb.30.2017.06.16.13.32.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 13:32:06 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 16:31:57 -0400
Message-Id: <1497645117-18067-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] nginx: update to version 1.13.1
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
X-List-Received-Date: Fri, 16 Jun 2017 20:32:07 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-httpd/nginx/{nginx_1.13.0.bb => nginx_1.13.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.13.0.bb => nginx_1.13.1.bb} (64%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.13.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.13.1.bb
similarity index 64%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.13.0.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.13.1.bb
index a999acc..d0d162e 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.13.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.13.1.bb
@@ -6,5 +6,5 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
 
-SRC_URI[md5sum] = "0ff7057465d5622c5b1279e91b273e96"
-SRC_URI[sha256sum] = "79f52ab6550f854e14439369808105b5780079769d7b8db3856be03c683605d7"
+SRC_URI[md5sum] = "5c2fe93447140b8b1a815a13bc89355b"
+SRC_URI[sha256sum] = "a5856c72a6609a4dc68c88a7f3c33b79e6693343b62952e021e043fe347b6776"
-- 
2.7.4



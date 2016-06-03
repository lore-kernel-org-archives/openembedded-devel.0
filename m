Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id F01CA7757F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jun 2016 15:38:25 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id q184so7945036qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jun 2016 08:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IUomDTBTAN1s83omw8FCvXSRD7BP2dDvYfxp2DcQGNI=;
	b=jXO3YlfgCEnIyX2vQFHH09Gs09MqcKl18+q5Nv5yoYOjGLhfyA03lCff07lzez7peE
	7Vs46IuO3Agf+weMVzg0+HQ55fkZQq/+1uIARW/lhPJ/6nzdm4JClDGJDsMDkGoYzTRU
	0En3XnDPMpriGqEuG8bROvyYbz2ZA0jwNLlvqsXKoYp9WobgHfzHb/8l1rni7Is4SnVr
	E5IbaQPZTvGm6sw9bwJpgBPg2gmpr2Ls6xre1IpdVJmnaf6DMmRDsVISEatngZ+VzJsJ
	7LmpzRvfzEPaNR27rnofqI9H6c9dAQWRBYUcyNByJN4R7tQMINlU5qs5WywjpUkHOUhr
	k1Rg==
X-Gm-Message-State: ALyK8tLpHQuvrh892E8nkOBnvzYWkAlNrAEHuCNDIGjP173GcdrOMb99WtRPuxV0arAAbA==
X-Received: by 10.55.33.40 with SMTP id h40mr3885442qkh.148.1464968305869;
	Fri, 03 Jun 2016 08:38:25 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(c-68-34-224-206.hsd1.al.comcast.net. [68.34.224.206])
	by smtp.gmail.com with ESMTPSA id
	m129sm1192584qkb.22.2016.06.03.08.38.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Jun 2016 08:38:25 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Jun 2016 10:38:16 -0500
Message-Id: <1464968296-2180-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1464968296-2180-1-git-send-email-derek@asterius.io>
References: <1464968296-2180-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-webserver][PATCH 2/2] nginx: update to version 1.11.1
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
X-List-Received-Date: Fri, 03 Jun 2016 15:38:26 -0000

  * Resolves CVE-2016-4450

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-httpd/nginx/{nginx_1.9.15.bb => nginx_1.11.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.9.15.bb => nginx_1.11.1.bb} (64%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.15.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.11.1.bb
similarity index 64%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.9.15.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.11.1.bb
index abbec53..eade7ed 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.15.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.11.1.bb
@@ -6,5 +6,5 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
 
-SRC_URI[md5sum] = "13cd38e9da3789035750dd45882c4a26"
-SRC_URI[sha256sum] = "cc89b277cc03f403c0b746d60aa5943cdecf59ae48278f8cb7e2df0cbdb6dac3"
+SRC_URI[md5sum] = "0f3900165b11c417854535f3538913cb"
+SRC_URI[sha256sum] = "5d8dd0197e3ffeb427729c045382182fb28db8e045c635221b2e0e6722821ad0"
-- 
1.9.1



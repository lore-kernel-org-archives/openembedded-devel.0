Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8CD6E5FC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 17:21:00 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id n21so216712734qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 09:21:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uaVKGYjZIZt2/L5DV+O8yV3fGHRDDkjFXUzzZxpRG2U=;
	b=ToFVF6crtkmWaENMO4fvM0un6ohh/DKqYq8H6XNhrWvq+XFBb1accf0IK6hOFQQvcL
	/mRxIxjJhRQl1e26Ut3q20mNCLx2ceeopDcjUBV+vVjN6Ni/ZDDTpcd/wlpxUb5Dvp3z
	kh1trqKwPOdnmNc0s0prhP4ul4oi+NzeOBVD3HMPhm8FQ1YDrbKytGv3BTBpiEKk0qzQ
	KU0UAnWog4uWSWp8wyxfgnUV4Cupl3kX22rGI4YwgCvjSgtUeLnKwyVqt3Vx+/RRxDjd
	z7S719DX/24/5iGHLlBmZPOXsAY8CRJSa1Jg5bkeJuTdjYOMkQpuYXCbNz455KykAFHP
	n72Q==
X-Gm-Message-State: AKaTC03Ga9/SYWo3ATqGR6dJ2RhBaL3HV61DUVLVytG+PHQgBs47ShGDj7mltKsjTbKEMg==
X-Received: by 10.55.94.135 with SMTP id s129mr28247603qkb.124.1480526461326; 
	Wed, 30 Nov 2016 09:21:01 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	l135sm33880339qke.13.2016.11.30.09.21.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 09:21:00 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 12:20:39 -0500
Message-Id: <1480526439-26832-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] nginx: update to version 1.11.6
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
X-List-Received-Date: Wed, 30 Nov 2016 17:21:01 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-httpd/nginx/{nginx_1.11.5.bb => nginx_1.11.6.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.11.5.bb => nginx_1.11.6.bb} (64%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.11.5.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.11.6.bb
similarity index 64%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.11.5.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.11.6.bb
index ae05c96..18b7017 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.11.5.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.11.6.bb
@@ -6,5 +6,5 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
 
-SRC_URI[md5sum] = "db43f2b19746f6f47401c3afc3924dc6"
-SRC_URI[sha256sum] = "223f8a2345a75f891098cf26ccdf208b293350388f51ce69083674c9432db6f6"
+SRC_URI[md5sum] = "4e29a07a7c74376fa032e5af0d1c5369"
+SRC_URI[sha256sum] = "3153abbb518e2d9c032e1b127da3dc0028ad36cd4679e5f3be0b8afa33bc85bd"
-- 
2.7.4



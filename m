Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 72492770C4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 13:19:56 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id x1so45587795qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 05:19:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0dsFvRxAb9sh75KS4C7ha8aVmG8gQSs1ZoRAOTXjq78=;
	b=hAN3kE862o/T7IYm+yBu+y2LKKhh6mjgFFmcSg/Iq7O8o4XUlYGofl2Wr/ygkMIvul
	3OIb7Gbe1G4hK7n1DYVg9zGRqdzf2qg3D8t0LhUxr95VObtP0AUTqqryAxmH/EmxC+kb
	dY3T+Yzvoha6uIF/DBpoBOSp/dXY4nJfMwb2BrGlFGn9mQdb04t8Is1MZ7ASAHJUH0kp
	rMptaP5R5i3VLHcNKrYUyUT+E5t8HJRgI0GMJEJ/+IV3OGi6OBZhFxvSFXeROtIOa3by
	fEYeflGASZgrX+DxOgZAoZ/bpwpw6xn5QD2EAh7epRkC/W9QRxASExKQW+kqHDwRYWCC
	bu7Q==
X-Gm-Message-State: AG10YORJn+jqkIvKaSpvVhBio5QrISxNM2swnw6wmYltD62/tDu4i/Oe9qlsErUIq2+8+w==
X-Received: by 10.55.16.160 with SMTP id 32mr8973931qkq.45.1453641596779;
	Sun, 24 Jan 2016 05:19:56 -0800 (PST)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	w145sm6798357qhw.36.2016.01.24.05.19.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Jan 2016 05:19:56 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2016 08:19:44 -0500
Message-Id: <1453641584-1855-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-webserver][PATCH] nginx: update to 1.9.9
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
X-List-Received-Date: Sun, 24 Jan 2016 13:19:56 -0000

---
 meta-webserver/recipes-httpd/nginx/{nginx_1.9.5.bb => nginx_1.9.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.9.5.bb => nginx_1.9.9.bb} (96%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.9.9.bb
similarity index 96%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.9.9.bb
index 87c953b..06d61c7 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.9.bb
@@ -19,8 +19,8 @@ SRC_URI = " \
 	file://nginx-volatile.conf \
 	file://nginx.service \
 "
-SRC_URI[md5sum] = "2562320f1535e3e31d165e337ae94f21"
-SRC_URI[sha256sum] = "48e2787a6b245277e37cb7c5a31b1549a0bbacf288aa4731baacf9eaacdb481b"
+SRC_URI[md5sum] = "50fdfa08e93ead7a111cba5a5f5735af"
+SRC_URI[sha256sum] = "de66bb2b11c82533aa5cb5ccc27cbce736ab87c9f2c761e5237cda0b00068d73"
 
 inherit update-rc.d useradd
 
-- 
1.9.1



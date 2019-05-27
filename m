Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9DFAA7DFE5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 15:57:09 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d17so3342946wmb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 08:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gN8TTS0jmJtAexXAWhsBe6A9ORWJDFQBviQWM7RMwF0=;
	b=lDNppft71jMf0uoQ8P/O47JMrVYurYE0j7JzSNWQBdiOUGg9ZnN+cU1ZaXFcWTO2rC
	qFOWUNPZ4fCekS1pLLJexuMlM+4Pd26hjnY+TS9GFYXPFudeRAS87curqx8D3GKEoWKU
	+2fxlLKBHkwYaKbuxAXfiYPof7w8lHbmyZ9E93K5VKt94tamaFTrez63LWvxLypcEu2X
	21yPDBNYyIL96TkAP4wX280ugHmSyaAgEWyvwYTkmPpQsrI56pRcs9i1ZO+XO/8HxMik
	OWrhIhOYjoHX0GpRCTIk9VbdVdtYd3JLtquoP4k9jTvvQn5Ptd27BRb/ATvZxrE+uBVr
	RFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gN8TTS0jmJtAexXAWhsBe6A9ORWJDFQBviQWM7RMwF0=;
	b=VaKoftr96Sr0xieHBUXff4mkNDoo+RqJBO/ZQ6HYGt+Ys3pc0z/WejTc4gl6M+TXAQ
	6dqhNsoPu+6kUBfpgV1R1gKIaEvN8CBk38rIsAvbth4xENYCRzBXEV+nOt3zHl9DZKx3
	fZ+H3VVdEWCuc1ReDIPpp8kw9PEEG8mKEmKRDf01k2xjPZlynLz/49cLxtn92blSc53H
	GQ/aI8pPiKgMdhPGyBLKWVt2qAMv6xMbiCh+qtmYOS8gMxlC/bGmutkFl2lNdmiH36bJ
	QoHHXfmXYhP9TDJVllg2upwFcA+I+/SPf/KmoneQ2bKbw2TDqOzoRIxW2ElI7ebKZf+A
	Ggqg==
X-Gm-Message-State: APjAAAWL9MpeOovDG+azknN861GaoDFX9pd47tP+qtUgFoGE+xKXR0kd
	GZPk/JMPUZauUM+ApX9AgRZlntuz
X-Google-Smtp-Source: APXvYqwGVahZqX/sSXQm/J9JZqDvoEvYrmN6Xmk82jou77tFHmNlc6bbbjB9LrszDECzw092hC5U1Q==
X-Received: by 2002:a7b:cb57:: with SMTP id v23mr10890126wmj.60.1558972629981; 
	Mon, 27 May 2019 08:57:09 -0700 (PDT)
Received: from nick-beastie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	n5sm16138810wrj.27.2019.05.27.08.57.08
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 27 May 2019 08:57:09 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 May 2019 16:55:21 +0100
Message-Id: <20190527155520.7719-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] nginx: fix kill path in nginx systemd unit file
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
X-List-Received-Date: Mon, 27 May 2019 15:57:09 -0000
Content-Transfer-Encoding: 8bit

the kill utility is located in /bin/kill -> use base_bindir instead of bindir

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/files/nginx.service | 2 +-
 meta-webserver/recipes-httpd/nginx/nginx.inc           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service b/meta-webserver/recipes-httpd/nginx/files/nginx.service
index c6fc0495f..9a6ca9651 100644
--- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
@@ -8,7 +8,7 @@ PIDFile=/run/nginx/nginx.pid
 ExecStartPre=@SBINDIR@/nginx -t
 ExecStart=@SBINDIR@/nginx
 ExecReload=@SBINDIR@/nginx -s reload
-ExecStop=@BINDIR@/kill -s QUIT $MAINPID
+ExecStop=@BASE_BINDIR@/kill -s QUIT $MAINPID
 PrivateTmp=true
 
 [Install]
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 29e7efc14..c4c776e37 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -134,7 +134,7 @@ do_install () {
         sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
             -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
             -e 's,@SBINDIR@,${sbindir},g' \
-            -e 's,@BINDIR@,${bindir},g' \
+            -e 's,@BASE_BINDIR@,${base_bindir},g' \
             ${D}${systemd_unitdir}/system/nginx.service
     fi
 }
-- 
2.20.1



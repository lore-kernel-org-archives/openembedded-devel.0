Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5741E770E3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 13:35:27 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id o11so8426022qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 05:35:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zspGRSLxGoAaTwhOHEzNw0Qv6HG1FeN3r7/dEWsqBo0=;
	b=KeNY5cAPYuwVvztW3inMk+DRXElD7U9R9wV6t0JhZlpcW+g1rReMQyGiORpMXcej6H
	WEzpMdBBc3kQUL/bilgyaf8iV9a+nh90w8IZiYZUAjP7WJssykhKIrROZJI8TwDwxSWA
	VDXeX/D4DHr3dUWoJgrZTf5aXdL9z96vd4MvvPUdKs46UDoG+RjuYI4kpzUACMcae/S+
	jc/rR7TIWZu0/a7pyWzJWA4xmiW23aB8dVNimDGWlGbFgNkraxzKGOWtK2YZToWHq2bt
	I/ug1Av8WwswgUCHHy/IzPvCAh8J3q8MlXM/6olE4KmKuw5gwLeZdSZtrIsKru3b/So+
	YX+g==
X-Gm-Message-State: AG10YOTJ+/YtPAf1yWWh2XZusJ+U/V1xDnDm+qCsi21BK30hn1yejb1uOFNCMTDuX9jdmw==
X-Received: by 10.141.2.68 with SMTP id e65mr16159763qhd.64.1453642528028;
	Sun, 24 Jan 2016 05:35:28 -0800 (PST)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	u16sm6877295qka.22.2016.01.24.05.35.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Jan 2016 05:35:27 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2016 08:35:18 -0500
Message-Id: <1453642519-4510-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH 1/2] php: check for existance of directory before 'rmdir' in do_install_append_class-target
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
X-List-Received-Date: Sun, 24 Jan 2016 13:35:28 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-devtools/php/php.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 67d2362..793ffe8 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -166,7 +166,9 @@ do_install_append_class-target() {
 
     TMP=`dirname ${D}/${TMPDIR}`
     while test ${TMP} != ${D}; do
-        rmdir ${TMP}
+        if [ -d ${TMP} ]; then
+            rmdir ${TMP}
+        fi
         TMP=`dirname ${TMP}`;
     done
 
-- 
1.9.1



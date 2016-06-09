Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id CB1FB6FF4E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jun 2016 18:57:13 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id z67so3601336qgz.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2016 11:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Q9uw0cimae5xvx+w/L7kbf1Cdj3af4P2YS1knz8Jfhc=;
	b=nF+P28WFtRnPDjxkvD3bqHD4zRQ6JVR4kRF6pOtaYsw5gmIZ5WhH/kU199sKRb/Kgy
	/QSxPs5g/rWfvIjlwhj2ZsB5fGI3uNQiAHPuTZOnjXhTvIFECkTmWAGmMYzo1C72bad/
	tG3AEVA+ubUuNUNeo3q4ZqO1iuWZC3wlrfrtzhmvb4+5roeJzAuxcWjzrv7kHVQWNQ8n
	ro314JJal3IMM8AeYpZtISjs841fiv1/8e8G3xVHKGPu2lcYioR097v4c5k0mneL6LBd
	eCsDWtvN48jXHS7pPlXKAdCUpx257XktzsOQCI8dX6sQl9AlvNEywDgZKvqKXJSu3KEB
	17Dg==
X-Gm-Message-State: ALyK8tIzPdB8wq9ceZm3KcfBJ1pmtvzly0iBl9b9pYgWYLTc7hhZf9W0RQVJj8SXRmji/Q==
X-Received: by 10.140.172.134 with SMTP id s128mr11781072qhs.69.1465498634109; 
	Thu, 09 Jun 2016 11:57:14 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 39sm2058238qgg.8.2016.06.09.11.57.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Jun 2016 11:57:13 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jun 2016 14:54:43 -0400
Message-Id: <1465498483-29489-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-networking][PATCH] curlpp: fix build with gcc-6 and remove blacklist
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
X-List-Received-Date: Thu, 09 Jun 2016 18:57:14 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
index 43e69b9..78b9432 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
@@ -16,6 +16,10 @@ SRC_URI[sha256sum] = "e3f9427b27c5bddf898d383d45c0d3d5397e2056ff935d9a5cdaef6a9a
 
 inherit autotools-brokensep pkgconfig binconfig
 
+# Upstream is currently working on porting the code to use std::unique_ptr instead of the
+# deprecated auto_ptr.  For now, ignore the issue.
+CXXFLAGS += "-Wno-error=deprecated-declarations"
+
 PACKAGES =+ "libcurlpp libcurlpp-dev libcurlpp-staticdev"
 
 FILES_lib${BPN} = "${libdir}/lib*.so.* \
@@ -29,6 +33,3 @@ FILES_lib${BPN}-dev = "${includedir} \
 FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
 
 BBCLASSEXTEND = "native nativesdk"
-
-# http://errors.yoctoproject.org/Errors/Details/68623/
-PNBLACKLIST[curlpp] ?= "BROKEN: fails to build with gcc-6"
-- 
1.9.1



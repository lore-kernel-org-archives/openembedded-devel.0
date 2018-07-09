Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 920D175436
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 20:09:52 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id b66-v6so10384841qkj.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 13:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=67NOGmiq3Wg3Sh3P3Zq8CCmDP71iHYyt4VttgJwDGTc=;
	b=dp8N027mmT8gqojvEk2yGz70KJUHIcsgrMiTe9UnrG0EdkART2VO8QPYlyNWez5oDt
	euqIyrXeMfL5fEjbZ3iql0HRCMpM7hA2JaFrJvD4O4p/7L1VAQfcm7yI3JmgXuHu1j4W
	fVHANfJfzSxHi72aOQlT5AGY9SPEl5rAhn9bf1f1oQBjQHV9fGdAPeqUAB1eM+Pph62x
	aL2q1BOmMIW/oRW1dCTeZSj4imNr3dAapAL/vt/wqw4Bd/Asxw//8iBAyZki0/TQgnVY
	zTYWxd2GzcXDu4U3WNzM8MPP2Wihtyr10idpZV120pMA3iME2FiTed3oOjsXkyuLXI7m
	U8CA==
X-Gm-Message-State: APt69E1cBjLNITLB1GoE5sgr6k463DxLVNapNVdSWRbl27a+soakj28a
	HwQ2WgWAd6bNow8S9bCYaY5Udi8/
X-Google-Smtp-Source: AAOMgpeAOd3KT5AOHFdq3P4mcYQS4r0kKU8roRMxsK/ZpcJoWlf2qIOu4L20HfoDRDGQl0DKJyhSbg==
X-Received: by 2002:a37:1791:: with SMTP id
	17-v6mr18732963qkx.434.1531166993030; 
	Mon, 09 Jul 2018 13:09:53 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	h22-v6sm10017368qkj.84.2018.07.09.13.09.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 13:09:52 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 16:09:45 -0400
Message-Id: <1531166986-7172-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH 1/2] nginx: enable thread pools by default
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
X-List-Received-Date: Mon, 09 Jul 2018 20:09:52 -0000

The thread pool feature can be enabled without significant extra binary size.  Thread pools can increase performance by an order of magnitude on some configurations

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index e6ae52a..f1b50bc 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -71,6 +71,7 @@ do_configure () {
     --http-scgi-temp-path=/run/nginx/scgi_temp \
     --pid-path=/run/nginx/nginx.pid \
     --prefix=${prefix} \
+    --with-threads \
     --with-http_ssl_module \
     --with-http_gzip_static_module \
     ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS}
-- 
2.7.4



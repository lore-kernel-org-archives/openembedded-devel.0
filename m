Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id C38996010D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Feb 2017 00:09:51 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id s186so4842400qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 16:09:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8Lj2pywWD5brplvtpVA6Uw87Hms/kq0e/aUHB2ATt+o=;
	b=ULdDK3yehlyFZe7XM9HWgbbtLiSH7PNOTcDUDS+wPZDdRvMCGJ06EuXgg/NxUnqv5y
	DsOh+gPXXQx6dIfnASRFwfAlst44pGKAcxMhNhM9D0EUpWJB3WyU51qPY6E7Vxo1CEMN
	TtT1KrDu3Cwvtunl7BypJ5zZhFdOouxxNMQXbq6/Ej6+OS0XWTKW8FsibykPBOTI0kVe
	YVCsVetwlETOo6ebx1AgfRB+JoVu+bI0ZQlmk6qxo42C+LPFW+vJb7uaYO83t3A6Q8lQ
	loLYFz7oGT9IZUCctXs8YQ/eIykHBFyXmjamowQC8MWBx42LAoMhoXfFzN9TJgpl/6EU
	0sSQ==
X-Gm-Message-State: AMke39k5cwIyNtz0Wa2q0ld5ahmtS57ExHnZw6mS8auyRZ2jK+cAz9TiVscCNySJoROEkQ==
X-Received: by 10.55.169.75 with SMTP id s72mr5097832qke.300.1487981392840;
	Fri, 24 Feb 2017 16:09:52 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	x40sm5804095qtx.23.2017.02.24.16.09.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 16:09:52 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2017 19:09:44 -0500
Message-Id: <1487981384-16516-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] nginx: update to version 1.11.10
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
X-List-Received-Date: Sat, 25 Feb 2017 00:09:51 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-httpd/nginx/{nginx_1.11.9.bb => nginx_1.11.10.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.11.9.bb => nginx_1.11.10.bb} (64%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.11.9.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.11.10.bb
similarity index 64%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.11.9.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.11.10.bb
index c142836..37565fc 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.11.9.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.11.10.bb
@@ -6,5 +6,5 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
 
-SRC_URI[md5sum] = "7aeca793819c2b8df134c0b1cfe98361"
-SRC_URI[sha256sum] = "dc22b71f16b551705930544dc042f1ad1af2f9715f565187ec22c7a4b2625748"
+SRC_URI[md5sum] = "6fb10f579055d27a2240d51c7d85c190"
+SRC_URI[sha256sum] = "778b3cabb07633f754cd9dee32fc8e22582bce22bfa407be76a806abd935533d"
-- 
2.7.4



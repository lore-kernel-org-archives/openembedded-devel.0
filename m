Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id A41B9731AE
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Mar 2016 12:21:41 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id y89so63933172qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Mar 2016 04:21:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5//9a3Il2DYi9prx1W5P/gwQJH29tBNuNpAULTGVQvA=;
	b=T8JQtSC6vcz9Xugoix8fGqZJwVBKeBQL8igZv21Px3XhQcGdxHRZJEW9zGqLygL8mJ
	a1yQLrtwbmQfoZRc2xPzLYv37RW64XzxHRP0lmXyD8c3TIiqx8oIOsLriRkunPyFYVpz
	pddHqAaKTeZCqS36I3l2tcKnk/iqcP00xezCYN/iWQUi5DjU0Wd60bFE3ewfZgBTv3/9
	uhRjrKefNkP7IKPJyXo8SsH6JMg3OpE3zokA1moiR73WA7pJDO+0C1Kf9Y3riDqNkusL
	vShRUUxDvSD5T4yLOG550PqcFsaczQi7hnLz/u1gn43OI+VLWsxUpbuSMP2umP2XFHzV
	KuFw==
X-Gm-Message-State: AD7BkJISEV6uI8Khk39VkeE1oGEVPei7/aDL1XfWwMTjzWmruKJTR5OWsKvrbnuu/TFIGg==
X-Received: by 10.140.234.11 with SMTP id f11mr17717834qhc.51.1457180502227;
	Sat, 05 Mar 2016 04:21:42 -0800 (PST)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 64sm3735431qhf.40.2016.03.05.04.21.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Mar 2016 04:21:41 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Mar 2016 07:21:13 -0500
Message-Id: <1457180473-8238-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-webserver][PATCHv2] nginx: update to 1.9.12
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
X-List-Received-Date: Sat, 05 Mar 2016 12:21:44 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-httpd/nginx/{nginx_1.9.11.bb => nginx_1.9.12.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.9.11.bb => nginx_1.9.12.bb} (96%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.9.12.bb
similarity index 96%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.9.12.bb
index 8b60e53..d18f82b 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.12.bb
@@ -19,8 +19,8 @@ SRC_URI = " \
 	file://nginx-volatile.conf \
 	file://nginx.service \
 "
-SRC_URI[md5sum] = "76eb5853a1190e0cfc691aa21c545de3"
-SRC_URI[sha256sum] = "6a5c72f4afaf57a6db064bba0965d72335f127481c5d4e64ee8714e7b368a51f"
+SRC_URI[md5sum] = "0afe4a7e589a0de43b7b54aa055a4351"
+SRC_URI[sha256sum] = "1af2eb956910ed4b11aaf525a81bc37e135907e7127948f9179f5410337da042"
 
 inherit update-rc.d useradd
 
-- 
1.9.1



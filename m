Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5B31974D44
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 May 2018 23:09:23 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id k11-v6so15262688pgo.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 May 2018 16:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7dCoASgANJha8SazWwPIgxYHiRmxC14RUJa0xvzaxZQ=;
	b=YIgTE0AVwW5+bln01Eqdo/ghTbupqUjxie2v456/PAqYDIXScGGkWw968vxgw22hHh
	tccVzquHbQ5vEX14o3/7OugeoLLHNvjJXkU1+COjZUCCx7lDsuZlGbr7TmGMMHA6D4pf
	Gm/oi/PynBwmi5OOBzM7WqkVFcMJNWE1n2aPuugAxUo+hWTZOcndqRHDKUvm302iuVk7
	sZgTjP7abarTFpzqCKPMR/uXrC0yi6YNGLqCEoamltpexiHk/emZihnt9OQKXvEbPc/h
	jOa5+CMCCRIyJZ3Di/dmFNsWWfOThKAk8R3z6+4b5jYLEyNNNHI7qnT6ifPln0ACTHAM
	uxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7dCoASgANJha8SazWwPIgxYHiRmxC14RUJa0xvzaxZQ=;
	b=l0xNWFE7uW6mXTli5C5CftWucwBgYZeb/i8Ivaodrj6VUnAfKZBgf08YOW2OBlXMO8
	fevapvhn5UopzGjI192TW1wLSCVGVeHnP7uTYLybvVJGeYC3wo9/WZ3BeNyiEQ7BUdYp
	7EzahP+M1g4qFB4UahVsJa8gSUV9cPwo4FYDeLMnLd5Bqt7VQpZKj0A9QlZmdY2txz8y
	GLxTlBpsW9tsmQDsC2DYDfcjDe+eCBP7Le6bVqw8Ag/+KOIxzoxvnsm+dJVNbjIAWPnv
	ZHgzubK1+zk5nKuH/befHPigldPeTMKSzGRf5p9WgkGAO0LUrPdvTdXKqIaOLbZnEvX8
	N+/g==
X-Gm-Message-State: ALQs6tAfM6QvI0Cgxp0ZJdAEYiZMwKB56Pxp5T5lQcIeqdsTwogI8UPd
	pNfWmhCb/Chqdfw8Ut+qsYcmyw==
X-Google-Smtp-Source: AB8JxZq+VMyPrNRt7bCMXGilDG3sdn2OztG+wgg4hUMNBnxgk3NAI2Je80NP0hcDnLWyyE2sHxsQOA==
X-Received: by 2002:a17:902:624:: with SMTP id
	33-v6mr29657562plg.361.1525475364836; 
	Fri, 04 May 2018 16:09:24 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	k13sm40465619pfj.186.2018.05.04.16.09.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 May 2018 16:09:24 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 May 2018 16:09:17 -0700
Message-Id: <1525475357-8521-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] openobex: explicitly set ASNEEDED from openobex recipe
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
X-List-Received-Date: Fri, 04 May 2018 23:09:24 -0000

Up to now, an openobex specific over-ride for ASNEEDED has been
provided by oe-core (from as-needed.inc). If ASNEEDED does need to be
over-ridden in order to build openobex it's not ideal that the
over-ride comes from a different layer so define it directly in the
meta-oe recipe.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
index 2db48f3..1b56685 100644
--- a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
@@ -25,6 +25,8 @@ EXTRA_OECMAKE += "-DBUILD_DOCUMENTATION=OFF"
 
 #--enable-apps --enable-syslog
 
+ASNEEDED = ""
+
 do_install_append () {
     rmdir ${D}${bindir}
 }
-- 
1.9.1



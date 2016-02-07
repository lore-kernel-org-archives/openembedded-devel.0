Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5E9D6760B0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Feb 2016 21:12:10 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id e127so334151pfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2016 13:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=x9OOjoKISdFUJUIyYWaF43c0vQPIsvYUQ8+LpgUOBPo=;
	b=fU1/MCXq43TOkQxjKHw30ok7gGr3L+9ZDkQw4hCX/oVOjKtxSbImbc3b4Bz9tSdfQ/
	9pyCFM7Wz9bLn+vEHUp5KJpyE/iBFoAay1TwoddK4X3kD4T9VVdQSXXdtRMZi7NuwSY/
	nmPrM0BYXmG0usIs+S1eUPHvntzQogCv+RxuxDUd/KnCtJOVOZdKSVfahC5VWKORnAQm
	U7jlXQXMg56iuxXA6SbAvXjXhldsq5H7vIqhcYPjAmCzjBamxGvb9ZpqbSxkDqgoTwNz
	Hc8am4Sc/4S/M4JxKsI/DuWtfi83RNPCgjxQZInvgaRAv5anmk0aD0Ez+ypVtDvwRVAG
	UVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=x9OOjoKISdFUJUIyYWaF43c0vQPIsvYUQ8+LpgUOBPo=;
	b=J4POSRJrRJqT/qZkwho50gpjEq2V0vlwiJ7E69QyAnMcBRyrd72NslPmbtVU00xwyh
	Q0mG1tPo21QD9zu75Xl/v9g0nCqNqrmqAIJGA1VG23k7IfcTv4LpsQo1wpe3SWmWvrdL
	tyZpOQWFOiHrraMZPFGkTACgdAdBRhq4ofDRHYH6LZvvMZQ02DCXZWMKspUJJOiMebg2
	sC+EMf6Hqjb7TTvyBztjYhUomUnWYn4lY7I9vZSncW4uT1E0kMpZ4Yiy4jYBCFzLvo6Q
	8uQ0MMFonLR1YueCye0ouUz/FCXV9wVFXBg3rd/vOxBG4a48zN3KJSYERWYz7Lr7W3KH
	Uo+A==
X-Gm-Message-State: AG10YOTVYFUGsI/RZj6okGbU3Bt/TcsJwi9wuVxRBWpAlQeh8xfkZEr/ZZ0SBaEKwTboZg==
X-Received: by 10.98.42.135 with SMTP id q129mr37000685pfq.13.1454879531442;
	Sun, 07 Feb 2016 13:12:11 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	g81sm38382783pfj.1.2016.02.07.13.12.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Feb 2016 13:12:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: otavio@ossystems.com.br, openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sun,  7 Feb 2016 13:11:54 -0800
Message-Id: <a63cb19ad40951d1860113efbe8bd449758a707f.1454879225.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454879225.git.akuster@mvista.com>
References: <cover.1454879225.git.akuster@mvista.com>
In-Reply-To: <cover.1454879225.git.akuster@mvista.com>
References: <cover.1454879225.git.akuster@mvista.com>
Subject: [PATCH 2/7] ntp: fix rpath QA issue
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
X-List-Received-Date: Sun, 07 Feb 2016 21:12:10 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

When ntp could be correctly built with openssh and libcrypto, we would meet
the following QA issue.

WARNING: QA Issue: package ntp contains bad RPATH ... [rpath]

Fix this problem by adding '--disable-rpath' to EXTRA_OECONF.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb
index 2c1345a..0a7a39e 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb
@@ -35,6 +35,7 @@ EXTRA_OECONF += "--with-net-snmp-config=no \
                  ac_cv_header_readline_history_h=no \
                  --with-yielding_select=yes \
                  --with-locfile=redhat \
+                 --without-rpath \
                  "
 CFLAGS_append = " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
 
-- 
2.3.5



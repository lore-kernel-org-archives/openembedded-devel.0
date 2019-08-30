Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 129757F3D5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 02:30:44 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id o70so3530666pfg.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 19:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=16IDWlq05o4rvs+GmC5eg6rQb0MvAa9OnGYZOBvSUUo=;
	b=LQxV3J/uNUd9eb36eBK0Epmb0HhyU905a4pqNcLkEBSffMaiBWsFUtWqTbVKcIOWxm
	DvYKBIMSJAIBfX2vBeJKxyfw4MYhz8gFzOWeICLePsm3bGQbAFw0+XKBHwfU0a43gGP8
	ajwWxQdydLufMlJhbz/FiFTQsPMnbL15Mpg9nMAVVIploTCD7g+HlYbTiaxt8ltIR3ti
	9v5SNKk9oRUbzdUKsc4ap1bNfPlzz047t3MyV+9k2ZOKFQSY2Uf+Rama2m2HroM7ieeB
	dKa5d1fll84UYNuwDBlyDkJM9VWYWEUpwLfD+0WKaxgKEM9N0wWReBG0Z3MfjzJ2HDjt
	ExEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=16IDWlq05o4rvs+GmC5eg6rQb0MvAa9OnGYZOBvSUUo=;
	b=TR6fB1qVddemc4/hxIQu/ceQP8px8f6zQ/hGBZEwKbnVowEIzGsi2nZWFaUmvI9oha
	CFNZQ15yjM80C+dWF0ffw1XZR6kswSfrvuIsPCgqfH4YCHH2YdI5wn09IgJP0u4gZg/W
	qG+C2sha8OghWciW5+0yy8P3zCveD+ipNzEtmXe8C1834J5eMeYHXNJXc9EQdv480gS8
	+jjhOCZbOsgVZTfCdKLuFEFp3GS/6NDw8FVQY0UZWn+8WEnLfqgsSwwxVhp7piNU5XWj
	OFwotDi0heSnLQZYQSb9x1zPoyiIeVql/y/tCuZynASJmWPm0H9I8MTJ5EcaYUw+EW8j
	9VsA==
X-Gm-Message-State: APjAAAXorkh5FwbteBTDPfcf6aTZ5o19HbUMF4F+WJV3PefiV9+wcwjK
	Lny8m+TITT/doyam4NR26Uuqp3Q1
X-Google-Smtp-Source: APXvYqzlZFlg62RvTAReYkhHav79P7Xf0k6Mal/fGVgf0qYBpir9y4CJj3IzRotRiY2FbyQIpQEu7Q==
X-Received: by 2002:a17:90a:f48a:: with SMTP id
	bx10mr13374915pjb.75.1567132245910; 
	Thu, 29 Aug 2019 19:30:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:90d2:579e:19f:13b1])
	by smtp.gmail.com with ESMTPSA id
	d14sm3731425pjx.17.2019.08.29.19.30.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Aug 2019 19:30:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2019 19:30:38 -0700
Message-Id: <1567132240-27573-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567132240-27573-1-git-send-email-akuster808@gmail.com>
References: <1567132240-27573-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [[meta-webserver][thud] 3/5] apache2: Correct appending to SYSROOT_PREPROCESS_FUNCS
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
X-List-Received-Date: Fri, 30 Aug 2019 02:30:45 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

A missing space lead to problems if something else was already added to
SYSROOT_PREPROCESS_FUNCS.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
index d58ccb8..c6961ef 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
@@ -147,7 +147,7 @@ do_install_append_class-native() {
     install -m 755 server/gen_test_char ${D}${bindir}
 }
 
-SYSROOT_PREPROCESS_FUNCS_append_class-target = "apache_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS_append_class-target = " apache_sysroot_preprocess"
 
 apache_sysroot_preprocess() {
     install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
-- 
2.7.4



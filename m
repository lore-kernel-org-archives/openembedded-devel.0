Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 925C36067C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 12:48:07 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id q62so1402931qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 05:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9nVi9JBSNHvdDPyMpa7yV1lNuYMqGW4tralfH6wrd0s=;
	b=m+/MJV9BARwS0wM82OlBWZ9flBM6v80uWnSaTlGRh3QHpzM5qLFjagIIkmpsdUdRNz
	TEKzIeCZJtTKjBezAspisTU4jmBiBDILbvPpBhausumH7jxUcVgBXtGDi0LKrfteWp0E
	sqqfnE1tPWQ29jnCIRyO/GThcRBWVYA6yhFeEI4v2yhfeJuwDd5YGJjDVqdMEcsQEAmo
	Luu6BJNqZZgFm+TflXaKf5o24IXm6KCGCqMA/QgE9Y/YaT5vh4LJTANbh/naR05H7pZW
	XttNp6nggwTyYMVfTeqQDJSh0zhJcsTObBfVFHu+A3fb8RRvp6xoMBwvqbZKK2iTWpra
	22JA==
X-Gm-Message-State: ALyK8tJYis1U55qZdlPgjIryGKUYJKYehm4kcX+EJWvJVWOiuO+ImgYjXuZw5xofmzl8XQ==
X-Received: by 10.55.38.197 with SMTP id m66mr18799775qkm.208.1468154888275;
	Sun, 10 Jul 2016 05:48:08 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id q13sm2219705qkq.6.2016.07.10.05.48.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Jul 2016 05:48:07 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jul 2016 08:48:01 -0400
Message-Id: <1468154881-16715-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1468154881-16715-1-git-send-email-derek@asterius.io>
References: <1468154881-16715-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-vcversioner: add RDEPENDS for the package
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
X-List-Received-Date: Sun, 10 Jul 2016 12:48:07 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-vcversioner_2.16.0.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-vcversioner_2.16.0.0.bb b/meta-python/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
index 9308c12..f4a6009 100644
--- a/meta-python/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
@@ -17,4 +17,8 @@ do_install_append() {
     install -m 0644 ${S}/vcversioner*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/
 }
 
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-subprocess \
+    "
+
 BBCLASSEXTEND = "native"
-- 
1.9.1



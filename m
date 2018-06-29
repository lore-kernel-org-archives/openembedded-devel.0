Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 44D39751BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 20:38:24 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id y4-v6so5676392qka.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 13:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tib0MGxI2JMNpCFhH9Y56s764WOgPN/X0p9BwAecrQU=;
	b=TMaD3ukqKi2cujUyD340jlr5oHH4qqrDJfeiUMOOZIf1lof8WmfqqsnX937lg/lFaG
	pQ8dS46kcg49tfw/qAOn5XXXK+2zvXCPlaB07BaKuoc63I9enZF6yPhSl4LNVpewXsQ/
	ULvPaFwmPH1VknXFYHZ3bgEg2OTebKTeCceG2T8uQoZy+ExeGtjNWQQ8tNN+aYy+43Lw
	1cB7oQx4FS7ysy16WBN3z+xRQYm0dkkLyMm2u1FKSGwHzMV85vA4bAATb5pgJnViXXsH
	O6oB1VshDWu+FZkoKm9WjrvhcW4CR2/F3emVak+4X3S+HmHFiEhdisN6jewiQVnGnS8Y
	zLyg==
X-Gm-Message-State: APt69E1oosksJsJEsfwiSU3tshN4Euki7l6FJq5ouOmej+BnU8A4Mx7T
	HNib19rZi068q5IIkQHfkuKyhUCj
X-Google-Smtp-Source: AAOMgpcfJL7CgFa0o+an3y0XLaHv/aEsZKsk9ojvMKHVUvAA9Xjahw5JP9b5QGtBcRrYIoylF/4BwQ==
X-Received: by 2002:a37:308a:: with SMTP id
	w132-v6mr3244270qkw.60.1530304704672; 
	Fri, 29 Jun 2018 13:38:24 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	l61-v6sm6278276qte.67.2018.06.29.13.38.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jun 2018 13:38:23 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 16:38:17 -0400
Message-Id: <1530304697-27277-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pandas: update to version 0.23.1
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
X-List-Received-Date: Fri, 29 Jun 2018 20:38:24 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pandas.inc                 | 4 ++--
 .../python/{python-pandas_0.22.0.bb => python-pandas_0.23.1.bb}       | 0
 .../python/{python3-pandas_0.22.0.bb => python3-pandas_0.23.1.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pandas_0.22.0.bb => python-pandas_0.23.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pandas_0.22.0.bb => python3-pandas_0.23.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pandas.inc b/meta-python/recipes-devtools/python/python-pandas.inc
index b9f84a6..a08f1c2 100644
--- a/meta-python/recipes-devtools/python/python-pandas.inc
+++ b/meta-python/recipes-devtools/python/python-pandas.inc
@@ -6,8 +6,8 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11"
 
-SRC_URI[md5sum] = "c7a2757b607748255f3270221ac61d59"
-SRC_URI[sha256sum] = "44a94091dd71f05922eec661638ec1a35f26d573c119aa2fad964f10a2880e6c"
+SRC_URI[md5sum] = "95554bdc5991831030055dc26393554f"
+SRC_URI[sha256sum] = "50b52af2af2e15f4aeb2fe196da073a8c131fa02e433e105d95ce40016df5690"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pandas_0.22.0.bb b/meta-python/recipes-devtools/python/python-pandas_0.23.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pandas_0.22.0.bb
rename to meta-python/recipes-devtools/python/python-pandas_0.23.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pandas_0.22.0.bb b/meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pandas_0.22.0.bb
rename to meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb
-- 
2.7.4



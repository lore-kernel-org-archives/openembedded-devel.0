Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3D238746F0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 20:45:34 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id j4-v6so27501972wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 13:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YxNs8hS0LVaHyNejgnC7m9Ectripv9MBW49i9yjIBvw=;
	b=phGINE0ZI4A+khk0Uxt6PHneH7mXTtq8PrG7X6aeRhAEbrEWgT5mfyNjZDQLV+hMid
	AEyZD8XewI84BYRku8RJw1F49kl3JmYhoJ2CoVHEH5LtLljsQRUNocoYoeqECsr/0mBM
	ACMxsh6tK4qKt2JP+WzPXGd/k+XnfA36LB1YJ36hM1r5iOEewvehACValOrjuMJR6HBr
	++wyZAXzuTReiPbxlsi9Rao0IAJO7BhcJ7zASzX5bhGqGsH6LQqHlu36h6rGzOlfaper
	TzdIn4GRsYaiTr/i6AtsYUfB4ajW36O56QoMyjZ1qzX+eKccSnJhTorGX3MsA9S6o57C
	Upew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YxNs8hS0LVaHyNejgnC7m9Ectripv9MBW49i9yjIBvw=;
	b=GQEI+nG33NH5qnsuaQiLMkz5Ul5ReHW5cV75mCqpkmb7Zf022ZYI6axjqu7y2lYcmF
	anYZwtOWWb/btXC3rvrOrJ6Tr4P5WpIKiEWlEK5FMqAXMSNgqJMh5ynfQ4RcFDGvyHX2
	B6Rh7mnb4EBpwt6PvwjQQtu6RT+MByr9/benJgS+Q28fg4jQIeS0+lId08gYV/epoRxB
	ucKVjQ+hfCTmYdxeDekdWVxi3UYJIJEk6N4Jbg4NP26mQ0iYeEH7LgQm5JDoGf2kyyvb
	27aXAiowQj9vM5Oz9S7PWYrDmpza+bUHwfKg/JC1R+AyOhfAncvE4EwwzIpvtEpzQsde
	NWqA==
X-Gm-Message-State: ALKqPwdFF3usBwp7Eiv3wcyO5ZwVmjP4fJU+w0CqKeG0YXB4wxc/O/GQ
	mkxD33hBJnU1ZpDfToYpCuMAqg==
X-Google-Smtp-Source: AB8JxZqhyfiT+BfOsvxMw4rxFwum7yPBjwuwpthmz+WSXMjsdKj8G9BU3526nJhHkPMvWaU/IdQV5w==
X-Received: by 2002:a50:98a5:: with SMTP id
	j34-v6mr25209690edb.212.1526935535307; 
	Mon, 21 May 2018 13:45:35 -0700 (PDT)
Received: from localhost.localdomain (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27]) by smtp.gmail.com with ESMTPSA id
	w9-v6sm7887929edb.38.2018.05.21.13.45.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 May 2018 13:45:34 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 May 2018 22:44:31 +0200
Message-Id: <20180521204431.114782-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-webserver][PATCH] fcgi: Update to 2.4.1+
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
X-List-Received-Date: Mon, 21 May 2018 20:45:35 -0000

Update to latest from upstream. This adds pkg-config support.
Fix_EOF_not_declared_issue.patch is obsolete, fix is upstream.

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../fcgi/fcgi/Fix_EOF_not_declared_issue.patch          | 17 -----------------
 .../fcgi/fcgi/add_foreign_to_AM_INIT_AUTOMAKE.patch     |  4 ++--
 .../recipes-support/fcgi/{fcgi_2.4.0.bb => fcgi_git.bb} | 10 ++++++----
 3 files changed, 8 insertions(+), 23 deletions(-)
 delete mode 100644 meta-webserver/recipes-support/fcgi/fcgi/Fix_EOF_not_declared_issue.patch
 rename meta-webserver/recipes-support/fcgi/{fcgi_2.4.0.bb => fcgi_git.bb} (56%)

diff --git a/meta-webserver/recipes-support/fcgi/fcgi/Fix_EOF_not_declared_issue.patch b/meta-webserver/recipes-support/fcgi/fcgi/Fix_EOF_not_declared_issue.patch
deleted file mode 100644
index 51ddeaac2..000000000
--- a/meta-webserver/recipes-support/fcgi/fcgi/Fix_EOF_not_declared_issue.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-Fix EOF not declared issue, following is the error log.
-fcgio.cpp:70:72: error: 'EOF' was not declared in this scope
-              if (FCGX_PutStr(pbase(), plen, this->fcgx) != plen) return EOF;
-
-Signed-off-by: Yang Haibo <b40869@freescale.com>
---- fcgi-ori/libfcgi/fcgio.cpp 2014-07-28 18:01:00.000000000 +0800
-+++ fcgi-2.4.0/libfcgi/fcgio.cpp       2014-07-28 18:01:22.000000000 +0800
-@@ -22,6 +22,7 @@
- #define DLLAPI  __declspec(dllexport)
- #endif
-
-+#include <stdio.h>
- #include <limits.h>
- #include "fcgio.h"
-
diff --git a/meta-webserver/recipes-support/fcgi/fcgi/add_foreign_to_AM_INIT_AUTOMAKE.patch b/meta-webserver/recipes-support/fcgi/fcgi/add_foreign_to_AM_INIT_AUTOMAKE.patch
index eca694adc..eec9dd7ce 100644
--- a/meta-webserver/recipes-support/fcgi/fcgi/add_foreign_to_AM_INIT_AUTOMAKE.patch
+++ b/meta-webserver/recipes-support/fcgi/fcgi/add_foreign_to_AM_INIT_AUTOMAKE.patch
@@ -10,8 +10,8 @@ Signed-off-by: Yang Haibo <b40869@freescale.com>
  dnl     to configure the system for the local environment.
  
 -AC_INIT
--AM_INIT_AUTOMAKE(fcgi, 2.4.0)
-+AC_INIT([fcgi], [2.4.0])
+-AM_INIT_AUTOMAKE(fcgi, 2.4.1-SNAP-0910052249)
++AC_INIT([fcgi], [2.4.1-SNAP-0910052249])
 +AM_INIT_AUTOMAKE([foreign])
  
  AM_CONFIG_HEADER(fcgi_config.h)
diff --git a/meta-webserver/recipes-support/fcgi/fcgi_2.4.0.bb b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
similarity index 56%
rename from meta-webserver/recipes-support/fcgi/fcgi_2.4.0.bb
rename to meta-webserver/recipes-support/fcgi/fcgi_git.bb
index 48c594483..a17e70f09 100644
--- a/meta-webserver/recipes-support/fcgi/fcgi_2.4.0.bb
+++ b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
@@ -3,12 +3,14 @@ HOMEPAGE = "http://www.fastcgi.com"
 LICENSE = "OML"
 LIC_FILES_CHKSUM = "file://LICENSE.TERMS;md5=e3aacac3a647af6e7e31f181cda0a06a"
 
-SRC_URI = "http://fossies.org/linux/www/old/${BP}.tar.gz \
-           file://Fix_EOF_not_declared_issue.patch \
+SRCREV = "68100b5b8cb26f04b784778ed19ccef4fe389f57"
+PV = "2.4.1+git${SRCPV}"
+
+SRC_URI = "git://github.com/FastCGI-Archives/fcgi2.git;protocol=https \
            file://add_foreign_to_AM_INIT_AUTOMAKE.patch \
 "
-SRC_URI[md5sum] = "d15060a813b91383a9f3c66faf84867e"
-SRC_URI[sha256sum] = "66fc45c6b36a21bf2fbbb68e90f780cc21a9da1fffbae75e76d2b4402d3f05b9"
+
+S = "${WORKDIR}/git"
 
 inherit autotools
 
-- 
2.14.1



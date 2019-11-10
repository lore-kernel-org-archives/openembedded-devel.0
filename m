Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id A32596C4D8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 21:28:05 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l7so937596wrp.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 13:28:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yvxy9oTFbgm+GXu6tt12ldGqPbQRqUo4nI9woNWNg4I=;
	b=ufv66YjSQKtHCqoOPG2Plu2Qs9wbvPGd0cFQT0NWrGaweBMTZkYe8S13yyEa1VLtF9
	LBhG9dP3eJO1fuU7yiStujb0iS0JmBu/B7UQiFkti+PVe0Ixqg50P9+ijCRFdt8quZ6W
	k7BnpH5Ezgru45hLrZWNPQMDdHkJybRaV4z5Fbv3HHFdJ+YMDpOiycvr6Fk7/LexA8K2
	LNLrU/ifCP/UWhr1pSit/hHmjP/Tm8i1OtqZfqCeHElXveKcNdcVs3UN6CFt4549zJ79
	n7KgNzNYp0E5uDqaj/C6x3VxyEv0MxGjQxg8zUDMGOuSb0Qx7I0+cxj/xiKGYRK6DEIP
	I7fQ==
X-Gm-Message-State: APjAAAWOA8MWF+XX+NuUnVhjmse4/QOjwM3/y/9Ol6Jjk0KYHKwLXgkl
	HRm6Y+a4KA4eY3EwrcKUy8mBOC6I
X-Google-Smtp-Source: APXvYqx2XHIbP4aMJ7P6uhpK4/5ZBTCUJ0ixB4V86ajMJ4rMlwnt4bX7ut6aNP0wL5kCCbl9flvCLg==
X-Received: by 2002:a5d:4a10:: with SMTP id m16mr662059wrq.294.1573421286072; 
	Sun, 10 Nov 2019 13:28:06 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	n17sm12862421wrp.40.2019.11.10.13.28.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 10 Nov 2019 13:28:05 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Nov 2019 21:28:03 +0000
Message-Id: <20191110212803.9262-2-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191110212803.9262-1-git@andred.net>
References: <20191110212803.9262-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/2] gyp: provide a python2 version of gyp as gyp-py2
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
X-List-Received-Date: Sun, 10 Nov 2019 21:28:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Doing so will allow us to change the NodeJS build
to use the system gyp, rather than its own copy.
NodeJS still uses python2, and imports parts of
gyp directly.
Also note that Debian only provides a python2 version.

Signed-off-by: André Draszik <git@andred.net>
---
 meta-python/recipes-devtools/gyp/gyp-py2_git.bb |  2 ++
 meta-python/recipes-devtools/gyp/gyp.inc        | 13 +++++++++++++
 meta-python/recipes-devtools/gyp/gyp_git.bb     | 15 +--------------
 3 files changed, 16 insertions(+), 14 deletions(-)
 create mode 100644 meta-python/recipes-devtools/gyp/gyp-py2_git.bb
 create mode 100644 meta-python/recipes-devtools/gyp/gyp.inc

diff --git a/meta-python/recipes-devtools/gyp/gyp-py2_git.bb b/meta-python/recipes-devtools/gyp/gyp-py2_git.bb
new file mode 100644
index 000000000..d69b92ce6
--- /dev/null
+++ b/meta-python/recipes-devtools/gyp/gyp-py2_git.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require gyp.inc
diff --git a/meta-python/recipes-devtools/gyp/gyp.inc b/meta-python/recipes-devtools/gyp/gyp.inc
new file mode 100644
index 000000000..98ed42cc9
--- /dev/null
+++ b/meta-python/recipes-devtools/gyp/gyp.inc
@@ -0,0 +1,13 @@
+DESCRIPTION = "GYP is a Meta-Build system: a build system that generates other build systems."
+HOMEPAGE = "https://gyp.gsrc.io/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ab828cb8ce4c62ee82945a11247b6bbd"
+SECTION = "devel"
+
+SRC_URI = "git://chromium.googlesource.com/external/gyp;protocol=https"
+SRCREV = "fcd686f1880fa52a1ee78d3e98af1b88cb334528"
+
+S = "${WORKDIR}/git"
+PV = "0.1+git${SRCPV}"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/gyp/gyp_git.bb b/meta-python/recipes-devtools/gyp/gyp_git.bb
index 61f3c8637..8e48a27fa 100644
--- a/meta-python/recipes-devtools/gyp/gyp_git.bb
+++ b/meta-python/recipes-devtools/gyp/gyp_git.bb
@@ -1,15 +1,2 @@
-DESCRIPTION = "GYP is a Meta-Build system: a build system that generates other build systems."
-HOMEPAGE = "https://gyp.gsrc.io/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ab828cb8ce4c62ee82945a11247b6bbd"
-SECTION = "devel"
-
-SRC_URI = "git://chromium.googlesource.com/external/gyp;protocol=https"
-SRCREV = "fcd686f1880fa52a1ee78d3e98af1b88cb334528"
-
-S = "${WORKDIR}/git"
-PV = "0.1+git${SRCPV}"
-
 inherit setuptools3
-
-BBCLASSEXTEND = "native nativesdk"
+require gyp.inc
-- 
2.23.0.rc1



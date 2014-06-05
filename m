Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 15DE76AD68
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jun 2014 22:58:49 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id v10so1712502pde.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jun 2014 15:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=KSY107Z+2UluKQOFvXjvvbRc0hon6lUBhE0ZUvW4mCc=;
	b=JlQhuZ8H+WxD6jY0p+Sol1DhXCINuGyKHQwHWf6XeiguYBse40xNKqo2WqWWxic2v1
	5jWKoRB6eeZeDlBZqcoWT3aXh/GKFVhgQw3fvy+wB9LriaKiFpKYjkiZhRK5zVzntl+u
	TsZcVfp7F+3AThxdmwkbkVDcdIgeeyFViCqySzG30uR8laeg3bv6aoOit82yBiBNH31v
	9G+cyXHEsuZLNvic4W9jiGlYqdTfXV4wu5ARavJXOS4oVJyl3+R3Dmpu8rZFYDg8YkbY
	StfKyB9vgf99vWt8hvBvjRBNkQCHa31QYP87lHaqMmAnFoG9XdaUS43fVoCuE2xMa6Gt
	eHFA==
X-Gm-Message-State: ALoCoQlishuco984Da+yUrrJZghl3+eFSjCtRA1WCBPtYUocmSEXlFkXN7bLTeEecG7RHw+VRaTV
X-Received: by 10.68.139.194 with SMTP id ra2mr1557089pbb.20.1402009130057;
	Thu, 05 Jun 2014 15:58:50 -0700 (PDT)
Received: from Pahoa2.mvista.com (64.2.3.195.ptr.us.xo.net. [64.2.3.195])
	by mx.google.com with ESMTPSA id
	sv10sm27565620pbc.74.2014.06.05.15.58.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jun 2014 15:58:49 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jun 2014 15:58:45 -0700
Message-Id: <1402009125-22805-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] V2 libop: compile issue files missing in B and packaging issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jun 2014 22:58:52 -0000

needed to copy over a file from S to B.
remove packaging requirement for /usr/bin/scsh. Not needed (see link)
https://lists.balabit.hu/pipermail/syslog-ng/2000-August/000795.html

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-oe/recipes-support/libol/libol_0.3.18.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-support/libol/libol_0.3.18.bb b/meta-oe/recipes-support/libol/libol_0.3.18.bb
index 429945f..299ccbb 100644
--- a/meta-oe/recipes-support/libol/libol_0.3.18.bb
+++ b/meta-oe/recipes-support/libol/libol_0.3.18.bb
@@ -8,3 +8,13 @@ SRC_URI[md5sum] = "cbadf4b7ea276dfa85acc38a1cc5ff17"
 SRC_URI[sha256sum] = "9de3bf13297ff882e02a1e6e5f6bf760a544aff92a9d8a1cf4328a32005cefe7"
 
 inherit autotools binconfig
+
+do_compile_prepend() {
+
+    install ${S}/utils/make_class.in ${B}/utils 
+}
+
+do_install_append() {
+    rm -fr ${D}${bindir}
+}
+
-- 
1.9.1



Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4DD34780D3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 19:32:59 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id a72so69081287qkj.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 12:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ng0/ukJgIVLc8k4ygZorPQ2ryF0ZALgJPid5m/fgJNk=;
	b=I5+uQqF3hH8ebuhpKtRe/JH8Qs7NH3hsDSjt6girtucfqaEm8og4wxOqadBMj2JExB
	SaJ2UcQY9PO08kI44wbRSdL90HHbDIwy3gayMiuV4zXl7YWHPIDJoYlbOkK0iBXVDn6s
	paLEXNDYhh+NDQQaiZJF2cGqAwcHbsD9c+rR1GJroGmllWjfIlYJh5DbgYI+UPhL8PP4
	+CmQkDSCTYRexY7V8KOniyq0BAmL1fQg39E4dK/X2e8gqVX/1Pja03gPAU76/9ZXTJnB
	oJZf8DWsyxdDF0EARYa/dUiIfn/AC2DeCdYEzNrBVqqeA+xBL5J7LXyO3EXBhHVMFzNS
	GPjA==
X-Gm-Message-State: AODbwcAshoFmDfBsvph3Prw4WHtTje9K3qgpl+dNXo4KUIaFEz/xSd9+
	tfLTXqL1z76tMA==
X-Received: by 10.55.17.224 with SMTP id 93mr9984897qkr.244.1495222380598;
	Fri, 19 May 2017 12:33:00 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id 22sm6730620qkv.52.2017.05.19.12.33.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 12:33:00 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 15:32:41 -0400
Message-Id: <1495222361-6579-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libmodule-build-tiny-perl: update to version 0.039
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
X-List-Received-Date: Fri, 19 May 2017 19:33:02 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...-build-tiny-perl_0.036.bb => libmodule-build-tiny-perl_0.039.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libmodule/{libmodule-build-tiny-perl_0.036.bb => libmodule-build-tiny-perl_0.039.bb} (90%)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.039.bb
similarity index 90%
rename from meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb
rename to meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.039.bb
index 761f17c..b1a56e5 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.039.bb
@@ -10,13 +10,13 @@ SECTION = "libs"
 HOMEPAGE = "http://search.cpan.org/~leont/Module-Build-Tiny/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=aaca61412962cf972aec0cdad99d0a84"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=57b8100f0b648cd37fbc3725fe3c111a"
 
 DEPENDS = "libextutils-config-perl-native libextutils-helpers-perl-native libextutils-installpaths-perl-native"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV}.tar.gz"
-SRC_URI[md5sum] = "bfc92c655158ce623f0ced94f4ef02e5"
-SRC_URI[sha256sum] = "d6706bf35e080e5af20cccf4fd565cc8af9c2a1e2e2075cee0a7de42cf0d6df9"
+SRC_URI[md5sum] = "2332c90c17454107fea3f2614e11a3a9"
+SRC_URI[sha256sum] = "7d580ff6ace0cbe555bf36b86dc8ea232581530cbeaaea09bccb57b55797f11c"
 
 S = "${WORKDIR}/Module-Build-Tiny-${PV}"
 
-- 
2.7.4



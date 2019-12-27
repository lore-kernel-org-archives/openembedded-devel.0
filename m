Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 21FCC7CE27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 03:56:46 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id i6so7287630pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Dec 2019 19:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cLNtGP39qbYu7zE/K2AJ3jsZfewzjvQsxVwBR5ou47I=;
	b=n0yJLEBhF2CZNnVz04yWIdY+eKTaKp9v5GLkcvcGBB1XkbqKXJwhaAqvV++rfGIMFg
	0WVI8RgmL30prSFI9IeVip3Mu2rCO6PsbXtIylZgWKYyeru81c2LDeErWgsMGOWi24pW
	o73r3Oc8pyH4FQuQkqx16J/e9kgNcxf526XQBrRhv1Xy2Mrv664/bint5Iisfh7ITF00
	o2Vfz6JFVrzqXLvJYIowvQMfqKt3P6xQBM0WNvGoHUASz0kAoEqHHapdwXV0s3FQGuD8
	rIAe0v/ls6RCL6KOXtJDh770mxJJkgldJ31tKv6Y9GCd7KXXIWBl9KBRFuyi7hmqo2Y8
	VXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cLNtGP39qbYu7zE/K2AJ3jsZfewzjvQsxVwBR5ou47I=;
	b=Vryde85y9peiy3agunKl0G4UGziSCcnk3WBODXeVJt8wzOWuvyEWwj4Pg4WPVEl3jj
	Bnx6ZyobLHSfkuGY4kDmosGsVPmn4KDyeTstXWWuO2vMGJwHbUiibik7fkBKTeFWTDpf
	OKQX8i1XG1QTTfxgooZzrSG0jHabcycrhNbprn1ScCPiuZ1MrNZ191kp2egK/AkBI4AC
	B0FSpygn03Qz+z/muxjegflDQWCZTCo6/7OfXbb5kmwqVYEslEP7yRFgVPXP9OyCmkSv
	bcDZEE1NJnxyVjcgm75VGXg6Ur8DI/Dqtkt2Q8u2g0ZKYKPtwU0xmATZIrIr3IKfmYx6
	tQGg==
X-Gm-Message-State: APjAAAWcNPanVfAEZ1BfyfQJLFMIXlDMlil2H3hhO18Q5bHoH8BjxDH0
	svXlMn9sA6JUUopy87s60cv8YGhggQY=
X-Google-Smtp-Source: APXvYqwcCooRtPRwe/dyJkxxWNL3JKZxaLeBsc6Qsok7DLi8wR4HHMDrAjAaXa/vMxmxhqUNAH1PTg==
X-Received: by 2002:a62:1548:: with SMTP id 69mr53473129pfv.239.1577419007704; 
	Thu, 26 Dec 2019 19:56:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	r30sm36673613pfl.162.2019.12.26.19.56.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Dec 2019 19:56:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Dec 2019 19:56:36 -0800
Message-Id: <20191227035639.303716-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191227035639.303716-1-raj.khem@gmail.com>
References: <20191227035639.303716-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/5] wvstreams: Fix build with gcc10
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
X-List-Received-Date: Fri, 27 Dec 2019 03:56:47 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-narrowing-conversion-error.patch | 29 +++++++++++++++++++
 .../wvdial/wvstreams_4.6.1.bb                 |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/0001-Fix-narrowing-conversion-error.patch

diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-Fix-narrowing-conversion-error.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-Fix-narrowing-conversion-error.patch
new file mode 100644
index 0000000000..fc9abd8e63
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-Fix-narrowing-conversion-error.patch
@@ -0,0 +1,29 @@
+From c86c524f951f6e973473bfee76fd5366368b2cbc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Dec 2019 09:32:41 -0800
+Subject: [PATCH] Fix narrowing conversion error
+
+xplc/moduleloader.cc: In static member function 'static Module* Module::loadModule(const char*)':                                                                                                                                             xplc/moduleloader.cc:67:14: error: narrowing conversion of '-1' from 'int' to 'unsigned int' [-Wnarrowing]                                                                                                                                       67 |   case (int)-1:                                                                                                                                                                                                                             |              ^
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ xplc/moduleloader.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xplc/moduleloader.cc b/xplc/moduleloader.cc
+index 02dd9a4..c53f5d2 100644
+--- a/xplc/moduleloader.cc
++++ b/xplc/moduleloader.cc
+@@ -62,7 +62,7 @@ Module* Module::loadModule(const char* modulename) {
+     return NULL;
+   }
+ 
+-  switch(moduleinfo->version_major) {
++  switch((int)moduleinfo->version_major) {
+ #ifdef UNSTABLE
+   case -1:
+     /* nothing to do */
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index b220f9c1bc..20becaf57d 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz \
            file://0002-wvrules.mk-Use-_DEFAULT_SOURCE.patch \
            file://openssl-buildfix.patch \
            file://0001-Forward-port-to-OpenSSL-1.1.x.patch \
+           file://0001-Fix-narrowing-conversion-error.patch \
            "
 
 SRC_URI[md5sum] = "2760dac31a43d452a19a3147bfde571c"
-- 
2.24.1



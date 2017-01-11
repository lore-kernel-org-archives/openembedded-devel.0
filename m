Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id CBC6171AE6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 13:28:31 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id c206so110929140wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 05:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=YyPuv3vyZwfJeomiZEfdYhXsASzU5JNmdjNpbCir3WM=;
	b=S0xPRQLlY7JCv9RMkqVL43SoIHVmCnjyogbab0bPZ4zUxJdGPf5ee0Sl7Mi3YhUWdv
	gRq9Pcu7n1yDfZYRbgAX95a1N+ofhWRMWyUmwK0Nnja0pe1Ttk0UTRO1K1GQA5ku8Iad
	l1Q3ECnwCG8YMtNil5wecwXOvxwOON6CdNeizTERHeBDBeycpc4R7KfY47wBy4oiygKG
	5D1rIDzgp5u3HYreHPyb8i7JdnLZvJ4TnXWiDTF6sURr70NhpSEJwOn5nrdCESEY26Iw
	h5gSZSeqXCJeuYXcMeAfkB6J2de7NHT74ypUb+QBNVM9HRbEUTFODoXNWVLzPm9OW5F0
	sLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YyPuv3vyZwfJeomiZEfdYhXsASzU5JNmdjNpbCir3WM=;
	b=tYXcdUSd1qc2v/NUrx+soG4k0CeKvwwleODonwV3/waVrpJYVGARVjEomMencDsnHg
	/ShFnERUeDxF4rDR7mRAYAa6aL4kqQfbAwEfBCURQMLKIB9RIG8RS8vnjb5BReB+CXDq
	po+MJxgMzf7Y0LPJ89E0PEF7/DIJmfJlR9P07Ndl7EP6W72UfQc68KwmwJHCtVpHIIDn
	KOCHhhexK25aJYL4OGm2sM/6G+pHt6xr9tXEONJv0bbQv9X16HMf9i5KUBVlmkDfbOku
	Er3+fsRDHnpQNmIqSr83nLc7mkfkr28rIipoUhmG7xlkedTrDDOHRUGBlpcvJyf3gLPf
	gB3Q==
X-Gm-Message-State: AIkVDXKAAbR9REdtgsCXz/XwIdVNa9skkir2zguEmvAQQo+o+6bkEvZiqQAxJ/Adl2SWLAgn
X-Received: by 10.28.99.69 with SMTP id x66mr3106783wmb.91.1484141308120;
	Wed, 11 Jan 2017 05:28:28 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id 63sm29870111wmg.2.2017.01.11.05.28.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Jan 2017 05:28:27 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Jan 2017 14:27:37 +0100
Message-Id: <1484141257-6935-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] nodejs: update to 4.7.2
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
X-List-Received-Date: Wed, 11 Jan 2017 13:28:34 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta-oe/recipes-devtools/nodejs/{nodejs_4.7.0.bb => nodejs_4.7.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.7.0.bb => nodejs_4.7.2.bb} (96%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.7.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.7.2.bb
similarity index 96%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.7.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.7.2.bb
index 54d6829..4f4b43a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.7.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.7.2.bb
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "f4a7ca6912d0688b37712bb09b65d2d4"
-SRC_URI[sha256sum] = "b03c777ba8817a8478d57f00797db86dc7e7953d2066c34edbceeba8ad056142"
+SRC_URI[md5sum] = "eb55fc7700acb7d65fa8cbbbecf4ebb0"
+SRC_URI[sha256sum] = "ad1b8309a621f725b5d8205f0fc5bbb7b396a438c108e6fba417c1a914932dfc"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.7.4



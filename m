Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 45C1F6B355
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:04 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c50so212654eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=lTQm8TOkq9Zud5XAnctRbZpFOpcrnnurK/Yb9wp5/OM=;
	b=CSiTIQOL6u52Zo4afkiOZ7gMiHswaj91zqkTKpX/hwSQghWhhzo6oWFEwUVykp6AZI
	R/GnIRVTGg3HJFRDWDgbIpNULf/hCLG1u78AhRWavy1S1Ge8/iDgC5ahY3TgHmJP8bBg
	KSuDACmXO7/0OH55t7VVWDkPnAVXCdsJjJgAqU8NoIQwwehj/uTDtXhL6qkwGytpBFo2
	EW/VstFZCsqFcQ7VQN4VOjJdYza7L8mTjNmnbD/EjK1l6PvxNUqVM6pMim+8bBZ0xTeR
	1LHB3b9UiqHg57KM/qeYWa0w3WLVOZGSPqwp4Q5J5AwItUwtq4rZ54EFRvqOBWfi7wWI
	nlnQ==
X-Received: by 10.15.82.132 with SMTP id a4mr37753034eez.107.1374669664600;
	Wed, 24 Jul 2013 05:41:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b7sm65839725eef.16.2013.07.24.05.41.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:40:52 +0200
Message-Id: <fc5bdc6830d8ca7e8f41f57f85f9b0b06f1354f7.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 08/29] jasper: add PACKAGECONFIG for jpeg
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:04 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb b/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb
index ef9ca6f..a454501 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb
@@ -8,6 +8,9 @@ SRC_URI = "http://www.ece.uvic.ca/~mdadams/jasper/software/jasper-${PV}.zip"
 
 inherit autotools lib_package
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[jpeg] = "--enable-libjpeg,--disable-libjpeg,jpeg"
+
 EXTRA_OECONF = "--enable-shared"
 
 SRC_URI[md5sum] = "a342b2b4495b3e1394e161eb5d85d754"
-- 
1.8.3.2



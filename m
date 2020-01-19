Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id C3B487FCA7
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jan 2020 20:50:11 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id l35so6057113pje.3
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jan 2020 12:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3Msoz6w0DhHYbIFo4mpAI5uLgYR9sXuoCEM2jNIMW4I=;
	b=Xs2j/jfI+uHs5rv3zgbHJFrCBSaA5tp0vUkKRefnf9hH6XnabzrwfKZCQUwL8+cysn
	nj5C2XeI1Lloa/tt+ACkUlp7y1WeNBxSdKBhXMFM56Bm1fwASv71OR37/kgZ7WGUxvnb
	JptI8X01rKm9d8HcFn9ucNt9oigKjUZo6Da8Uod634U7e5eHw53PYsF9RzeiQTurHbct
	d8zcuNgF3rBTaDxJ/xKiDsqDjfEG1rkFud8trAUR0Bktw/X++aKsv7OAxyd24tQsp2me
	6BCOcb0J+JERdscwDgtQyjo3fHaAINe3rGZksNs2xSs840NW8KIlCEgyJNC1PwtGgtQS
	GacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3Msoz6w0DhHYbIFo4mpAI5uLgYR9sXuoCEM2jNIMW4I=;
	b=lRV7rs9CigITKRBPbiOBFkReS0n9C59nQsiw6hTEsVzklUzSknz6w0kO7p7mOmplw2
	2Yt3SCRW3l8kuPR6FZNZlmvYGl0vzcT5Ui7SP2c4W/1uPa3vmgUO4FQ8xaq/wRAOYFZ6
	d3u5t1BMvIBGS6oVLDuORSXX3HQbVbqViH/Tff30YuurRr9mH9X7oe+Oo6Y6DiPX0b4O
	+OHov2LEKXiOCam3OFh+ieAcHD830KmG7u3WGd6AzXZhNxw/S3Lx9GyVS3T6/CnvaGPK
	IZlA55e74by1LhDEYYm8mPi2czb1YNebcUlC1T3d56u7L8mpN5+O7zaeVVlpzmXdFFV7
	xz9Q==
X-Gm-Message-State: APjAAAX/2EVXAPCdMvsEwCUop9/zW2AAuijl6sP/AMA1CrFmYHAK0i4s
	6k6qDrgMFKe9r7rUpyDMdi2fZbxG
X-Google-Smtp-Source: APXvYqyMRxP9qfn7fUhiWA+YNcPdM+cwi8uVGb914fi1pYZoi9N687PzZmLYwJEz06N/bbjHStmItQ==
X-Received: by 2002:a17:902:8a8d:: with SMTP id
	p13mr5405295plo.159.1579467012771; 
	Sun, 19 Jan 2020 12:50:12 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:450d:e003:9142:f492])
	by smtp.gmail.com with ESMTPSA id
	k9sm14701403pjo.19.2020.01.19.12.50.11
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 12:50:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun, 19 Jan 2020 12:50:01 -0800
Message-Id: <2ce57e0b6c51eda6c7d8ae36ebf36ff9044b03f1.1579466920.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579466920.git.akuster808@gmail.com>
References: <cover.1579466920.git.akuster808@gmail.com>
Subject: [zeus 3/8] cpprest: fix cmake installation directory
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
X-List-Received-Date: Sun, 19 Jan 2020 20:50:11 -0000

From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>

This should help reverse-dependencies find the cmake files also in multiarch locations

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2ca15ad3d80172f47b107bb4e346827efa431769)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb
index 53f6469b28..11c8eab553 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/license.txt;md5=a2e15b954769218ff912468eecd6a02f"
 DEPENDS = "openssl websocketpp zlib boost brotli"
 
-EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake -DCPPREST_EXCLUDE_BROTLI=OFF -DWERROR=OFF"
+EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake/cpprestsdk -DCPPREST_EXCLUDE_BROTLI=OFF -DWERROR=OFF"
 
 SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master \
            file://disable-float-tests.patch \
-- 
2.17.1



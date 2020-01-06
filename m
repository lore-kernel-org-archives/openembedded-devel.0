Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E96897F7BC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 09:30:11 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w15so36245001wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 01:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nfpf+nrkiIYu/OOJTIPB+au9QDyH/LVz20rL5h98NYI=;
	b=F1hj5iPtrG8KLz9WeyA26IEt7DamLIKkypFyolZ22p9EFRxFvBIPvMuzdT8R2cXsM6
	6SeSvQULSpW/cIwVFnhAV92qIJGIuMC1WW9qbZTT0qdJzZ+COuqlo9+E16ppDXNVmv8g
	hyztPLls6/8+KNBOJUSikbi57JllYO+QpAXvWk+vywxlX4Ao5pNl6mrH1mnthg8SFyuh
	PfYvepWXiMk2tHqi9SZ68Ev+rjGbG7zcd1tER3CW6gk2nXmQ0xOT0OwMW/FZbMqDvzQA
	yf3TQXQCKxj6Kk/DgBSX6nPLxjhxGlpJAod5ZI7G03BSVHX53dupoyqOpsIa5v2foYy2
	yUDw==
X-Gm-Message-State: APjAAAVbV2DBMHOFsvONa7Ras0mbD5W/NK+Jgg4NlpuYNKoPJAVVekV4
	yBCSyZmcAkuLSatd1U2FOFo8pXTl
X-Google-Smtp-Source: APXvYqxQVHnFjL0n7tjGjERj/wuLKodLWHCIxDV8Cwk0H0g6wc6QgzjjMTeBlnDok/HKIaV38GqHJA==
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr107952846wrm.80.1578303012361; 
	Mon, 06 Jan 2020 01:30:12 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	z3sm71594959wrs.94.2020.01.06.01.30.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 01:30:11 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 09:30:11 +0000
Message-Id: <20200106093011.7155-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200106092229.13686-1-git@andred.net>
References: <20200106092229.13686-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-python][PATCH v2] python3-jsonrpcserver: update to v4.1.0
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
X-List-Received-Date: Mon, 06 Jan 2020 09:30:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: André Draszik <git@andred.net>

---
v2: fix missing newline in recipe at the same time
---
 ...sonrpcserver_4.0.5.bb => python3-jsonrpcserver_4.1.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonrpcserver_4.0.5.bb => python3-jsonrpcserver_4.1.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.0.5.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-jsonrpcserver_4.0.5.bb
rename to meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb
index bf9eb0a1c..7d464b16c 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/bcb/jsonrpcserver"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c89120516900f96f4c60d35fdc4c3f15"
 
-SRC_URI[md5sum] = "d41e9f6b310cb29b0d8f213ff9d57567"
-SRC_URI[sha256sum] = "240c517f49b0fdd3bfa428c9a7cc581126a0c43eca60d29762da124017d9d9f4"
+SRC_URI[md5sum] = "c1cc652bdeb04b8ce3ad962fbab34daf"
+SRC_URI[sha256sum] = "3a35c0ef21174ca98f995f99688cebadda97053785833fbb31ec862d6b157f6d"
 
 inherit pypi setuptools3
 
@@ -20,4 +20,4 @@ RDEPENDS_${PN} += "\
     python3-typing \
 "
 
-BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
+BBCLASSEXTEND = "native nativesdk"
-- 
2.23.0.rc1



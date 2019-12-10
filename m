Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6E3E67F8C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 17:06:23 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id d5so2506249wmb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 09:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GF9oVoG9W6UKnpd07tMFtjZvaW55mLMFwGd2NZUvAGk=;
	b=QoN6Ik/qIZyfWTG+/7EL1u8jjQ5Zcq+TI3r1F6hKk/BBlRrFpt8ImHpETlUVPQTrJn
	rYQf/tbo62Dl9dPw2eSvKvrc1AuQvrUZF8nnoX3lrezybkT0sJwJZeYL60CImdgJjYzv
	LQnBTfYBfmJUA69s3qydyVrYUO7WYCCy9fRvZE/6aYonR8cbB7EMNj1JHU0B0mrJ18W0
	sd5vhHyFb+VpcQ8FoGr5P0nNfBf3q1tXtW3iIgDivY3mIs6G47nOZfUSEyG4+L5fD7kY
	LK5rl3cUl9TApq36eS/6ThgpDGLoUWLHJ91V39RCwocm7VSXOOJaZksUY2QccewvZiwR
	gUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GF9oVoG9W6UKnpd07tMFtjZvaW55mLMFwGd2NZUvAGk=;
	b=ZXvHaym48fpMfVvYP6vgtSpSiRQ7/ncgtS1MWJwWc4OeH1lEogDt/b3DxP06bRPCI7
	maaOjUfowWI8CtfuWslzZUvpNVfryU4vkWDuZBA4i+K7nH7agcnKQkliCkftzqqOyQlE
	zA5cjQvXnC2r9v9I53JIbcS0eh5QjQPGEKHvVMIXz6QBl0NhKh4XY/sD1J9ym7XdzSfo
	W8YD50nERbugJheQRh5ORoprEVjmjs+boEPP8QUyxq8GfDc/gpsTtORLC7SBHpKIvrHo
	+dRIxtvTDDHFdsB3S2XgawvgVtH+daC44QLPJuwrMGRMsk2NArD/+lQrKQO8vkSjwFL1
	ViOg==
X-Gm-Message-State: APjAAAVwi/LHIA2YJUfrvRQSafaClZAPMqf55RmubaBSK/XDFY8WoKux
	LbcBoEfOwIq0XCgBgpqewebe/CWM7j8=
X-Google-Smtp-Source: APXvYqzxRH1zqhrxLIgeW285YJZxZ7n8YIfW+OowQii42IBPmzjbnyxHD+mEfPZk1YGvEhMxQ/7eew==
X-Received: by 2002:a1c:23ca:: with SMTP id j193mr6019140wmj.83.1575997583954; 
	Tue, 10 Dec 2019 09:06:23 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q3sm3998443wrn.33.2019.12.10.09.06.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 09:06:23 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Dec 2019 17:06:15 +0000
Message-Id: <20191210170618.29764-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210170618.29764-1-ross.burton@intel.com>
References: <20191210170618.29764-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH][meta-python 2/5] python-m2crypto: don't use relative paths
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
X-List-Received-Date: Tue, 10 Dec 2019 17:06:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-python/recipes-devtools/python/python-m2crypto.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc b/meta-python/recipes-devtools/python/python-m2crypto.inc
index a36ab8a7fa..5f5444f37e 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto.inc
+++ b/meta-python/recipes-devtools/python/python-m2crypto.inc
@@ -32,7 +32,7 @@ export SWIG_FEATURES
 #
 do_configure_prepend() {
     ${CPP} -dM - < /dev/null | grep -v '__\(STDC\|REGISTER_PREFIX\|GNUC\|STDC_HOSTED\)__' \
-    | sed 's/^\(#define \([^ ]*\) .*\)$/#undef \2\n\1/' > SWIG/gcc_macros.h
+    | sed 's/^\(#define \([^ ]*\) .*\)$/#undef \2\n\1/' > ${S}/SWIG/gcc_macros.h
 
     if [ "${SITEINFO_BITS}" = "64" ];then
         bit="64"
@@ -42,11 +42,11 @@ do_configure_prepend() {
 
     if [ -e ${STAGING_INCDIR}/openssl/opensslconf-${bit}.h ] ;then
         for i in SWIG/_ec.i SWIG/_evp.i; do
-            sed -i -e "s/opensslconf.*\./opensslconf-${bit}\./" "$i"
+            sed -i -e "s/opensslconf.*\./opensslconf-${bit}\./" "${S}/$i"
         done
     elif [ -e ${STAGING_INCDIR}/openssl/opensslconf-n${bit}.h ] ;then
         for i in SWIG/_ec.i SWIG/_evp.i; do
-            sed -i -e "s/opensslconf.*\./opensslconf-n${bit}\./" "$i"
+            sed -i -e "s/opensslconf.*\./opensslconf-n${bit}\./" "${S}/$i"
         done
     fi
 }
-- 
2.20.1



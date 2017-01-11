Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id E8EEE600E2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 14:29:27 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id r144so30186230wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 06:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=1jVVXGDOtQ+HCSoK166bBrNf6mt5T8B5tTcnWN7WYYQ=;
	b=rjFUKcNKtllA8HDVLa4bvBkZnjrlpZtzvFDa+1KO7gqAa3BGBBdYZMNGVC2v1ts1HG
	GV6ps4LYvskFpi7g5CescdUo5iPT5SmVVQ9yCA8JS0VzOt6BwhNVfLVYgEqU/cErzPqu
	zJHHTxhs3N5Yjm2UUjqXZcCR/qfVPfe7mqiaDHMrLjo6hY7ifaw/951GJS0bQJhFkK5X
	+RfG9neR0tNxWuHJKRNSVy4yeWlT2HPY95x5RBmO5o1R0qPdAeTm38PCK8+xo3pIW45i
	QSvf8xNoSeHSOdqYNn17QKwHhdV8pq90kqrH+qSdxpEP7GzMLd5apEx2be28eQa26nk/
	FafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1jVVXGDOtQ+HCSoK166bBrNf6mt5T8B5tTcnWN7WYYQ=;
	b=gNIq5x3KF23tCFBpIpRSxnCaQ5rRQ0B0m9ZgxohCe7ZxLZP/7taXgDhNoxO71WxmPP
	Vli9Qr2KoaHPNOuaFM3zJrqMSE/M8yeslQmon5i3j138rVzE8BPU+L/Y/55RF70gRnlt
	mrEb9ob37wPC5WJsbqcauAaFm4VEydrZBTaibCEiJDEpaXOY8EfIEdS5Pdd09v+8S0fN
	eLZWm0xHBbfOJoc1PMnANALR9uNdhUGYqZZlFcbW7Yzhvu4YfnjF73EGvbqC7kYmhncI
	RaYo9849OaRk5hJ20q14MtO5KVBh9dRLPe7ExjczN2xPaeD4BTQQPQ6jSVNmcs95djGE
	BoTw==
X-Gm-Message-State: AIkVDXKBIS9O9bdE2+jXptvpW1NxDa0Qdqha4C+vHUd8/qZgJ6eOUqmxq1ZYAnSencXCFnff
X-Received: by 10.28.147.147 with SMTP id v141mr3640216wmd.110.1484144967987; 
	Wed, 11 Jan 2017 06:29:27 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id y4sm8843713wjp.0.2017.01.11.06.29.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Jan 2017 06:29:27 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Jan 2017 15:24:58 +0100
Message-Id: <1484144698-21339-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] jsoncpp: upgrade to 1.8.0
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
X-List-Received-Date: Wed, 11 Jan 2017 14:29:29 -0000

Upgraded jsoncpp to version 1.8.0 and changed home page to the new one.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../jsoncpp/{jsoncpp_1.7.7.bb => jsoncpp_1.8.0.bb}                | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.7.7.bb => jsoncpp_1.8.0.bb} (77%)

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.7.7.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.0.bb
similarity index 77%
rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.7.7.bb
rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.0.bb
index 17947e3..fe6ae24 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.7.7.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.0.bb
@@ -4,18 +4,18 @@ DESCRIPTION = "Jsoncpp is an implementation of a JSON (http://json.org) reader \
                lightweight data-interchange format. It is easy for humans to \
                read and write. It is easy for machines to parse and generate."
 
-HOMEPAGE = "http://sourceforge.net/projects/jsoncpp/"
+HOMEPAGE = "https://github.com/open-source-parsers/jsoncpp"
 
 SECTION = "libs"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c56ee55c03a55f8105b969d8270632ce"
 
-SRCREV = "d8cd848ede1071a25846cd90b4fddf269d868ff1"
-SRC_URI = "git://github.com/open-source-parsers/jsoncpp \
-"
+SRCREV = "f700fe455940d4d325c088b9174a173e130e0fa8"
+SRC_URI = "git://github.com/open-source-parsers/jsoncpp"
 
 S = "${WORKDIR}/git"
+
 inherit cmake
 
 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DJSONCPP_WITH_TESTS=OFF"
-- 
2.7.4



Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.1842.1621647341984219865
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 18:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CxS63YmA;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id lg14so32993821ejb.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 18:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qMB44/04+HS2yoRRV6SbZK0scZNLS/lm1z0AUdMVrW0=;
        b=CxS63YmAi8Uf5hfvGoOLhlfXJOHrbK2qsnwGoYWq6KOWVQREZ+T+GvAPWd6f0FkAnU
         OBgttuO3YdEjaT1pPVX3QJ5r9qD6YihBY+vcRu4KvKfBiziPcpZtuzzbVVYuwDk/EvwC
         /pkszNKi0AwHhNiE2h94Uk+xQJ6/3zv79RCl6TtacJw/EH55h+6zUABkuWqCNyw/ijCL
         dWEYxqt+EYRXpawFEy/uqG9X/L+zjALWGI8JSSt6Xsk2NqQF84QLZB5YozZNONkiouum
         f7FDsGypdkuI6IY4I8z8fDPYNbCSnTQ/4/Z0G1G3QSo5y6V5uF1DJ4MnVj/lVp6J7VS/
         UJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qMB44/04+HS2yoRRV6SbZK0scZNLS/lm1z0AUdMVrW0=;
        b=tRC09jtHsQBN43NdSIiol44o8a7ne9G60rWJ/uOLFjAKJtgxe7zPXICgVkF8sLqw1O
         0hhRim6U+ubOOyBgcH09CRS7rc9GYAvUzE1Ws/yqLfxlHUIoR6UpBb5hJhVfnaLTvn4x
         6lW1gW9v4CZ9WN06Hnv+t5EpryJCQ6ISD8AyU2b3N962NJWZ+6xqmaG8HoSNTmTjv0e7
         aKZsTwJNJ31gt7pJhbYnC1ACgGpc+EyZ+Xs0w3MqbU10L4jtn8pVHywsUkPZJE/1dJI1
         b/mzSeFlwPXoYbMbGrg44jqEXwMNFZVOuebPVkos02nbuOlWlX5dBFh1xJWerOMKgXlO
         f+2Q==
X-Gm-Message-State: AOAM530fAe1csDklyZil9K/gs6A+s+BRrZBseqm7oYwBA/3NMtciHynO
	UOVcXLA1i/8uRV440+GBD9c4gWt+/LA=
X-Google-Smtp-Source: ABdhPJw0B25JqJT/1B/Se+fV/MKmH0dKK4fNP2R5cB1dHOsssiSd9VYIhCx9uuXz/5/jWe3YTD2+7w==
X-Received: by 2002:a17:906:e0d0:: with SMTP id gl16mr12937177ejb.509.1621647340646;
        Fri, 21 May 2021 18:35:40 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b69456ae2a4ae47bbb1.dip0.t-ipconnect.de. [2003:f0:7f1a:3b69:456a:e2a4:ae47:bbb1])
        by smtp.gmail.com with ESMTPSA id p9sm5361337edu.79.2021.05.21.18.35.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 18:35:40 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 13/17] protobuf-c: upgrade 1.3.3 -> 1.4.0
Date: Sat, 22 May 2021 03:35:17 +0200
Message-Id: <20210522013521.588774-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522013521.588774-1-schnitzeltony@gmail.com>
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../protobuf-c/0001-avoid-race-condition.patch         | 10 +++++-----
 .../{protobuf-c_1.3.3.bb => protobuf-c_1.4.0.bb}       |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf-c_1.3.3.bb => protobuf-c_1.4.0.bb} (96%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
index 4fc7703d8..17fa14092 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
@@ -20,17 +20,17 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index b0cb065..1608ae0 100644
+index c7339ef..882756d 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -156,6 +156,7 @@ noinst_PROGRAMS += \
- t_generated_code2_cxx_generate_packed_data_SOURCES = \
+@@ -166,6 +166,7 @@ t_generated_code2_cxx_generate_packed_data_SOURCES = \
  	t/generated-code2/cxx-generate-packed-data.cc \
- 	t/test-full.pb.cc
+ 	t/test-full.pb.cc \
+ 	protobuf-c/protobuf-c.pb.cc
 +t/generated-code2/cxx-generate-packed-data.cc: t/test-full.pb.h
  $(t_generated_code2_cxx_generate_packed_data_OBJECTS): t/test-full.pb.h
  t_generated_code2_cxx_generate_packed_data_CXXFLAGS = \
  	$(AM_CXXFLAGS) \
 -- 
-2.17.1
+2.31.1
 
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
similarity index 96%
rename from meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
index 6fef0bed2..85172047a 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cb901168715f4782a2b06c3ddaefa558"
 
 DEPENDS = "protobuf-native protobuf"
 
-SRCREV = "f20a3fa131c275a0e795d99a28f94b4dbbb5af26"
+SRCREV = "f224ab2eeb648a818eb20687d7150a285442c907"
 
 SRC_URI = "git://github.com/protobuf-c/protobuf-c.git \
            file://0001-avoid-race-condition.patch \
-- 
2.31.1


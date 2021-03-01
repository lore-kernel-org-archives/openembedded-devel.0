Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web08.153.1614638070595166923
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 14:34:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ltXjN6P2;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id x29so4302703pgk.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Mar 2021 14:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YDOu5Q2Vhw8qFSRm5QKcpEU3DsqvvbQl9IMIChWQA3Q=;
        b=ltXjN6P25Bat/CoBgBuP7Gd5gfrnOhmr582CPY66+Eyhmu4AlvCi/fp+50SE4oEC77
         0yYpsLi/fmcYQmjYbnXFBtZ+ymCk6vkI3g/6+e6aERQYUMwJW5cB2S7iKNB2/ZuQDvxy
         2sZDbf2v6iQF14lCmiV+5LwP7fapJNFQ1+jaZJ8tZUrMgdmjkjbUAttYo6nZm+wPT+Er
         JsJrCG3lPZ7JRG0QKgLFQuiwNLn6R3icRYvM0egeVkbLvFmPBuqqPl+1KRRIyVkPLzjh
         ueAz/Qie/Uj+mGdz+PV9PZa3VPTF2bdEoE0QSThXC7Ouu0BWlngvG/Zk4Zz+FTIIMbqX
         UMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YDOu5Q2Vhw8qFSRm5QKcpEU3DsqvvbQl9IMIChWQA3Q=;
        b=JdMuVfrs1+ueAETIcS2ourTfDDC5XIQzlCfwa4Bl/U+blSPfNpSq/fcCjrAjRL2ysn
         ajZnuglFpBmbvz5awEBEwv6c3Z1RQq8TN7dap6orCS5YWnFEwWZz/q1N7s0WbbM3t1Gc
         SDAS0Grp51/Dl0BiB5Rzp/Kk0LJ+llwkIySR9pUJqes8Hidle1ovIvBoLUax5v+p/QlC
         ncoQNdKaiLP7pRAL4G7aOFnfNuPENYKHz34n9DIuYq+kjxKoY81GkYvTd840uVYtszX5
         FOLxCIRf+5b7W2HpZ6z7l4D++lhH1inJjCEQGTBuVI1qaSCrXYEKp5HKZfuTCQ6xzmHJ
         rd0A==
X-Gm-Message-State: AOAM533xSo7GJaelacxq9phf5SpusYreQZah4PH3gvUFQZBUa3bYpOvN
	47VN7AUA7gx3dFflKtND/hYLSihxv+zmxg==
X-Google-Smtp-Source: ABdhPJyDVUXY4EpfzmkFroyTcpmqP96GK1A2vE+1nJ+M9/mlXAJ5aZArYA3WuktO6VFR8j1dc2/DmQ==
X-Received: by 2002:a63:4a44:: with SMTP id j4mr15525717pgl.199.1614638069759;
        Mon, 01 Mar 2021 14:34:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id q2sm18698828pfl.158.2021.03.01.14.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 14:34:28 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH 1/2] libauthen-sasl-perl,libhtml-tree-perl: allow PERL_USE_UNSAFE_INC
Date: Mon,  1 Mar 2021 14:34:25 -0800
Message-Id: <20210301223426.1991847-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

latest perl has made it defualt to remove current directory from default
include paths but some modules still depend on this behavior, so let
them use it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb | 2 ++
 meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
index e658a5ff11..c75deb0c3c 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
@@ -21,6 +21,8 @@ S = "${WORKDIR}/Authen-SASL-${PV}"
 
 inherit cpan ptest
 
+export PERL_USE_UNSAFE_INC = "1"
+
 do_install_ptest () {
     cp -r ${B}/t ${D}${PTEST_PATH}
 }
diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
index 56dc19c85a..569ac696f8 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
@@ -21,6 +21,8 @@ S = "${WORKDIR}/HTML-Tree-${PV}"
 
 inherit cpan_build
 
+export PERL_USE_UNSAFE_INC = "1"
+
 DEPENDS += "libmodule-build-perl-native \
 "
 
-- 
2.30.1


Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.9313.1599640975762080102
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=Mz/Qq/S5;
 spf=pass (domain: blade-group.com, ip: 209.85.221.44, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f44.google.com with SMTP id m6so2027771wrn.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2020 01:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bbd94GrZR4VCSF2OzfTvaC3pivCnP2J8dF7XEnK39MM=;
        b=Mz/Qq/S5l3zDxD2pSJaExqBltpUQswv56YW1dRXsmVYeeZuyodPM7TibJSX2wPe+wL
         q3tmG6Njv9hbhvyb3zXXgW9r60UPESrT6mE0/nuv2gifP4yIoSOxpZYMEWbCGoQ4/Cx/
         maUSv1vT3thSyrex/XZgptY7k52cFl3FK1H0/9oHxXRFRPCjf2X5D1iGMNPsxdpGEpil
         NTuV3UfsF8tl/ahybNx5Wa8DiowApKkM2UIasWOsYVyhdP5iAyCQd+qba3wWXWXiVZ2x
         CHdkcKjQODo2TVVACGp6zEVB9xYzFvMMs5fDQE5H7raLEtMzO7XeNWOFelbDglCam54b
         ndcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bbd94GrZR4VCSF2OzfTvaC3pivCnP2J8dF7XEnK39MM=;
        b=D6plNBC1Vds18hXyIS+dgmhbPgQBxDbysXt1azAPKTKd7c9IiKTlrCEdeBZgEUOS7A
         jcjuRniSkuYcVB/LRE+x7V10DpoNdV5EWx5Zyft02YPJ0Bm5GJSXLOz6Z3a5B1uFf5Dk
         HmOzRZLPFke1fBY0IMJ42hhPlN+xjDYS9Aiv/Rcpo0ogFE/N9jQ2oZdUkMsngPcRg1xZ
         R4ZTwPdSzJcNmeK18i4JY154i3UsTVRLIaFvLpnJlYHuvdwVqnXquX2h6rP8T2obLZRa
         yM7Wu9bx12RsVdS3obgSjN/MOdmUp9Khq3wosKs7bkdysKy/CWgnWoLuLA2auOQIGAF2
         sbUg==
X-Gm-Message-State: AOAM530qdQ77AkCJPNZk1oIPW8PQKXT395cDTDlVZTN1J7XtUU4kE8m9
	ALgiIrCqZOOYEy7uWXITAjfiJt0biI/6XO2G
X-Google-Smtp-Source: ABdhPJxrA/JmntYJuy+1PrgzYlexLx5rlXr/iVfAQMjEV2fSlhOEHAkKlgK/06T490w6aX5ofzLzDw==
X-Received: by 2002:a5d:654e:: with SMTP id z14mr2686117wrv.400.1599640973930;
        Wed, 09 Sep 2020 01:42:53 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id o4sm3027825wrv.86.2020.09.09.01.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 01:42:53 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-devel@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [meta-oe][patch 4/4] libcec: split the python example into a separate package
Date: Wed,  9 Sep 2020 10:41:54 +0200
Message-Id: <20200909084154.178795-5-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909084154.178795-1-yann@blade-group.com>
References: <20200909084154.178795-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

It does not provide more functionality than the C-based examples, so
is of little value on a target except for checking the python module
is working.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta-oe/recipes-extended/libcec/libcec_6.0.2.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
index f55801c39..48be1fdac 100644
--- a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
@@ -24,10 +24,11 @@ inherit cmake pkgconfig
 PLATFORM_CMAKE_FLAGS ?= "-DHAVE_LINUX_API=1 -DHAVE_RPI_API=0"
 EXTRA_OECMAKE += "${PLATFORM_CMAKE_FLAGS}"
 
-# Put client examples into a separate package
-PACKAGE_BEFORE_PN += "${PN}-examples"
+# Put client examples into separate packages
+PACKAGE_BEFORE_PN += "${PN}-examples-python ${PN}-examples"
+FILES_${PN}-examples-python = "${bindir}/py*"
 FILES_${PN}-examples = "${bindir}"
-RDEPENDS_${PN}-examples = "python3-${BPN} python3-core"
+RDEPENDS_${PN}-examples-python = "python3-${BPN} python3-core"
 
 # Create the wrapper for python3
 PACKAGES += "python3-${BPN}"
-- 
2.28.0


Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.28678.1590402369694636587
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 May 2020 03:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mM8Y0qlI;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id yc10so19916991ejb.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2020 03:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YeL1VQEAgntHILOhTKTsKu/yLJoKxPBVRanH/jBpJko=;
        b=mM8Y0qlIIoT/g5YxtgRHLje4AiaWjCuX13vXMCir7wpxSLh+Jarkn5NcYi/gg/Rvaj
         sftJTuzUdtPsC++1vqwNmgY+heKiSdz+HAkt8rttC1C3sKVxJGG31BRkjiuHtJQ28mqF
         3Qvt9npHKowUHQtrQ3FrzUHtGxcKENoL3MiKNPmLvyS11jCyxEzZAyrpBQ+mJ979yqBl
         rm6I+qJ11PQHmQbf7lgC2E6rzE5Knz36nST8VneOIeuI09F0RebkozahJxiGV7BkRDSm
         fiE5RiX7pRIpMIPK27/ji3oHcJ3AWb8sc/Wnzgmc+cafbQGm6noH9NNn+9d52anaSvTF
         0xVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YeL1VQEAgntHILOhTKTsKu/yLJoKxPBVRanH/jBpJko=;
        b=KYvmGSg/Ghshryk9u2pW2Pyftgb9yBzqITkk107DyW6GnIyoNnRVsVvpItBEh5Ap8s
         w9oc7XNDkzKvEsKlxKTEVI76N+a5HWAjnWOnd2ACPlwBG2gk/HS8h0OYfkxf362c7xYo
         H82p7KIML3sccVfCZ6BxtLYCSCyAsJ7Ta+wQJ1UpDUCCzAN5b1bzd9AIFkcprH7kpLii
         LfxHbvDG6+s9m14LcK7hF2OSwCM4rz5SV3U6HVY5Q29JOpTsL1medkfLdC+fXIXU7dDx
         iHhoI9fyqeUrku+d91Ih/0CvTvox0Q+YBYoK9pAqK5YijjXWH8PyJrkXeGrKssc5yR54
         Hd0g==
X-Gm-Message-State: AOAM530WHkLOBD0QvQ4sL4eiOlZ5G5tkbnOh7x/ISNyDaaH6zcQDVlX8
	7WftHlc1aJerSweete/LHvmGcaWj
X-Google-Smtp-Source: ABdhPJxnH5S7khl7rkgJ541hczYtpUXyMUaF5HZqp1A3cuqjFR+P41g26fkEZel1/fUNez/ThELuBQ==
X-Received: by 2002:a17:906:480f:: with SMTP id w15mr17767502ejq.381.1590402367768;
        Mon, 25 May 2020 03:26:07 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r9sm15639614edg.13.2020.05.25.03.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 03:26:06 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] irssi: package libirc_proxy.a in PN-staticdev
Date: Mon, 25 May 2020 12:26:04 +0200
Message-Id: <20200525102604.32209-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fixes:
  ERROR: irssi-1.0.4-r0 do_package_qa: QA Issue:
  non -staticdev package contains static .a library: irssi path '/work/core2-64-oe-linux/irssi/1.0.4-r0/packages-split/irssi/usr/lib/irssi/modules/libirc_proxy.a' [staticdev]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/irssi/irssi_1.2.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/irssi/irssi_1.2.2.bb b/meta-oe/recipes-connectivity/irssi/irssi_1.2.2.bb
index da5403e5c8..1c5a912f27 100644
--- a/meta-oe/recipes-connectivity/irssi/irssi_1.2.2.bb
+++ b/meta-oe/recipes-connectivity/irssi/irssi_1.2.2.bb
@@ -18,3 +18,5 @@ EXTRA_OECONF += "--with-textui \
                  --with-bot \
                  --with-perl=no \
                  --enable-true-color"
+
+FILES_${PN}-staticdev += "${libdir}/${BPN}/modules/*.a"
-- 
2.25.1


Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54720C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 22:32:35 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.18150.1700519548721826350
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Nov 2023 14:32:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=GJTdZ5Sf;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3316ad2bee5so2225858f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 14:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700519546; x=1701124346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hnx78fG0jBsGJWCCSshCUD/HWJkJcKmTFE53hRSBq4k=;
        b=GJTdZ5SfqsB36GGFF1IM40qi/pPiLYcbChDmDI9EcHqbOFZAjHZiM3SYWvdBixtEJB
         OoRiVqYK9mP6/gMErLmsT+3zk0QKM1v1n6R5DRjobylPGIU05t0dtCBgSsis7uDaiXLA
         bzuyjJLD6KL4yW+JeutVap2Fo8u03MCoeXZuxnf+UywOeKL9AK9FT/rdXdcAI6XaAzC3
         RF06tZPPsmK1kv64bh8NwMW7/SZevzL+wl/HdsRNDYEOlDapXPP3Ii9x64IcGNicmZcL
         W008tRDjSuClX6pozGGQ6KZLs37OaNw9/fJ274IGH1+pNIwbsPP0JeJSeks52z00s/8N
         5nkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700519546; x=1701124346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hnx78fG0jBsGJWCCSshCUD/HWJkJcKmTFE53hRSBq4k=;
        b=VIzky/hgpFgXHiCY14tXg+Pe2YW7nLkTfmpNyzJgI7Y3wadyH+xfJ5iUe4uuc+pxYH
         GtbQbSKcn1uza4XuKlvkAUOcpGDhVD8YfrvqgenIcGQn2dhpMDVr7lqojvyXUe7iogHz
         iIDSGxfQm2e6FknLc1I1z0ibtrLFccBpJjZMrtcF9Eo6TW2YpBUl/5eg9MtasWTyXxtE
         SM2euznKJfPojWzNS/QWjUIlwtvNgOP5bdGrECVjrPQEyGu53U6WK2HNBk8eHA+tmjn2
         Ptu5s57Nsfz8uP9JQZYgc8B0JynIME+jVgaixrXE1tLwQ9yPSlFPqYJ2vAChqe5jB1MC
         idFQ==
X-Gm-Message-State: AOJu0YxhTVABtYfhE5nQhUYr7ecDUER8O2Eqoqv9DjvZGyLbu7MrCUA9
	V/YNdgr19S5wEY82Smv4QHuR3SASHKxe1p3VgsM=
X-Google-Smtp-Source: AGHT+IG2YSDTDWDhpq8c8FhSG5/pJ4Q6QzeS0NYxaNd7eJEzB/xYoqNJg/85WfP7Wqe+lsrYTGG43w==
X-Received: by 2002:a5d:63c7:0:b0:331:8e29:44e3 with SMTP id c7-20020a5d63c7000000b003318e2944e3mr4283439wrw.58.1700519546464;
        Mon, 20 Nov 2023 14:32:26 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id o5-20020a5d4745000000b0031ad5fb5a0fsm12470704wrs.58.2023.11.20.14.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 14:32:25 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][dunfell][PATCH 3/3] meta-python: Drop broken BBCLASSEXTEND variants
Date: Mon, 20 Nov 2023 23:32:18 +0100
Message-Id: <20231120223218.2397154-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231120223218.2397154-1-yoann.congal@smile.fr>
References: <20231120223218.2397154-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 22:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106971

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The command "bitbake universe -c fetch" currently throws a ton of warnings
as there are many 'impossible' dependencies.

In some cases these variants may never have worked and were just added by copy
and paste of recipes. In some cases they once clearly did work but became
broken somewhere along the way. Users may also be carrying local bbappend files
which add further BBCLASSEXTEND.

Having universe fetch work without warnings is desireable so clean up the broken
variants. Anyone actually needing something dropped here can propose adding it
and the correct functional dependencies back quite easily. This also then
ensures we're not carrying or fixing things nobody uses.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d4aa17dc436beb96a804860bc6d18cf72283709e)
Backport:
* Adapted paths to follow PV changes
* Adapted modified recipes to the ones generating warnings
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-python/recipes-devtools/python/python-pint.inc             | 2 --
 meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb      | 2 --
 meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb | 2 --
 meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb     | 2 --
 meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb   | 2 --
 .../python/python3-robotframework-seriallibrary_0.3.1.bb        | 2 --
 6 files changed, 12 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-pint.inc b/meta-python/recipes-devtools/python/python-pint.inc
index d022c41a5..5d880a039 100644
--- a/meta-python/recipes-devtools/python/python-pint.inc
+++ b/meta-python/recipes-devtools/python/python-pint.inc
@@ -14,8 +14,6 @@ SRC_URI[sha256sum] = "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359
 
 DEPENDS += "python3-setuptools-scm-native"
 
-BBCLASSEXTEND = "native nativesdk"
-
 SRC_URI += " \
 	file://run-ptest \
 "
diff --git a/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb b/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
index 803ca4a40..24e38cfb4 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
@@ -16,5 +16,3 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-pyperclip \
     ${PYTHON_PN}-wcwidth \
 "
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb
index 33f0efe84..57d38e60b 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb
@@ -34,5 +34,3 @@ RDEPENDS_${PN} = "\
     python3-pytz \
     python3-pillow \
 "
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb b/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
index 35330cac6..eda0bd57d 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
@@ -35,5 +35,3 @@ CVE_PRODUCT = "pillow"
 S = "${WORKDIR}/git"
 
 RPROVIDES_${PN} += "python3-imaging"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb b/meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb
index c13882240..6636fda83 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb
@@ -12,5 +12,3 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-prettytable \
     ${PYTHON_PN}-cmd2 \
     ${PYTHON_PN}-pyparsing"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
index b6de42f7c..60a26f58b 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
@@ -16,5 +16,3 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-pyserial \
     ${PYTHON_PN}-robotframework \
 "
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2



Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.16668.1587071964639954473
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 14:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=YAIr1t0q;
 spf=pass (domain: broadcom.com, ip: 209.85.221.47, mailfrom: abhishek.shah@broadcom.com)
Received: by mail-wr1-f47.google.com with SMTP id k1so291406wrx.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2020 14:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=2rCE/QW7d4xHQPh5e/Ry9CL46Rg3OC2BWA/9oTZ5WEc=;
        b=YAIr1t0qsfnuZxbYmZrHP+rLmU7HiwT8YDzJ6imCBUDytqQf15q84I0YA+w2chMcIM
         O8Ju1vc5o9ZG9VMPvOMw2AQdyr669dm72RiDkI1vCvOq8QnzoRHZfJ69kExm6O+MCpCa
         PbqtmdgmIzpVJg4XdZaOx2eCoI+qIskoTrEqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2rCE/QW7d4xHQPh5e/Ry9CL46Rg3OC2BWA/9oTZ5WEc=;
        b=k6uN4KHvHdkyS3dC6VMrz7UWQf4ebsWXNA0/tiQJVIG+VXbfaId02IsC1Kpx5uUrGf
         bUA3aRtA32VaZEXTpZCj3d4IM3h9bKyv2uIniKMqubcjdD7+0IVL/jBjAeRNA7BQ1ugN
         9WCb7rJA+oGnqekEj9HsNTgnoHQ1mARmfg6GKtS5yXtkiSaYf+FNDsh3sDBGdoKIQbpZ
         szXs/Ok8f7pM0wV+GsslJpws2xtMdlL180ejWZ2+vC2NB/shMoDvYnywxJ9CH3WPhKKq
         IEzCMvmwRao+U/N0whg0qILRUYdsBXanJsP+YHRSl7TE0nI0vjxWJMOGmRydo7+pDue2
         sW5Q==
X-Gm-Message-State: AGi0PuZAUeksbtrTqN8XIAKfsf5xzacuDRsXjxYY1pJtFwExhIEEAepV
	WXm/9SkxuTtXttmvHTwpQRye+XQ3GT8hKFDF2bydgmaprvBT+tz09OcHEL5PtV8mu59VmMdMVcb
	HH28NTauPpPrh9ziJBW26ubMIFEwCxGvtoUd2YVX5CknRSc7TzbWcmickhp+LjiLv10r9AbnCm4
	nkGuiSf8ZQmfT25RYl0E1528/YxQ==
X-Google-Smtp-Source: APiQypLpCguzTUIdTFAfgVHW8cjZ1UowdMLEq+fTtnExC8z7WoFLE6JmhZxixkKs4VFfDG4jRLlbGw==
X-Received: by 2002:a5d:6582:: with SMTP id q2mr155791wru.343.1587071962713;
        Thu, 16 Apr 2020 14:19:22 -0700 (PDT)
Return-Path: <abhishek.shah@broadcom.com>
Received: from ashah1-OptiPlex-7010.ibn.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id x23sm5165460wmj.6.2020.04.16.14.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 14:19:22 -0700 (PDT)
From: "Abhishek Shah" <abhishek.shah@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Cc: Abhishek Shah <abhishek.shah@broadcom.com>
Subject: [meta-python][PATCH v3 1/2] python-dateutil: Fix RDEPENDS
Date: Fri, 17 Apr 2020 02:49:09 +0530
Message-Id: <20200416211910.27047-1-abhishek.shah@broadcom.com>
X-Mailer: git-send-email 2.17.1

dateutil package has runtime dependency on "six" package
for native version as well, as shown in error log below:

|     File "poky/build/tmp/work/*/recipe-sysroot-native/usr/lib/python3.8/
		site-packages/pykwalify/core.py", line 25, in <module>
|       from dateutil.parser import parse
|     File "poky/build/tmp/work/*/recipe-sysroot-native/usr/lib/python3.8/
		site-packages/dateutil/parser/__init__.py", line 2, in <module>
|       from ._parser import parse, parser, parserinfo, ParserError
|     File "poky/build/tmp/work/*/recipe-sysroot-native/usr/lib/python3.8/
		site-packages/dateutil/parser/_parser.py", line 42, in <module>
|       import six
|
|   ModuleNotFoundError: No module named 'six'

Other packges specified under RDEPENDS_${PN}_class-target as well
do not seem specific just to class-target.
So, move them all under RDEPENDS_${PN}.

Signed-off-by: Abhishek Shah <abhishek.shah@broadcom.com>

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index 3c89cd62c..e70e963e9 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -15,7 +15,7 @@ FILES_${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-RDEPENDS_${PN}_class-target = "\
+RDEPENDS_${PN} = "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-six \
-- 
2.17.1


Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web12.707.1586894785128806256
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 13:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=bq3NlTRC;
 spf=pass (domain: broadcom.com, ip: 209.85.166.182, mailfrom: jonathan.richardson@broadcom.com)
Received: by mail-il1-f182.google.com with SMTP id f82so999977ilh.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 13:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:references:in-reply-to:mime-version:thread-index:date
         :message-id:subject:to;
        bh=NG/vs2lgDLLqbKTVSCDwt5QriisJ93EUZF5MRKx8aCQ=;
        b=bq3NlTRC9FJorYjcm71i3lqQQwobUIwErsa9wX+dOaXhoW3xZI0gjtvt6CPfT42fPO
         j47FvAQGptQ09YHLCU41z46f7L3U7HMzlsCMKtVjRmzrkOBOrEGey3lEkYgRga/oK7Gp
         vgkAvfddZhFvDmq1K5WDBZRSx3j++Gq/Tt8xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:references:in-reply-to:mime-version
         :thread-index:date:message-id:subject:to;
        bh=NG/vs2lgDLLqbKTVSCDwt5QriisJ93EUZF5MRKx8aCQ=;
        b=eTlRwvOW/4LxS1QU4Z/Q3WuFvrwYS6GDYYeD2hWGOyl4Xl8xeIwYfwaef8XvSCzGjM
         DpCkugVlTbKDyty01t9C4t9zHWdRdu2F3D6XTY6YGfd9edVJYQZ7nQ5hxYEOFOvo/AMz
         WL/UgY9m3UhIUBxtaXeGWQriPCkBj0lsgrg/ZYqvISiPu7QI/q6jytzToxWyINOmoPdd
         QO/6OHcM6AfPTByJhIvQJYxtNFnTeIRMxFOB4OxG6bKZhWOvHBOG88cXqawknN0OCkN8
         Dyh9hJZL/SW+yFnt7Lk1UXbIiQ+ZRtxm+yr4q0FhO4mL0gEFB6ASdmzbuhEjQYorcMTB
         0/4g==
X-Gm-Message-State: AGi0PubmrRdzeZFJXnVjerrBPIhnpRB/oB6DnQnqIkSUaiUTcKSG3Kid
	cRlRF8M0DO938CITYraAwr2a0w7Mbd+SD91k4Moljw==
X-Google-Smtp-Source: APiQypLvPIG5bney9XRtTcSjTzzuxk3NXBkg0V6opwZNE3lqpa1LGPKDBuTbdAUdtf83+LwRR4udb91TOtmn9VSrcz4=
X-Received: by 2002:a05:6e02:c94:: with SMTP id b20mr2131094ile.39.1586894784559;
 Tue, 14 Apr 2020 13:06:24 -0700 (PDT)
From: "Jonathan Richardson" <jonathan.richardson@broadcom.com>
References: <20200414185217.24503-1-abhishek.shah@broadcom.com>
In-Reply-To: <20200414185217.24503-1-abhishek.shah@broadcom.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQH2CRpEPaFUZhpcm9qm7caE3L3Gl6g5HerQ
Date: Tue, 14 Apr 2020 13:06:23 -0700
Message-ID: <7fe36226fc767ae1af8e65448319d78c@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2 1/2] python-dateutil: Add six package as runtime dependency
To: abhishek.shah@broadcom.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

-----Original Message-----
From: openembedded-devel@lists.openembedded.org
[mailto:openembedded-devel@lists.openembedded.org] On Behalf Of Abhishek
Shah via lists.openembedded.org
Sent: Tuesday, April 14, 2020 11:52 AM
To: openembedded-devel@lists.openembedded.org
Cc: Abhishek Shah
Subject: [oe] [meta-python][PATCH v2 1/2] python-dateutil: Add six package
as runtime dependency

dateutil package has runtime dependency on "six" package for native version
as well, as shown in error log below, fix the same:

|     File
| "poky/build/tmp/work/*/recipe-sysroot-native/usr/lib/python3.8/
		site-packages/pykwalify/core.py", line 25, in <module>
|       from dateutil.parser import parse
|     File
| "poky/build/tmp/work/*/recipe-sysroot-native/usr/lib/python3.8/
		site-packages/dateutil/parser/__init__.py", line 2, in <module>
|       from ._parser import parse, parser, parserinfo, ParserError
|     File
| "poky/build/tmp/work/*/recipe-sysroot-native/usr/lib/python3.8/
		site-packages/dateutil/parser/_parser.py", line 42, in <module>
|       import six
|
|   ModuleNotFoundError: No module named 'six'

Signed-off-by: Abhishek Shah <abhishek.shah@broadcom.com>

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc
b/meta-python/recipes-devtools/python/python-dateutil.inc
index 3c89cd62c..40f406f50 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -15,10 +15,13 @@ FILES_${PN}-zoneinfo =
"${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"

 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"

+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-six \
+"
+
 RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-six \
     ${PYTHON_PN}-stringold \
 "

These should probably all be RDEPENDS instead of class-target specific?

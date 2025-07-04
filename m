Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5E7C8303D
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 13:31:57 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.12529.1751635908841444564
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jul 2025 06:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mGgJDZX/;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so161934066b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1751635907; x=1752240707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smfrM0csKqqXw4TuN1rw5PWp7C/muTywjJJEr5+LPYo=;
        b=mGgJDZX/6b1MvKtufgzAIiUAkDGkKXXBMmVoEe2qpFkFe5GyvZtgHkgGWYK+F9FPEc
         YfC3pKFpDpcZ27uaN5Dy51ISv1JIJ2g+J9yZ20atBk8FeVtdARR9vyU6yWqCwN4e3eGY
         EtCGEKZoTTL3RmV2E09jcfBHNiG/nAjHZoyA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751635907; x=1752240707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smfrM0csKqqXw4TuN1rw5PWp7C/muTywjJJEr5+LPYo=;
        b=PW8ZZdWl3QfYwIPOkdeWc/AxtGabUqP+BbokyVfsLVG5rtct9GDdzj9Ac+EMDpi0PI
         S8vyN13+ZfVm70fkkeIJKygbWcw8p0CwBmgesh2FuSZFM4WSa6JcuPiNzBZ66gxvKQob
         /lhmiiPoOSptZaoSP0+8MGHk0z18C6rIT+yquy+7kWBTpQAWTb3R33/ydYh1m81v16dH
         +0HxFQnsn8Yk2XtFdzpi9LvzXCauzTezWbvGJMFPW2qsvTVr1ncBCENYrDoVCHNgqWJA
         Mwg/X71QP2L7gzSjZrB2u5BV/XbRjy55PffW2TtvjgMecEYEStEHOhR5HS3Y/GRju0FD
         VF+Q==
X-Gm-Message-State: AOJu0YzOpFUMYc24w7KtBSvr+4DuKpwR7xdZ4wjKxPS8sqi1xlhQTH2r
	PIc1iGHh1nSuZhTqFiaO1OV0CkfCXyTFwZF2oiSDhjINJvp7NaZ8YKWgRDH0YDcetHgdNbKFpFU
	kaldI
X-Gm-Gg: ASbGncsoY9TKcIjXx9VawXU1M2ZBCsAkhbpppDfx0Pyiy5uqvOYo1IziuMGZOcbgB/C
	rNA7dhCGaoODXqI67wyB/Z37DIcMJvTp0cyRqKFVEF6WTYxtFhsQrOKmnPhGYi6z3hWOp1jAcJ1
	mTwQ5Zt/xwQdz3v2pJXDUdGXUWiokypfAyvf2caHKEYCJ2nbB/pDD15qQeRJH0SWVJnj18kE/Jc
	3/LHXut9o5kOjbiNWBMKOQHTnEGoomHJ75Gnt03WTg5wYjf4MpQ8rmIRx0m6jOdbqhjDm+V+8sG
	rty51rpZCTgzS1nD6epJEzHX+m4k+cGJSNa6G5ljtqPFmXAy6V09KdFt6l4bimkBzesaxz8jaNh
	eYt9aSWfyUV4=
X-Google-Smtp-Source: AGHT+IGlBe9YOTHdpDrVDLHoZ4Sz37Ruj+Vr8Qt1VVWb/t6pu3mQpt0OvV3FfWHkiQhpJDE0HI8RMg==
X-Received: by 2002:a17:907:7290:b0:ae3:f524:bd2 with SMTP id a640c23a62f3a-ae3fe64e7b4mr181823766b.10.1751635906755;
        Fri, 04 Jul 2025 06:31:46 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d93ffsm174389966b.36.2025.07.04.06.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:31:46 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-rich-argparse: Add recipe
Date: Fri,  4 Jul 2025 16:31:41 +0300
Message-Id: <20250704133142.712380-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704133142.712380-1-leon.anavi@konsulko.com>
References: <20250704133142.712380-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 13:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118236

Add recipe for release 1.7.1:

- Fix TypeError on nightly builds (Python 3.14.0a7+) due to new
  HelpFormatter arguments. The console parameter is now keyword-only.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-rich-argparse_1.7.1.bb        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-rich-argparse_1.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.1.bb b/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.1.bb
new file mode 100644
index 0000000000..cb07b012b4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A rich help formatter for argparse"
+HOMEPAGE = "https://github.com/hamdanal/rich-argparse"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=06f5c372171ce02f7e6a18f5f57f0b69"
+
+PYPI_PACKAGE = "rich_argparse"
+
+SRC_URI[sha256sum] = "d7a493cde94043e41ea68fb43a74405fa178de981bf7b800f7a3bd02ac5c27be"
+
+inherit pypi python_hatchling
+
+RDEPENDS:${PN} += "\
+	python3-rich \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5



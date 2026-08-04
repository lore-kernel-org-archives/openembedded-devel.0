Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A7DC55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 23:04:19 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28781.1785884652830965608
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 16:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OyvsPttP;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso178148a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 16:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785884652; x=1786489452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5QKqxD1bhCnj5NmnldT3Ha70RIMqXBHhAXhDJtNlZOs=;
        b=OyvsPttPy1Y9wYT9oE3ZM4bTgxlecbvBUxPQevfN5hgewFnIQfpoi7zimMnRXbzDcj
         48e2uP5Glb09PhWHMxtRkfpCCfJQEhClraFLgiE+P3nnj+iOmtGXjCvdbTnlCu8kcFmP
         HrEMIzMxi0ndycjUJ9E76/4GzWveK6Iw+nebMpfj08feHgUZBgl1lZCjAgmGLx8Tq++Q
         U6jsSESVU/vyteQE6X/dOTmXsEP9r5WmFilLywh1+38jPeJ1jIO0b4qWVEZ+Jd4SmwHt
         BVH/6tEXrCSsexhOoSbWmoEVZgtfFYmBMuqB+eiZR7yCCgXCeDaXdWAXInp9BTijC/H5
         FKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785884652; x=1786489452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5QKqxD1bhCnj5NmnldT3Ha70RIMqXBHhAXhDJtNlZOs=;
        b=do0jLFKqaDtsLmtatDUwKCc23q5de7ZpEcUdipxXtBosP8omkn5KY92cgGHYTmCos0
         RXgL7T2wop+eb/L1atpdAphz/l2QynNiP5GZRRFT6Rm5sjmi8PBI0LGjwu4alMRyeaZC
         6gWLLLTmniVJrt2alkvBV+A9iApKQogRxp7g1zXdwu3kzQvVCM5lm8wWmleTrJ50b142
         Vd7cRYp16Ux537me18cTD4f5larkQj0q3QXXVhblmz89S5tRQWs2t47pXEjgNsqfgFPY
         2llfUEbl0mX70a7Kmf37Y3NCrh8zvLik4rzs1sxjnijZbtZpdLK2jtizBQQ0RXiXKe52
         /uow==
X-Gm-Message-State: AOJu0YzhOZaTIS6YDIyNIOPUwCv/imVtHIsoLGagtv/fCJNgQSQCtK88
	hY8Y8NlEUz+vFVjow2s7FGDQUi7yTCB3FOUVTd6pYYeyHHmN4NZfPx0C6k65rGQ+
X-Gm-Gg: AR+sD100K5m/ALW2cutS+CZ4oS20OdSR+iEcGZ7FG2hJl3fdvQrRWWlFN4xtzQLH3lY
	WjnJvFLBnincoVJCYD3NltZ75w0tqvqdJD2qPpQxHTPDLC/nOnjv9TIKs1eoBdJ3X2tr/A4c5dG
	Mai10j2tP78YV+HV5xuGwhSRWJmwV6QcqqzjfevwJbPc6wFqaw2x4223zqcraGiXbrAUI0oBitf
	Q4Gp5cDnyfQU+KR71TyuCc4zEdSIwSGZcZBnM7aI36uZDThiWLS0gYvxKleC2NjWavWJR0ou9Hb
	KRbgoUn+9a117KWyRsDqgXTVV8UhuwFL3w7Me5ndI1X3zMDc8r9l/doiKMbNP9T1N0edQL4u5Gw
	P2Cn2LssYg0k9wAODOidrJCHZ5QuxLjtAgw/3XdoKE3Ifv0fYYmW+EQzBZKv1S5UOsEGOUIxuW0
	KWGKSlkMFZXpRvchtaPcA726f7NLU5oMxnTPfRazZfMZIkDfaVfhYGwI3M5ulWQ7U6EmrecLTRx
	LJ9zfIJSeVq2A==
X-Received: by 2002:a05:6a21:9201:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3cb85dee577mr2287389637.14.1785884652150;
        Tue, 04 Aug 2026 16:04:12 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586777bcfsm13444844eec.21.2026.08.04.16.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 16:04:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 3/4] python3-pandas: upgrade 3.0.4 -> 3.0.5
Date: Wed,  5 Aug 2026 11:03:57 +1200
Message-ID: <20260804230358.365670-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804230358.365670-1-ankur.tyagi85@gmail.com>
References: <20260804230358.365670-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 23:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128787

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://pandas.pydata.org/docs/whatsnew/v3.0.5.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-pandas_3.0.4.bb => python3-pandas_3.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_3.0.4.bb => python3-pandas_3.0.5.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_3.0.4.bb b/meta-python/recipes-devtools/python/python3-pandas_3.0.5.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pandas_3.0.4.bb
rename to meta-python/recipes-devtools/python/python3-pandas_3.0.5.bb
index d837e7d79a..407503277e 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_3.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_3.0.5.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e98642e1210ade884e5254ab18d55b7d"
 
 SRC_URI:append:class-target = " file://0001-BLD-add-option-to-specify-numpy-header-location.patch "
 
-SRC_URI[sha256sum] = "62f6062586d159663825f06e70ef49cd1572d45824cb63a9559f3ffd1d0d2a20"
+SRC_URI[sha256sum] = "dca3734d6ab7c906e6730f0788b0a1dbb9f2467731f9711f77995c8e9d62d712"
 
 CVE_PRODUCT = "pandas"
 


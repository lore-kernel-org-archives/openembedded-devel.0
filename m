Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1ECC54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 11:12:34 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.19920.1709637153082166507
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 03:12:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hCYjkoa0;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-564fd9eea75so710989a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 03:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709637150; x=1710241950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2bLhjPX0QstRR+hnVAiXkNiX7M+vGZTLPN0nkAe0a3Q=;
        b=hCYjkoa0AiQ0pahEYdQv9ggTkIJT9w4j+G7762ayZnvl6dAAo4wXCaDx3x5kQBe0TL
         8K0J/Sb5FUV1frhbZNG4J25+BcwJLK+w3DcPTIazT+II261SDMg15YJxBpfYje7jxB4r
         BEbkkG6yRR1V1uDY/KUi9HIKWQ5I+RvaFcrSMXIJIF9x7u+aI1ntwoacGVr1XnRLFKjs
         7ulg5lwpXOpn3Ly5bDBwxUf88s8OxBbCHF7GAZFdidIQ7PP8K7Cx7/L3J0thM6Tznf2P
         3qvzA2kbWTzLyrPw7L1HWcvuiQLoQ9o3SnNIpolOYsKVBdy0GMDOAbMMwPz43leOKQfG
         p2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709637150; x=1710241950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bLhjPX0QstRR+hnVAiXkNiX7M+vGZTLPN0nkAe0a3Q=;
        b=OWSfeuOzRmMg6TxY77Hc8MdJ/Wo+wCj755m7T/N24zEgIp/ZdmPeW8Q0H3BmWz9a+n
         s7Azy8s6PIa7Q8P2oxQ3JQHOIR97NiWrCB9H4a++rtIeKIXAs429/iPJR1Y9jtG2lrqD
         jHQo+ce8s7IWX9LkJJmA19IkHhhX+Cz21lVhtSgP4D/0hI3CHFfBlElYWbv2HGfB+dQ4
         5Ajp0rRw9CZP5+xKqjazEqPmCrWREYDYndA64nM9+MZ9nC2Qx13xizVqbzPO+98pC9KX
         EgVJIiCk0+F7zlGwkSxkvj3Byisbx25Ub4G/v/L11EKCkVUo2cZoC2pIOoefhmEm4Tb6
         TBvQ==
X-Gm-Message-State: AOJu0Yz7pbjR6s/QAuXw2kJknzGmeJxf/8xlUcvpzHWr8LFLJxjPCmq3
	nwv86YVaNxB6887uRLjGzqkx10HrR2BDxsHZZejlzlaazz+SiR+lz80wU6+GkZ0=
X-Google-Smtp-Source: AGHT+IGQZl1148xr24dhEF7kAQCAULo+llueqT/fMVasunffSlXLeuVgQS0N/dPd+zMG+BvTlZTR/A==
X-Received: by 2002:a17:906:2f0a:b0:a45:900b:e3e3 with SMTP id v10-20020a1709062f0a00b00a45900be3e3mr2054682eji.5.1709637150301;
        Tue, 05 Mar 2024 03:12:30 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id tj7-20020a170907c24700b00a413d1eda4bsm5910215ejc.87.2024.03.05.03.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 03:12:29 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-dateutil: upgrade 2.8.2 -> 2.9.0
Date: Tue,  5 Mar 2024 14:11:23 +0300
Message-Id: <20240305111123.371640-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 11:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109118

Changelog:

Data updates

    Updated tzdata version to 2024a.

Features

    Made all dateutil submodules lazily imported using PEP 562. On Python 3.7+, things like import dateutil; dateutil.tz.gettz("America/New_York") will now work without explicitly importing dateutil.
	tz, with the import occurring behind the scenes on first use. The old behavior remains on Python 3.6 and earlier.

Bugfixes

    Removed a call to datetime.utcfromtimestamp, which is deprecated as of Python 3.12.

Documentation changes

    Added note into docs and tests where relativedelta would return last day of the month only if the same day on a different month resolves to a date that doesn't exist.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../{python3-dateutil_2.8.2.bb => python3-dateutil_2.9.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dateutil_2.8.2.bb => python3-dateutil_2.9.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb
rename to meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
index c8e8a45c9..bcb68d771 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://dateutil.readthedocs.org"
 LICENSE = "BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996"
 
-SRC_URI[sha256sum] = "0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86"
+SRC_URI[sha256sum] = "78e73e19c63f5b20ffa567001531680d939dc042bf7850431877645523c66709"
 
 PYPI_PACKAGE = "python-dateutil"
 PIP_INSTALL_PACKAGE = "python_dateutil"
-- 
2.25.1



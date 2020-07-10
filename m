Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.3893.1594353673679229462
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 21:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lyYqPJw8;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id x8so1698319plm.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2020 21:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=oIZS1neSpoyjMzhcA9T/Jvz9/D+ulR9LUqU6k0REeLk=;
        b=lyYqPJw86qUCGYUtlWrRRknCkSfjbJlywid/N0YeXn6An90aC96UXheETppMwcA4ip
         H7MWDKytH9QLSiwRbWQfrSG/46jdkpnrcWxnQzctabQdxpZSWrRR1DEyjMv+2dG5g4fx
         iqcfcMfPbZQOUNRvZHMEhcpjpeDlAnAF/wDubUcTwvt7us93v+GyLBk5F6S2BH6GbX39
         QYE/7PCdRYeGTDi6qtqPDETxfIZdpe2p0i3T8EVI7Ayg4GReqsDc36xASgJQ1cIEMVC5
         AyvuVFwBhWi5m+HD3AJGuYiDkTMva4NYx++BeS+wF6H/QGQXNGe5oJMVTJEiKpLdRlzJ
         fKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=oIZS1neSpoyjMzhcA9T/Jvz9/D+ulR9LUqU6k0REeLk=;
        b=rQ4tSyNJTeU3c67YGfajo8dzdoyM8TFyK3AW5nfR06a0tOEKPtVw3kx1alu6uzNHmj
         3VtRQ5Ri7NniJeYSLMCU2FLfHTpaZfGBry5OOnoH43a031OW3hdn78elhMa1UBePhtHc
         rgE3BccABlesReNdyI5asXzYJe4w2jKo5fILtuGMHuGNs5xJ8sr1tDr2zeMDZka1BNfM
         MJohNVAcgKhf/TUpK3RnjWHB14EyPMzqy6QcIUrFSt4xW+PJ/m9s2xT8r353Orr7DM0k
         dFAcSjw2LLm0lPallaBjZCGzFOimXk/bs3ioJTngHJBFlLN1ic9TMX+g7B7aKaKpJS3h
         sPDA==
X-Gm-Message-State: AOAM532r8xkqJPZxoCSBQxHzUHrlIuGfBRu3MZc7G+FnpSxcVHboGgfn
	H4bCzrYSQbLkOtTR370aD6oGxYThw3w=
X-Google-Smtp-Source: ABdhPJzzz0G9Jg7xWjDY44fkcDkdMmdJ9utTvUYi90a0XYyrusgvj+9zrLc+9ABBuR09A4PJlTUrBQ==
X-Received: by 2002:a17:90a:784c:: with SMTP id y12mr3266569pjl.16.1594353672938;
        Thu, 09 Jul 2020 21:01:12 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:396f:c9d9:1d67:d8dc])
        by smtp.gmail.com with ESMTPSA id b21sm4101405pfp.172.2020.07.09.21.01.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 21:01:12 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/4] python3-fastnumbers: Add new package
Date: Thu,  9 Jul 2020 21:01:06 -0700
Message-Id: <20200710040109.22600-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710040109.22600-1-akuster808@gmail.com>
References: <20200710040109.22600-1-akuster808@gmail.com>

rdep for natsort which is an rdep of croniter

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-fastnumbers_3.0.0.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb
new file mode 100644
index 0000000000..b0ecb9d560
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Super-fast and clean conversions to numbers."
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f797665cf3d3e0fdc0d488f5200c6f55"
+
+PYPI_PACKAGE = "fastnumbers"
+SRC_URI[sha256sum] = "93ce2f9516fbf2bbf46c85e4abef783cc569e5fbbc665352efb9cdddbae517ec"
+
+inherit pypi setuptools3
-- 
2.17.1


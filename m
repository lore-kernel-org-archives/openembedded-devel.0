Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC49C36018
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:27 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.3927.1743454886008082250
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Eb+e+9nx;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so780834266b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454884; x=1744059684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4Dgl1uWFUTrlUmErk9wxZnocTi1LntZAcT+RYF6LDY=;
        b=Eb+e+9nxRWDGzh12eXXNd9m0NzPpFu0aZwkFgvRGINMT1rU/TGIyBBRYJyyPNVt48H
         9wtm7jF+FPzAIDJUXPueXgHHT1C2ae++U4vP72SToOvEz/GHUhbbJuVtOKuW8x20H+xM
         X86LqwxSyKsyVvRUYtWNH82KJnTsizsOvR3Eyn2BIyPhscnHdxa2XUoYehZES1b7D7Yy
         qRqwhCJGAXMqoJEIga0Zm8GT7YJ3I8IjxSdP9Eun4nThQY+2ONxp+JFz6uGao2fPk3mB
         NKdq+QjgKt7bjJksfE9EF9hfOa62uhA+5C4ewFLuq+9p4hFAnn2KuT9/hpvvuutdVecO
         pm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454884; x=1744059684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4Dgl1uWFUTrlUmErk9wxZnocTi1LntZAcT+RYF6LDY=;
        b=WtRut2ldMgJ6A1ovyHHBrvuVD9UOdYKJpC38L096AAij8EdwMtkVLT3c8b0Pxtf5Fn
         1HZLzsbJ0N9U7heJXyQ0TXdsUQD7IeePw9GknjAK9UmKlGiNmKACNeHGTqRn1l7koAnR
         g6OdH2pX0IYEDHh0nq62f8YTnR90PEh0pRvniOIWO8ipJcyJ7KVgNPb+ZV3Rvgj143qA
         K7dt5cGaxvwgYq5uvOHSxFEQ7vtBn4u4oLB8E5BKtONZR8bVRKyMSRYGV72UGoc5cBAE
         e4Yymm5HgQpI5uk4iz+QsBLLMpSkD+cUnC6rJVoVYu2QBi5FTtR/hKX2EyM5IAMku5D5
         6qQg==
X-Gm-Message-State: AOJu0YyN4N9EVavNT50sfG2kNU02MQHmnEeunV8zUNvfY7FZPUKhTn1a
	y40LAJHc+qY1MIA7Yr/ww4iER9KqKz8yVguIHg+r3msxzE7T8zm31Obn9ute
X-Gm-Gg: ASbGncuPQQjmigJjm8YKI6JVjy3fFEBigASXG/YyVHnJBZYDGzb9Aii2sNX2AGkjmQT
	YRF6taQd/f9M8gdhH3e17LmT6JieA4bF7nfak3VujiFl7mVQeu7gv7g2kRbQOeao5JIHo0ru9zE
	4r6jFU9hVKVBgcekobq8VbYbDxz9Vk4pY2wf/IvK6xwo2lbVfyBqgI0oGZyDmfTWX8sgxny3SYP
	jOkAgwiarzNKPWxpfCAYnsa2F0mPYArDDdJ2YFi8VuVItWev7OdMNaumFYZa5S4NuXo7+UMjTcn
	2C6e+UMWCIw4o4trNdD7rc5YZN9ZS/nX/kcMtTEcJgIt+1g=
X-Google-Smtp-Source: AGHT+IGqtVHKD3hocKVYuRPHLEInApGNDTXWbKtgB368EVtvQXuvenb3WpjOxynr4x9TfsqKDuA71g==
X-Received: by 2002:a17:906:6a0b:b0:ac6:da00:83f4 with SMTP id a640c23a62f3a-ac738c6f29emr810990866b.53.1743454884212;
        Mon, 31 Mar 2025 14:01:24 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac71961fd8csm685943766b.100.2025.03.31.14.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:23 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 12/21] hplip: Fix contains reference to TMPDIR [buildpaths] warning
Date: Mon, 31 Mar 2025 23:00:52 +0200
Message-ID: <20250331210101.3460858-12-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116448

From: alperak <alperyasinak1@gmail.com>

Make sure that the OE provided CFLAGS are passed to the compiler.

WARNING: hplip-3.22.10-r0 do_package_qa: QA Issue: File /usr/lib/python3.12/site-packages/cupsext.so in package hplip contains reference to TMPDIR [buildpaths]

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/hplip/hplip_3.22.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
index be420b4837..991c695565 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
@@ -49,7 +49,7 @@ EXTRA_OECONF += "\
         --with-cupsfilterdir=${libexecdir}/cups/filter \
 "
 
-EXTRA_OEMAKE = "rulessystemdir=${systemd_unitdir}/system/"
+EXTRA_OEMAKE = "CPPFLAGS='${CFLAGS}' rulessystemdir=${systemd_unitdir}/system/"
 
 do_install:append() {
     rm -rf ${D}${datadir}/hplip/upgrade.py


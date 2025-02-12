Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AF7C021A9
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 13:28:06 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.15619.1739366878833419964
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Feb 2025 05:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YOIVWnX7;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-438a39e659cso47515835e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 05:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739366877; x=1739971677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BKqMkw6m84M424CahwPrnTNwfGkR98fneSzP/1TLASw=;
        b=YOIVWnX7XXfWunwicPzNCywvD3rdMPXxowTGMa73G5FIQZDGZB+Ssd4BfTWbxqXG8j
         tynOUJ4NyLFLIsLRCE3WhUyJMGg1Kx1dxzlvcyiApo+uccyVcAJHzk9luslCJ8JUokEk
         e1CqeQTGm/63QTOC9XGcujSZCgukFyUJ8zFKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739366877; x=1739971677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKqMkw6m84M424CahwPrnTNwfGkR98fneSzP/1TLASw=;
        b=oFl2ssEiV7FNratDtrT4+JixFvPmVV8/+p71Ge1MmJIuiKc6/3xDV+hWfPAaJpczX2
         H6YdD0ctQZ1Agj9rJQbBRQ4gAxbBtgdjdRYvr7+8UZq3Z+ykd0P8zNdAZEiRbnV6jbjC
         51AU2hzaCk5UOijcFvLI14ePeLDT1kiR+iTUrWjYq1soWGBfw+pJVufNd3PJUBd2+hiu
         XWX4DuLLcNATAHeKwE3UfXl7ZmuIs9/YKTwG3+GOmVrGMpAr1O99s3383iE5/esQZaos
         0SyDvnGKNBEHPDR7Ir9fuLrl/a5NIWUZJ1dA+MdwBQXe95PaTgOMozsqQHn4rzJSBMG1
         6XGg==
X-Gm-Message-State: AOJu0YzKwHPsfWaJnX6G1yNbQ8VH3rYqgldZYqcguhVw1k4QB0xGi/Nk
	sxbLq3X3wBMoZTPn8dCrEvWgvyvfRwBlrvqA91ZIicgbrpneWVjz6651rBpTfce1TjGLfd0vF8w
	E
X-Gm-Gg: ASbGncs4ahkH92yqIaETJTEhwY6if9C37pbT5AjctuxvgRbt0duDtA3faqi77rA116w
	Vy50pZoiTfrEpELR3mTyw8PCEKZ4I6RD8qT6hEyquUhKN/2pofNUKdz+8pkhnMhR6UP7bPmVnB9
	QOVyFATFMj186lq+XUkTq2SSSVHGWhIEqFD0fwUDFFfYe/f9VYBq5nlr5Be5f+8lEcd9yzQ5/Or
	3tIEdVYbb1Wq7grRn/pkdcFY3QrU+KSLPGbd6g48g3caJiHU2Kez6Jp/mZvpBjO09TD5yKwtxqe
	Qj7lDIlRN2aOHS0oGRzcb45aLW247g==
X-Google-Smtp-Source: AGHT+IHpqXYb48ZEOvS9oXmM0aM7FWQh0H6QggCn5raTk9Q9MUzBNhxkTIZxrOn5RUXYVTV7q7y7lQ==
X-Received: by 2002:a05:600c:4e8d:b0:439:4a1f:cf85 with SMTP id 5b1f17b1804b1-439580e532amr35058785e9.0.1739366876817;
        Wed, 12 Feb 2025 05:27:56 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc9ce31e8sm14781835f8f.5.2025.02.12.05.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 05:27:56 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-pydantic: Upgrade 2.10.5 -> 2.10.6
Date: Wed, 12 Feb 2025 15:27:50 +0200
Message-Id: <20250212132753.957846-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 13:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115444

Upgrade to release 2.10.6:

- Fix JSON Schema reference collection with 'examples' keys
- Fix url python serialization

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pydantic_2.10.5.bb => python3-pydantic_2.10.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.10.5.bb => python3-pydantic_2.10.6.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.10.5.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.10.6.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.10.5.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.10.6.bb
index 77568a368a..9c2bbf5140 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.10.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.10.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-SRC_URI[sha256sum] = "278b38dbbaec562011d659ee05f63346951b3a248a6f3642e1bc68894ea2b4ff" 
+SRC_URI[sha256sum] = "ca5daa827cce33de7a42be142548b0096bf05a7e7b365aebfa5f8eeec7128236" 
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.39.5



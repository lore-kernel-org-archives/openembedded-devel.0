Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0279D3F295
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:49:03 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.30103.1729278832530841059
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PPiEeYN1;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e390d9ad1dso26143017b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278831; x=1729883631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TB1VMu+TR+H7i1g8Swbl8teGk+jwN1d/5MkAanKYrvs=;
        b=PPiEeYN1Emuu4pkgS3m8sHC4i18QII61IAMZO4Uwfzhu7Mbfanv77yqtmoOl8iQnkV
         YOEHb1EDJKHDAb8Kmp3yEOfijI5EkMWJmHQvt3Sr5kPDtsywKf4X4lItdLqGHSkFQPiO
         HWX29hXHzBFGsYA6cGUUqr5HVkGARhgoG1mJApLyK+Z2AjO/oQ776Qnsx3xXDZdtjjns
         RHO0XDC4THzxDQBrt9+nmhG2Ukxq1G9Azwc01/uB2EavTChJwNu2ZevGj8HSfpf+KODX
         L1DHyuunsrw6WeApWf1sgLfv7KtHk1rw9Qh3uczxDs5slHQA2b1M5Q55FBkraoHzLaaI
         Abjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278831; x=1729883631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TB1VMu+TR+H7i1g8Swbl8teGk+jwN1d/5MkAanKYrvs=;
        b=xGUaXZTl4vD8wlvg8KGJ9OTC3aZ1ashDTOIEv1+psX/V3Hl6KhnmyWZNHlL3xZPEtL
         hXwhkQEmHFJN9+HYzYUy9Ko8a00TtfNn1ld5SUO2leqVsw506kdwEV6MXisZU5j12Ie4
         VTu0hOSdlO5O1Wh+HeGkTfgCIkbqBaIm2ppVqNa6/TgQacwSeaUQ3gndYvy1goY1/7Xr
         ZI7IQq23Iz769qMvKGbpFQDAz7mTgadpwXg1EyZBqip8zebqFAWN1xTdv9zb/UbpPRB6
         SHHspf6H72zB5rrV4N1yT9ezoViBsUJV2HlaecG3dKNM9caIoq0Nc8GCS9hAYVTl3Cjm
         2mtA==
X-Gm-Message-State: AOJu0YwS0doFl2nziJpT2UXEOa+Q9ZBKq8MSUbJtykh+tskr8yYIGwUR
	v8S22+ecqFbjTPQFKhxHYvNt6/o77b5f+FRcygsRxqmS81B8CVTYQuxFYw==
X-Google-Smtp-Source: AGHT+IH9W7hoi6hIYQYt7752O0qCmvksW5nwtbOt3+z/HHxP2wdEIHgZa8jb3BQyfP3ZVjnulqHVkA==
X-Received: by 2002:a05:690c:6e0a:b0:6dd:b9d4:71a1 with SMTP id 00721157ae682-6e5bf9a1107mr43692717b3.16.1729278831142;
        Fri, 18 Oct 2024 12:13:51 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:51 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 62/68] python3-tinyrecord: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:49 -0400
Message-ID: <20241018191101.25184-63-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113049

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0.bb b/meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0.bb
index 1d99ae2f3..16415ebee 100644
--- a/meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0.bb
@@ -8,7 +8,6 @@ HOMEPAGE = "https://github.com/eugene-eeo/tinyrecord"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ee157eec4b228c8d5b7a6e0feab2864a"
 
-SRC_URI[md5sum] = "cbaae3f4599b12e3bea67ca4a75eca99"
 SRC_URI[sha256sum] = "eb6dc23601be359ee00f5a3d31a46adf3bad0a16f8d60af216cd67982ca75cf4"
 
 PYPI_PACKAGE = "tinyrecord"
-- 
2.43.0



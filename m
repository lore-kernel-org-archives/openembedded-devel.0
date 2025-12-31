Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A32EE6424
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:55:00 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81813.1767167699545227542
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ral4Kg8Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so81195345e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167698; x=1767772498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBqBxQt4/qmJ1ET/M7jfa+UXpMJsGcxpAS3nAUT3BNw=;
        b=Ral4Kg8ZE+KKzitS4UdXboA1DOf1LusEgmS95Y87I7qkUUHnZb/NXWD6xL+uGJq/oK
         JHsJJMjTPDwTreyKdXq4QNfCcZbs5QJEW1z+Kq832L7wi4rvXR0VLiYLElC8ivAglCZl
         HSuRRiKkXj0SvrfPyzp9HLIeqpy+Yra4psrU8Of+TDmXUfvgi1Y6qnB0nLXeADLbf3T6
         QPQfUso76WrrVvyEHLhmaW3lxcf8F0Sn878xf39ONerpr7h8v6bWsnhNztIoxlQGgIWG
         e4AFVqvQNk2sYw5aVlF4py6aURPfwTIcr6MdbSVxDq+ZUJ4KdAiYYyMPzIY3bB+bHl/F
         VcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167698; x=1767772498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hBqBxQt4/qmJ1ET/M7jfa+UXpMJsGcxpAS3nAUT3BNw=;
        b=Lwybv+UQxuAhvB8zfhD59OyhZEcSrliknd58Rs5TerQC0r6B3jTN1rCKk/n8BGyC4U
         l0ZZ3oj+QOOUo8JLnUuwQ/w3SyzOCupqNqjax1iZG4R20SfBfQPNY/PzN1uIoHWzMLuu
         Yyl0hYqNllbLIzw5UgKGyWZA1nXNJmW58kTdyT2ZZLWI31gJcm/RW00XKz+A768FhWA+
         WoNlLmWOD6nbZO6s7sIVnW2V5wS/1bbuU/dHEYj3xJeIc+i1EOUb4QxEaO9chVhz+8Ob
         7oh1JcBeItwKavYNyRYrdI1GvF2kJG8aXWuAt+5mlGilWYlCq4TcxBtz38IAVAnhTMOk
         4JdA==
X-Gm-Message-State: AOJu0Yzgd2lJCIXdeOTVscEloBSxCgqoH4cdSKdaNUXRRgZF+lLgjQt6
	0GsVWRuMRLy9Ro7KkA2t8HQCtiYbx1RLUUkePc7ewlOcDmKH7akMtJguD5r0Lg==
X-Gm-Gg: AY/fxX77YtO+RZxz1Ih+1Uioqg9vWrJJPkYqPoRTbRu1ugLfJmwB1BWmveFNHNwdjBB
	He4l3K2L21VU3UMAyvdpQuHX0dmQoiRzalwpoHts+kNch+6IzCBJpHEKlfL5GnPl8k27dGLQotK
	scoWlgtqhvDGVWhlV9KzTMb3OuUW+x+Nm0hjk+qXN9u2f+h9cBQlK8vvlBJiyTwSSmMjqMiQGJJ
	eHrOJlqtpWgkndGJ0oet1WgIkqQ6g8bFgr4moPnSvgsbJjWTgFl73g0Sevl8Kt5zXLrvq540S4V
	dCBqo9ACcLadRLL1lDFCX0aLe4oTF93LCdp7jJBrZZMTCOvzlxLHsqR2BoMV7/Wtarrl1UqFfff
	MOjuuF5QzS9ht3FCBmWKuBVu5MHdcP0T+lKLJPcpY8Oknfd0r3DryI2aoJ3J7+UPTAkLckpG4cC
	IdKlwfMd7t
X-Google-Smtp-Source: AGHT+IGsh6VObtgD9EaV/BWqnYBWEdy4UHKkoJZBzrwJmnhHRlJSn9Nzri70x/zoDsgap0ke9Rvh4w==
X-Received: by 2002:a05:600d:108:20b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-47d1c038664mr296380695e9.28.1767167697859;
        Tue, 30 Dec 2025 23:54:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:57 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 28/34] python3-dnspython: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:30 +0100
Message-ID: <20251231075436.771395-28-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123068

The related CVEs are tracked using dnspython:dnspython CPE, and the
default python:dnspython CPE doesn't match relevant entries.
Set CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like '%dnspython%';
CVE-2023-29483|dnspython|dnspython|||2.6.0|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb
index f8f78f1016..aa14caed15 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
 
 SRC_URI[sha256sum] = "181d3c6996452cb1189c4046c61599b84a5a86e099562ffde77d26984ff26d0f"
 
+CVE_PRODUCT = "dnspython"
+
 inherit pypi python_hatchling ptest
 
 SRC_URI += " \


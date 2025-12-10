Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD83D3E762
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:49:23 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2026.1765388953896390611
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:49:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CT5dnaeX;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso80697b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 09:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765388953; x=1765993753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpmzuZOkekwAjRlA6WDsdRwCMtZpQfNGIVt3fW45MmU=;
        b=CT5dnaeXowkxL4HIADgWiF1ADaDsO1e7dWVWCu++g2YfSsS3iYNItBBviBc6tB4E3V
         FwOX6zJZrFDFQBLg6OABLl6nJllu6+fYyncYV4X24AXaC9Z8wuFommeu5rVJH6/xcbuA
         RaWjXm/gU3DzyqtEN6H+4lXJYr24/8XiXtdil+W5ixeM46LBxvrHvAl9VbZ13JlRL6ky
         005bTyUsoguHV9GTyputmyH6+F+v0Qzt1iAfoZPpZm4lCFAbiyJ5xlM/SEt8dlA4oD9Z
         A+0nS+IjQqQCr/FyWzyNKWEcEiytwH+6ACTT30WJaCVXgfEQy4eR8fbi+Mq7NAg3pzF6
         jSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765388953; x=1765993753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bpmzuZOkekwAjRlA6WDsdRwCMtZpQfNGIVt3fW45MmU=;
        b=BY7wOb1aT0URMhiGUf7ND/J+2ThtF0xMjNY+AQeszke+wjieFfHqU3qaooLZFHdeM3
         VVJk+xaX2hDkTTVebN6PddRw7g2pXSvRb5ECREcbbbdbZuDmE+ktN5hp+68G1szQZ24+
         WKY1xgoz4iCMmEnx46JyNWb8oWMWNnGV9H5Vfk3kFGrECwwNRyiuTM8Zx42v/peNCU/z
         nWmVmCTjz4aLExYiLMj5Wn4O+eDPfFBtsGvejdsY7p/xHoTi6jn07c7d4Ns/xkKiOeYt
         +DnwZHNRkUaUll0wFfZYlkobVPeMzWWYnLKat0f9F1Gb83Yl5ewFRNo1ATn9rdgKvGFl
         qX7Q==
X-Gm-Message-State: AOJu0YyPXAeNKJkWByX0+hqQ6AHQFSQJ5vmjYOs2bdOoZ9mkzDLS88Dj
	dwZMrz1fzK3E7jwymVjoDmLoU9uxqfTD1cS6j23PsH5Z+Ht5kqzO7E0zvBPsnBEl
X-Gm-Gg: ASbGncu1FndCLRVgQKsinKtPvajscG6QTVKHIToPVN8MltNwLeduk1JlkMmlfpEMlrZ
	78FloNS9f4x4Qs8pPt5v3QkovkR355t5W9mqv+3Nj3HwJg+26stszMaauysnxhJ7JbX4Xvhk3Jn
	91no/x4v2F8hsxi2lrKWXaQNNxNw3hMfPM/LglXGPmj51hAJeggbajg09MOjESk2fH1ZRfToyf4
	n99pZKEwN38b7VyUkSOwQc9Xc4wWm8VgpLbNkwL0o1yQ1Ojwf70lOZY40ElnqlJpUxNGhvNuHbD
	Tr/QczErIKW7mPZy0r9SalSiCvB0ojzjJQu/vvn+8ddH9qV32BJrZADoav5XcKUStEbnJZRI3E/
	XdSFL5eftdv5cnLgTUH9B3FMdu/Pl3GiSwq5MMKP2YyFxTg8pYJV7KUh9Irk1fcuE56Jc16RSY+
	l4x0HinO0NXm9ztajMpdrc8bI=
X-Google-Smtp-Source: AGHT+IE8kGryT8jXpd8Jf991C//8Xa/O0sNb3Urt43n+tLStbYqOkwtYACc6r9VoeJZe60XJmXpIXA==
X-Received: by 2002:a05:6a20:938e:b0:366:14b0:4b1a with SMTP id adf61e73a8af0-36804793a65mr221248637.37.1765388953039;
        Wed, 10 Dec 2025 09:49:13 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c264211cbsm124658a12.11.2025.12.10.09.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 09:49:12 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 06/10] postfix: upgrade 3.10.5 -> 3.10.6
Date: Wed, 10 Dec 2025 23:18:43 +0530
Message-ID: <20251210174847.2828731-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210174847.2828731-1-ankur.tyagi85@gmail.com>
References: <20251210174847.2828731-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 17:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122572

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cde1da5ec1cc7d5edfab7f65d95dfb9afff09682)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../postfix/{postfix_3.10.5.bb => postfix_3.10.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.5.bb => postfix_3.10.6.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.6.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.10.6.bb
index 02fe9df7ed..647680bf25 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.6.bb
@@ -28,7 +28,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            "
 
-SRC_URI[sha256sum] = "6a926bf702173861b08e49bcb51fca3a2f269f9a337f72ef159bf46052087e35"
+SRC_URI[sha256sum] = "71b383f57d4cb363201be8a301bcbafe304aadbe7f38ebde41cd5b952248465b"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C591EC0218D
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 00:48:38 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.1279.1737679712350656852
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 16:48:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SxFSpgPY;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2164b1f05caso26327855ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 16:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737679711; x=1738284511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xp7vBfCdx9Pm3TuHhzIvgXv00nXHYra5r7gVAsfDRXs=;
        b=SxFSpgPYfPlCXm5m7u7va9ThWeC83GCbsf0N4Zc1TITRg1Y7z74sYqWX6i0ZThE7P+
         whVQOmjE05QZb0dCOmjzC7s2GlRXD+U9w+Q4Y7gGXFM5adVMOretzgXfoWOoiF27wXjt
         +FOTiJRm40cTfdldInrXyQ6iuiOofqqTRVDA7R3vYH1GSOY7K1/XOwFWFRVfQ46rNx1Y
         mWhHzUr/pzoF6BeCnIhB5qMF1DKzRw7fx4ORSppqd/S75OGu5ZQN9lzNJUNv9eCEIU5h
         kJMpTZCjljpkro3krjSMqcMP94Pom1i+ezwW5un+ic5IFLxF2oo2QjziJIv+8KN+bvsJ
         C4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737679711; x=1738284511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xp7vBfCdx9Pm3TuHhzIvgXv00nXHYra5r7gVAsfDRXs=;
        b=BM4ZOJUYLHKz45K366hbU5t0alPrH0U3yZ/cnb0ofKg6UDVg+dlrFxokJna7JNzUkq
         AsGqAvLgSAEbguq6TTN6mPQGQid7gH0q9Yp7oIXwZ6fpgFd8WlErOLQVyd+yOtI2pmIc
         6MRIdTZaKgmUcijk9JAESozl6npPx6v1HZScpU/8eigsiRYor0jIFbDP/I2gj5dTO3RS
         Txs/oTPdPt2QIjjS+Ru0YbEX7KaG/dlVtj5t38Lwg8lxca7sqirjwLZdWUyviec5qyqR
         USruYNmkAjhO1M/eSh0pGFrmoT/MR3msB/YiRSLwnJzrqXlcYpp+yFzYbya9eTClL8iT
         7oDA==
X-Gm-Message-State: AOJu0YwTrfzqhMiwXYBDZQcmJhPMTTXl7NfPS7/zEuGHQeZlShiRhyQK
	u6MPr95iA1+EEIWBRkRy2uDXepUIXU0KRc8Nkz40uGhCAvJM0FAGoQXZNDIy
X-Gm-Gg: ASbGncsrZcMSQEBrNB350pLqQhzbT54/GawVSaopXk2O/8crZoTMuB8ayzR0RtjZ476
	/5h+H5NS5pdCiyVoUSo7Q/YJx3bHzekb3PZrWfC+aTMByA8mPaN58Zy6503KL8+RqOZKKv04Ra1
	12D4vXbISt2Mf8mJ/ZbF38HfbxKX+ILphCuFeVGqzsDSTom38xOW6SkOft5fXV7pgRzflCE1Cmn
	tCbBP+ao3Bg1w7d2FOtPlIOLteeEia4TznIXx2eCZlRulAH8RRGor8GjEqZgyHp1reAnUBpHZ0F
	0VqGzfc=
X-Google-Smtp-Source: AGHT+IFUQgJM3ypq/1iblHvA4nL/QBZZFXqoR9YxZ8KjgKX39V8G+puUjUnwjHE5vaSCVdjx94GD8A==
X-Received: by 2002:a05:6a00:2989:b0:728:ecab:51e3 with SMTP id d2e1a72fcca58-72daf984dbdmr41367096b3a.11.1737679711491;
        Thu, 23 Jan 2025 16:48:31 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::d2e2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac48fe53bddsm475599a12.25.2025.01.23.16.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 16:48:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 5/5] ntp: Cache snprintf/vsnprintf C99'ness checks
Date: Thu, 23 Jan 2025 16:48:25 -0800
Message-ID: <20250124004825.3525640-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250124004825.3525640-1-raj.khem@gmail.com>
References: <20250124004825.3525640-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 00:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115044

we cache hw_cv_func_snprintf_c99 and hw_cv_func_vsnprintf_c99 in
meta/site/common-linux but somehow configure now tries to compute it
and since it uses ac_try_run they fail in cross compilation, as a result
configure decides to use rpl_snprintf and rpl_vsnprintf functions and
they fail during linking stage

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
index 302cf9915f..1f4cba1bbd 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
@@ -60,6 +60,8 @@ inherit autotools update-rc.d useradd systemd pkgconfig
 EXTRA_OECONF += "--with-net-snmp-config=no \
                  --without-ntpsnmpd \
                  ac_cv_header_readline_history_h=no \
+                 hw_cv_func_snprintf_c99=yes \
+                 hw_cv_func_vsnprintf_c99=yes \
                  --with-yielding_select=yes \
                  --with-locfile=redhat \
                  --without-rpath \


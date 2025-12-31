Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2561EE57FA
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:59 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81877.1767167692877766126
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q4ikSEbh;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so81194895e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167691; x=1767772491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vwhDFrZ0Ez6DCSx7aN6Ppm5q0p0j6R+iLfn9ZlmB45o=;
        b=Q4ikSEbhOM9h1AXKEsPjbGV64am1YCwp+xjfhuHU/g7Mk8Yu6RMX4kGZ7ZHXYU0nGw
         hXEeQJGTkrVPoiKN0Sxc4VyGqZY2/XudSLS/ArNVPBMIJHf59j6JnMi5B7riwdrVXT7O
         qd12JWVHGXe4LQP4QKrKj8LCd9P83ZE/rsCuXhFhzTXf3YS3+A2fqZUsNuKaAMmbGUSo
         7eKgoobA5Nc8//iGjezyBOFPpf6qTuji/hJQ7Fxfu7nYTq1EpU5/0braN+7XQHcpPq2a
         mBYXXW/z8vldC6Jv+VWUKpL+vWpbHKsaltIHdBfohwOiaiVgoMP1povegpwQyN7RF8su
         9r0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167691; x=1767772491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vwhDFrZ0Ez6DCSx7aN6Ppm5q0p0j6R+iLfn9ZlmB45o=;
        b=RsNl3S2pHDa8W8lN5L/Ocd/xGWCi/8jFF757PW305gtE4brh5DXetnTvNFLQprYH0u
         jWebkp4YLvWDaRFFfVQSjvuN+aGbXsnAEk8TuJTlbuV8ZJaQCsicy8jZ/wOv9QL5Iol4
         sAj5SK8AlbgEwMayH8IahhnWMqPqMtxgt7Mc5Svfyrg8eYMofG8ET7idzYbl4NZyvSFz
         IXfQA4reTN+si5/2ohUFRAtbSUXXQMVzEl+SGmDF+MnflOui6khCmIqbGPJtekQEvzVF
         2raSvlcq0InbrzPQOYXOtaa/EEO/v0D0VoxyA/4QESmLibDQpHqs+2vH1pLwhyw46Y3X
         ibQw==
X-Gm-Message-State: AOJu0Yy5SBvsYjHkDTNix6VUpp3e/BOAaVz5PX01ZgeORm/AVauXeQPX
	QMzrCQqSRNUVySoxid9K9T+nmquA5U/R+xFdWUH7FOvk6zRfP6ylLDlrVYg5mA==
X-Gm-Gg: AY/fxX422pRpfg+7W3m4zAaCGIKx5QQKkUTwCs6nFSRZ8Qxzf+7EE8oNtHAkRBAbzu/
	mln4KuzYudMPngwXyeDudvn9EmFkDk/dWe81HajgSf81xgtV8wnQMcGzVg2c+H8Hg+rzdASxI09
	Rx+yP+2CQLEk4GJ0EEFUirlPoDBjW1cnhAGZUe88+GlF0eqs89jXm4bkOK3q0oOVnoHluJI5/7K
	9yCXhz68GnSG59a9NKsBERtrXVteo/QU4taVlWl/a7IlMJx+6I6c8N63++cTyA8705rR4JbGw6m
	Z2ZiJquiy2uXDpPZ0Kthn+DxO032SL4BcncLhil9alLSW7SAa0DWLWUl0UQiCtSfj+5ef0yNl0p
	sgJySk9Q+I/I7szjeJNM/VnX3zEPwXwWMzJexgtbAVP63/99gTzWO54dPnSlUzIRTxi82Cgiobl
	cgaVKppQLj
X-Google-Smtp-Source: AGHT+IG9+ND97TqvWeVeyE/MQKgLB1aZO8/axVO7HqcDWAElzfD5YODT1hkyQeKJasjOLWdBPoVEhg==
X-Received: by 2002:a05:600c:4e90:b0:471:989:9d7b with SMTP id 5b1f17b1804b1-47d19594b70mr475575235e9.21.1767167691221;
        Tue, 30 Dec 2025 23:54:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:50 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 20/34] python3-eth-account: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:22 +0100
Message-ID: <20251231075436.771395-20-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123060

The relevant CVEs are tracked with ethereum:eth-account CPE, and
the default python:eth-account one doesn't match relevant entries.

Set CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like '%eth-account%';
CVE-2022-1930|ethereum|eth-account|||0.5.9|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-eth-account_0.13.7.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-eth-account_0.13.7.bb b/meta-python/recipes-devtools/python/python3-eth-account_0.13.7.bb
index a3ae8a7802..00deb53c88 100644
--- a/meta-python/recipes-devtools/python/python3-eth-account_0.13.7.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-account_0.13.7.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a26e64020156e806cf0054a6d504b301"
 SRC_URI[sha256sum] = "5853ecbcbb22e65411176f121f5f24b8afeeaf13492359d254b16d8b18c77a46"
 
 PYPI_PACKAGE = "eth_account"
+CVE_PRODUCT = "eth-account"
 
 inherit pypi setuptools3
 


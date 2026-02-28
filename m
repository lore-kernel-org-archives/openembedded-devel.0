Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC569FEE4E8
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 09:31:08 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.116291.1772271062573610508
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 01:31:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kuq4vq4x;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82728e5680cso1611122b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 01:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772271062; x=1772875862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnTzSYF3PPjtKJBCxAdfT5QOKEFJDyVfNGOzBtjAt28=;
        b=Kuq4vq4xEGqMB+MioIJaT/Io/2BMYrCHBlB9u5zK3/b/xrw8ma3nZYuImYu2W0A24m
         +5+r7I4RAD7BvHmN7gFB7kxHOCsEdGxsLM4MoZJSowjbpy860mBemI0S8LViWp/0Psb8
         dRTF5G1YdgEheLYI2duELsgY4k6MVubtJoRZjrxD6LqSiIKF8Fto2A/4XztAbkebFqm7
         zi1Cs4EO0IXQzGUmGGAC3O4fyIJ5DxfScVuEpnpRXwHOc4NaQDXeaUFNeOLdB23eFWW6
         HXIH7Hl5+G1xuJ9ku9g3JYrWGSTuDVuS59hHQde9gieMHLkFDyZMoOC0SOe/144peFrF
         ILiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772271062; x=1772875862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NnTzSYF3PPjtKJBCxAdfT5QOKEFJDyVfNGOzBtjAt28=;
        b=efKkinls9l40tTZReY3Rakm3Q0DoDa0xrqRb3KrYo7O6DpqAV9gS7ItkofvGSzdpio
         BW+A+FL2RDHR81kc8eO3NsTGL65D0lk+yF8ny+/AMbhkqiQv2RcscD79o2l7KeXAiyqK
         Pbj/cC9B2Qw0ywgDQ/vGk0k6YlpWKxu+dz77zgLjGg4Cnlki7LvGeVTLxMaZsyz1oexj
         Y5cJm9avcFpgQlgll7eDkhUMlgrG3t58vweu0RTKDHrR7RBlwUCOiVAYDeTLFDqkdXO0
         67yZsLSIgIS5zqV2FSeScYySttXyPdzeKr7F5/XHYX5yk89Zt7nNKnEwBs/lRhPLN3iz
         +kYg==
X-Gm-Message-State: AOJu0YybPkJYXuRp9ac3UGyeSzMX05rwUiD7rxfmkooAymDlfQ+KwpTE
	+TDLyyvtQIol0RQSDs6wYHOZ6DCYCYjzFjZ1mjZBI02zZDaye9vxtA3MSIWjrg==
X-Gm-Gg: ATEYQzwDNDuEUwnBQ9Eyxjkh2WibO4CqqxYJNJrXZRyefSB5HUxWM+JOtcnE6FaWb8O
	DQOz5i76Xq5gCdeOANQ9fVV2LAu3RERFIWeLzgO7tVqlDNBsDe0UGRAWzVOBAueScnCFhFFlCpb
	2sPUlwvJkJeQfznJQxnd97EkzJNrzzperQueEuN/mthCsL/XIvw9mtycgiHKGJBTtAOE5KsuH23
	yJ+PhNBpuBnKeLLsdT1U+s9i7yY8P1CecbEJP6n6otgxwJpwfn9C1PGX6h/jtgP+scl9wNC/WFc
	gORi29YyBqITS8GhpMF2exucHIRj2RIUGtAb2qdEch7hxJiGuAF2ioztgfgrqsymg3ibYkwrKhu
	McAYqCdA3f0d44mHslZEo9u1F19B4m1JDvgBxQVDR7lhhrSyfsr8u18zcBO3zvGvo2JfTEUcUVS
	lh/bIQcach10nH++TIingAI8teAx+UODUnoA==
X-Received: by 2002:a05:6a00:1885:b0:824:aded:63d9 with SMTP id d2e1a72fcca58-8274d9571f6mr4788977b3a.19.1772271061744;
        Sat, 28 Feb 2026 01:31:01 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d8cd91sm6875158b3a.23.2026.02.28.01.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 01:31:01 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 3/4] python3-filelock: Upgrade 3.20.2 -> 3.20.3
Date: Sat, 28 Feb 2026 22:30:40 +1300
Message-ID: <20260228093041.816960-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228093041.816960-1-ankur.tyagi85@gmail.com>
References: <20260228093041.816960-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124780

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 3.20.3:

- Fix TOCTOU symlink vulnerability in SoftFileLock

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-filelock_3.20.2.bb => python3-filelock_3.20.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.20.2.bb => python3-filelock_3.20.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb b/meta-python/recipes-devtools/python/python3-filelock_3.20.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.20.3.bb
index 75eb16635c..caa3957fe1 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.20.3.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
-SRC_URI[sha256sum] = "a2241ff4ddde2a7cebddf78e39832509cb045d18ec1a09d7248d6bfc6bfbbe64"
+SRC_URI[sha256sum] = "18c57ee915c7ec61cff0ecf7f0f869936c7c30191bb0cf406f1341778d0834e1"
 
 BBCLASSEXTEND = "native nativesdk"
 


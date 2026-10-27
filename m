Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14644.1793092838201569011
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Z3EQd82E;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso24775035e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092836; x=1793697636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVATpns8+3PKtiMsQ3z0mPKIgqfASpii43swPWEscXA=;
        b=Z3EQd82E4S5P0YHbFfe8BwyAUTN2CEI/6Ji4RDvEFyQl1Hr44ZudRFfHrOpjxo2ncl
         KxF40YLC84iJdKxUUG+LJXW7Xr8gCTYKpUThiuyk+0qfp/anuA4VELwP/MoW1EBSg75P
         8rkYasuDrkIJX1ktNV9dyA8Ipt6KG0TaKNlds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092836; x=1793697636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVATpns8+3PKtiMsQ3z0mPKIgqfASpii43swPWEscXA=;
        b=EDTbQjzDGp109WxEizzRR156TdVPlKux4hntn1PjnBwwTYm5tmaSTZeoagRzxv6Pwb
         ehx4IYMfkB5nVZuXh3AN9TZ5dNnwOHV3PhcaOM8IJ4NGS9p35Z9kfwd/W3ZAuw3BHHu4
         aWpi+y9SkHGD7tn0zKXQGsqiVMXqlGPpUGACJ/v1u37hHSrNR9SMdxFHRKTjCqJoXiYF
         Rsdh/foUuDQ+BPVFMrSadgC/PVhJ2QH+/gs7ufSN+5F89qkRjKAvFSjlMh2xTmOVwRVl
         ujmvgo4wFr9nbbleq8ck24VqCp+WOHIdfWJTHLrJEgrq5HJWLHwgoeaOSFLpfUAG358a
         WRtA==
X-Gm-Message-State: AFq9FYIrG4tTHZ25QfSw7UEYeipVkyDQ5EzxxhAskiWohdN13DGYpj+e
	kAHjoEyBgEQYUtJgLkrrUm6atqKJGrY8BHxgfx7YRmPtFpWRw/Xqqs6x8p8JIt16jiydeK462p5
	wndjd
X-Gm-Gg: AYBFou1q2uAT1OQYymkuyGFI/uhgVc/kk/NP5FkPpbw0WJblgoWjWtjK5Kdmvp6Zl4d
	w9e1WOcRuvPpOShCCLqOlHvdSP5c401Z0LBCKBiHqF92Fybr2XVfzDRCPxH0tPweb02F6NP/xJU
	ApgfxaBPl4vbOqf+YAOrXwTonBk4Aqfw5S44FjYgwBUvax8o5BNoFjDNVEHad4ZXoQjX7SQvDUh
	NkBQGIay/eXwy8j+BNNB4uwpXI9wVP9v9MjSF8n24LmpmqSIE7JlkbwCVswyiqzM22iev0X6hry
	eAw22fOX1AwnfKQFsWz2d3slKbjxluM1R1ggNYxN2/beUKnPnquG4gqfmlSnkci8hsGaoYut3nQ
	02noCXWTZKuQm0DpsDsz4wCiqrauWL/sOL4mw5YDHESLkkKKh5g8ov8MWICrpAv+m5xLZ/rxjV0
	hHgo3Hhb3V72vVvYQAf1JGDo49Nb22PiwP6Co5cuTTLLbIlsRI/fPiTF40SU/BA/JPC959Jnash
	vjH7hGqFYk4fM9kEe9R2hYeWdNGvuynwkHafc1EKmtZ+IXLUP+9PUhnXB1c6c98aiwoSfT7wXbv
	SoeXAjzo5gOcf6SwHlXzBVjZbNrLuU6nu3FLCLLpbi3WUIOlmP2h7sprl09/K2R/hiq8FnsaZhb
	COIA3
X-Received: by 2002:a05:600c:4e0e:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4a35ac9d227mr172983165e9.8.1793092836510;
        Tue, 27 Oct 2026 02:20:36 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:36 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/61] python3-cmd2: Upgrade 4.3.0 -> 4.3.1
Date: Tue, 27 Oct 2026 11:19:31 +0200
Message-ID: <20261027092028.782979-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131468
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.3.1:

- Fix type-check failures with ty 0.0.87
- Exclude .DS_Store from release
- Route annotated command help through the application output
  stream
- Add example embedding a cmd2 app in a Textual app with
  textual-tty
- Add example embedding a cmd2 app in a Textual app with
  textual-tty

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_4.3.0.bb => python3-cmd2_4.3.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_4.3.0.bb => python3-cmd2_4.3.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_4.3.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_4.3.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-cmd2_4.3.0.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_4.3.1.bb
index 3605ab9003..f7f256e5bc 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_4.3.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2a861642858e0858af9dd4e4716bae0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "3f6c4b9619dbd0d1ba75789a099be82b65daf8ac1d97b8e4ecb112e76c72b100"
+SRC_URI[sha256sum] = "708592210dc382510ee090ad7928147060bad1b460cbefb1105f8d1251376ed8"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.47.3


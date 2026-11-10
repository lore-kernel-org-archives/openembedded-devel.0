Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12.1794324461886406323
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iSJYiwLm;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49465892f7bso1523961f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324460; x=1794929260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjQnXZnn/fZ1RL3zbLFpu76U17w6SWdbwXHFldGmZtA=;
        b=iSJYiwLmDzO4Wk+/lXoNKuwb/u77YVjGdypOkiFA2UL7oRSAqsD4qdBiTE4w30fbe8
         2SqA8DXeMpPoOObv/sm9OHaiWfg4iOJIXA1UxFJpotX24VtZEMblN1sqXYqKwOOWh8aN
         NlHSZ1Ln1rChD3iuS8Dq7tEtia+zZ1N5QAX1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324460; x=1794929260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjQnXZnn/fZ1RL3zbLFpu76U17w6SWdbwXHFldGmZtA=;
        b=c7KJCYsXCpFWOTF/4Tas4ErBtJntmZe8uK6qjjlWYCoyPx+cAribl7KbX1mYEzRPPk
         kkKps6QQYIve5rowMzJmyLV2x/vslGXlBG5U5OFBS4VuUj0g10kpBWub8wPCCeZIRfR6
         DdZgPfm3RGykJCrl7sHv3OMxPe70/aa6cxPaQMAa9Ne3wqFfEg3m2UzW2E7y7cPDiiGU
         PDNtbBSoAvgppKvY0PDUOgWraJMsBKaC3rULf6lTFINassSlgXbRRHuhnfsAkf3R/jCe
         4Lmjzdll5SJv2wUTiAqnsi7GsfQCeXoBr468rFE5oA5bVzS/GaF6XXyZoHtgdZWvdB+U
         foKQ==
X-Gm-Message-State: APuU4Z8Aph3iHfs28phEQkt0PN6ZbIXJajpwE3Ee6OnQyAwZ95bJnPKn
	MPzIyULwUTn5wKhHtXqQ1uI0P+Sz1pd07A4b9qlpC5v6AoQ/TPLBeV1s7gdJRvtD9TMUs0eBEM/
	KrNoF
X-Gm-Gg: AYBFou1bMru0SLCbuhznomYs7cO5PlfmLkYyml/tbf/2n8qrW+dymojnE+KH0ItQ2XE
	K6mzqSHBmgTwNBhe4rJUcbZbp50IvRcgHeRdIoo84yXdHQhJAkkP4k54+Q5LQXAkimYVtWej4Ab
	X++48pFUhzpV20pzw+frkZZkSTbiwt8MPyNt9BEknPrfU+20yEamxVP4O1HFHQ5cr5Qiqc/3z+f
	WY6Iz+RPG44k63YSTCq4i369P5ubUCca5YaJO7/nQjjf4i5OCIQs7WgBrog7TPUZZVVXrAItA1Q
	oC54ntmmQ7DfeJAIV5eAjw5m2GZjfM9YhWvJeYRWsBEuk/8n8hNwvS9S8iPWMPHzyTgKErL53l9
	Dm7N7qnTZWfokPLF71gVS5My2tw+/zUZx1RSn96sjO+yB7IZdMv1qJc7ilKOCVkPDvsEWDTyYMs
	9tuyb+q+WjcmID3zXHjq+Bb8g3aOT8bjC/TuvoKgslxG56CCogcEfzbB5SKR9jaCJCYjYbcoBEf
	cmUDmGKcWEqXfJ3W2IgR4L4pnXQQHdcKGuQohH11MHcUa378I1b4XaAxQb7XxqVf3euIK1epZUi
	p3RUaHZ8XCjT4zHVcdASnQjyGTYCDcIlixHLE0qhPhBJMwdmojYQIgV1/yJ20o+tdRT4jGigcS2
	33u4SjO9BherCTpx/2ErhR2xmdhlu4nANru4npqGww40uAJhbwVTp5w==
X-Received: by 2002:a05:6000:2913:b0:48c:571a:a1aa with SMTP id ffacd0b85a97d-4982ecf6001mr6106046f8f.19.1794324460139;
        Tue, 10 Nov 2026 07:27:40 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:39 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/19] python3-py-serializable: Upgrade 2.1.0 -> 2.2.0
Date: Tue, 10 Nov 2026 17:27:19 +0200
Message-ID: <20261110152729.1065911-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110152729.1065911-1-leon.anavi@konsulko.com>
References: <20261110152729.1065911-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132083
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.2.0:

Documentation:

- Chaneglog to pyproject

Features:

- Support python 3.15

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...y-serializable_2.1.0.bb => python3-py-serializable_2.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-py-serializable_2.1.0.bb => python3-py-serializable_2.2.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-py-serializable_2.1.0.bb b/meta-python/recipes-devtools/python/python3-py-serializable_2.2.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-py-serializable_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-py-serializable_2.2.0.bb
index a3f36d11c9..d2a9afd059 100644
--- a/meta-python/recipes-devtools/python/python3-py-serializable_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py-serializable_2.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/madpah/serializable"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "9d5db56154a867a9b897c0163b33a793c804c80cee984116d02d49e4578fc103"
+SRC_URI[sha256sum] = "8e4fa02e8de819c0488ccdb69c2d3109274adcf224c02357fd8729cb12727aab"
 
 inherit pypi python_poetry_core
 
-- 
2.47.3


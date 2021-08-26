Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.30835.1629985441221442279
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 06:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=lcvsk/pF;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.169, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f169.google.com with SMTP id c12so5231548ljr.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 06:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nhbdD4FZk/I9wu9YvBK+CsU0ALg8ZeAZbvJdxRqVScw=;
        b=lcvsk/pFo+EDzLWECE1nyPiXPf8vY39SNPAcTJr0HPdQuLRtxNxk+AMl/IJNp7cC9p
         I6pGR7fiZ+KMViiaD0g76/E+c9WDMAXlbMlSdt2lRpqfxLoV7mMx65V+LRDZJ6hwLwPE
         VWi5r3PScZV4ZcQTLZMr3zHEA1kksXP/fZWyAxe6cavRQcHlKakx7TGIp5FpBKBs7qET
         afCgJOMbysGUgQWAsuBDJGe9b0/meJk8H7Enkxq2qy2830jqNBaAnMilK7i6Mzt15OED
         h/pmVr/NqDq5sYsK8NbgXAkPuIohmRestAVIH8W3np0WHrsfqYE3yNqZsBemFphF92p7
         GjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nhbdD4FZk/I9wu9YvBK+CsU0ALg8ZeAZbvJdxRqVScw=;
        b=rtyWRxC9Z0NvH/xng2AWse2I4O/a61RtG6nRkU/9k99uWuYdM2ixHgydtuN0Ivyefc
         bAfeK7y6Nh1yul2Tdemt4Vs9FEwVibodyOPfqeGj8JNRqhDeiWq+GeOzqw1hyQU3bjei
         Biw0nfpMO0wwqWK+7gSET9HXNJ1tHPfyLobrZUUSg5hpsM1tJusNHmbgrRRlCE5TunsC
         hLnOZfC8xNmVPkhPAM7jttpPgFYUH38YwImj9/muc1H8QsoEdXor5Ff4fgTkUl366uIf
         kxqo1eQUV/Qk5mPf8027SV4xc48gfzkABZunRFi8washd6s7YiJOvUKKT++BAa6KI2L1
         +75w==
X-Gm-Message-State: AOAM532vObxF8QWVqL9BQdAd6Rtf/vCIlCKFYpBVDQ07Tfv9TERQTZm0
	NEdI/W/6VosIKORAMum7nKKO9M3PqspKxDlk
X-Google-Smtp-Source: ABdhPJyV4htttxA17O88wM2EBfVJmOVDmjNwZ+xnvloSK7opfUA1rP5wlNiyVHKe8x7n/IWt29ZZKQ==
X-Received: by 2002:a05:651c:225:: with SMTP id z5mr3171806ljn.409.1629985439278;
        Thu, 26 Aug 2021 06:43:59 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id p18sm327571lfr.12.2021.08.26.06.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 06:43:58 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH 5/5] font-bitstream-100dpi: fix UPSTREAM_CHECK_REGEX
Date: Thu, 26 Aug 2021 15:43:27 +0200
Message-Id: <20210826134327.2535535-5-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826134327.2535535-1-open.source@oleksandr-kravchuk.com>
References: <20210826134327.2535535-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'-100dpi' is part of the package name, not version.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
index e32fad5e3..b280a3260 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
@@ -10,6 +10,8 @@ DEPENDS = "util-macros-native font-util-native bdftopcf-native"
 RDEPENDS:${PN} = "encodings font-util"
 RDEPENDS:${PN}:class-native = "font-util-native"
 
+UPSTREAM_CHECK_REGEX = "font\-bitstream\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.gz"
+
 inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.25.1


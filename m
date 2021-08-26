Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.30588.1629985438016554184
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 06:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=d4ZWKdeb;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.176, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f176.google.com with SMTP id c12so5231232ljr.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 06:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2BEwtnq1q4ZsklkE58acNNmmDFn4MV1A0bsEkp0vWfE=;
        b=d4ZWKdebCxjBr3+Ev1VMrPjAC89R22f8b1UJ6bLBskXeUYg+FcmHQGDKNTe00yfsPX
         5IPzuO0av5h8g7pueW9xe3nfCTunRbB1R9+UBOFTfyE9kGcAwJHQU9PeVthRsWJdbK3F
         2YO4jBX6wkf/kWflJuiDNp2vE07EcnfasYrnhr7s4YM4VNG0jS3+9WxkRlU/86RdopBc
         vQiys7byJyCQuYPlt66ou3b5bOt0glALabc14+segbC8ZUSrwBkkHnDaS8Iutp7oR9cy
         WzA48Q/f51Lb0+t35eBNVQnYb5fmtufVcWOmQFSEMxGO5qodTneSJrT/ynl4Tm/l7AkO
         5LVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2BEwtnq1q4ZsklkE58acNNmmDFn4MV1A0bsEkp0vWfE=;
        b=PHpYE0MRhai156CcUsYN4GQHW9TRs6YV3BgDND5VSbfDM9jqd25qGpiCaalTs3n2nV
         R/McZDgqeFSwhdOUZNpVMCTuWpo1WYrwO/VepWHxLawda9o/d56r+W4pp55jLCM/7RvO
         JzUKxviyK20i+Xc3xOzeAc78ZeSfDusGN/XbygK2y6/d9YVcMMvDsPWa5N4NViKQc8wk
         xNTZxlOSxu2QvphLVJImPr9Bk0hRUY+d/bzUNIIz/fd72YPqQ9H2AtNPllBH8HW7UZVR
         jeUhjKiXGiraV4XBWwT1xn4P1ZEeU0ocWgjG4pqdr8aqkqvKiWaC6PQM9c4Vgibmo43M
         8YpA==
X-Gm-Message-State: AOAM5321ZHMF648Lo2W68MVbDGxNpVfMbfRT7P2q0TDE0o1meyCrqU7n
	FsCTGQs34CWOk1NMEq2FHvvOpFQCL3Ppndy0
X-Google-Smtp-Source: ABdhPJx544pGBQiYzYmx/hniiTMA6geJ+qNULdlNMpuj3jUMIcpMy2aILrlCxKLzhpxztOBhiSwAMw==
X-Received: by 2002:a2e:884e:: with SMTP id z14mr3172834ljj.365.1629985435860;
        Thu, 26 Aug 2021 06:43:55 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id p18sm327571lfr.12.2021.08.26.06.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 06:43:55 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH 2/5] font-adobe-utopia-100dpi: fix UPSTREAM_CHECK_REGEX
Date: Thu, 26 Aug 2021 15:43:24 +0200
Message-Id: <20210826134327.2535535-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826134327.2535535-1-open.source@oleksandr-kravchuk.com>
References: <20210826134327.2535535-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'-100dpi' is part of the package name, not version.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-font/font-adobe-utopia-100dpi_1.0.4.bb                 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb b/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
index 2c51c6548..8b83ba378 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
@@ -10,6 +10,8 @@ DEPENDS = "util-macros-native font-util-native bdftopcf-native font-util"
 RDEPENDS:${PN} = "encodings font-util"
 RDEPENDS:${PN}:class-native = "font-util-native"
 
+UPSTREAM_CHECK_REGEX = "font\-adobe\-utopia\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.gz"
+
 inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.25.1


Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.47265.1598851871475009220
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2020 22:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KrJyrUlz;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id g6so2396011pjl.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2020 22:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IKmz67eGF3qQi5MgZ3YgMEcqf46sg8yaoQrNyp/151Q=;
        b=KrJyrUlz34aKKZnLpMG5Ca3BrPotpt4DEtEu3ntztgH6mPzJCugqZubV2lTf7zXrmx
         jRxczsS1fgSR25R5JRo2gUhTDIl+TYR6EjoRMOMPRAs8ovaJLTK95Ldgu5iYem9WW1u+
         I1rzOe4WJn0P6M3wtmqiBRiQUhUU4mgMH/W2Wy3igUloVtiRvDhWUj5M3Lbhqp+f2O3+
         h6hFiumejNDlE2uVDZ1uISG7VvoK90qMOffUUe/fEkb+x9v1CbVMsKL7X/7qycAItVIf
         R4mVWa+EzAVNUFnP3u+LsFZoAb35okwLsl2DXbIf5AiFH9ZlXRiVYQBOeqwfbxoFEqsf
         lYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IKmz67eGF3qQi5MgZ3YgMEcqf46sg8yaoQrNyp/151Q=;
        b=tg+1UAJ1aPXVjdKCLMF+W8SwC/Ke98wTHy5V/A6+Ozei/+/lMxgKSxminMJ2XOYiya
         FbW6Xhzusb7qKU7jlMxlljDN3IYbCNnyJXCVkdlvsK9MgDeUhq7c8VtON02zqF8V4r7Y
         vdoZQHh3ioKXBiZRhe6CGwMIFx8Q0yHY5BmEAvNPricHdeIkt+1zoECqcDDNCYZMsfhP
         tGQltz4CigzKozbzGWDhj0H2QMBOk35MCiV1lS4nirpLB9sCfIet8h1dFvqF+FPhjYM7
         s9RnYbFiH8TLc1oBW5LWojYh4IpJ6vN25YIFt/BJ55TIraMgvGFktPVxRwia08ZLQk6e
         TyRw==
X-Gm-Message-State: AOAM531WHAU6T/noyhrdcYcHqrb7NAvP37U4FWRCPOk5aNQBRDyOm4Bc
	AXCVA4f+p7DjMcrsJg0t/qsy6N71kaKcXA==
X-Google-Smtp-Source: ABdhPJwjmLpwZeULjkk6g2G1wcparVR3FoJKCKHTz7kpqQr1ntgyayOSChs+WHzl9RtVl6AG6ZYDGw==
X-Received: by 2002:a17:90a:f0d7:: with SMTP id fa23mr87615pjb.91.1598851870797;
        Sun, 30 Aug 2020 22:31:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id y9sm1568350pfn.85.2020.08.30.22.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 22:31:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 8/8] hexedit: Define update alternatives
Date: Sun, 30 Aug 2020 22:30:57 -0700
Message-Id: <20200831053057.1541321-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831053057.1541321-1-raj.khem@gmail.com>
References: <20200831053057.1541321-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hexedit can also be provided by toybox

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/hexedit/hexedit_1.4.2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/hexedit/hexedit_1.4.2.bb b/meta-oe/recipes-extended/hexedit/hexedit_1.4.2.bb
index 050b7da3d7..3e7fb2a076 100644
--- a/meta-oe/recipes-extended/hexedit/hexedit_1.4.2.bb
+++ b/meta-oe/recipes-extended/hexedit/hexedit_1.4.2.bb
@@ -13,4 +13,8 @@ SRCREV = "800e4b2e6280531a84fd23ee0b48e16baeb90878"
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep
+inherit autotools-brokensep update-alternatives
+
+ALTERNATIVE_${PN} = "hexedit"
+ALTERNATIVE_LINK_NAME[hexedit] = "${bindir}/hexedit"
+
-- 
2.28.0


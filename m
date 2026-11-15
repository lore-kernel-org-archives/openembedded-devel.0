Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3811.1794728999384979030
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Y7h4IWho;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36f8cdd30beso3150517eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728999; x=1795333799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCDOhYFt1B1TEs5V73elml9UZumjgYi5JNOeXnmjRY4=;
        b=Y7h4IWhoaqry98Hm5ssR2oWX4CEZCC1Zgy3kIB1y5e78gSxLIGT1rmJclz3oUXpsht
         0BFylTgm9BKVSuKytJpRRkG/vmMhtaVuz9vi3T0dXm8aDSBNAiY3zZUZLesoHXBe9fmY
         qk0AO2qHXWg9tqsT5ggRdR8atF3DLeFU2JQIbpQeJPszi/iu6ekhG3Ezo76YIgWNDeGj
         uyEFiBtxgZu3XjjYbKYmi9E3Luko1dJvPGlcdraWrAndZwenqZkmUNbOOUg1FwzHNOrp
         qnCjRSlkqB1FnJL1EqUIty627EMN8WDgsKzU8OGntLK0jkRjs/0e8qkt1PKkmzFKaYSN
         tAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728999; x=1795333799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCDOhYFt1B1TEs5V73elml9UZumjgYi5JNOeXnmjRY4=;
        b=dIzI6vFQAbu2RTY1eOhMB7RShuXRD8HR1PXDbkoMGHtU7TM7hLk8vAH+cEl5XJHbfC
         I55eqZ6PzddAI18AZ+Xgjwz9wcPcYuqxQy0whYRgZXk+3kSyEJmtsWYJHfsTX3o/QHoh
         YDKNLIkL2dXbyzkx69leKw4ceulOEe8tlHn4wkhupMwt42pZ7XCkuTSXMxwDpf0TxpRA
         4GrE+ui2FjSLyCE1WytDo5JwEPi77tGppO85k2MLrxf345Oan5u9nOudnYBHX9hbBBFR
         T4QAr9W6tug3LU8zlumVs5A6oemT63gPAT3VnEntjNe4KrvHQOLSVT28l4lbbOTWCd+b
         jk+Q==
X-Gm-Message-State: APuU4Z8yjSI1V9/pZCEJbkDVJku9OBuq1AIS6Jx0C2YgNyrHLZP7uOZV
	rXd34RV6KQie/CbGOBlnHiQALq/mw/JdA7LvG22ZIGERx3GUYglO6CWLx/31Bq6f
X-Gm-Gg: AYBFou3mkP2mbtGLFGSwj/QGIVYXtWpJLpWw7kvsgMEuPhhuU9cJ/VAGsVmr5bioHZl
	/dLuS2XhcL88Yf/lP8ueApe3CWL+T5uCdZ1bYSNyLrrojK1utSfw0iz0tt9Iiw11oUMnfOhIqbp
	myJf4yQJMF/5GOr/+F8o+uRzQU28aKNIGJqiAlbc5l1avGWBjBAuWMqDyVALjKiTmlqAn3Z372/
	sUZjtrMkGakE+bSyTkmZ4AGJMXkya/MYVl37Tac8HrkV6Ge7QtlaroHbmQ1r+dcLVGFPyql2Niq
	NdpMYG4+1ml4kcSHaItc6MsAY0YQs8e68VXj8CGdQ2yU+VL7YtJekToO3VbVDRxkuAe8FYV16q6
	EA3nfdxZSg5s44+AOM+6Z/KzCLdi0FRgq74Mlb0PTJuYso9+aXgeRJQMvj3CXnUCfVCMoig7cE3
	gXdJ/MHkkHjxiHsN5qMhAODCvTbQ2LB2U6PHUX1uQSs1qbUz1Zqqzw9N3RGs83SBUWTFrl5cHDa
	6wEPHjPnRHg0o5W2hWsadhZ59MoLuElmaJQOQ4WlPqqbKnKajdpx4QY+mtbFFkkhBHz84GO+b/6
	VGodmIrlSH0WS8WQqdbc84f0rqj6hjqmPwooaM68hkqWl6VBb0/j9tSwtbCum/R74/m7CsC3JKE
	u62UDLxEvl2whPMLrhsRj+M8nPZg7mruGwXQBRIwpaeQX07gjhIhTCv0eeo6+j7w1PS++6C7EjW
	53m/WL8vOCgVV2mK/TRHC8J+BN9MYfc0b/aHPTsqTNJiJxUkG5DHQCh/1pc2tPZ7rolQCv4AKJB
	FoVDqE+ZLlflWPC7m++vaNXhJG0x0KOhhv+AkF0JZWIZPMx8nsv/2LNRzjwDkMGkJ0rpxYj2np8
	1kzvgl0SC0V1w6ScCu32v69evA==
X-Received: by 2002:a05:693c:68ca:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-37967410b8cmr6889116eec.28.1794728998690;
        Sat, 14 Nov 2026 23:49:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 24/96] libjxl: upgrade 0.12.0 -> 0.13.0
Date: Sat, 14 Nov 2026 23:48:02 -0800
Message-ID: <20261115074918.2932593-24-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132294
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libjxl/{libjxl_0.12.0.bb => libjxl_0.13.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libjxl/{libjxl_0.12.0.bb => libjxl_0.13.0.bb} (97%)

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.12.0.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.13.0.bb
similarity index 97%
rename from meta-oe/recipes-multimedia/libjxl/libjxl_0.12.0.bb
rename to meta-oe/recipes-multimedia/libjxl/libjxl_0.13.0.bb
index 2ca52147be..922ea63f77 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.12.0.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.13.0.bb
@@ -11,7 +11,7 @@ DEPENDS = "highway brotli"
 SRC_URI = "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1;tag=v${PV} \
            "
 
-SRCREV = "a7a9c787341cf703dede03c2009fa460cae5e5df"
+SRCREV = "5a7da83447212fe4900fc29ce97430b881caa67e"
 
 EXTRA_OECMAKE = " \
 	-DCMAKE_BUILD_TYPE=Release \

Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.895.1793316669861129429
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 16:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=f2wKixq/;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a8cc11ac42so95252c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 16:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793316669; x=1793921469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2NQ0qFIdXrdDuFm8aL8riG2ae3vBy5gJRQr9tol1tY=;
        b=f2wKixq/YL5BKGeTq1ITOKVPh5chh1njX6R5O6jSVeb6e8Y+zkEThZh+1jGKuws1bG
         Noh4BDJYfGYly5zR/yE+qFS5BA5XgNq9/dvu8t0ltgRySYFtRCNi19ia8FNOGTrg/Ye9
         W9gG1KBiIbVN/9aeDY6l8Zhb8c3gs26m4DFmpPyqO/FDtxnIHx8Mkh9hiAPKSNmJ5Ohp
         NF73aVLMhY/GKf0wKXp6BX//+eo1MtJeEztvZLahxPduK0UyhIw/Uj26YKvapIWLhfGR
         umNT7FsLqpvdRrA1Pnc0k5ubmdks7qL7oDXWFyCxVKJpIA95pgOZeemfXIqUxkDV8dgZ
         4MEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793316669; x=1793921469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2NQ0qFIdXrdDuFm8aL8riG2ae3vBy5gJRQr9tol1tY=;
        b=zqM6Yjbar2V2D3+J5n08XLWzVYfUuFKbKtR9bnD6bhMDysoGsADrKEW/uWDEGHUVsr
         6KpY2tn/0FpBAKgT/XRvhEIeX43eL3neg5Xx4gKl6KMEqkK6nysgXKYjG6smC8hgro+N
         bL2y2sUa29nAQyT2Mac3AsyGolHsoQ/Zmxr4/ALt+jLeEGhxWCFBbQVdMkKWW17MifQ4
         Lesa25+upS7NFDXne09f3ZmPNUoOza3nu2gclFfJJ6mnrHRzuLzh8hF+0VpT8rUVPkTD
         RvLeg/4CM+BUhgPV8ebaAALnOYWgztMgVdyCKTrzfmjgiDJ1ae7DgMGnX/k0MtuYC9Z6
         3B7Q==
X-Gm-Message-State: AFq9FYLWt5/FRht2wspPlLyc6f33vHsoofAEARoONYE0r+z6IpJePU3l
	H0GpruiBdL2bKVfNqa9ZJIN8+XYa0XkntL7u+wu1sns0hbXYdGu+v/1qsa2cog==
X-Gm-Gg: AYBFou07FMBW7tsGXOlXfttw+Z2gb/AeDjuNRCc9QkEH/nbK3SNoKnUUBJ75wxgcsxL
	2mzp5Ti/qExIsQXemzI7/YTIpLaME5klz9Gvoy6FGD3rUVx/QpiPxw2AUD8AzX+NJ689WHYd0E2
	deCXhbmIpdJRxW3fQH/4EHCvxqdw9ZmHgkhEZ+4/UMoAAX81zgechudzkTteAsQr01OfQVyPpmd
	maq5yQoE8Pg6lhBeAXXTK3zKwd0+QLphvZt2AFW/7KRzab0/CVc1kVou5pZK6D8QiLjn/qLjwzB
	vmZLvaXVd9sueR+aB/AO7isXnYJ+wkkhn4IinVgUakmwuF2Aggzs0YxtMnXcFMSOZmtwjUVlrTP
	TQ12zGvbWV22PCBZMOVp+34aHenW5TYKjO9pPOT2p6rdq8S3jh0tkif1FHmVmqlzRtLedFmHAq7
	r2BUvsFRDo7Q0bjqYr3BKjYO/xA8AUa7k3iHbVgMPfhmzDcrCl443zE5EmkeqQkJO0ZT+mu7pc4
	cFjtt+lJpC/YphZi5j0VJAoA/apx1mxnkOoxpyMYpstYhDZQjNRcBMoUfs9pZZuideE0E5PcItq
	d69g78EBKJtsXc1BXvDZdJHgEUhirj/R0ThyFSLv77KrwIjGzD59uGQh1ZMqXw==
X-Received: by 2002:a05:7022:3a8c:b0:14b:cf58:ce5e with SMTP id a92af1059eb24-1ac4fa14bc6mr993163c88.0.1793316669092;
        Thu, 29 Oct 2026 16:31:09 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm2207349c88.10.2026.10.29.16.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:31:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/8] json-schema-validator: upgrade 2.4.0 -> 2.4.1
Date: Fri, 30 Oct 2026 12:30:55 +1300
Message-ID: <20261029233102.1177876-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 23:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131670
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/pboettch/json-schema-validator/releases/tag/2.4.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...schema-validator_2.4.0.bb => json-schema-validator_2.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/json-schema-validator/{json-schema-validator_2.4.0.bb => json-schema-validator_2.4.1.bb} (89%)

diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.4.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.4.1.bb
similarity index 89%
rename from meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.4.0.bb
rename to meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.4.1.bb
index 857fdb779d..3332468a05 100644
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.4.0.bb
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.4.1.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c441d022da1b1663c70181a32225d006"
 
 SRC_URI = "git://github.com/pboettch/json-schema-validator;branch=main;protocol=https;tag=${PV}"
-SRCREV = "c780404a84dd9ba978ba26bc58d17cb43fa7bc80"
+SRCREV = "9abddfa905bb4889cc4ae55f87adcaa71dd3bc23"
 
 DEPENDS += "nlohmann-json"
 

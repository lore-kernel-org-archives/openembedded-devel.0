Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.863.1793316674461089519
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 16:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=tb2ZKA1X;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-19305bcb72cso78260c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 16:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793316674; x=1793921474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8WU0KKBMeFSgZ0nIn6pLGV3vx5JUp6XokGXHe7ikCj0=;
        b=tb2ZKA1XKmgVeTKSqkrGkYkCS7j+SDzMrZ6M5H4Lp774kqdL4KNfxrBETDdyyMCuOB
         FWibjYvxZy6jrIfkM530ZyxjwJCo8Rz/xRizPcvrlI/eREu/xclTSojQX04yRBhyDM2A
         7hM0gXUw8He/HX1A1T4uJr7hVRfG3x9NiJgKrHqhmf19ArShVQFlHn90LnNJkYXZaYst
         OVxhqqDo4LbvK0l7h05QUYZlpJvYzt8wweoryGHE2aBds+9t+iLE2IM6MHwfD4fS02cI
         3fEsuyLo4YfGpeGJjA4pFStR/LkzOgg0eV2V2G+xcCFj3kXCSc8M4flhrTwFymAVXko0
         Q0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793316674; x=1793921474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8WU0KKBMeFSgZ0nIn6pLGV3vx5JUp6XokGXHe7ikCj0=;
        b=PRczZ8sad5eJJldMw/vxk7nfbEl0Hh2ESak0Bb4DHsAiNSjPfmfnHNh6VPRTxJw64S
         mZlwCumor3Ydhu03Vs2/iKn7m9dwW21Vg2nPDlZoM3VNumvSZ/dct/rfesvPR1TG+K/H
         k/hTeEQqRh1iIRcv4ecTh+JUEu9D2Zyz9r+7oZVZscVJld4An+LtbuulMP8Gl0OpB2BI
         yo4nWbROQjGkG7oU2S7qAKhwnACQxLJBE6sCli46f5YyhRpIpcpc2E3rNv5yocHxsQZB
         LJVu0P7nt8hSJBShWr7Apawkre0Y511bv3tpjaRV1bUzmL9Od7pT1493Wm71gi9J0t5I
         q6KQ==
X-Gm-Message-State: AFq9FYI2oeGFOK4ewNamycnt/BK3Pll6KFUvZTVKK9B7M7FJ0HsqwPfa
	wb5BpjX9dMooeUzbaJCDvX2c5QrJbJ6Jgt1U5Lc7wTGvHlFsbFGtoI1EgQ8qIw==
X-Gm-Gg: AYBFou2P+VuHYJISqZQTpyoggjx/eOQOLeboxpdildHGtMUx71MC7umoxBK4F1FMJR3
	Fgi1z23w7J76RQ0X0woRyjfUKEBiajFPDfHpeOTsyezia1gD/yidS9cZMIcXvWAHoZN/UPOWNtn
	hk/IXioRG1eoJAdxCF19NG6iZ4fjfpgPczIcubB3mC+2vQXt+S3boGjs7zO6EYay9+KNzac9TFE
	CpHhvUih3m8m5cQzIOvgc+ZQI9C8lWgrcaIsgwyNeo2byz5bzFj70caB9Z5lFl74qNgOwywqWV7
	CM/oxFl6DFrvfSwLXMSJfSb45RGO7VKnYGomqCTbR/aTSkxBVKAc4xmmzOkQQhnkm1KvneRGoj8
	7YKd+h0BuSiDiX6ld+VQmCMQcfFajkFtr/k7X+J6S9R1iNFk4rcjltQYgQ/PD/zaPva/9wNppK4
	nFoFXhyo/DzHE+g/hG0GDdJDxu5Qtffw3nOTZxHM768Kurbr++K/i2RiXRuiFUrpn2qPRkRqTn/
	5/5lDXoQB10zbeKtSp5kBTtc3rA3Un5BRbImbTfSj7/S3poNx31xPjnfdx3rVsFMairCI5++xd8
	meF9tZVpMW3HFg10XCiuZTjjON9cueDIJ9iFtnrxT2yvV3mpp9eAaTNwPmwBgA==
X-Received: by 2002:a05:701b:2702:b0:143:5cb4:30 with SMTP id a92af1059eb24-1ac5577508cmr714217c88.3.1793316673464;
        Thu, 29 Oct 2026 16:31:13 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm2207349c88.10.2026.10.29.16.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:31:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/8] psqlodbc: upgrade 18.00.0002 -> 18.00.0005
Date: Fri, 30 Oct 2026 12:30:57 +1300
Message-ID: <20261029233102.1177876-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029233102.1177876-1-ankur.tyagi85@gmail.com>
References: <20261029233102.1177876-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 23:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131672
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/postgresql-interfaces/psqlodbc/releases/tag/REL-18_00_0005

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../psqlodbc/{psqlodbc_18.00.0002.bb => psqlodbc_18.00.0005.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/psqlodbc/{psqlodbc_18.00.0002.bb => psqlodbc_18.00.0005.bb} (97%)

diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0002.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0005.bb
similarity index 97%
rename from meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0002.bb
rename to meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0005.bb
index ae1d603e1d..a770b60db1 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0002.bb
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0005.bb
@@ -26,7 +26,7 @@ SRC_URI = "git://github.com/postgresql-interfaces/psqlodbc.git;protocol=https;br
            file://run-ptest \
            "
 
-SRCREV = "95b35ac7cb2c9ea9df087fda08a695d89b8f8134"
+SRCREV = "f6da5647355b110fc9cc005100e23ba980e20e33"
 PV_WITH_USCORE = "${@d.getVar('PV').replace('.', '_')}"
 
 DEPENDS += "postgresql unixodbc"

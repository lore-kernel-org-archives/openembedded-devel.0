Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10251.1795752993268653785
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=iYHWAxqO;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-14394530ec6so1416072c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752993; x=1796357793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnTc4iQiHORxDXgISEoBAf6E94AScKv4+/V3LnO0sO0=;
        b=iYHWAxqOijAJeHQsrPk9+kDr46KmjWkkjpEZBBLHQ8zgq8ZdyE2YzIgOxvcW6Mm+VQ
         SZnAIGbGjt2YSPp91HOGuurX7/Dpp7dlK8peT15pSwxfWJo+TJHFN335TJ18Imxn1ZRM
         YDJAnM77zmeLYI/7ALqjIt3VHiRyma9s6t5zZ3CC/prjV7hRekQxZUVrf74LXj1hrEob
         nr8O3ciw1DFxSGpxfDHbF115cQ2PoLrkE72REbSF4lJbw5sg5kTmJ8xk+THuKdQNFXeG
         mRsF5pmE1a93PFCRYj/sCrB0f+hJqEKE5VCXRZoZOSA0w6xseQqQ3TsIbM0z1xjMgfSL
         POEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752993; x=1796357793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LnTc4iQiHORxDXgISEoBAf6E94AScKv4+/V3LnO0sO0=;
        b=XJmCKwdt+XqrsiVe7mEaKWlKAozZi27c61L5xWZ3sUNKDYy45vKl2KiQP2cRJBzJ6K
         EFZtHOpp22nVzBPwN6fr95DrkxrYNQ2bG0PcK4NPZQclYSr18Ugt+5VD7PEjLy/6AGLv
         5NrOrhw3vRJ18c/Wu+r5uveXHWzcjHaGGSpdGqpIrgGt5olsiZypcHD+mnh4GW7yTQrd
         S6A34FR0xY/Uj9CDZ/D+fnoGlMRaZfeiNdb+MIeKQgjFA8Ykgkvu4I373d6CvhZkJe2L
         S1lZ9G9a7g9ZZyS5UCb1T35vmozuWIfa1AbkZRN0aNAPMxacCbTEtafdWY3RWlkfQjBZ
         W8nQ==
X-Gm-Message-State: APuU4Z8aklzr1Yj2qV8F27yQryifAIxmxDGotebePKzi8RpTQ9xee6d+
	BDxhEtFZPoRaR/r1cG032EHeSBEx5NuIhdYSHtlLOOD6LaDn7ZaLkHMmC7GiqPrV
X-Gm-Gg: AZFdTZczWgd40ng8pmNnYi666UjoR1AxDXgFBdBa77Hs0nh2e1emN2oCeDXv2exDOoF
	ZWR/t1x1gi1TvPi+W/6x98FVl8i3BRNFGSYv9n2lLo/qVbmrDLzXlJxTiXb6jlbDNoZkv4Mlscp
	uzD+ZAzaSbjLFTgDKVsu0ltmCTtDqcrwTtKt1MGwmjAZdYtQeYMr3pl5dAWxvYqvkRu26pr1Wkz
	Ts+ZKRJjp+ve7NBzQt/Ky52sQ9JYu3ikHSzwEx92pPmiVdmGZnIDsszEBl0UHsbi64IjjmYe8yS
	gfvHUa5Y3HiLyyzM6xrgEJF9GHmKeLNuFaO2WdPV32UES+8AVLZiNgK6Fpr8KgXLgZiBtsBVo7a
	SRwxHFKglOCION0X+EBdP3wtnIpx+KT0VN1QPexJv2jzZXFClKZBhjBNGm6IJiWMBmUaCZw6B5h
	ctPcxiJXeoQA+221YWc7HaJcB5YX53PxMlwFTUDEWBkJFfXqmvT/fIk/UnsSN4xYisoFCqtB1Ik
	c7ZsvtUzp3uXrfuH/2Fa+1WBBY46ucwWcga8CfDKwva0sTMC5HOaQ+9na8zZQBkrGvgn451at+F
	l1Eq5y6NW87qIl60Cd0iznyYvZXpBC2e7/vVqibTyNp8XbX2moPfR9YTEwAtr2DaFwdnVsz/zov
	zV719ouTn3FRvTgTP2NjMyzQENUjEybOWSM/8bOmbbwiUmel0qZC7zTF+Lk9Yjj9ufCupxUuCrN
	fOJq3KsWSex5FwrEPC2yU80LhuxbuI8Ew8ZQ0g7rQIE6HzOwXuslyOpYMD27+v6ZzE2yU9aAKSs
	V/nk6TReW0ei4CURcrS/kvxo3s18+E+QCbbdvZQpu7o84tNR4i3K43uV7BsdM9ngFIVZ7Ili65/
	wsBX
X-Received: by 2002:a05:701b:2608:b0:15b:afce:62c2 with SMTP id a92af1059eb24-1b55691337bmr19906117c88.41.1795752992561;
        Thu, 26 Nov 2026 20:16:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 13/32] python3-autobahn: upgrade 26.11.1 -> 26.11.2
Date: Thu, 26 Nov 2026 20:15:55 -0800
Message-ID: <20261127041614.1775064-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133232
Content-Type: text/plain; charset="utf-8"

- Add TLS 1.3 channel binding "tls-exporter" (RFC 9266) on the Twisted
  backend; WAMP-cryptosign now selects the channel binding by the
  negotiated TLS version (tls-unique on TLS <= 1.2).
- Documentation and CI typing-check updates.

The pyproject dependencies are unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{python3-autobahn_26.11.1.bb => python3-autobahn_26.11.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_26.11.1.bb => python3-autobahn_26.11.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_26.11.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_26.11.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-autobahn_26.11.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_26.11.2.bb
index 681f46e5b2..dbf3ecef1b 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_26.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_26.11.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=49165a577911c4178e915dc26e2802a3"
 
 SRC_URI += "file://0001-Skip-march-guessing-for-external-cross-toolchains.patch"
 
-SRC_URI[sha256sum] = "1a081ca27ad5a0a04d3c7ca07b2caa6d324b8004383e36ae6eede1d5053e23b0"
+SRC_URI[sha256sum] = "01565594de3e1d1aaec7145ef7d6d67ec1c1f51412f6aa426e33f8b787b17bef"
 
 CVE_PRODUCT = "autobahn"
 

Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15255.1795015859530621038
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 07:30:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HeEtMbr0;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso11522295e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 07:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795015858; x=1795620658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xeckl/XnjjQVJfzlDp8voCBPNvAVItMhSfeDLKwCa2E=;
        b=HeEtMbr0N4JQ4Mu5EKze3meAA6FP0UWY919dP0gZhLlwHu70X18fHo5QfYjeB4A3QN
         oydK5ypeQmCFoQu4S02Sypo8DzhiaZbIQQmYeLnaXPOaimpnWTw5MqlB3hYvKpMZSGuM
         Hj6exmXFeJRQF6wIRVsjGzc1vDpXzMcFn3hzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015858; x=1795620658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xeckl/XnjjQVJfzlDp8voCBPNvAVItMhSfeDLKwCa2E=;
        b=eCEV11iebIwmOpWVry2/1q8MQT9es5vyh8k6qR0dpFG0phmBJut44/kJvpYY0JpxHK
         djDCEnktn1VI/iLodhs9FfL58x0xggKz0inRXAxr5dKOAv0YV2PHDEsJu5MbsqBM3CiG
         HYeQ/MR5RYV0Q1oU0yyjfdvaMWfbrkb1RMvuiDTQ0wEKKlfxmMRVOPkImgDg0TaZfC0D
         hXg84IBDnIfrZZ4RA7ePOPKPq7jPxx/kU44CBSydnUJsee4EtLEC9Jxw6D+So4j3mr5d
         1sLn1qlK1Z7wdelyadBZsGUDFeJ44Qvh+nPcKtZiH56H2cUBCk7kpHgUa/WZT+T2aPqE
         AG2Q==
X-Gm-Message-State: APuU4Z+Dp9HlGFRR1DnKeXGvpFtKrdLrqn2PSieIt2hWlitsGNvyd98f
	Pk78wSuk0St65RRND9Mrr1pEOXilzc2qa8CCzVPnGeglu6/pLrvr0lJSDTB8EpGpH6cH9BXUGRT
	Tih6x
X-Gm-Gg: AYBFou3T3fRHwNIDQk88M8jelHk9jeHLp4zqV4lWMtH4jTvyDe5yUbdRuBGnnWT8OzS
	iEQHAbiF4eWPaQrQtmSNxpm0nDVU5HQKetyYz8yJpj04SyPM2n97DfGzHhbQBDmuUV93zsjyztA
	hM1ru9rbEvAtRTbGJ8IKDvtCvu2n3jSMVVn1bxuilb/rk9rDE27NndjNCFsBsQJzeMA04am2a/M
	4kvR46826HsTwviv+w7py8bkPox7CVIh5KUBixgTpvMCLUSkg/Pb8qtNd+FKCQJGUI0JZ7j0+Fz
	VU9DrvVtjnAvkxrNVSa2Zvl/pvsdv5U0e82ySa+TPXYW9uC+4wrnvRwDlQ1tMFmv4HCuag+ahSY
	XF0MSmNsPouAV4ToTB0YhefDBPiI+SYm8MnQXk87ngGnD0UnYWAwn4oI7ImSG/jjT2I4lq9jIQo
	ZMH8MiBl1Yan9Qq0jbvtRB7maMVWj/G535VIbnbVeviVeFTcEtFt8pZm68hsdgZzD762Fwh/AM7
	NDBFck6Yw/edwOaa6O5QeZCw9dw7ln3A3rGwo+kQ29fDUaXrQI7kjYuYsxTQl4GwIXfa43bzyPg
	V5+i8OG47G1b3ewBTsBsgELniLsDZcwJEGYrjoFTXyxm21vIyuYz5d/ubcwN6Uct5TY85Mys9kd
	YWn+hSlGuzdZuigfpyUliQ0e9H/bLTKcF/x6qzvmcNgL/bXeDJHTKfV4=
X-Received: by 2002:a05:600c:3107:b0:4ba:eb:eb9b with SMTP id 5b1f17b1804b1-4bb7da1272cmr57465005e9.8.1795015857784;
        Wed, 18 Nov 2026 07:30:57 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm150214265e9.14.2026.11.18.07.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:30:57 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/6] python3-cantools: Upgrade 45.1.2 -> 45.2.0
Date: Wed, 18 Nov 2026 17:30:50 +0200
Message-ID: <20261118153053.922769-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118153053.922769-1-leon.anavi@konsulko.com>
References: <20261118153053.922769-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 15:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132658
Content-Type: text/plain; charset="utf-8"

Upgrade to release 45.2.0:

- fix(database): preserve metadata across CAN database imports
- dbc: load and dump Bus.fd_baudrate from BaudrateCANFD
- arxml: keep integral enumeration limits integers
- sym: use the longest Len of a multiplexed message
- Escape quoted signal units and choice labels in DBC output
- c_source: escape signal names that are C keywords
- dbc: keep CAN FD frames from ARXML and in-code databases
- Read relative timestamps in compact candump logs
- Use the frame format when decoding candump logs
- dbc: rewrite a loaded VFrameFormat when the message's frame
  format changes
- Read nanosecond timestamps from candump calendar logs
- tester: use raw initial values when scaling is disabled
- Fix for Issue Overlapping Signals / Multiplexors

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cantools_45.1.2.bb => python3-cantools_45.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_45.1.2.bb => python3-cantools_45.2.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_45.1.2.bb b/meta-python/recipes-devtools/python/python3-cantools_45.2.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cantools_45.1.2.bb
rename to meta-python/recipes-devtools/python/python3-cantools_45.2.0.bb
index 1ec1866f3e..d649ca74d6 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_45.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_45.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "c9f9059ae9028902065d5fc4478728749e27815f5548e6b249f963350d812e8e"
+SRC_URI[sha256sum] = "55d380f608c4cce0b45522b05ee2a32205ffff6cbc4c4cc9a3de85ac20ed55e9"
 
 
 inherit pypi python_setuptools_build_meta
-- 
2.47.3


Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C17C2A086
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:02:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61071.1767607369366450842
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kagFtQLb;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so90458385e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607368; x=1768212168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBJ77HUV+lzwH7N/1GZNtpMc+jrlE+ktQRj3IRFIMkE=;
        b=kagFtQLbwdLP+8fFaegmgRI2qU53jkSl1kxrO0GaNN/oXVEPp/P7IemKlm73UUgIZb
         IHicVSsjqdjbR+Q5V8ekI/hDPKSOaJHWoRGliz+JrhcuM6vMxRXTPPNgTTMmX9ahEy0B
         3gHPNVRbBU4CK5Z2sDLfhWuk5a0MeqqZ/10MrVoHhDdoIOntnWUccqnWxrZam8Yf7soI
         bkHPiBN/mj2E+xHN+/9rTZtCiToO24OL4ve4E8JBC6E/BtYDPd6GQg60w7Rnd6axCxh1
         z9CvHRupVAnpviSHdxOwiQ9l8wpp0CgzT22eF5khruu2Zz2genfkXBea0TKz0LWUSvjP
         kHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607368; x=1768212168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iBJ77HUV+lzwH7N/1GZNtpMc+jrlE+ktQRj3IRFIMkE=;
        b=iUYEqmUPBZvYX3AlOgSl3INwoJrdqzC1shWo3GxmzA20JRvdG+4JSawRX2XSpJyZEZ
         i03jgRW03wzMgAWcqolaV0X0Owhm9f3rr5fpjQwKCUCwJA/p7huobJMS9hJdjQLTZ7Kv
         +NB4pbN5PwiZWceWj+wq4w82W+b4aO9amK0NO+NjclmQHuCeGHCJfKhKwCIH0s8+epcS
         ciJ4+JbewB5sDzTDcDfw3cv3ATNsO+hCt+LXQ/AY2js5PudPdOwzzVTpgagnPKTA3zjQ
         zQeqxH1T+TnrdpSzzzatvhIFXlryWBQuI9ZQfKhFlwzL8At+NyI6FeoqKhZnPAy0s8i3
         UGzg==
X-Gm-Message-State: AOJu0YwX2yiEsfWbUVUzTncKfahtFYMp/7POWheu2vyLOb8GBIiOWSNF
	AIxOPB92U/PdaI+09UT5vMsoh4XxCGTtQfOq0WMnyRN+LiSW79VVCu5uX1erRQ==
X-Gm-Gg: AY/fxX5pFd4xb13OQPrzYI6rFaTMCPos4jaohhVE3Zquuz9V/ZJmXh5qmtnFzq2XMNR
	IPv4aKgdaXa5/gNIbRG5UYU3CxOLWg9kVVMi2Hnfp7ZD8sL+MAoPuDEuYlpQ/5xXV/JWD3r2SWY
	rtZ16lBCxhi9iBoiFRDPJAm3piE2zQIGIRzHn/ncdoylRgQIc8wSnregvgcx8Bu+y5O5wewiIDl
	G1O4j6nPidzrO6hfgDc8jOagSaawWFpzXJBS3pqUNgVBncj8YjBbFd5ALc+gxxCDn5BCCQyBWCM
	mwS0P+86HzKInhsUidM3AQIuk0LsuQAtIdIjdJfOqSz5nfpdAsI6L0STzC9aOc+xv0krDOgZqrn
	09T4aUhVtO/RufWw88Ed49Liof/9BY2A/7SbBnGGYI2PJWC1zWeE5QlCcCXo8TkIw3nD0ZjRtYA
	DDwf8xrjzp
X-Google-Smtp-Source: AGHT+IHwkITJYmuWL8Kmh060gXOuyfgHpGmldCnOmEjfRAXOmOyskXD9E45+ZMHhjiOJjwDnxoEeDg==
X-Received: by 2002:a05:600c:4e90:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-47d19557183mr676953825e9.15.1767607367682;
        Mon, 05 Jan 2026 02:02:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm144604435e9.10.2026.01.05.02.02.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 13/17] php: upgrade 8.4.15 -> 8.4.16
Date: Mon,  5 Jan 2026 11:02:33 +0100
Message-ID: <20260105100237.3081345-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105100237.3081345-1-skandigraun@gmail.com>
References: <20260105100237.3081345-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123144

This is a bugfix release, containing fixes for CVE-2025-14177,
CVE-2025-14178 and CVE-2025-14180.

Changelog: https://www.php.net/ChangeLog-8.php#8.4.16

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.4.15.bb => php_8.4.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.4.15.bb => php_8.4.16.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.15.bb b/meta-oe/recipes-devtools/php/php_8.4.16.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.4.15.bb
rename to meta-oe/recipes-devtools/php/php_8.4.16.bb
index 629eef0519..870cb663e6 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.15.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.16.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "b7155bdd498d60d63e4bc320dc224863976d31b5bd9339699726c961255a3197"
+SRC_URI[sha256sum] = "6c48c65eba6a2f7a102925d08772239b1f45110aed2187fdd81b933ed439c692"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."


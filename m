Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60852CA5FF1
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:08:33 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7180.1791371306405118745
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EiK10Oqp;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a02551822eso1681812a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 04:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371306; x=1791976106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwDvkYG7Eb4Pslo+g5iNJuxc4ZilgbEEj14eYSj5xSc=;
        b=EiK10Oqprv2NWYlpR/HQRBzQLtO1PKYQ0q0EM7bwfbhUN92wbSUTb718zJ3Z8P5T/c
         TAZ+OilkX/lbM6DXb2hZpUV5hvNi1FSzSmZyZNInmnevwUc0WDkYGhOIS/ZKFbH7kpP+
         xPZIaLVzaHJ49RrvTDHodBNajaczAyOTnTT/SvVBDO20LvUsoLaeiQHltPoBlyr5LraR
         s4JmHK+/8TPbPrcLl5VKlpE7tXqsTYzl+v2bV6fMtqLq8nHFrVy8yObfRA0yH7y0rf1x
         NXk+a+/1WxbdQ3cKER7ICcvJ1jybf02TrF2T4yK+xjsY+kaFvQAfn4RYOrp3XD+lPw70
         87oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371306; x=1791976106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwDvkYG7Eb4Pslo+g5iNJuxc4ZilgbEEj14eYSj5xSc=;
        b=KNd/eBS/1kUBqZ5HTWyXKWwV9EVYTy8+XhPxFe1x+PBzOseHcqBCXjESjJT7p1dfP7
         Bw9wTGzSj2kCKG+6OBxCxbSElpjLd6x/hQupAP9PAPIuzsPaGJHgDzAp0lv7MtmNy8xw
         5A1gjM0NZXkVgzqYZZXGBpw0+GFwXdVA/vNIhsDl+bGbM8zL+7F6sKVQb0GTSQe4C1Ne
         zH2jE4gjxS/Szppx96egloFpq20DSagbCaLZ9w0/z+JqZZ6OAmcenP/wNiFtsjDBWPQz
         6WNFHdlNX7ZOJUhmDsPgH5YYVKtg0iKuDp+KVeNSL9/E+Cg13AH1FmPTtncXeG4UdXm4
         5u9A==
X-Gm-Message-State: AFq9FYItZw/UrTSPGBg4ac0yhAqMwdbtVH5bEZG0bg3GzFJnd0P+aCXk
	yYHxfUwBxQ4eS2f3U0Y93yGPwT6KPm9rzx72kWnMTymID79NgnaL8CpRBRPiJcYN
X-Gm-Gg: AYBFou2yyPo0jQ3UOrn1D4hxf408dXCDbSNO4sPLFcRgcUAML68NBsrqlyBRoCQ0s3l
	WON5b7ZKTytyTdW974+2XehzpyA1j8PZWWmXlKwZSe9jT1zOB7jEMmFQ2EgExXB/E57OCnKHq+E
	N+g6VXMSzD06A7o0pGV/qlbtxM6hXf9zj7B/a+6lE6dhYEFXwa4V6vA+sH4Xuin/yd8O/ejfqFR
	aFhpax7+iSHGKA337Cfwc9E+1kJxB0BSiwBQbjeZ0NXBDzAHrt588BIFVlxdbfbwlayFoLrPaA2
	QSnCYaEMta/CYUJ+wnMs+fyb8mr1JUyPk+dJiElgErjXZdEGNTqV898rTRG0Oyi6Re5pHJPyG5C
	SrQ2HbX5GitAsXlaglQw67EKSFzioDFlRF1NChdE5Vkh5fyBC169QQIyFDxSfnPI7w/b4CuBnfm
	OkfpvinPfPJdlBNxGgWxjDw9ZoY4vyMbLY3n57ZECT5/aOHjgsqfhFsa5tzFzthSTAzN90hQAFM
	Tvsde7PuL/PFiRuC6hjIwc0ZJyYMpdrQg==
X-Received: by 2002:a17:90b:48c7:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3a8a0ba1c96mr1001942a91.13.1791371305672;
        Wed, 07 Oct 2026 04:08:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm10862177a91.2.2026.10.07.04.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:08:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 13/15] freeipmi: upgrade 1.6.19 -> 1.6.20
Date: Thu,  8 Oct 2026 00:07:38 +1300
Message-ID: <20261007110740.3179543-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
References: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 11:08:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130655

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- The format specifier %h was used for two different format fields.
  Use %H as target host specifier.
- Fix minor output errors in Intel Node Manager DIMMs and Windmill
  device IDs.
- Fix ipmi-oem command line parsing bugs.
- In ipmi-oem, fix error in with wistron get/set-ipv6-trap-settings.
- In ipmi-oem, fix output error in dell get-system-info cmc-info.
- In libipmidetect fix potential hostname sscanf bound overflow.
- In ipmi-oem fujitsu get-sel-entry-long-text, fix potential memory
  buffer overflow.
- Fix ipmiconsole workaround flag parsing issues.
- Fix minor libfreeipmi corner cases (e.g. parameter input corner cases).
- Fix minor SEL output corner cases in several OEM vendors.
- Fix libfreeipmi macro inconsistencies / errors.
- Minor documentation fixes.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freeipmi/{freeipmi_1.6.19.bb => freeipmi_1.6.20.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freeipmi/{freeipmi_1.6.19.bb => freeipmi_1.6.20.bb} (94%)

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.19.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.20.bb
similarity index 94%
rename from meta-oe/recipes-support/freeipmi/freeipmi_1.6.19.bb
rename to meta-oe/recipes-support/freeipmi/freeipmi_1.6.20.bb
index 697efe004e..1b768042d9 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.19.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.20.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.sunbmc;md5=c03f21cd76ff5caba6b890d1213cbfbb"
 
 SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz"
-SRC_URI[sha256sum] = "f95c2b73797c4a0341a42a7b3c43efb60954c4130d082ad348fd40da554b4e85"
+SRC_URI[sha256sum] = "9cc644530ee629ffb94d6fd209e7cb4a8b8ae6677f89d2dc461efed9b2e709f2"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/freeipmi/"
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)\.tar\.gz"


Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99022D3C535
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 12:04:42 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14137.1765368277742881149
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 04:04:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HHYy+iQn;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3436d6bdce8so7298283a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 04:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765368277; x=1765973077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCH65f5UlQsRVv44tBkkNgZJh9xp2ZpNsth0gwRFBmw=;
        b=HHYy+iQn40ttLaa63jqD+0lwblSgTABavsqRa3TbyO0uM+8C2ErXgCZZzJiQT58mMo
         U8l/dtD/+CC+4smqGAcfI4nVkHEP6sPwbw8Jw1foC3xEejOFfPDq9GTbmmaSFQ32Pp7H
         JA7rWCwNRdyvPcXfapJCpgGMmfMAuZPyiY5ndOtAsVwGPrhGtqvVxunP1Q89q64wDaFu
         0DGyu1Rg4BkWlmSM2u/qXpx1AgmevGsm/H8nzS8eTobn04XuohN23aPjnJGTfukoFZ2u
         tOJyMiPieJdTiVANqVacDEnUSK4PQ5fdUf39GA5J3K8pSU5lRZzOBh+bCL76USCXXdgW
         j5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765368277; x=1765973077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OCH65f5UlQsRVv44tBkkNgZJh9xp2ZpNsth0gwRFBmw=;
        b=ZSPadCNODGeyGHDz5aQBKhdiDC5KKVr+KqtmLgsWYzXcZzuNliWiWDby2fF6H01JBd
         7KwO8qgcvwwCzScz1McbefcUteukyELBv08hxH8DUOiINiu6ZM/5UM5bmx+Gpm/3NaAN
         RfmxwVf9HowM14K+aDgm36zwfQfJlBWVdlNL3Os1AlfZ+MmYq8Ojs5iwP/D9cgNV0t+A
         f96xf18gXb6Sp1vRdpRD5GJ61cwWlfwiSZDWVovEvmskLVwZRpriWb5qvTdciUfbi02z
         hXdhrWCIS3enKMN8lZK2fyna3YFp9O9SqQTTjYLkyTzN9ULu9hyANnOMA0RVPdFWNeqg
         cNxg==
X-Gm-Message-State: AOJu0YxfgdOIWM3UPUOhL7CYl6xS5djDikvtI3S/qR4v8rgoYR1q6Pds
	fBP5PEeE15nxgQVWA+WP43XBNSEU6LDck5rZFgtrhJ+kBrLSl5W6DsNUljhNeA==
X-Gm-Gg: ASbGnctb0yzdmqRmaWxnTWAeBefROSl88yBYmDlmdB+Jwy+ZDjQxsrjWRZ3wrFHsIA7
	y2w0II4ehMT8Qr7WDgbhFmExSPRZDOXT/ra19N3mSDkoQcU6JfrvVXOlgxaqpY3sSg3LDjXKMsJ
	DJF50Mx3oYijjoxq0TDPjkJPaLwKPkwIUGA9SOcFvpBqWahDe2bJq3SBM9mhntewi/p0dvxAan9
	jAJQ5Gmiij0Hlv8bmXLf4ypHWJwjgTQ1fNkvYKkcGp9JbzNB9dE2AB1/kVZIg8jRW0QZEU/jVrX
	3H2/4AC4NJRz3IFO1ewz6FKUz1EXmtZv0Mz3bHd9dKRaDQloiJ2gYyTOisadG8blPRT1hQ0dQFK
	YmxEjQvVbMe82MdA7W6prvPtNdM7mlZCmam5lAKGPgFuIlMaNub8C19wv35+r6QfmUknTYgJ5eE
	fHo1u4PMWoaCo+Wz6zDRM6Lw==
X-Google-Smtp-Source: AGHT+IGQ+ntgfay2jVZAEn5fMfcEuAnz0VkaOyP85hlOIv9FPIGH+qB1/fKKleJhECEgQImRzkHSqg==
X-Received: by 2002:a05:6a20:7350:b0:366:14ac:e1e4 with SMTP id adf61e73a8af0-366e36bc0d3mr2215264637.74.1765368276815;
        Wed, 10 Dec 2025 04:04:36 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.251.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf686b3bad4sm17767759a12.10.2025.12.10.04.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:04:35 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 05/43] gpsd: upgrade 3.26.1 -> 3.27
Date: Thu, 11 Dec 2025 01:03:19 +1300
Message-ID: <20251210120402.4179289-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210120402.4179289-1-ankur.tyagi85@gmail.com>
References: <20251210120402.4179289-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 12:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122509

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-  Improve support for newer signal ids (L1/L2/L5, etc.).
-  xgps add signal id names
-  gpsrinex, support new signal ids.  Add -g and --gnss options.
-  Initial SPARTNv2 support.  Disabled by default, terrible protocol.
-  Many ubxtool updates for newer u-blox receivers.
-  Update driver_ubx for newer u-blox receivers.
-  Lexer() FFI interface is unused, and deprecated October 2025.
-  xgps and xgpsspeed work under Wayland.
-  Add support for Qt6.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2c18b9a4410683b14840b04bd30748e0104a3ccc)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-navigation/gpsd/{gpsd_3.26.1.bb => gpsd_3.27.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.26.1.bb => gpsd_3.27.bb} (98%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.bb
similarity index 98%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.27.bb
index e4a571daa6..41a3231069 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://gpsd.io/"
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://gpsd.init \
            "
-SRC_URI[sha256sum] = "dc7e465968c1540e61bc57c7586d6a57a0047212a014efdad348f907bc2e0990"
+SRC_URI[sha256sum] = "6195292dd7910be68cb7018d45166283eaefd3f9db9773fcd6e9a78d49eac999"
 
 inherit scons update-rc.d python3-dir python3native systemd update-alternatives pkgconfig
 


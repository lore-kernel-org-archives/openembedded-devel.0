Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679EFC5DF7F
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:39 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2349.1787029352949109827
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fE+lHBWT;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc11a30a259so3103699a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029352; x=1787634152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCOk0Vg6ixW54YMdNXfX/iieCtcdVPNoz/bMXito1ls=;
        b=fE+lHBWTAVg8H8NbuaWEclUwcK1+krmBQhJwb1tjAIh8tNOnrsUvh3OCiSOCMbLIit
         spZHCWCTjGjACNH9MBoJHMUxbowvtwZxlEzTVgt95NyEAKQhBlUtT6MuI86OLVQH578Q
         DynksXniQeHyinlD1YQz8DRUYlI7VEQ+UaLEbKv8i5fvIvKqNkLOOh3hvTJKHXKTPzKs
         DDsn8Z0Lanocp0+ylR2Axuy0sNxNgwhPoawy4an+yivt1+00UwTgTI91JlWD3+i5UNqH
         bzfoDallptDSFqNY2DlchxQVcJPdgAxO7GuYY5QCtwNGa7sP+RfP5ewqCZdSbwuT0odq
         nFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029352; x=1787634152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCOk0Vg6ixW54YMdNXfX/iieCtcdVPNoz/bMXito1ls=;
        b=H2I9WGKADFlK1ETYcDDgaH4hdo5nNdkjHEXO1NkChyOtcjvYcowczWc0saqJeoxWPb
         B6ZowpGVAOylb4leeXakiu5qCHFaSwEGPvXwpnV5O5LIeQ/M15QKXVw7+FoQmdjm/6sc
         Jwtq6+KEvoxQB+nsJpGLS854Ds+4SMf4Y022v9Rj2lG+HdW36DSnZ9A07B08XFrZrN83
         at7lKMaYWyl6oZjVEWc6HG3n85gNZT/PI0f7Vr5dIDVsLLCIQx5ll3Sh1Dvwb+3auLp8
         H1uScK1d++zwT+gHrz+QlcyB8KUI1MIQUINrxB7CEA/s+y6Xzi5FNqjrEpI9mgc6Afg/
         HZCA==
X-Gm-Message-State: AOJu0YwTm7wYbpYGgbczWaBFW6uq5jT4tUyuuAFmKkaJqLcSM6YcdzMM
	D9Z3dKazcMaR63igeLkeL4l0OekM3dGSRK5GJhxec/H6Enpgsa7nWNSq2dMbqdSd
X-Gm-Gg: AR+sD10zRcqpDQiNXLgZY9PQibMAFnpWXZBkrt+KhC2TAsZasu4Hp2mqsMI1wJkwzqz
	JJEjM/lmBWCO7lnomyMZmLAKHJlnxvnX4jG5I85YigM2bjM8XcF4+Z3QEz3NMj6i1qvy2kNsBH+
	n5J91HT9pTtR4KqLjNUG9oB4fKBeAnDf9uxvu8ejL0mX6SjcD779mdxngvV3AoWncg3amzyN6I8
	F2wasf8bXrViau1RCyIIH98SPfz0mtkgiDR7gtPbpPqGpHAF+Yyy49fhAY27lSXJQECFxv5A6Ag
	XcmIrM4WBcVAzoN7ciCtTmn0FxSTo/rzSyB5aG5OOrslVZgXWgfCtBvGqhoHDgOSTaa472V/6qb
	8UbHYSMOR759M3OFBpgDW/wYKDHWM83+jJI7bjCvk50fFrTf9P8wGNWYsjKL3xzmszWKf420KJ+
	MO9Ag57k59iqktDuukiVy4+hDHdJtzSw9vjkrhd7JDf1sJAuS2OBIbI1Iq2LyZXsTlRw/OqZKK3
	1zP1pGC6c3+
X-Received: by 2002:a05:6a21:9204:b0:3cc:369f:a03 with SMTP id adf61e73a8af0-3cc71d58bdcmr35231899637.20.1787029352243;
        Mon, 17 Aug 2026 22:02:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:02:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 20/27] libnetfilter-cttimeout: add UPSTREAM_CHECK variables
Date: Tue, 18 Aug 2026 17:01:15 +1200
Message-ID: <20260818050123.2901739-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129219

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version libnetfilter-cttimeout
...
INFO: Current version: 1.0.1
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libnetfilter/libnetfilter-cttimeout_1.0.1.bb               | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.1.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.1.bb
index 46576f4d32..9157b6bfa7 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.1.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.1.bb
@@ -14,3 +14,6 @@ SRC_URI[sha256sum] = "0b59da2f3204e1c80cb85d1f6d72285fc07b01a2f5678abf5dccfbbefd
 S = "${UNPACKDIR}/libnetfilter_cttimeout-${PV}"
 
 inherit autotools pkgconfig
+
+UPSTREAM_CHECK_URI = "https://www.netfilter.org/pub/libnetfilter_cttimeout/"
+UPSTREAM_CHECK_REGEX = "libnetfilter_cttimeout-(?P<pver>\d+(\.\d+)+)\.tar\.bz2"


Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63620C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 04:03:17 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.67253.1744084994214835020
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 21:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PA1eL8lG;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: alistair23@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736a7e126c7so4571788b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 21:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744084993; x=1744689793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RgkekoFVgef5uWDE6PvKX95Xt7MKtdu+Hl+l7MNTGss=;
        b=PA1eL8lGEoHtOYHjHnS8iUTr1dK3FklAvZ8hTU+fwnPDaUWQ/ktcEica0nSqwQQXjJ
         qzeP9XnkIsLh0GVxmyQyFG+oSS4z+Acw5RcutkhESQc69PBpytmQUghqC30yRSZD2RjK
         naOJkFpa4JahC2YAv/E4NU7N0hpTRTA4cNpLm44Un4t85sd5IUjsAzrk2oBCxVeyCdnY
         ikezGKm9UH6ZBGCgl5aRkWWDoae+UzFmywzxY63eJIuSEVqpkuYYDSm+iZx3R+MCpdz7
         fT1RVIryyDk7uTNbps4FdWb/aQhbCvvql6/Ndnensboi/FmvB69QvIJwhCcnO3rVwekM
         nqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744084993; x=1744689793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgkekoFVgef5uWDE6PvKX95Xt7MKtdu+Hl+l7MNTGss=;
        b=EmS2I8UUUuhGdp5RpZfvLuI6BLpIy7hXb6J0fElpj+roLS9DR+JDCsunKeYoo9gr2i
         dUtLNzKPh94a0XaUXvYs8CsrkwoGCiBb0wcZhsRBR/QeePwkUuxWQL8xdQpnkjWeqFhu
         PzOInaU+BfXFPgmP25bNNJR8DLQBgGyLBTUaUBkm+fEEEJ8ObY6CXozsQSlyxz1XwnMk
         jaWaUlvZ1zWzLLttXWdk/WAcGIUg6u4lEppsR2c8G0yW2JzpEFG204GdfqIRxy6bmnzI
         KRGSb/bM3WaV8IWepNf3sdNy+LSgFb7uGQh6QksEcqoc4XkYs406KW62gu4oY7bbhdfb
         6PMw==
X-Gm-Message-State: AOJu0YxZ+mH/bLmE1k4aVPsUgExx1u/HT+ELqg68r+7HaizkQ3UiZiqR
	rcFVT4+df6kGyPOTpEN8XTxsEScTtNcGRbrKXt5VTsFRgx1mY8SiGDPinQ==
X-Gm-Gg: ASbGncuxHZyjjcW0TEu5FMLH170dj9ijd1kiMPifC0Y0Xc9r3gvr3xn9MupYk+KkVME
	iNlgduYyOY4wcG9szI6/JBrJQv07i3kbzqLBvQ1caUOm04wc5y2LtncVIwVoBs0y2IWk3xI5Sav
	EM2/1Z2MR/fTB/7vTjtwD+1Gx7279Qfg8n3zIPVrO1ZT8eMm9Krg04J8335paj9k6E+02+TbXM+
	ipiyu/2U3Bdwf2WNC95Sxv+YCV/EU26qniRiupyJqUPRQi6jwrHf3S3qReqQLYOsZXruZ0b7GF4
	KOm0O+QMHpCai/Vcn9NYt5XyBUUk6sO5HJ8HUO6yLm5q2Zfr4qTuEDn9mTZDLHw/CEvEsEezybR
	DdXSl8zKanBH491rVwN7j4C4uRrUjD47n74p6VuOvExotEf9AeA==
X-Google-Smtp-Source: AGHT+IGJW+fHI4jqNjNg2tPgc1F66w2JXWnDNzphY1UgVimtVq1aee9ZNlVu04/dwQ2sDp66/8cygA==
X-Received: by 2002:a05:6a00:2e14:b0:736:4bd3:ffab with SMTP id d2e1a72fcca58-739e4be89demr15117388b3a.17.1744084993181;
        Mon, 07 Apr 2025 21:03:13 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d2f63sm9466291b3a.1.2025.04.07.21.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 21:03:12 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-oe][PATCH] ktls-utils: Initial commit
Date: Tue,  8 Apr 2025 14:03:04 +1000
Message-ID: <20250408040304.4005939-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 04:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116685

Package ktls-utils which includes tlsd.

This is used when in-kernel TLS consumers need a mechanism to perform TLS
handshakes on a connected socket to negotiate TLS session parameters that
can then be programmed into the kernel's TLS record protocol engine.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../ktls-utils/ktls-utils_0.11.bb               | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb

diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
new file mode 100644
index 0000000000..e85dc4ac72
--- /dev/null
+++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
@@ -0,0 +1,17 @@
+SUMMARY = "TLS handshake utilities for in-kernel TLS consumers"
+DESCRIPTION = "In-kernel TLS consumers need a mechanism to perform TLS \
+handshakes on a connected socket to negotiate TLS session parameters that \
+can then be programmed into the kernel's TLS record protocol engine."
+DEPENDS = "gnutls keyutils glib-2.0 libnl"
+RDEPENDS:${PN} += " gnutls"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d568123389d9a12625cca2b089b1728b"
+
+SRCREV = "5c3314b5728b272cbaf0d98f4d521cca9610b6bf"
+SRC_URI = "git://github.com/oracle/ktls-utils.git;nobranch=1;protocol=https"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig systemd
+
+PACKAGECONFIG[systemd] = "--with-systemd,,systemd"
-- 
2.49.0



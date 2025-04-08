Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD95BC3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 05:47:47 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.67885.1744091257814977696
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 22:47:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kuWBWvqV;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: alistair23@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-227cf12df27so38730945ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 22:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744091257; x=1744696057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/pFePGLMJ5KirumK3iHvdAVwU+uhl6lmx6mNvTmDgGw=;
        b=kuWBWvqV0aR2bGAaCKEEcRikGAdpraR9Rq+YjCf9xptrL+SQbWCJExHn9bewhMb4eS
         VgBYmBmG5gvYz19n+v9d9ArB6nUrpowJnl6n4Etgys4xkA3mDlX+wCQ+UtMbuJzapll2
         WL2S4pBd90EsD9mK3HzewZ0aO51lOkEH9pgHqLpeyorNKW+RXo6/9VPHDOgOgn0TzVFk
         tC8UnV0Y1D6UlejNyF+ZPO2A7UmVFzzvpLA2I7HKa2tvwiOKvhfbb4ofmBLqnPAWfInd
         MYJnVaIS94vF3R/tJdFfoQnQ7MrncGszOasssfQhdsLhJOi5h6qfgFVRLAOElB06u2rC
         fiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091257; x=1744696057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pFePGLMJ5KirumK3iHvdAVwU+uhl6lmx6mNvTmDgGw=;
        b=dE09XbgVLBFAf7cEv7rrMl2Al8gnb+OfAH3bFaWIisoH0o7KcLyD54ZeKPJX3H4qOO
         cCVqu/sigHIJ6qNbN2W4G5D3tn+FGWDQ66zpAF1j3O/AYcYSzlEuk9AZqeoEX95kL5Mg
         GIvurEL6kuEQWbRyrJJc+ENxtPYzAETI6gCys4e4fSnTjEWCidI707a3Janihl21+OLB
         30KXiwA8G44Tgu2jMlHcK3hfTbDvgJux7z7MZgOf0tsVkwB3tcfE0hwMnW5Bg6sJNMkL
         H3dX6U1yIeuIUm5w0Q1SLdlmm2s6EQ7f3sCDseSmKV13Ct58TaIpfbxGpBPT/aEeOS+o
         Vccg==
X-Gm-Message-State: AOJu0Yx7ZgG+RFaC6OPHb2aP95uzrT9W/J1WM06XNHXI4j3kHzlRJXnP
	yRlXgbuBiAMJB9liKQS9pRkRahFuvf8WiZHKLQpJTDBx6GEikjScDr9rOQ==
X-Gm-Gg: ASbGncudaH1Fdr2s7YIHCI0Dc8urrmXeo0hShmvoAF+cIlnY3ARGRPGYcaWpOA8KPrx
	fwjrEzcsF11HQAUmPTAo0AyVifKykW16FAkQMlGY+7fX/3PwOXuf0OtkmMZXvDTyLZVOD9O/OxS
	Oa1+JETVt4u414KJ6NigKN87oBqHp4KWkCzNkOGqhG1CxuoggprugRfe1r1wVOoZj/WelpuKeY9
	/rXxkGJtMh5xBoP2lRJe2B37tZd4sBM6B9SqwlyEOwfwUmzGu8zXayeQmFpQytUYoAY8b7IQWBU
	oI/7U85kRjNepIiK1UlCd/sBy8V97A0R5/lN85hOsCBKC7I4jW5PqAJmJaW8OK5+X2d9mVXLrri
	tHPQouC/aRUV/plU8GHmaaASwxiyHFmZfwVztTanjCgVomfT82g==
X-Google-Smtp-Source: AGHT+IER5pp2b5kUi3DVk9uK3VseCBFRNofERPX+ceM0OZbR2nuUH2CcWah26Z0F7wa2vG3QnRwhRQ==
X-Received: by 2002:a17:903:285:b0:21f:40de:ae4e with SMTP id d9443c01a7336-22ab5e1ba49mr31515815ad.9.1744091256842;
        Mon, 07 Apr 2025 22:47:36 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787728c4sm91599225ad.222.2025.04.07.22.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:47:36 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-oe][PATCH v2] ktls-utils: Initial commit
Date: Tue,  8 Apr 2025 15:47:24 +1000
Message-ID: <20250408054724.173577-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 05:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116690

Package ktls-utils which includes tlsd.

This is used when in-kernel TLS consumers need a mechanism to perform TLS
handshakes on a connected socket to negotiate TLS session parameters that
can then be programmed into the kernel's TLS record protocol engine.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../ktls-utils/ktls-utils_0.11.bb             | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb

diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
new file mode 100644
index 0000000000..b4905db640
--- /dev/null
+++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
@@ -0,0 +1,21 @@
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
+inherit autotools-brokensep pkgconfig systemd
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+
+PACKAGECONFIG[systemd] = "--with-systemd,,systemd"
+
+SYSTEMD_SERVICE:${PN} = "tlshd.service"
-- 
2.49.0



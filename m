Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E257CC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 11:45:58 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.34826.1741779953501727093
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 04:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ayziJcu+;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so9860553a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 04:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741779952; x=1742384752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aV/wtCkO+/eFIQuxcwXDhg1N/tBEhtr91AyCkiV60SY=;
        b=ayziJcu+PTzZYZQ6J9eGv10oRtBR20NBMfdekuPWxdM07r277N/2vlzuMbRcp0AU8s
         BVKpAypHH6pMsziRK/qKVU5yRTSR6VDVlZi8TZnQ8WWJPkkX0QzeArHe+80PLq1RNz/h
         9MV+Zt7Pm6SSHKswv9Fq5/h1QPmUywqteRO3OfiWfwhXQCVZa6w1PkclHOAh96gZaNlm
         50WnN05AhkFUsMiZKOXZyZAUBcXRFD6A+m4d2xNtAoOYaKFS9jVI2kxVlauBjTROFYVV
         zSPyLtBIxXB9ZCCdWxetobe0/YSnvy8z+SOOj8bY/9j+PsuhLvLz/sDk78rtPWthkjDL
         HqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741779952; x=1742384752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aV/wtCkO+/eFIQuxcwXDhg1N/tBEhtr91AyCkiV60SY=;
        b=LoVN7NG1Z+6shPkxLbAnQMnJL5XGDhea1bfyOtqH4dlKDyv5KFapI1QcVi6DQ25qTd
         G+HEgqLqWljdGfHz9WC2LcgYy0nFDJRmuTOXl/foj3PXOfQ1JSybkIs2Tqr92t3wLROb
         XITMOhitNw9+THmc8YjA7/oW2XHpRqTbtVfHb1BDhY3IdzPBsv9g30mfSgl2pn8nXnyf
         WLc4FXk1/6IK8pyTtpAGjcvfqzoHBA5X2fc7mNhdftHGce7DpmHUx0UTKk5G/1q8KSM1
         PREdVFj19oLhjIMffaXL2NZJoDK4PHXCfpdEqFL8sJXw1m7IrWmzoPGX+wXlfEwEJyjC
         gDHw==
X-Gm-Message-State: AOJu0YwYCdnH/Lw1BE1ttipHC9gH2mOooKCvkudCw5FNqv3u1P+fpxoK
	oLy/5onVF94UJGwTOV1czTLlxiix3GiGvHBOz9c6uQGMZicAWV/5fjrHwQ==
X-Gm-Gg: ASbGncufRLFpi+DGfAqe3GIbO1AUoluAi3ydd0a6LU/PvNrlT/UX4nusfHLreeSd8pU
	uFNyf0R+9HPmDXfVNXHbAwzeHWdEC/0p2P8yJrKwz9HKBdWuULwGzU4SdjpYhpWEAKBVteQ5H9Z
	W7x0WcJrnneas7Cw5hcoAbm8z3ukDIPMfg3CnCdBb8ajXefb3oTq/A8u2wkwEMZWK1NnSRE65ya
	eJTiCEl2ZQfQVDNEQIslE/hRuSMMBBf8aTBoWbiVqO2Ld1+ggW5IOx/a1QqYi1Lt60uMaIiA1Cp
	BOEbr3kj761TwfUnjn5C4L2j0wU628OU2+yEsh+y+tQPNYJtM22QbQjDMpkg
X-Google-Smtp-Source: AGHT+IEU7iWL0sfh/4cL4h1GTmacLE0l4E/MuMDu/oa40DfKt8sLGVTCjQNxWJK0+X5A0vdt19OjdQ==
X-Received: by 2002:a05:6402:3508:b0:5e4:b66f:87f8 with SMTP id 4fb4d7f45d1cf-5e5e24d601fmr20439931a12.21.1741779951534;
        Wed, 12 Mar 2025 04:45:51 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a960esm9780461a12.45.2025.03.12.04.45.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 04:45:51 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] fio: pass pkgconf args to configure script
Date: Wed, 12 Mar 2025 12:45:50 +0100
Message-ID: <20250312114550.3239004-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 11:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115921

This application uses a custom configure script, which is called
explicitly from a do_configure task. This however means that the
recipe needs to take care of passing the dynamic arguments based
on the PACKAGECONFIG values.

Pass the value of PACKAGECONFIG_CONFARGS to the configure script
to ensure that the PACKAGECONFIG changes take effect.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-benchmark/fio/fio_3.39.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.39.bb b/meta-oe/recipes-benchmark/fio/fio_3.39.bb
index 473408e9b8..91bd23e50e 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.39.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.39.bb
@@ -36,7 +36,7 @@ EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}'"
 EXTRA_OECONF = "${@bb.utils.contains('MACHINE_FEATURES', 'x86', '--disable-optimizations', '', d)}"
 
 do_configure() {
-    ./configure ${EXTRA_OECONF}
+    ./configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS}
 }
 
 do_install() {


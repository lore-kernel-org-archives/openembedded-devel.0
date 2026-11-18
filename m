Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2527.1794961619989656791
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 16:27:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lXC8XFjj;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37198ed3727so1807814eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 16:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961619; x=1795566419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KRKPctF9YQSpzCilPG1HbRAVXK6BeFMCZbqemC0xv0E=;
        b=lXC8XFjjx1TELN4fA5dv9R5mW/fKw6kqV5/L6CJio3gJnP2048Pyx3BH0DGrHV5jiB
         hwohcUy0gNk6idbG55O/U2sGRRnBXMrbPkUwcuYEtTwtQE2MJBZ7SPbL3VMrBJmUcYpr
         uvpNwF3a8IN/HHqLZoIsuZ5ygS0h4TDX7CqG5nNhSlE12hxZMjYsqnoNzbzEiMfgx4eR
         C9KsNwQTOBPlBMZ50TAsKek6SNn6OK3NkbyRBwkHH0TImJkZ5mjmB8uDp1cwqRebVLrT
         DkObWUnFKQ2S1EZ0b4536oA62QgVFLS/thFqupdKE5Sh1IP9bCQBzfZue8z/IMi3bSmT
         oxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961619; x=1795566419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KRKPctF9YQSpzCilPG1HbRAVXK6BeFMCZbqemC0xv0E=;
        b=Yr265jEzYwLRgbbPaOJBy8Fs6dDEjD/Kr15Q1ZSSwOS/jllN05oh9ZMrIiYmiKL3L6
         qYw4CQRqI/VEKTKzu56zvGuw81htvzsOH+L4m46R5Zp26oJwoEPG47ZLVXe7a/tegTZi
         UKsoVoDwgl/6Os1j4W4VgJA55eFWGZRB9muJ7fwhjOsfbGXqjeo9LpbzbQ5Bld0L5TBQ
         CgsYfXWdBMu7hNXIqwmR3jOqSFZOlSUayeqpELCI11cU6uWR2qlLczPDp/oH57YC6HG7
         gky7UjYb1mFZYz5WNH9M3oRyeoBPdsbU6KoP5w45wDDLFnd1gYVJf5u2sXs45svkiIRV
         IeJg==
X-Gm-Message-State: APuU4Z/irGqEQPm9BIesvclDHDvBsQAuPNi0bjAoSmayzRx3JEZEthFx
	zMWAbdQuVrkSK+FW0rM73YaVQIEQocCysnXdl8GQ/pNCoNOgvN7WvcXjBUDJuWpG
X-Gm-Gg: AZFdTZeqQMDJqz4SxoqsbRkWhTPBrtapveTt6H4iIRmeCTBZ7yRUYaYFXINgD9oR6UA
	/ym6g2GOKU+FlftqOGL0Yro2qngz157r23ZK7ym/CXK/A+bwJupJlMkxC0p5dqpqm6GPVBIDGCz
	dC1KAcSrbsT0vGblsXR8N1SCYLgGwzib2yGpokn5sgh8TOXZ70A2UaDKToxdenEMPzkzPaX84ZW
	j7IjvD4ab+if1wPZ/DLnkLSwh06J+3vrxCavrpqhuF8ZwvY6jhGPkX7dIXh9SIJPL78ip5S75mh
	HQ44oO70AQDJ4yPgVsHB1m3hTuFB2y3atUPNF0tLpw2Osn8rVgTAuHBIZ1/g/X2YHe+Q95soBfl
	kmeoZZUYwCSqD9eo2dVbDFr4mY7xhCLxKgsuqHvObOdaCNHOR0T3HJ2IHPGJNljiZhj6ZEOZ6bI
	YtSDZlueU5HTJq4lt8L9jGff31M93UzbsJF3Vl+Yd+Hp3+5p4CC0yQn/YJOUJwrBeppbblFIb5Z
	SneW50Dmj+HQV7yB0zM0pypTdFq5a0UJgJ+wpKPj5S36WkyfqJbql9y8S/4Rj+SpzaYJ7iuNCVj
	bvuFIzWOcnMQezRH2jAiwKr3bLrz0dW0w7nTzQwzFAHZ0OQpDhgQM4i+7b1OC2TeMkcGHWWzxZF
	E+r8IXLcOAVRCk0SvCKlMfck+EhUzXK6RTinhn/5bKR7eg1HOr3SHjdABn77N+yvA3lFWPsiQtq
	m/GQYdNNsb9UmS4Rla4uWR1TGZtIaps5gewYQJNCJHdCG22umNpTzNZzFtJmrNa0YbqLI6ZCIXm
	G8CaUG/zPPXeZS36z0+5Rb9v17/gLcmEN+EXPNXlOW6N41q9f9pZBiTNwPqd5qOyn/Xm3GLPFFo
	K88bw+hkkW0fQAZICGMtJeMLVg==
X-Received: by 2002:a05:7301:1821:b0:382:2ae3:b1d0 with SMTP id 5a478bee46e88-3822ae3b675mr1582278eec.13.1794961619017;
        Tue, 17 Nov 2026 16:26:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm1697015eec.28.2026.11.17.16.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:26:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 12/14] libeigen: Use GPL-2.0-or-later for the GPL parts
Date: Tue, 17 Nov 2026 16:26:40 -0800
Message-ID: <20261118002643.29829-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
References: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 00:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132613
Content-Type: text/plain; charset="utf-8"

The only GPL-licensed files (bench/btl) say version 2 or any later
version; COPYING.GPL is the GPL-3.0 text, so GPL-2.0-only was wrong.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb b/meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb
index 6121d5eedd..6e66683be9 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms."
 HOMEPAGE = "http://eigen.tuxfamily.org/"
-LICENSE = "Apache-2.0 AND BSD-3-Clause AND GPL-2.0-only AND MPL-2.0 AND Minpack"
+LICENSE = "Apache-2.0 AND BSD-3-Clause AND GPL-2.0-or-later AND MPL-2.0 AND Minpack"
 # The GPL code is only used for benchmark tests and does not affect what is installed.
 LICENSE:${PN} = "Apache-2.0 AND BSD-3-Clause AND MPL-2.0 AND Minpack"
 LICENSE:${PN}-dbg = "Apache-2.0 AND BSD-3-Clause AND MPL-2.0 AND Minpack"

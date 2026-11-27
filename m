Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18165.1795794961562441403
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 07:56:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Qa5N+gzj;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1aefd1bf74aso4628536c88.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795794961; x=1796399761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fbLpk3GLRfL+/5uCjqA47WJLjJ/tJ6u72MqUZcxX+DA=;
        b=Qa5N+gzj3tmg0g+M0Cvl88Rqj153c5c336c2Tu9NQu3zLR1ytbwTgwmztkY0gmHxjZ
         LB6LqArK2VamGcSpIeW68oZYM8GRWRBK+N8TUSH/sxf2RY2cS50EJpWQLbpIp2XLeBM1
         561VJOh1DA9NlDrXXdsrqYAX8XGo2+kr2LUrdIHtBH86Ev9ulUvPgUwnSwUwglMjqRka
         ZWi1C0OIRRrP9aDJjtarwk1uRXbks+v29FNj+gEqjNKhtNtmA5vhgjLqtBxPwESv5aIz
         h1yebisr57mKhQu/WCJVPpq2SDv20GnYmHuh5XatzCvlrSLerN2mPPOdrMesmI1d+ZYj
         Qr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794961; x=1796399761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fbLpk3GLRfL+/5uCjqA47WJLjJ/tJ6u72MqUZcxX+DA=;
        b=iH12moMmhp4qQRoy5uEQgZxM7zvO7fvaPNhMJtm5ONGjdUO7VW7kHQu05KZTEQmvx/
         2q+KMkSuOkk/2GBYL7XePI6tpIdKshYc9zQIW/tDh3cdxOMyq5M0cMOr9qrXCn2JZXrj
         cHGBXF1gM7f9DZl5HXxrOXL7qSxJtlQ2TVpl626MAFZEcRFQSBOxFxhTshFJd+Nu3iMs
         UOk6/trwZNu1tAcSfHEEMfZK20Tcm6MOknNwUR6wRyWYF+cVYjJD7M3yDtccv+HPHRC2
         9NqAEV2IhFhDJ2Dz934uDM+GUoLqvZPkXn9ixReQqJBLlummgMLN429/8GKoyowmO+kf
         iszA==
X-Gm-Message-State: APuU4Z99ORtNSPvrkLnV+QRAUtMbJ0tBM4iECDJ+gXhfYGPAo6UVbvLv
	iIq88dzWKvAgFx+r6o2wCgQ8L+XCzuv9iZhbZmSScU/DW5tHuwiYgw0N0fkh8rPW
X-Gm-Gg: AZFdTZfO0VPqEB7Wc8va+6W7L3fEde1B3QXMdN81TnoskvwjuEbVUh7wJnQXYXAX3+e
	sR5Ah2KvxC3rnweem50d3RVkeuB5wa1Erlx7y1aeRVoc182P6RjnXP2iB75wESVTDdzpIh2a+fD
	lFFNI1ppo4Uo5Ie2i8KKDHg9h0V3oFYQ/n/dCOK6vADOrJCRkIXzduYhQQ3jhp9cMgXAL9Dr4fJ
	ssi3ly8q56t9Z31kxAlxco3u6+SglPXO/3nZJETu/ygNA871FVXZ9cauAzrVo/wL3fJVwbV7caJ
	Z32Bvk2tiHoOn87nZVXAO+M4ie9cVDCPnmiVK4kwlZuHGbBwPEQtMPPoaaYoXDaFgWD1atvDed5
	nVg932C58X9P/m/RfHJxRUmlG11wBJvJHTvVr+Qjr3XSao29j0/bpXqdGm7jfz9GovwJuGB7+Co
	Tcqo7hhettoddsznoEQ8YA9MO+Xu47tfAfIuU10B/YZvHUnuUrOao+fq36d9CPfhjv/JAnO4+Ca
	wlRLtT9lM3E97fezLN2yyMiSK66TpdcqqABt1de58s+RYRPzxzVbx3w6pNYQ6CNNdCi/ZwznGRv
	zfpvuMZ9u+36CAqUy4pFntFtnZmXYUEu5EfOIGVRWvKwtcH+YgMPbYulxrmEjN0smMIRF6siD3b
	VEo/N/5UCZr6c1lgmsVh8uwFGoo2TcUrZXKIWWLQlMJMt2UIJeuAv3A0+bGzKG8kiKyNvQl6Xx1
	lav3KqUt8E83QjDe2/Ye+v6n2bEvgMGnLjkhwHkAo+z7KkFDpwFJp1NEd+7k/YRpyCy2zXji0h+
	a8ocLPJfWPhsv68RSl+lkR6oq3USNR0h2zjjJ9mc1iO2x3pfnO13j3QX7e5ClBO7pSXdf0NYPuW
	bCfs
X-Received: by 2002:a05:701b:2706:b0:192:a481:361 with SMTP id a92af1059eb24-1b5568c12e0mr23389695c88.7.1795794960746;
        Fri, 27 Nov 2026 07:56:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm58118218c88.8.2026.11.27.07.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:56:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 0/3] Build fixes for nodejs and uftrace, kernel-selftest OOM skips
Date: Fri, 27 Nov 2026 07:55:54 -0800
Message-ID: <20261127155557.2874294-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 15:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133382
Content-Type: text/plain; charset="utf-8"

- nodejs: V8 in Node.js 26 has static_asserts in discarded if constexpr
  branches that GCC 12 rejects. Debian 12 build hosts use GCC 12 for the
  host tools, so the build fails there. Checked with a full native build
  using GCC 12.5.
- kernel-selftest: skip cgroup:test_memcontrol, whose OOM cases make
  testimage fail on "Killed process" in dmesg, and cgroup:test_kmem,
  which fails intermittently under memory pressure in the test VM.
- uftrace: fix a parallel build race on the arch common.o, sent upstream
  as https://github.com/namhyung/uftrace/pull/2079, and backport the
  upstream fix for a second race that make --shuffle exposes in 0.20.

These apply on master on their own and on top of the series sent
earlier.

Khem Raj (3):
  nodejs: Fix build with gcc 12 on the build host
  kernel-selftest: Skip the cgroup tests that hit the OOM killer
  uftrace: Fix parallel build races

 ...carded-constexpr-branches-for-gcc-12.patch | 73 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_26.13.1.bb |  1 +
 ...d-error-with-make-shuffle-for-arch-c.patch | 44 +++++++++++
 ...-Fix-a-build-error-with-make-shuffle.patch | 43 +++++++++++
 .../recipes-devtools/uftrace/uftrace_0.20.bb  |  2 +
 .../kernel-selftest/kernel-selftest/run-ptest |  7 +-
 6 files changed, 169 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs-26/0012-v8-Fix-static_assert-in-discarded-constexpr-branches-for-gcc-12.patch
 create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0002-build-Fix-a-build-error-with-make-shuffle-for-arch-c.patch
 create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0003-build-Fix-a-build-error-with-make-shuffle.patch


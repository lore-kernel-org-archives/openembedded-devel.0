Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48026.1795411841888212662
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=t11dBq2Q;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-382f4710a17so4981980eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411841; x=1796016641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kOZVVp7tNXYVLBWw6knn+n8rfOuVf1kc4PKo1MBhoIk=;
        b=t11dBq2Qddp9AASFjT7qOMvBbJCrCikQiV86HkxSZwSLy0r/03QAR+gDe6cKNwO4ms
         //Z4pN12dtNm0b8E/zl3z1FkkslfvCUnCDIl7IDuTRjFcUU8PJzLWJ9Hre9/IlD/WdxJ
         sIr4XIeruBMcCbTMlN55lnUk/Xsj4yLYR5YkJ3sG77XEBZ0620WC5mUSVY/drsxdh4D2
         tM/7HuLksK80I2sY3hWWXNtYVG6lx2+JrOVL7jsq3+FT1aTqI7xmrgKI6y5RPARCti1X
         Vx+IK9gupBOdE0MrnfUTZ4qSTtiyVVFm3AUBpwH/Vq0E7tbEwIHbNX7zsK1/aZX2u2N5
         Wwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411841; x=1796016641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kOZVVp7tNXYVLBWw6knn+n8rfOuVf1kc4PKo1MBhoIk=;
        b=UFHzqvF0K+DVL6IleQOS4uWG4t7vBsN9/bpitG4xZdDZWcfesFQNNAI/OdCm8k/DDE
         MX1sfF6zb9aF3uP+1mE9wqll0SqqB58+wyWHj05otZM4QwGWR7/3a3SE7FsfjJwTttXH
         QNZh/9bS07vP/Tqb3Xu2H2yWMkumB6wv3rCowmF6Cj8HvFUSbpIukQpi3vXraIAJACqb
         J9uGnKnORa2ObU2vDz9P7fcQfE6k+J5FuWSHLi26Wx1/JEeiRcQZFp+JqvXdpoNMEoTs
         ICutCJubXICpw7Jik+8Blcbb0T32fvIX6J2EbFJ2sW0N0gYAn5q9iXbfW4JMyEIm8HME
         V6bg==
X-Gm-Message-State: APuU4Z+q2KHEw+2aOFY5rkKF4jb+p1TFrQUthHe+GOEpqXJQrpZg1tZF
	WLzumJS+WMWSEPDSwO7m6Xh7Z9KNhAULme7NOIrP5x8zCtUqbZxSKW3TTIpRLdgDHvM=
X-Gm-Gg: AZFdTZfB5Myzhn85FH7qZTjIFURk+yqjS49v0ymRUwqiq1sVVIr3+Lapy23Fh9JeAVu
	2xfRHZGp7m1OjHSdTEDlJq+OtSoFCLgl13BL8PYwh9YrdL2Rayf/M6eH9K3LDz/qfXeZq7/+gIH
	lF875pMLESqFxJJ7pkQFF7i/daAl1Q4fgVHNvjq8wl5zRCIIlH+NbTSiAYYadgoz392uGQQbgM6
	b70bbNhifeJc2MWwuJZjeTv4gJIS3vMetr1sJBfRj3NFrVDmtN1gGdRz5CNTCUq2W1oNqEQMXMf
	akYL1O0EX2OIuY3k+x0ZIa6gFudO+MsyDbHQbXuNsaI7ZOko825CYxRFkCTuSTBuWTxhHEykHF1
	J7xEdoLUFNCBo2JdBMu12LbNj6CnP/XW+pRHMcdxFGyqn5pQOElbIMs6ZGuwQzioMAU7LmWop9I
	D58Q+CJTb0oKolQZ3kqQORBUDeIfkWMB0x8vuo+QXArAxLB8CRvedD2c+BuYNPnIvQsTQRzs9KH
	e0hB0zMfGDVeu1GtcbNBCNWynKzUsxksjCbXrZWOirdQa1/R0dhXdMeWRzPNcvNkvXg3io0MeS0
	FyJ9gMJ9dz6Gh8wRc4k8EMpQTkeca0QzPpm07iducccMc5FwO0wphSjitNDigxu7uVmMnZ+4VZa
	wynswR5Hv4nzqmgAT2aE5fv2DtoS+khiPZf1qPNJlAny+zlrCPXcLqCBqrAXZAHofgsaFFRbwvX
	e5v4w5kMpZ/1Rs04fXC/O2FRI076U5MnH/j5V59H/LqKYr4ajiTZR2ULKX7gaOZTAgXKE0VnPcD
	SsJRUw4YcO4a+3btSWs9+9F3bJHWwnQ5IBVJzmIA3XCLtPf4XUTTqnagsQFV/gy8oeJWx7GJ3Kg
	8fWe
X-Received: by 2002:a05:693c:600c:b0:36a:1bac:6bf4 with SMTP id 5a478bee46e88-38570451dbemr12652284eec.18.1795411841199;
        Sun, 22 Nov 2026 21:30:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 08/42] ctags: upgrade 6.2.20261108.0 -> 6.2.20261122.0
Date: Sun, 22 Nov 2026 21:28:52 -0800
Message-ID: <20261123052953.3658549-36-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132823
Content-Type: text/plain; charset="utf-8"

Weekly snapshot: the C/C++ parser now handles C23 typeof_unqual and
_BitInt and expressions in decltype-like parameters, and the Perl
parser preserves non-ASCII identifier bytes.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../ctags/{ctags_6.2.20261108.0.bb => ctags_6.2.20261122.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20261108.0.bb => ctags_6.2.20261122.0.bb} (96%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20261108.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20261122.0.bb
similarity index 96%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20261108.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20261122.0.bb
index f7502f0774..53faec448c 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20261108.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20261122.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "394badef3b67abfab30841ec1ecc541b030fff13"
+SRCREV = "c456899837b24e777777b37064e463bfe185ce1b"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 

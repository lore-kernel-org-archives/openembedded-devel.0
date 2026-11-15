Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3845.1794729088718846994
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gm4GRelp;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so3487179c88.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729088; x=1795333888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ur5zX06SRFQXJvbLy+usI8guMCnfz0VsX/13fzamSyg=;
        b=gm4GRelpqmrmAVApUkcS4KR1yv5UpzURuECuz1npCHiCFDO9OgyDSVmafqYuwz8TJm
         wHiYIP0L/+M3dHbqhL9xecDkiOzDwgF4thzcCRYG/17ZHwoiHJPGp9jho0pZbBmUIrbI
         Yb8fYl/d7AvwwuMlsDCA4nrKTAo/ljXD/fRVZk16KBfKcEqiW9guD5jdtnS/3+8D9AA5
         9qLWWunzPmxmukrwTowyk6imEFhjh7j2s7KjRB8/l6u4lG+9C8wdIkAy97r+PJ62+WzK
         7eix5v0lEqkNvEu/MZY0hWffRvb9fhtU0lMMffPoeuTgwZ8kPfr2zi2s9JillI57Ev3v
         N2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729088; x=1795333888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ur5zX06SRFQXJvbLy+usI8guMCnfz0VsX/13fzamSyg=;
        b=0s7ifbRz7dmoxe+NJ1KaULKQ0TatGBIHdezGm4ximsEhdV3IlfNK9N+pLkLBs+cJnG
         5t28uFyEKR7wsA1Yl9QQSYrDm7XFg7EW4z3iOYbBJJ3VaKGvApMBM5gRiR1AXIVSJLRo
         yx10Xp8oP4u0LhHQKaBCk9+3Ogdo2koMg+1zVpG+9er+Z4SZvFlO7ur98QbvAUD/cs0U
         +IEBpuCeSdnUoL7f7Fef0W5UWl5vYasFmCZ2/vMvFuKdtwUh3P++fMIskt4KyQR4dwQj
         Pag0w6FaOkIqqJPJgzJpqmLgMFzyA7f6fcqKU18X/qFYVmDen9GO+zHEe3DiOM4EeqZP
         j2Ww==
X-Gm-Message-State: APuU4Z9Gu+R+YK5bnq3/1cKf82Nt3j9jpu1Gr2xv+OGpwQPKlHu9iqMU
	V8XGTTeCgOBP/y2vUVoA15mcWZ6zP2k4VxRdwcvGgnsMVDLBGfjyNhODIVFrqFLY
X-Gm-Gg: AYBFou2kfiqPi18lgqutL56L2BsE4j6ZJ1puE7woKbf01S+5g1PgEsrhhutz0f5oFij
	U4G4q2iUel1p5zf07csy/ccFwzpqSMef/jffC+rNlKjFx7ah8vEvSao7KvH3RdClsU/7lOKgXVq
	U6EoSnEAX3ozvptG+ZxhqFsuLkrO/Z6Hp0mDLDVB/CNyD9OLMUYc6L0Ym/AuIEyWHTDS7LW6uyE
	mGuhQA0GGkH/OI40NdJvkAxTVQUM45GpPrzx5EfOdBBqIux2dfmcSypO3jqBEBesj7PBtS04yWR
	COVFb6js7yuLzpbWdm4l5RBkCSGaRXjCD+MGdT4lmXg0sBUrt5YsNyGPWSM/2nSijMJYWWYgn7T
	NSfaA1b1VP+VIOEdNuxndA36ZL82is8YV/2lu/7Jma8UobU+0rthz2X0kp+p2ttNyRQ2n/EnSaA
	olJLNDvDk55i1i6HQdH96CmPn3ofIadjTUq4/SQMliu9UxPDPfO/L2k/O4Xh9qI87DUCL/l2Xta
	KWgqAWUNh0WFg/R33op0VJHAJ1YRRZf4VIJ5WBHnCiJY9DPg7PXpDSQFTCoYBzpKuI+psOeDuCv
	fklmX4vwGbtWobXTxwxcwFkSmE76JaCibg3TG+vc/dZGPtSmJlyWCanZs2REoBAcIHnrrfKZdH7
	/MBG+zkQLIXLQamFm4xwC2o5ezlvLpcVcKT0LGFUBFNUvmLf+Je6jKC1DUQfrsq20J2wNNx8Stq
	LUZMshUnPzF9sgFfhO5lFiTzALyBpli+rYwEcutlSRPnUQLOw1pZ6nJOCF3nZzobg37r2MiVP+a
	DxbKmweGN6fUPTelB12CWTOMoU7PQiq8k+s2wqnmr4uIV7PxVDFODwaAN4VY2DnZ7w/5bwLz0Su
	E+Np
X-Received: by 2002:a05:7300:2a9a:b0:35b:cb8a:8d0e with SMTP id 5a478bee46e88-37966e3b092mr7244716eec.16.1794729087983;
        Sat, 14 Nov 2026 23:51:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 78/96] python3-pycups: Remove stale 2.0.1 recipe
Date: Sat, 14 Nov 2026 23:48:56 -0800
Message-ID: <20261115074918.2932593-78-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132348
Content-Type: text/plain; charset="utf-8"

The 2.0.4 recipe in recipes-devtools/python supersedes it.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-printing/cups/python3-pycups_2.0.1.bb | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 meta-oe/recipes-printing/cups/python3-pycups_2.0.1.bb

diff --git a/meta-oe/recipes-printing/cups/python3-pycups_2.0.1.bb b/meta-oe/recipes-printing/cups/python3-pycups_2.0.1.bb
deleted file mode 100644
index 35b78890e6..0000000000
--- a/meta-oe/recipes-printing/cups/python3-pycups_2.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "CUPS bindings for Python"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3961efb54421653518521529853444c4"
-
-RDEPENDS:${PN} = "python3"
-
-inherit setuptools3 pypi
-
-SRC_URI[sha256sum] = "e880d7d7147959ead5cb34764f08b97b41385b36eb8256e8af1ce163dbcccce8"

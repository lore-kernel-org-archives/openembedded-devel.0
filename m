Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5764.1794975212463990330
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:13:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mbsldkZ1;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15dd124bbe7so1200951c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975212; x=1795580012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Od8Jy8UH/mix9Q2BlUXhai+G1DmTIC9UR4K/1T4EjsM=;
        b=mbsldkZ16Ld/bC1RUQaSxL2q6AnoLb2HEYXeLVWNlNQ6uOdzqH9lLrDkFfRicBnMTu
         Vy3FPD+X8zeWRdmeYYoN/kGzJNhZFMefAxhjxgdwdH+v9WT3xeJvG/HK5A8r9c/lhFfQ
         6B2ntDRS0dZgZ5QKM3RArfZ4TENRaFZoZEBRtEM8KVzvy3cv/3dOdrDw7Ps6K0YSxLVa
         hwWVsAqfW8ohllvMldDjY+ioeCDFTjGxmuv/gUwXhh7IYgTcXN+gR86qI+xOA+b3eCb4
         yKNUoANXaYMPfsv7Osa9IhtFYZFtQt6QTYYyEETUg9nmLhL5w8Q5UMdcRSSWzHUJY0od
         crtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975212; x=1795580012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Od8Jy8UH/mix9Q2BlUXhai+G1DmTIC9UR4K/1T4EjsM=;
        b=Ger2zZEu3ElL5RBleNO5rqdhGy0Kj7/PVVyZR6eBACBDjIxTvMUDErbjJPnpkRzgPf
         xmgwDsaT9JN2MCn8/bm4GoRa2NeeCA6D3tqs//Q6E/YXgCJNhX8r4m8uVz59/nz18uhV
         c52ET+Hul2ihW8DUHfeU6fa4Zsl3ZC4/aowK+bRegAaTPuG3z9BT4Hjvv0490Y09n/g0
         4V0WrNjWzk7exUZ1pkg08Vpe+jYYN90ls2F3K3yj8k/V38NmfHu2f4OdQJY1/oGx2KkG
         Wg8+8bLmLk9yCgDyfkRi5LfzzTToeCHhYJTKZWa4WfH1bzrtYJMqqfJyxTpiYZ2xlzJQ
         19SQ==
X-Gm-Message-State: APuU4Z9S6nU+vuXwQhj/zral7rOAzwxh6sgZBSzP8f1jRqC/VhnAhas0
	A/WqAHcwPbf8urpAoF2q1IsC0VGpVSYPqnXfwH4tWOGXmvc4oaf3r4cg7PlU7Syj
X-Gm-Gg: AYBFou1tBc22IEkmnfd0JBOkgkLF5atTFmpHgvZSBLmMdjYW8LfiQUlEs0HPGfmMtLi
	b1xrYK9lzxLtY19AdOWXf50Gmkh38nKH9gcuvt9nflGYtAJI+g9o9mMkM+jtIxM2WB8q+9BA4qh
	t2tMS4hVIRLnK3FBQYODZmwA2kIrCIgSFkprDyTXJNGC7ckaK7agvv0IJJrS6rHFVlEuES+9bVz
	Ai6BOwo83toE8JghKa1OAYUYpHFTTKmsw6W4ueXeyX8L2xoRyGQGiNtwPIhE6iZbTR9uJRn1ygy
	3hOn+aqwwO5HqaRuGwxSWNNm+4RzJi8wEYulG/q1Tpv70LRSdgErpylXHKfPKiyEtas+j3nI42B
	cs5kX2Vf+qtuPrU/B0tBiM+BpqyEGZU48CN4Ujv59GscKdz67h3FpuFp8R0tgTN3CAkmuqSly5i
	pc0nZ7PNbUL15bDakeeAczI+9UNU9Mv996ZaNczwvV/y1rIZsJ6ta6SuqnmwurLaX9FZJ8Srcqh
	pXcA7gxYfW8onllZMNx3LX4fCmGYZHopAtUE6jSEmKVsh2AQbKyun0HPjE9d/AFZnrX/JMuyCM1
	JTRvOYBOdt2BnVSEsreYCkiY2IW+ocZ5u63xFhHDKss5w56eDdVEOLLIzKNxBHjJ23QpfSlHxH3
	yHIXrBXj7Gu2PwaTf2s49cf5Gwd77aK9O0lEvn3tCv7iSyiIcB8D2qW1d3zLa+frsRG3KY56kSJ
	QfXJDnHWc1LCnKel32ieOrJIXzeTspL49HNH3AKiWGjGVIHvRCtRr+s1ulL26+b9CRAhe+/+xEj
	iWrEmsgHDMo0kKPaY1fGj949wn0kRpjGamP8Dv8e8NS4mlaLewVl3wEo0qNazoVzWIbzlF67pZo
	Z5scafXPNKgq0oqBA9GqZhYoyw==
X-Received: by 2002:a05:7023:90b:b0:1b3:b6d3:b91c with SMTP id a92af1059eb24-1b543be9b59mr1880134c88.7.1794975211759;
        Tue, 17 Nov 2026 20:13:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm2655742c88.14.2026.11.17.20.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:13:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 11/12] python3-blivet: Fix LICENSE
Date: Tue, 17 Nov 2026 20:13:16 -0800
Message-ID: <20261118041317.2287415-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
References: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132634
Content-Type: text/plain; charset="utf-8"

The python-blivet.spec says LGPL-2.1-or-later and COPYING.LESSER is the
LGPL-2.1 text, while several modules (e.g. zfcp.py) are
GPL-2.0-or-later with COPYING being the GPL-2.0 text. Track both files.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-extended/python-blivet/python3-blivet_3.14.2.bb  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.14.2.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.14.2.bb
index 24da6ce30a..7efa49d756 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.14.2.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.14.2.bb
@@ -1,9 +1,10 @@
 DESCRIPTION = "A python module for system storage configuration"
 HOMEPAGE = "https://fedoraproject.org/wiki/blivet"
-LICENSE = "LGPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 SECTION = "devel/python"

-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"

 SRC_URI += "\
            file://0002-run_program-support-timeout.patch \

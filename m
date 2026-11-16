Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1.1794851749065621886
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zy9e6MZA;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so9840280eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851748; x=1795456548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/TeQmvsFP1CPc9b4PJ8r/EloMKgVvAkWPg+2BqZqc8=;
        b=zy9e6MZAS1AM5GiwwJc+03FvNrYZ8B3yA5UQz0zAsxTDl5Etb0zC4L35Qfe/uzGasi
         1ElBFn62Jh/uGbb0UKRfIdFiNp/YLPV1r/XDm4Gmhps3XZRHazMzw1Ucj5uvh5CwwqcZ
         /PRAjLMY5gOFKR+SacSSAbxo/xckb0SnxqPPQSH6exSAS5cjk5duCspktpRM2GqwK51c
         bVYAAjFSOEhwu19RCvkarGP3qnO9Pc26DAMvTIvL42+C74aVpKAcQ0oZkEqdRDNS4LS6
         /o066Nn9eWMdEUfRzGVu2kbeqL/ruXnrr8csFji00H+8/M8UkS56i9YeWbHYnJyoRMpF
         w8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851748; x=1795456548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/TeQmvsFP1CPc9b4PJ8r/EloMKgVvAkWPg+2BqZqc8=;
        b=j5lJFRdsInJPh1dPQgc9DNBt5tNpi94mhm/6zsuXi6WnOQGrJ5msnvLTHpUlehpxn2
         ytjioFFC0I18dJ2tO/rEpaABiYEhTgDb9/LXAct0N3gzqFvxPzGHjp2HC9qWfZGWtNpL
         /eEud0p2XS1ntYt6fxHigdYu+owP9V+0wn01iTASnIckn7It9MEmlBgeCYuigCsQxrj+
         QQoN9HxI2wGGWJfOq4qxJcy/fbQu7kgeJAIOT45ibn3013rGWlqBF5cDZfRYiiqJ9TfD
         bIy9ApKO1zdt301VNFLO41Gr/jWzO2/BXfRbbOk3wMA/VFanPn+w0j93OqjlWOU99oWO
         pIog==
X-Gm-Message-State: APuU4Z8/Aaw49m5FJ+fKOC1mLPRRH6XU92R8ZHrJRsVxktapPcHCTQBC
	5etdu8NGlx8qEhj1iUBvuxMDWFnXldoV1etOAEi5aiH+SEg/9uYGTXR6lm1oOBok
X-Gm-Gg: AZFdTZfuEywPa9hO71FIg7NKoqpUFYy8kGYMn8ERBML+Z7tNeBmSLHFy9up0nN7L8JM
	OUQIAZoJyqit5N5jAevdBHkpZP2HVEX0Jacbg8AKo5VB5JUmh5B0ZRFQiESEosgCFwyGo0XsxtP
	zbyweTAzZxx5VeOjpxsQyWYJYtu/wwaoSRjvygNRoH1VI9t1U5S6KdUTf60wqlmYaKy+I0MxThu
	HK9gi5Hht3G+F3UTrQdz4Eew52fBM37Z1Pyv9+K0KDgtCFlOAd+9Jcj92wb7Blc5ogWpZvl9vBi
	6wzaa3AzgO2FdbSF958a2LeLUElw7zaAoV22uYVOb/dTZWDS4UG+I8W5omH4BB02Fp8ZR6KfUJ2
	WkNWwODe7Ap8pA6YK/mtq1wgOiB3dDMZZ8QptT7H8XrW80ugNGb4KsYgyRCWjyxaWkFNn6F3e0V
	fjFVfruPzZGbqA8T+g9O00iFOLSG7u6gDXHZdC/N73p5TFrVI4xldrWea3chXoEXNhu+FX2FAaZ
	10c4d96TsAgIAo80GpuGl3Z7s0tKSLbk3cU0/4/CzxW6XjTqXjHXQ3L6hbhcwwqQXbD8aS9uHJm
	5RYI4IgRuLYj4E5EZ8Apcx0wmgZgp9SwExXgnxp+GUZ0vs+QhkbRa7OQqzH4VqsfxzBQ5EqiGIt
	RfRmgg/1jo9qZCaVY9xNz41AaAtfcOIYJc7Ke8XcCZpkyxW4oSB1KsyRjQ7ZfmM1rEFXOyL38V0
	0z2oFjDmezok5Q3r6z8O1iZ1L+st4v5MZwoNzKKagu1TFSmR6uSp99ml0PQ2sfGowlBKsTO1+wb
	uSegotPcrrMiy5IrKn3nVsOgtu4lraw/R+vXxn/jWSK6xgVXSUSjVM2irl/klNUNnF0iYAbaCXm
	pH65
X-Received: by 2002:a05:7301:d819:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-379681c73a9mr12112908eec.41.1794851748424;
        Mon, 16 Nov 2026 09:55:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 078/105] python3-pytun: upgrade 2.4.1 -> 2.4.2
Date: Mon, 16 Nov 2026 09:53:30 -0800
Message-ID: <20261116175359.342679-78-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132533
Content-Type: text/plain; charset="utf-8"

2.4.2 is only published as wheels on PyPI; fetch the tagged release from
GitHub instead.

Changes:
- 2.4.2: CI/wheel build updates only (cp312, cp314, cp315 builds,
  cibuildwheel smoke test, removed older Python builds); typo fix.
  No functional changes.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-pytun_2.4.1.bb => python3-pytun_2.4.2.bb}         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-connectivity/python3-pytun/{python3-pytun_2.4.1.bb => python3-pytun_2.4.2.bb} (55%)

diff --git a/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.4.1.bb b/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.4.2.bb
similarity index 55%
rename from meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.4.1.bb
rename to meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.4.2.bb
index e7e1663b1f..34c4d09731 100644
--- a/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.4.1.bb
+++ b/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.4.2.bb
@@ -2,7 +2,8 @@ SUMMARY = "Python TUN/TAP tunnel module"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=13f7629e8e4989b66b4a913ab05a91de"
 
-SRC_URI[sha256sum] = "20b53ea7a09dfe173c00ec0a00eea508b05e959f5dc4b4bb698aa52252192f8f"
+SRCREV = "7bb880635689a751429ff8f219e39b0b712485bf"
+PYPI_SRC_URI = "git://github.com/montag451/pytun;protocol=https;branch=master;tag=v${PV};destsuffix=${PYPI_PACKAGE_SDIST}-${PV}"
 
 PYPI_PACKAGE = "python-pytun"
 PYPI_PACKAGE_SDIST = "python-pytun"

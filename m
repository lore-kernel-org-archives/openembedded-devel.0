Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5.1794851754650737326
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=krm2t9yv;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so9840477eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851754; x=1795456554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Et4b/h/IZtVxfhHL+uHUv2Nspo3ogK+zGrbD6IOw+vY=;
        b=krm2t9yva0l6zORxhEhiNm8uqBllBKt5ipYNi1X8xD3GOVt1ryIT4uF/K8osjz9kR3
         VsmVY8mGi9Is+BjUnPmdg28Dv42h1hC5ZE/oj8PVAfoEIYY5Lttb8DAbXjjEr0S1qglG
         HTyYvymAh7oMA5+qvS9D+t4G+7aIH3KPFv7lgz1Uy94KCe4VQqJOwhSu+Zn3+JeD9PW0
         llLP6LQKs8vj2l2A/VgCzfZoxG64laZVIiWtN/J14A5E1jYhHBYcLsx+a8Kt8c7w9tCa
         ljlcnU30GIuegcjXpl2wFyUeU1/0fRULnD3KB3yiNIq2+8KHtdHLTkPwc27KZlnHVig5
         Zqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851754; x=1795456554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Et4b/h/IZtVxfhHL+uHUv2Nspo3ogK+zGrbD6IOw+vY=;
        b=OWGh/k4kaEFqoEZ611XckmVTjKmIWpuvROZUgoQgq3STi29nv5jDLNszuS7vcVo9Md
         XJRJG+09GmY3csDwGpGwQNgOx8ffrxoiERNJgUtP2KU8lwPVyGDvrmthnrXIEfHJc3iE
         mhFhmIQIRJlQrXYFz16/u397NlW9HYVueEyRpRt3BvBK6gJfLeqIPE0Xf+OXe8Ut8ODN
         2tQy941MhHtCVvLHsQX1HyP0VEl2tensV/pRIUuS4KMR3+lsuLQObE2Y71FtjCpmTFfH
         Qh/evDJAnn9j1HSSPVLmqnZQtIxfqcURc+97Jo+TPUVdhvelswnQ9zNnOsy10ivl3lch
         T83A==
X-Gm-Message-State: APuU4Z8My/I9mh7J2RJ3W6m8BqWIxjw7aQyOjJxKzgjEnhtQvauozzX6
	y6/yFBcwY2NKI/ZkSQl2ZFDr1XtQ5dDMEKoLws7yDLUMaWkpn3QbtC8v3I76PMLE
X-Gm-Gg: AZFdTZec9jiQvDxKkFqO8jom2qKOjKdiUwTMhoORNOpGn6Ddch6cw+dGzBk+jb+2EtV
	dUi5SAdyHKts5wwARn+3wro6AGSEAzaU5AJoPujSfbUMgAZkqGmJuZzQjsNIWI2htd92HH2eVIs
	a/VzbHSXgERthsTZGHL+y0YushBgrZQOiNNv+J3mQR+fKzeSF/rbY289fkouzI2jcccwH/ZDTEa
	2gadsjhd5M5q79//2X+9tQ/AMLjK+bn49nR7/ebc7ZbzwNEl4nXHAupXbPYLe/wZM4Ttsp425TJ
	p3kLnCCj4SGYdVx+OAbs2N/98bVweSmy12RQusAJTsKfB3Q1rbef7oDmTeAHzMqucvoOl5RWQou
	FmbgbfhoYN1as6m8BjljNGa1zlfYhVPQ67ZFw6/aD90DSq6Bo6o71qlJFQ1pnWBnAN1cxEBCL01
	QyeabQjSqOoFvVeGYTr2EzcrbDfcYw01EF7h4Wi4/6TxQ3HPEgXKzZPgrQTMIPl7acsG8WI1gKF
	9xQYZG026yQfvIe0f7aC/Hj4ZsI7JlCgTEH0Ta74YvvyfEDTzxW/u4HkRH4P7UDa8Xi81ay6q8T
	qNZZmBSQMvMPUMM4/Mi1E+w/YmoXXDywI3oov7W7ruw5muvofOVdIUVZ/MgBERtJWPoHNna58O/
	VxBfr/HM8Mw2Jnu6dc0ez0VfCvucFClWWJ9PgLv09M0VIg3nK2w7gJevPLOTMV4x9FYhuygwn01
	mhMdqBhFrgaKVwy382QD1FGaBDGBYb6iE/oDvDDojLJrQO9vaOSq6ryy+KD5W0o/i1lWMGZDpGm
	HVOZTL6ulITfNxY11SijyjfSX4JiGa13zpees4k5Slo0UcppX7ciHKpflt2L7GYelqiGmOf8n+W
	u9kV
X-Received: by 2002:a05:7300:f401:b0:36a:1489:fdf6 with SMTP id 5a478bee46e88-37966387750mr11220827eec.11.1794851753942;
        Mon, 16 Nov 2026 09:55:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 082/105] python3-rich-toolkit: upgrade 0.20.3 -> 0.20.6
Date: Mon, 16 Nov 2026 09:53:34 -0800
Message-ID: <20261116175359.342679-82-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132537
Content-Type: text/plain; charset="utf-8"

getchar uses the tty module; add python3-terminal to RDEPENDS.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...3-rich-toolkit_0.20.3.bb => python3-rich-toolkit_0.20.6.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rich-toolkit_0.20.3.bb => python3-rich-toolkit_0.20.6.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.3.bb b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.6.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.3.bb
rename to meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.6.bb
index 94c2f0ffc4..115bb4cd20 100644
--- a/meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.3.bb
+++ b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.6.bb
@@ -3,13 +3,14 @@ HOMEPAGE = "https://github.com/patrick91/rich-toolkit"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://pyproject.toml;md5=29c91c89ee62891477a1476375143bef;beginline=6;endline=6"
 
-SRC_URI[sha256sum] = "223dd2cfba325ed55e94933b9e53f3aca13e9fdf76622bd564c18109a2273c1b"
+SRC_URI[sha256sum] = "04768f19438df877c6279e6e668ab0d88b5fff5c7ef3ac302838d97f7b03472e"
 
 inherit pypi python_hatchling ptest-python-pytest
 
 RDEPENDS:${PN} = "\
     python3-click \
     python3-rich \
+    python3-terminal \
     python3-typing-extensions \
     python3-inline-snapshot \
 "

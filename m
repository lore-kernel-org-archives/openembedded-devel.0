Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8041.1793701462199797868
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Tw3hI4Zh;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a215e64962so35857985e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701460; x=1794306260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uK6cmICg75y8GIDMqx9mmLH8GzMthMdvEH5uflhATvs=;
        b=Tw3hI4ZhCGCAzA4q+Y6FkeFSU51O4m93MwjA1Gn+y1KBMEdGNV5kLYP4/2puDKQ2RQ
         1/FW5VhHbemqj6DD93J+CNT1ycS5wxPr8RIVB/TnbcZzPu6bIS0rzx60UxLOnqhDv2Go
         Dzy6XvDrVauEZ5ApzY5Qn8Vd5h+H6N9jeh7L0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701460; x=1794306260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uK6cmICg75y8GIDMqx9mmLH8GzMthMdvEH5uflhATvs=;
        b=nkOaiVKrtsuddXQrvIdBDTOgwGkUE++P5Fr20x0vNSeSlLD46tSnAdERLdCi/q4Yt3
         vHRjTVVSSnjQGp3/PRwdlU8myB0QDWPrSRONHWTKPGCyxk7p0o+1cjJbi2kVqmHBfaaJ
         ELZGjJrqaovZX+XKkMN9GBPsj8uAlFm++kdab2eIrOxMV67a50ksetI1QzVQvYaIgrBB
         dF1Tj7wgru7VYXd75J1xe98Dags+jypydyxTAADNBJGBJvaERw7JIrJI3bSV/yRCsplx
         r6MNb3/kGO/oJgqU53UcIFXI0bL/CT61zFFJ7nY1yKrMGPIJs3EZ/ce9dR522EhrIlZU
         Wx+A==
X-Gm-Message-State: APuU4Z+q5vBk9aftI/9meIvq0Fs6P+XkwcAA0zgrcZQMwSQtBRf6gntV
	vdP2e5IfDaKshVoFMsCTYMoms+XZGRZUjfYTF02RcGRgip6d4dNs8i836oG3YjvR2sDiI8Zqsbr
	ndpmU
X-Gm-Gg: AYBFou3emwjKu3wIYc+CED4qiPGCzYJOeF3f+f+n9gQ3eRZkx8DlLZ0m6c9hKo15ePE
	jeKfSU0WmBIFwz+qrGffQ9SKqLn3wn4K/KGU0hDmyDQR/6cNmI9EYxF+3qI/BhyzEc0YJIHf1ST
	VTIcBfwWffdtnFi6yeYi1ucT/1PywhNoxpJAEOYDNyKkQJYzUSRXXgUJY5QhRBBQXp3JjKy0bpR
	MkfThnO3X7zPyzWDFPdykRHJJDWw/QlW7D08ibHw1YNdkvbi/Z9GbNIDk1KrN+qgQf6+ZTkK3VG
	4iZ+kDjor5imTAKQXa+28yQhHtzHx/YtLmue8clY3RVa6fW15DJDpL/dWBhJPd7nzBPQZMTNBrN
	Ufnv+j1B1730XNNwZjroiJTeRuJ2bybstA0V2C4CUKMCxkIgn/Z35ZDwsapqNl1D/ca3rBuZCNz
	kQMjtXIwWdIB/NMGIrM8shTwz36ajkiftCCt2K+X11W78WhM3JacU1uU/eyIybqZj/Jrhf1c3S3
	/uaXJPMb2R0zRHSceiexKs0ERmAJuEl4rJlnio5/Us616jJ6ZAlknD1w0qqL/Hd3fe0STvqDVMv
	p7Dkf4vvJ+gP4zmY8/hoNOTSqQlmwMzA8b1eVdQM9ZQPQlzWLQyqDJe4PD34GsCJMYJ7hr1HUKn
	Po2iDK0Rys6Ad2+WOE20galKuWWw6YzTuDdISE5VK1wX71uLd+/DEsQ==
X-Received: by 2002:a05:600c:6306:b0:4aa:15b1:d4fa with SMTP id 5b1f17b1804b1-4ac17b2ce91mr308798275e9.5.1793701460465;
        Tue, 03 Nov 2026 02:24:20 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:19 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 14/22] python3-pytest-asyncio: Upgrade 1.4.1 -> 1.4.1.post1
Date: Tue,  3 Nov 2026 12:23:42 +0200
Message-ID: <20261103102350.1952237-14-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131777
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.4.1.post1:

Changed:

- Removed the upper version bound on the pytest dependency.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...t-asyncio_1.4.1.bb => python3-pytest-asyncio_1.4.1.post1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_1.4.1.bb => python3-pytest-asyncio_1.4.1.post1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.1.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.1.post1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.1.post1.bb
index 9e49d949d4..21d5d5f669 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.1.post1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-asyncio"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
 
-SRC_URI[sha256sum] = "e8266eb094e5ee9ffdb2068c9836f33e209ea77a970eb846933d416b5602669b"
+SRC_URI[sha256sum] = "f582d9ea4a1c082195abe8bd29a1fe106aeb1cd435e3dad2d3bc2749935c36a2"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10284.1795753064890414283
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Iw7XeSId;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b244fb7fffso8341605c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753064; x=1796357864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSOiWWE7X6tOfaglQSOYPeM+4A9PfYT8Qli8WWXjveE=;
        b=Iw7XeSIdY/uU1Fny0HjzlKaS5ixQG/rQB8JmDCzfMq8JRdF4WCHaPy4gD1FwJt/vn9
         8PuLJn/GR6lhg2i/N1xQsBOuzNFdVBH3q/e7TYs5dPPpojCQnHOYC1pagLIp7xUlKxE/
         lUMI9Zy/tGtk0tocg9R5sKJ2eyQIjr5xIpwBxmn1bcnM5n/oM/JHmpoKxvCTPnqnaDgL
         tKao5mcv7L6sAvDS5oxExjYhv2AZ9vfy7PGCC6EWNA59npo0eXPguF/+pnGYzHhR/5qz
         Xz3Fcei4h2kCsA/ghpd73d0itkGP6YzmtXa4g9XyKnytzm0g9Y9kBgq+fgjGyHEf53kD
         NJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753064; x=1796357864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSOiWWE7X6tOfaglQSOYPeM+4A9PfYT8Qli8WWXjveE=;
        b=QnGnPrgLdnrEv5InCo5mKrueU/TN3sUHNayXQeDR+aRLuddG/N6ovBWfaMzyRd0Qkt
         j+vgikiqhEBjUSBQ7Z0sxy9hhJH2NNgOOKYM/l6zTJ69qPCb6xyR/dctIQjUy/qUROCL
         WxOWtUOSGAjqxkkFmMh62xG+Lps4dQ7fLCuJoEQAH6CCx7j616T7vIfKJTRFLSvsBR2W
         BvcB/IRp/sz2CbyVSLQsNUoW8dDL4NhD7yC6i0rR64AqSNh89/PvY+gLa7aWwzI9jjYl
         naQyql6hgRXcmHepVtFAujVOArn5snKvZ5x3D0ej3FyiaC9qf9/E4zEOLTFcyv87QVo3
         3tMw==
X-Gm-Message-State: APuU4Z9WHikgij9uVfgimuAjGZbFXf5H5cmPkXoL0sWPJHqihGP4+sKE
	1V0qi7m63j/BoloQfQ0T0OGqWMosyQozPv7i3XL/8hXwapEd13I/KnGErY7UwxNI
X-Gm-Gg: AZFdTZdIsSUzuek3AaQRnBSoj3gm9gDSx8drAIsdiNf5GGX8eKidtAe7oo8c00xcmfQ
	ippalKja9QE6nZw7I48goU0MjhrZJYmC4go0FM5vEJ5QRazNejhqhmzKTduUEtsdJO+YiEUd3Vl
	De+q4GEOGG6+Uinfxq1mbJp0A0eo9omUXm6++ki3gLCMghjPwZ5Vn/RyePRNk9LH/0IzuRDDDWj
	KslnXdZCUEi5Pq46ZlnORgU4/b0J0+ouny7L0BD8WM8gpuBoNQS55GolKuhZvvH1Xoiom9Ivhi0
	9ZGzErDr/q78+ajsZyxVDgHpDgPO4dv0hgB30hO8hbVnLralJb1r4cImlzdUO2Us5WTP5CYJ5hI
	slgLloZ9W8XZfw8MlC0pOfN41LpiLKVikgPQD8YVqv0CUM1DYahMd4WS2KxIpL6ga1iZVBc8hix
	caKmOEU3gW2JhJydkRr8ZcoGbv3iPvf8eZinIvYI1Iel4ostqm9qHuX5YBsBwiwvzDiFKT/2qjE
	KfzATlOdWkvC/1tjHrUNkOicx6xlmJd2QEzTbm1pY//UZovHQ6FBQ+QfmWq+CcZ6mwGKvEPzDi8
	e9IVQ0aXofQzL9gY/7sj4jau3S1EU3hWp2OTrIxNuvnD9s3V8+czeoXcnjGeU2Awp3azBmBXK6I
	PWo4x3R/XXSafHmGjqkmH6GVjy2iQPbnUvbUnbLMUUOA8JVDqiYbtwcn+hvnJFp0/UOKZeUbQPE
	WciIIFuiGx6Gd0jmhygoNJKu4f9BxsMJrbgwnYbMOLxPPQzG8VANPPX11tsVowPFsvHHqAaKiSG
	/ujAoxtbujNsFU6/OXTr9Xb2WWOJki7/4mYQ2Mau3eyFgWghH2PWi6qaNhnQfdn/amCX+6sU31v
	Wl22
X-Received: by 2002:a05:7022:e0b:b0:1a3:8d5f:6f93 with SMTP id a92af1059eb24-1b556882ac7mr34379818c88.17.1795753064246;
        Thu, 26 Nov 2026 20:17:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 24/35] celt051: Restrict upstream check to the 0.5.1 series
Date: Thu, 26 Nov 2026 20:17:04 -0800
Message-ID: <20261127041715.1776485-25-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133276
Content-Type: text/plain; charset="utf-8"

The check reported 0.11.3 from the main CELT tags, but celt051 is the
0.5.1 compat branch used by spice. Only match compat-v0.5.1.x tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-support/celt051/celt051_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/celt051/celt051_git.bb b/meta-networking/recipes-support/celt051/celt051_git.bb
index a9a664c196..349764774f 100644
--- a/meta-networking/recipes-support/celt051/celt051_git.bb
+++ b/meta-networking/recipes-support/celt051/celt051_git.bb
@@ -21,6 +21,8 @@ SRC_URI = "git://gitlab.xiph.org/xiph/celt.git;branch=compat-v0.5.1;protocol=htt
            file://0001-tests-Include-entcode.c-into-test-sources-to-provide.patch \
            "
 
+# Only the 0.5.1 compat series is packaged as celt051
+UPSTREAM_CHECK_GITTAGREGEX = "^compat-v(?P<pver>0\.5\.1(\.\d+)*)$"
 
 inherit pkgconfig autotools-brokensep
 

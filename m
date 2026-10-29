Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.867.1793316682646267915
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 16:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FxT5TW4e;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1438d9363fbso136665c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 16:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793316682; x=1793921482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q5SpV35VXa7AjOhTMlDm07TPrXoNAiCyvdvJYCUoIlg=;
        b=FxT5TW4eA0JNwf2mSWymoef0IYY03aMyLU8BCbQMgZiAhvKBVV4OaZyiY+AlrCp29S
         unXaBBqgmgxTQtDuMvvLTQ8hkDeV3Bdk9Zmu9tIblLwFqeqt/5Sv/yxTKA31x/MaR39L
         NejIqI0/99uWTo8JLqkoi6VEynC7nZb0BQc1EkWZhADouy2QDONWVS2YdQ8tPOee4v1I
         Ur8Dl/pTsaNJ7OWrgNaWh7zF+97BtQTZ5eWW2A/SyklhMBmYvRnSoWLQJx6dFaZQmF34
         DpOIIFiif/6wIjIutUr5IwO4K55Qf4U61Tl4OgiRrtaJ7Lt1RMEOpBBKRRTW0n2ipHJD
         DHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793316682; x=1793921482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q5SpV35VXa7AjOhTMlDm07TPrXoNAiCyvdvJYCUoIlg=;
        b=UEEw34h78S6JRx7o726uPPME8VIP3mkGnuPReoMjtfgwk3qh54/R5jNvV5KAN1UPyd
         E/hYddNaJ9dEffT1peMNi+l6C3K7sMkatrd8JoQl5wuHPIYJHPajCsumS5imHlUZPAtV
         0MEJx7IEPwrwNn36T3SZBXSzvaXVPk4TQZCbV4zlxFa6Id9YI+deGRo4Qa56NyYyi9LV
         JkxZRD45sLI4gm6Zj4YDYhV5pEcDTBWujaA3Y6VflgUquqJGC9dAZV4BNJp62n7sVI/R
         YXaNlb1qj5b5BP97TTZKI3YQ0a6hXgQgzcDNoPGXM5sneb5NHFLOJvnpeGFbDTBTlq0P
         P/kA==
X-Gm-Message-State: AFq9FYLfy9JsVCA8b/dX8QaOBzOvy4JRNMfp+zvZJjur73eLxr49zbpW
	7UFZZfJ/m+KrMNxRbXEiSwSGQ5UAbLtsI+DgwmaCKQ+YBOpha227mTvzHXAoqw==
X-Gm-Gg: AYBFou2H6ft8U4ABzdYiL+dRRDaxqStwAc8YI76NVAIqP/YYoCnlRFQmYBbCaOwghMD
	O404xSpBgWQ/oa9v8Q9lRq/kn3kMFULxv2ZZk8uVT8MgJGVx4aDP57NNIvH515AWcUiU/55sj8v
	AQPPnAYD5KqWlWxLtKbsWEBBycn5H/tzBFzELY1iX+uJyg9n/q7XKrU0cSN6t3kMNkp6eHy8VoY
	xTApUrMmL2ij/zGj8+x9/s7Lqt7mWblVXXsYAGyH4puUa6VocfQPp/aECo+ztDe11UqGFizn77X
	qEww/r2w698JmG3qyOfUqSfzLs47wCVf/Pr4aHH8l1YUXWMc1jZIPXqB1SeTdpz//69HndJC9Bp
	e0R98XqmBJbNBKNxnVQHE89xlJV0d0Okuyi26u2vTzdLPhYRPFxOsAJKh9On6lOSsUuv9blTGZZ
	A4bRkSk3P3beE4uQW2i/8BwT5fMP50pOUYI05xsxJaEGXmINEyEyMf3e2x/RR0Q4/sLuH2Ur2D8
	wftyw0t9rFVJ6o49U1n/drXEkq5I5SudvRdo5+K7Zi7Ly5zYmzP5KacuwmKkrV8wb35ZnBoBYf1
	472oio80NGNxDyEQ+cfcgcm/zBHKm5bwvHJjsds4gHZkzjKO0qibelimqG6tTg==
X-Received: by 2002:a05:7022:5f0a:b0:14a:a6dc:9cbf with SMTP id a92af1059eb24-1ac599f5078mr635422c88.4.1793316681819;
        Thu, 29 Oct 2026 16:31:21 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm2207349c88.10.2026.10.29.16.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:31:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 7/8] proftpd: upgrade 1.3.9d -> 1.3.9e
Date: Fri, 30 Oct 2026 12:31:01 +1300
Message-ID: <20261029233102.1177876-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029233102.1177876-1-ankur.tyagi85@gmail.com>
References: <20261029233102.1177876-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 23:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131676
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/proftpd/proftpd/blob/v1.3.9e/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../proftpd/{proftpd_1.3.9d.bb => proftpd_1.3.9e.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9d.bb => proftpd_1.3.9e.bb} (99%)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9e.bb
similarity index 99%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.9e.bb
index 81a7094359..7f2cb71ec1 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9e.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-SRCREV = "f59f248e26bdfa514443e42bf72a145641df635d"
+SRCREV = "fc3f908a0d07fa3b17fbe1e3054b7520806bc75a"
 BRANCH = "1.3.9"
 
 SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https;tag=v${PV} \

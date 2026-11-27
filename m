Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10256.1795753000187082671
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=yOvYFoVi;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so6588107c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752999; x=1796357799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scyi0bAZhweWxlLs8a3iGSKyaUqdN21v5KGptUfnLUc=;
        b=yOvYFoViu5K4dgqa4PfITzc66OF0VPrnzzutSoB2IwX+V0XPQ4PLvZLNOLJBXzWx1V
         fr0RJ6P8XTB5TeI2ajqbSp2QRd9ov7Es7KcxuM+/DH9SL6glhQo0OJcUrV8Yo5FjBkWT
         WzkFIMeE5Id/8tc4eKDfqevybdTaWaAahYJkDV2e1/swcktclaItZXczLPb8h8tlJSfU
         tHp3W+adP5JSdFFiXshFVTq9DOlzhEI0HBZmn7SQVqfG9vR1NDoZTSOyjAO6sUgwJP1D
         m4K1Kp72MEoR3ZM3xUTnRNPvxNjKjePq8+zieZtFxhWmbWP/QHYh9HXG6pq69v5Ss5PT
         bbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752999; x=1796357799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=scyi0bAZhweWxlLs8a3iGSKyaUqdN21v5KGptUfnLUc=;
        b=hES9z5DL3UiAZoa61/pWdaaX/AussUp5Orrbcm4Iq+N6DrdHZINveIPVVjAe/5uxhJ
         7SDHDFVm1U/2H4QIL/AxzrKJshkaxz874iBrQq6ibE8qUtU6nLD8U3aFfw7QGzP/bvQn
         o6pG+UuiFRsDOYQJoJSNu1NY2dRP797+faGIdvLxnsJmneMfF8pHY6WiagTcz7d0WKjj
         lP5f67XqvZ00s4m3sd3qMpHjLX3FIt7YiVcXomhVxoWBOBUfdNEHBtbjyII15i/q5o4v
         IvO/bjSjaUUHfGDFb2bXPTnyE/5bQv2cp/xymqWvRAu33Qe1stCYm9yaY2wCNCwY42rP
         4MZA==
X-Gm-Message-State: APuU4Z+MLJuLM1e3Ma3uZgEXRkJHCrSfNzxSJqOK0z7hOOKNSl53lw61
	aCi5RtzkoTo+NIkL8F08ux7VXTvh3fcgzqQn/KED9b5LwiwzFE/x6bdmCnTkyCX4
X-Gm-Gg: AZFdTZdeDn244t0N6DwRMTToRCPi6KenLg6cHkJDNc91sgqWqBpJCnMmf1j3kNLcwX9
	saYVaex7Ngsvb3VaEUk9Dn2vwbBxjc9wtj9rA1U7CTeIPF0RL5cRHto3DtZlcBqmtXCGAoV7Z2m
	uu3OgLsxRlQRC+9I0E6kMwd+2jwyJcMW4ksbJh3fK9N7PAWv6cvHF591kMQY6e/i/zWv2YeLzJ4
	3k/AyNMmy7AWlKGkiFamFzkpSr2LnWMfwuLmqA2SizgNI2KQzcrtDoM1kSWy6adYDxny0FVpIV9
	eSeInOyjsQV/NBagFZYFbF5pbaka+fuNkCTe7g3PZXkhvPHP5P4E5MPjOUahKYwosWa4tt5ciAv
	DyU2ci1CBxeNVNKdJ35qM42PhlJG5YHI+43QZNAUOwjky2BEdvuhEpPoJX9FKPpG2TFIhujU75a
	Z+o/WKZJIfAGJ+k33aoHzLOLIiFHsgYyBfV/otzjZshqnplYSCOUcJBrPlyAKowZgMhLV5SNGh4
	IlFnPY9zQSidJX5nZSOi6Q5n1B0yQjJmdZjJp9900jZKZ5aIfjYHpqbRs2/QtZoTmslzMULpuML
	BI9HvTZw0JIGLTRAFC9wI7KT9tDUnWNGu5veSav0aEYUXuHvNPYPgCuEdmXJhWyDICgH7jDpVnh
	pWcGajOQ+x6+k1PmV1xp0n6E0PO+Ed55AiQAXvCa+t7Ihd+Rr5ZnLv28zDD0RQpGm/AqzEc1OB3
	phFw68xTPzmvbPDKmnfFkk4GBlyopKVC14rCibsetE6MXtmMwhZqe2wwEY465XfIbCdaWa3uJiR
	CWLifAPTf+tKHfQZY1EQKqXP+1IFjhFChzbe0en3DbAGVXrweqXmuBckwg8og5wrVQrqzgUQZKo
	9hHL
X-Received: by 2002:a05:7023:a41:b0:1b2:649d:dc23 with SMTP id a92af1059eb24-1b556901b95mr24134588c88.35.1795752999566;
        Thu, 26 Nov 2026 20:16:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 20/32] python3-types-psutil: upgrade 7.2.2.20261111 -> 7.2.2.20261122
Date: Thu, 26 Nov 2026 20:16:02 -0800
Message-ID: <20261127041614.1775064-21-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133239
Content-Type: text/plain; charset="utf-8"

Updated typeshed stubs for psutil (typeshed commit 567e5e3e); only
packaging metadata and tool versions changed in the sdist.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...7.2.2.20261111.bb => python3-types-psutil_7.2.2.20261122.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_7.2.2.20261111.bb => python3-types-psutil_7.2.2.20261122.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20261111.bb b/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20261122.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20261111.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20261122.bb
index 8b4d4d2c2d..0701754327 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20261111.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20261122.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ec038232ab86edd7354b091c54e190e2"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "d677119c44fb80cc9be41d8ac731f08bf89974bb1daa49b6688665a9d7224f42"
+SRC_URI[sha256sum] = "30879c88d871c99f4a632cb17826ce8ec55de2c4884ed84e4f8f293b91c6439e"
 
 BBCLASSEXTEND = "native"
 

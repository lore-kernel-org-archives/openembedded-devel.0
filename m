Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51566.1795430145803479525
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 02:35:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=q/N/nbw+;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso21872235e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 02:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795430144; x=1796034944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YieijP6nK797ulk5vFMbojuJm7lIn7fPabZu1cotYxk=;
        b=q/N/nbw+NRyY6v3w6bwRepV0Ao/qprr6UtV11crAdLg4wV8xGXeCSeZjBwcZVxnwmD
         gftEMJcyf+5TPYbhlQeFB+Pgp/6swkKbAs1JKKrScIKhEtBfbV3N6Rie4UPYhL0b97r5
         j+wqXPHpB3Jz+XMTXd3llD016CDydpefCYWos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430144; x=1796034944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YieijP6nK797ulk5vFMbojuJm7lIn7fPabZu1cotYxk=;
        b=Cclr1SankhbFNYaiq2YbZrSZMCNX3jae4IW+vH0wajb3IhGa6LizwLRS9QtKYA96pn
         vNB0jm+fs3d73wq+CdqAcv5ti9KJ1d40GCB5TJlx74KBDN6rxTgbaeMi1W4Jp4OVfyxi
         vEq8bgP+UF0Gj+nUmZW4t+FIrxyhLZ/l678bjooxNPGErVkIvaPGg6e7/r2NxHeg6Fqe
         P+FK5JqTwjm/VzGcnnpqKXKp0SrvwCdnHHCovduB9un4FNMZTpXX4vRR45r7xD3i0kKZ
         KlyeKBBge2kIcZ46fNZWPhDDbjSjJjceigfeMkv5fG59stRnviWUTyDgDkKaqwpJhoXu
         zPpg==
X-Gm-Message-State: APuU4Z8I5CFZKnQOKpq/sIycOMUpyHwesCgRaBg7H8knB7TwhdXuzKNc
	/h2eMZinlDubuPMH/cIqPQTtJIiv3sNaCJ9oXxeJRC4r10/Dk64NCqmSAIgGaXd7khzNSMQzObF
	EswJC
X-Gm-Gg: AZFdTZfGKe0n/T36suKQ7p9I9iPJaQ3Wv9z36dJu0Dji1HhLNfbCJZT4f36Okh0dFhg
	GZoQJOtZtTdWwBxQwbwLF5lgvYinXFR3peT5FNTGqh55oRXeHbzo6c8C85Xp+AU5heQEDFYK0lC
	NY5rCA434im4D1l9myjK2SEUNLEe1nsg4nS0e8pG4XavID3lm+9DmMuMDkb3DLzLgscnwGfSsk5
	/X0NqhwxNmXSkXyL2sQn/v+1ocpuQjZIxu0gtxHlvngYWBrjvXcB8sbjXSStalIZpSzqQ6t1/Zk
	M1fZA9AK56zNm/46wymfvcOZSCq3E7O7bX0AF1VfPBHWL7oH4nGHtCp23Mdmal7OM7rmqKDdazx
	WrX/Rdewbz0SvdWorWKqJxyTz5QZtNjod4PuDLiJSAAEn1bdX1hBQU1TZC5Eh7BaD1NSzSMRzZJ
	kjgCxqnEdqpb0sdx6N8GzUj88QFOqtV6+Xv3ROtfhP9O+JrfMQDRAncVndbRWdLAhxHcvzpuOl7
	dNaulyKIzwRx2Ls+WLNjbrpchNO/Rcn6y95uod9n0wAQaCgAmaKY4acO3xUZcU1xUph/1hYhNcD
	rrzowhT8l6Ez9kWcogmW6ukYCYu5zhmY1SVduuJZJ3brJx2m2O3WI2yF/ndtJ4HMol3faMz3zzl
	Y2rvbRbbxYQg9V0cgK3jOqJOalLM/TwJgCM+hYkixjNG/YOUpXVwpDeYjof8OFiNlbwiW0rogJV
	Q=
X-Received: by 2002:a05:600c:1547:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb8880974amr253600435e9.8.1795430143736;
        Mon, 23 Nov 2026 02:35:43 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm300120265e9.8.2026.11.23.02.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:35:43 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-rstr: Upgrade 3.2.2 -> 4.0.0
Date: Mon, 23 Nov 2026 12:35:40 +0200
Message-ID: <20261123103540.3599606-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 10:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132887
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.0.0:

- Refactor: Xeger and Rstr are distinct, Xeger no longer inherits
  from XegerBase
- Default to use SystemRandom() CSPRNG
- Expose star_plus_limit as a property on Xeger
- Fix error when regex specified a repeat larger than the star_plus
  limit
- Behavior change: explicit repeats (e.g. `a{1000}`) are not
  restricted by star_plus_limit
- Drops support for Pythons 3.7, 3.8, 3.9, 3.10 adds support for
  3.12, 3.13, 3.14, 3.15, 3.16.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-rstr_3.2.2.bb => python3-rstr_4.0.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rstr_3.2.2.bb => python3-rstr_4.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-rstr_3.2.2.bb b/meta-python/recipes-devtools/python/python3-rstr_4.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-rstr_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-rstr_4.0.0.bb
index 01c27127a8..f9803ab15b 100644
--- a/meta-python/recipes-devtools/python/python3-rstr_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-rstr_4.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/leapfrogonline/rstr"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5c15c04f1cdbd42c6152066f0b02102a"
 
-SRC_URI[sha256sum] = "c4a564d4dfb4472d931d145c43d1cf1ad78c24592142e7755b8866179eeac012"
+SRC_URI[sha256sum] = "1a1e7f304b0291edbc12955a9cb4093bfe1c7c1d48e0797e752bb3bf2a24574a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


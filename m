Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20452.1795534515330663595
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 07:35:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CFZy6oM9;
 spf=pass (domain: konsulko.com, ip: 209.85.221.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dee593f18so4425907f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 07:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795534513; x=1796139313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XR4SwocKTWwZgI8pKOPgVYl3QjU/6DLcCUz/n6n+Um4=;
        b=CFZy6oM91wGbJo1yhuqD4Pvamqb6bIbV9h7PhO3ZYGJ63P8fzEW61i66Eqgi9WvLle
         WaJDZ4RMAfv1Lef4T5ebFj9k674NcLxMul6HNPeLOTAltvKpvMXVdiVQ2xkVspPX305A
         v3tCZt4mjp3ryaRkSgqXObkd2BAGmlELI1f+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534513; x=1796139313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XR4SwocKTWwZgI8pKOPgVYl3QjU/6DLcCUz/n6n+Um4=;
        b=XzFKITjD0E0HIVkW476X+E9oqKeP1Nz8ejgu6RVmxVqrnYk87S1e5JmvyUoenAvpxJ
         tZNRdVduBvJUiZOaUvZafcFlLA9kNtjD4MEBMKgPI3fpng5aEW49lR01eC63U0nUHREp
         M+60nBrrbXkg0atXgk7ueLDb75qV1qZw8OldF520CulKC8g/bU3MtXWUeF+ANB3s4ACn
         B2+OEf3vcOrKc8pZTLWqqjL4b1njMq4C58zbZ7KXpUjHl0xu5tAxVdZiRuA0LmE3oLYw
         6+LuSEdECPblOzESw7RB5AETSrwqZ64pvnX3yvxYzw9aZfzK69kQulrzK+THgylvWoQg
         fEYA==
X-Gm-Message-State: APuU4Z+qVlBBGnF/vb2GPKBRCLxeZ4CN2rR+56xj+GKgYpOEM2XIZAo1
	dmkZ68q1HhEvahkCdwK6RE1+bwAjYXcnOvn9A3nQKBfo2GhrANmj4Q+7pgLFt7kAfabsIsDKV6N
	04rGs
X-Gm-Gg: AZFdTZePB2feHO0+7jdL1RbPS3bGFTbukcEnrTX8/NuF2qwFL9+0EVJCXd70UBvDj+O
	/suIZC42RLiYXXRvIxBSTiHgEZCHn/3BUaYKBQhDeq0hv3SIFBL1Hc5ga4GZ1t/IHz5sJ4IV6lM
	az9ke7e61rKTaDWbBWCc97SW+PKguN1XqWMYfwCgEUS4Ic4A/Luuv1wkkRyhYPFtkiPgdriab7W
	I4hDIz+4/v0/Lw0G4Uushuc5MGLto+U3eDHlh4pnZdFuSu3wPeT7hUfOIR8ZUzu9Umq62uDmdgJ
	J/rFOzZSvWqRvNhTyXIvr7Qz5SFB7Bnu9F9sT5uv6WoLMFGyam0uuq+4sy7DNAlndLqKOzyZGLM
	3De/ZhHBcJO1rpxFVzbq2ICNH6xuSVnW8MNfeA3mCcKiyDAqJW1ChJ0DJ2w+rWmTtDJJQo8GFO7
	StxUsKRc9DkUlPD4vdMxraeuHweL8TjrDRikXkdcKF/r/Gw3hFM/fgNl9EobZgwqZcxg26VNyGJ
	4gx7S4hAgTHH1G7d5PMRv40gnkK1sRqBX5uCRxHcaO7z/pL1pf/eQM132Io8T4v77EJWXW4kWOU
	PXjGVFm8kv/yiS+LVVQjWJh4ihzUkpB5rCN0U8Em/7+nMqaV1btBwhinsDAoiyla7CUazYo/DRK
	oCAqSw5kivQNreIIKY48X/ibVzF2eBNrXilmbVcLMvNX2xUKUc151tQ==
X-Received: by 2002:a05:6000:1889:b0:48d:ee35:b3fe with SMTP id ffacd0b85a97d-4abab5ea3b3mr36198546f8f.8.1795534513361;
        Tue, 24 Nov 2026 07:35:13 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm29472884f8f.16.2026.11.24.07.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:35:12 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-coverage: Upgrade 7.17.4 -> 7.17.5
Date: Tue, 24 Nov 2026 17:35:08 +0200
Message-ID: <20261124153510.1696027-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 15:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132947
Content-Type: text/plain; charset="utf-8"

Upgrade to release 7.17.5:

- Fix: the reporting commands (report, html, xml, json, lcov, and
  annotate) used to put the current directory first on sys.path, to
  let plugins import local files. Now the current directory is
  added only if plugins are configured, and at the end of sys.path,
  so local files can't replace other modules.
- Fix: local plugins interfered with erase and combine as reported
  in issue 1726. This is now fixed.
- Fix: with the sysmon core on Python 3.14, starting and stopping a
  second Coverage object stopped the first one from measuring code
  it had already run.
- Fix: combining data files failed with "Conflicting file tracer
  name" when one data file only listed a file without measuring it
  (as unexecuted source files are) and another measured the same
  file with a plugin. This happened in pytest-cov's distributed
  testing. Now a file with no measurements doesn't conflict with a
  plugin's measurements.
- Fix: saving data while another thread started measuring a new
  file handled by a plugin could fail with "dictionary changed size
  during iteration".
- Fix: a keyboard interrupt at just the wrong moment could leave a
  lock locked and prevent saving data, as reported in issue 2383.
  This is now fixed.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_7.17.4.bb => python3-coverage_7.17.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.17.4.bb => python3-coverage_7.17.5.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.17.4.bb b/meta-python/recipes-devtools/python/python3-coverage_7.17.5.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.17.4.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.17.5.bb
index 1120b003a1..dfa2ef2d09 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.17.4.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.17.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "25ed180a4fb75b487509a4568acead1de41aefab8bedb06ac1ed5c14223fef97"
+SRC_URI[sha256sum] = "4f41d35b798714a2e79ec2097d6b03c92cd3b7de58e422fce7a1ca2c0c25b276"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


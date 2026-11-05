Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30041.1793869209251710244
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=OMMcfZta;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6485; q=dns/txt;
  s=iport01; t=1793869209; x=1795078809;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+FCHtilwsSenr9kYBM+fCZxrea5gfsy2JMSGvRvPQzE=;
  b=OMMcfZtaa4+XSzPYbnHYLOPjha0F8oNiS69HYMijryhBf5x0uB6OOrip
   iDqnrAzmNeac+rCEoQvoY9ZUfOWinIDCFj5VJcaREk6J5PM1YUh2oS70V
   FN8D46x5+eih6LBpc94Bo4lTdz6vJ924y/lvepb5b7uz5qlUFDSsxNPoI
   kRwFGpzVoBdeleeyERpFo4+9qYYEc5LNzMnaXjHF1HWANM7Kwa3FzpmNN
   wXMkT4G4HULBIHGhUO7s501WX1/9qtWQDdDIv2FFUXrd/bLbW42lfOSy1
   NoxsfnD8fVJ99QjZdLtFv88TQ7jniNgTeZGEojlxxGskOGLcTMoRdP4NF
   Q==;
X-CSE-ConnectionGUID: awPkm1t6S6+25pc8lJC04g==
X-CSE-MsgGUID: bRQRmVDbRC6+BPuthX/FwA==
X-IPAS-Result: =?us-ascii?q?A0BNAgDGROxq/47/Ja1aHgEBCxIMggULgld1YENJA4RUj?=
 =?us-ascii?q?1OCIQOLZZI8FIFqDwEBAQ9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMjBAsBGAE9CRMDAQIDAiYCA?=
 =?us-ascii?q?iALIwgQCYMCAYI6AzcDEaENmyR6fzOBAYMpAT8CQ1DYTA2CWgELFAGBCi6FQ?=
 =?us-ascii?q?IJ/IAGFA10YAUSEOScbG4FygRWDaYEFgRpCAQGBRoN2gmoEgiKBDIFagQMJj?=
 =?us-ascii?q?AwCgVKGcUiBAhwDWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XL1gbBgWBHYEeg?=
 =?us-ascii?q?RKBB12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1P?=
 =?us-ascii?q?AkmPxUMZAsaBWEIAg0McjkQMB4kLwUcJkAbChgYDUgRLDcVGQQ9AW4Hki+CZ?=
 =?us-ascii?q?C0xXQErVoFWDqVooCBxCiiDeIwkjz6FfBozhASmbQuYfYJZizGECpEygRWEa?=
 =?us-ascii?q?YFoPIFHCwdwFYMiCUoZD445g2uBf8xcJjICCQMvAQEHAgcBDAEDC4FokAAsg?=
 =?us-ascii?q?VIBAQ?=
IronPort-Data: A9a23:ccF2H6jiP9xkuiCbfPp07mTmX161MREKZh0ujC45NGQN5FlHY01je
 htvD26Faf/YamCgc91yO9jgo0IOucDcy9I1QQA9qypkE39jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvrf8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUR5d50BDhSq
 8dGa2pQdhvTg8CdmO60H7wEasQLdKEHPasFsX1miDWcBvE8TNWbHuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg1/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKIIYTRHpUPxR3wS
 mTu9V7AOBQkGNal4mTG2Eqxmu//2g3kcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmMHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289lte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:c/dcn6FP+QVH/2aLpLqEyseALOsnbusQ8zAXPidKOHtom62j5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: 9a23:bDFleW13kHx+r//2BLvA6LxfE98dcXiE0CnrfQziVH5iGLm3YgfM9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AuTwTjA+E90B12v+3G2iOGkuQf81S2p6rNmwHq75?=
 =?us-ascii?q?Y+OO8KDBwC3Czkx3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="530338233"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:00:08 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 9070E1800020E
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 9EE8FCBEF71; Thu,  5 Nov 2026 01:00:07 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 15/18] python3-virtualenv: fix CVE-2026-113713
Date: Thu,  5 Nov 2026 01:00:04 -0800
Message-Id: <20261105090007.351866-16-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105090007.351866-1-hthakar@cisco.com>
References: <20261105090007.351866-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 09:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131888
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. Always copy seed packages from temporary app-data,
including when environment or configuration values enable symlinks.
This keeps the environment usable after the temporary cache is removed.

Although NVD lists releases from 21.14.8, the project advisory [3]
traces the incomplete guard to 20.0.6. The same unguarded constructor
is present in 21.2.1, where the upstream regression tests reproduce
dangling pip links after temporary-cache cleanup.

[1] https://github.com/pypa/virtualenv/commit/b81995c3feab9e1edb453c75ffc6616e1a77335e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-113713
[3] https://github.com/pypa/virtualenv/security/advisories/GHSA-4f8h-vr72-p32c

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113713.patch  | 113 ++++++++++++++++++
 .../python/python3-virtualenv_21.2.1.bb       |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113713.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113713.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113713.patch
new file mode 100644
index 0000000000..8c56a5c228
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113713.patch
@@ -0,0 +1,113 @@
+From b81995c3feab9e1edb453c75ffc6616e1a77335e Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 10:09:55 -0700
+Subject: [PATCH] 🐛 fix(seed): copy from temporary app-data (#3437)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-113713
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/b81995c3feab9e1edb453c75ffc6616e1a77335e]
+
+Backport Changes:
+- Omit the upstream release changelog fragment.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ .../seed/embed/via_app_data/via_app_data.py   |  4 +-
+ .../embed/test_bootstrap_link_via_app_data.py | 52 ++++++++++++++++++-
+ 2 files changed, 53 insertions(+), 3 deletions(-)
+
+diff --git a/src/virtualenv/seed/embed/via_app_data/via_app_data.py b/src/virtualenv/seed/embed/via_app_data/via_app_data.py
+index 092ef74..44ba70d 100644
+--- a/src/virtualenv/seed/embed/via_app_data/via_app_data.py
++++ b/src/virtualenv/seed/embed/via_app_data/via_app_data.py
+@@ -37,7 +37,9 @@ LOGGER = logging.getLogger(__name__)
+ class FromAppData(BaseEmbed):
+     def __init__(self, options: VirtualEnvOptions) -> None:
+         super().__init__(options)
+-        self.symlinks = options.symlink_app_data
++        self.symlinks = options.symlink_app_data and not self.app_data.transient
++        if options.symlink_app_data and self.app_data.transient:
++            LOGGER.debug("copy seed packages because temporary app-data is removed after creation")
+ 
+     @classmethod
+     def add_parser_arguments(cls, parser: ArgumentParser, interpreter: PythonInfo, app_data: AppData) -> None:
+diff --git a/tests/unit/seed/embed/test_bootstrap_link_via_app_data.py b/tests/unit/seed/embed/test_bootstrap_link_via_app_data.py
+index a9917c4..fe07df7 100644
+--- a/tests/unit/seed/embed/test_bootstrap_link_via_app_data.py
++++ b/tests/unit/seed/embed/test_bootstrap_link_via_app_data.py
+@@ -3,9 +3,11 @@ from __future__ import annotations
+ import contextlib
+ import csv
+ import hashlib
++import logging
+ import os
+ import sys
+ from base64 import urlsafe_b64encode
++from pathlib import Path
+ from stat import S_IWGRP, S_IWOTH, S_IWUSR
+ from subprocess import Popen, check_call, run
+ from threading import Thread
+@@ -21,11 +23,57 @@ from virtualenv.seed.wheels.embed import BUNDLE_FOLDER, BUNDLE_SUPPORT
+ from virtualenv.util.path import safe_delete
+ 
+ if TYPE_CHECKING:
+-    from pathlib import Path
+-
+     from pytest_mock import MockerFixture
+ 
+ 
++@pytest.mark.parametrize(
++    "source",
++    [
++        pytest.param("environment", id="environment"),
++        pytest.param("configuration", id="configuration"),
++        pytest.param("command-line", id="command-line"),
++    ],
++)
++def test_transient_seed_survives_cache_cleanup(tmp_path: Path, source: str, unusable_cache: Path) -> None:
++    config: Final = tmp_path / "virtualenv.ini"
++    config.write_text("[virtualenv]\nsymlink_app_data = true\n" if source == "configuration" else "", encoding="utf-8")
++    env: Final = {
++        **os.environ,
++        "VIRTUALENV_CONFIG_FILE": str(config),
++        "VIRTUALENV_OVERRIDE_APP_DATA": str(unusable_cache),
++    }
++    if source == "environment":
++        env["VIRTUALENV_SYMLINK_APP_DATA"] = "true"
++    args: Final = [str(tmp_path / "env"), "--no-periodic-update", "--no-setuptools"]
++    if source == "command-line":
++        args.append("--symlink-app-data")
++    session: Final = cli_run(args, env=env)
++    assert (
++        session.creator.app_data.transient,
++        Path(str(session.creator.app_data)).exists(),
++        (session.creator.purelib / "pip" / "__init__.py").is_file(),
++    ) == (True, False, True)
++
++
++def test_transient_seed_reports_copy_fallback(
++    tmp_path: Path, caplog: pytest.LogCaptureFixture, unusable_cache: Path
++) -> None:
++    caplog.set_level(logging.DEBUG)
++    cli_run(
++        [str(tmp_path / "env"), "--no-periodic-update", "--no-setuptools"],
++        env={**os.environ, "VIRTUALENV_OVERRIDE_APP_DATA": str(unusable_cache), "VIRTUALENV_SYMLINK_APP_DATA": "true"},
++        setup_logging=False,
++    )
++    assert "copy seed packages because temporary app-data is removed after creation" in caplog.text
++
++
++@pytest.fixture
++def unusable_cache(tmp_path: Path) -> Path:
++    blocked: Final = tmp_path / "blocked"
++    blocked.touch()
++    return blocked / "cache"
++
++
+ @pytest.mark.usefixtures("_no_coverage")
+ @pytest.mark.parametrize(
+     ("metadata_file", "content"),
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
index b13b7d4fdd..adeff3939a 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
@@ -30,6 +30,7 @@ SRC_URI += " \
     file://CVE-2026-113716.patch \
     file://CVE-2026-113722_p1.patch \
     file://CVE-2026-113722_p2.patch \
+    file://CVE-2026-113713.patch \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30266.1793869209181269794
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Av4kggbD;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=66497; q=dns/txt;
  s=iport01; t=1793869213; x=1795078813;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Ey8GszdFNvQwEBUk4PlMsNsP0xXEGZOaf9poAnq9Fsw=;
  b=Av4kggbD54Mhr4bqMxOrHmDjo2D6157AWm5KL7dR5nmx1zWSPMFT9bKY
   6Dncl+RC4vtHBsbsboneOFJHBRZoswA+zT/dBrkIfOrYRAMQg6w+Ouptn
   rmHsCcqsQJKDtzH/yvR2xAPNUtwvWFUDJKTD9IvKH9mFCcl++O1L4kh/E
   ny1k0f72oW0ejqz3JOJlziAY7CMO0VNUcqsQWY+ZSFP6lYfXID389enZl
   AlSAV4xhd8+DA7YU5lOchoi6eFcfa237fEuWSo18Z9HRQkRpKfgscjm3u
   2dmUtchaZMnLmxMIOg0Tvzpp3JJwcvdPQxu+h+G5oM4n07SPqYKdjBswn
   g==;
X-CSE-ConnectionGUID: 7n1UyWN8RqW5uqyBw+2fcA==
X-CSE-MsgGUID: IP0qkI++RSWBlS9NrzrhWQ==
X-IPAS-Result: =?us-ascii?q?A0AFAABHRexq/5H/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgX0EAQEBAQsBglZ1YENEBQOEVFyOd4E1bAOBE4pShWeMVSOBA?=
 =?us-ascii?q?QNXDwEBAQ9EDQQBAYQ/RgJPFY05AiY1CA4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBAxoBCAQLARgBKBUJEwMBAgMCJgICIAsjC?=
 =?us-ascii?q?BAJgwIBgjoDNwMRoQ2aUhs3en8zgQGDKQGBVNhMDYJaAQsUAYEKLgGFP4J/I?=
 =?us-ascii?q?AGFA10YAUSDCoEvJxsbgXKBFYEXgVx2gQWBDQ0YKgKFPIJqBIIiehKBWh5lC?=
 =?us-ascii?q?YwMAoFShnFIgQIcA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+Fy9YGwYFgR2BH?=
 =?us-ascii?q?oESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaN?=
 =?us-ascii?q?TwJJj8VDGQLGgVhCAINDHI5EDAeJC8FHCZAGwoYGA1IESw3FRkEPQFuB5Ivg?=
 =?us-ascii?q?kQtDgsGAQENCBcEKAcBGhMBBw0XBBADMQ4pGTUYBxEHKAUJAw0UCBSSQx1Dj?=
 =?us-ascii?q?2SCIYE1nh5NcQoog3iMJI8+hXwaM4EWgm6BV6UWC5YagmOCWYc1gRkEgl+EC?=
 =?us-ascii?q?pFUCwsNAQIQBjeEaYFpATqBWXAVO4JmAQkWNBkPjisCAgoLg2CEUENRhCTEU?=
 =?us-ascii?q?yYyAgkDLwEBBwIHAQwBAwuBaJAAAiYEA4FPAQE?=
IronPort-Data: A9a23:m52Qoa0nb90h9/T0HPbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzAAy
 zZKWmGHbKrfN2vxf4xzYIq+/U9V68CEy9AxHgU43Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcsbjpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGU0dvAJwn3LZNGF4T6
 OUJAi9ONB6IrrfjqF67YrEEasULNsLnOsYb/3pn1zycVaZgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUidC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZjeSxbYSNIYXTLSlTtmeg/
 nvF3ie6OColHtikmByf4GisudaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7JQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:oqhoJa2mHxwjdrvfJKfHpwqjBJAkLtp133Aq2lEZdPUzSL3+qy
 nOpoV+6faaslgssR0b9OxofZPwIk80lqQFhLX5Q43CYOCOggLBR+tfBMnZsl/d8kbFmdK1u5
 0NT0EHMr3NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: 9a23:YoGmgGAECDpwfnb6E3ZhrXMFJeZ1SGTikWrJMmWnSjxnQ5TAHA==
X-Talos-MUID: 9a23:HJM/twXLRyQGOqvq/B7U3ChhFYQr2Z+RIkQ2wLMcqdOEChUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544560311"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:00:12 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 13B8A18000440
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 09:00:12 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 6B8E5CBF202; Thu,  5 Nov 2026 01:00:07 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 02/18] python3-virtualenv: fix CVE-2026-102930
Date: Thu,  5 Nov 2026 00:59:51 -0800
Message-Id: <20261105090007.351866-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105090007.351866-1-hthakar@cisco.com>
References: <20261105090007.351866-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 09:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131896
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Backport the seed-wheel digest check [1], as identified by advisory
[5]. Include prerequisite [2] so the expected digests are obtained
over verified HTTPS, and follow-up [3] so missing digests cannot
silently disable verification.

Include follow-up [4] to verify wheels in private staging before
caching them and to use the same verification for the pip seeder.
This also fixes CVE-2026-113714 and CVE-2026-113717, tracked in [6]
and [7]. Apply the TLS prerequisite before the three wheel fixes.

Add python3-packaging for the upstream wheel-name and version checks.
Keep virtualenv at version 21.2.1 without unrelated feature changes.

[1] https://github.com/pypa/virtualenv/commit/a01ed3e2f239d6ab1fce62c5c7664ccf268fff6d
[2] https://github.com/pypa/virtualenv/commit/48f6fdcc14b8654236f9081adbff10a32f536940
[3] https://github.com/pypa/virtualenv/commit/91460add8f53f4654c4aae3898e739c03fb69946
[4] https://github.com/pypa/virtualenv/commit/7babec66e043e1cc8bc66869a063653898719d96
[5] https://github.com/pypa/virtualenv/security/advisories/GHSA-94p9-xgh2-xp45
[6] https://github.com/pypa/virtualenv/security/advisories/GHSA-494p-63j8-28p3
[7] https://github.com/pypa/virtualenv/security/advisories/GHSA-cx28-75q4-x26q

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../CVE-2026-102930-dependent.patch           | 115 +++
 .../CVE-2026-102930_p1.patch                  | 309 +++++++
 .../CVE-2026-102930_p2.patch                  | 293 +++++++
 .../CVE-2026-102930_p3.patch                  | 777 ++++++++++++++++++
 .../python/python3-virtualenv_21.2.1.bb       |   5 +
 5 files changed, 1499 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930-dependent.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p3.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930-dependent.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930-dependent.patch
new file mode 100644
index 0000000000..87da5978ce
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930-dependent.patch
@@ -0,0 +1,115 @@
+From 48f6fdcc14b8654236f9081adbff10a32f536940 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Tue, 14 Apr 2026 13:20:04 -0700
+Subject: [PATCH] 🐛 fix(periodic-update): refuse unverified HTTPS to PyPI by
+ default (#3122)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Security hardening. When the verified HTTPS request to
+`https://pypi.org/pypi/<dist>/json` failed, the periodic update retried
+the request with an unverified SSL context and used whatever came back.
+The original comment justified this with 'the information we request is
+not sensitive', but the metadata drives the decision about which wheel
+version virtualenv considers 'up to date'. 🔒 A network-level attacker
+that can break the handshake can then pin virtualenv to an older seed
+wheel and silently suppress security updates.
+
+The fallback is now skipped by default. A failed verified request logs
+the error and returns `None`, which the periodic update path already
+handles gracefully — no wheel bump happens and the run continues. Hosts
+with genuinely broken trust stores can opt back in by setting
+`VIRTUALENV_PERIODIC_UPDATE_INSECURE=1`, which is logged at WARNING so
+it shows up in CI output. The env var is documented in
+`docs/how-to/usage.rst` next to the existing override knobs.
+
+CVE: CVE-2026-102930
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/48f6fdcc14b8654236f9081adbff10a32f536940]
+
+Backport Changes:
+- Remove the automatic unverified-HTTPS retry required to trust the
+  PyPI digests used by the following security fixes.
+- Omit the new insecure opt-in environment variable and its usage
+  documentation. Preserve strict TLS verification without introducing
+  another compatibility option or its boolean-parsing follow-up.
+- Adapt the existing release-lookup regression to reject an unverified
+  retry, and update its cached lookup-count expectations accordingly.
+- Omit the upstream release changelog fragment.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/seed/wheels/periodic_update.py  |  2 --
+ tests/unit/seed/wheels/test_periodic_update.py | 16 ++++++++++------
+ 2 files changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/src/virtualenv/seed/wheels/periodic_update.py b/src/virtualenv/seed/wheels/periodic_update.py
+index 57193ee..67a0337 100644
+--- a/src/virtualenv/seed/wheels/periodic_update.py
++++ b/src/virtualenv/seed/wheels/periodic_update.py
+@@ -362,8 +362,6 @@ def release_date_for_wheel_path(dest: Path) -> datetime | None:
+ 
+ def _request_context() -> Generator[ssl.SSLContext | None, None, None]:
+     yield None
+-    # fallback to non verified HTTPS (the information we request is not sensitive, so fallback)
+-    yield ssl._create_unverified_context()  # noqa: S323, SLF001
+ 
+ 
+ _PYPI_CACHE = {}
+diff --git a/tests/unit/seed/wheels/test_periodic_update.py b/tests/unit/seed/wheels/test_periodic_update.py
+index e683d6c..3fabf75 100644
+--- a/tests/unit/seed/wheels/test_periodic_update.py
++++ b/tests/unit/seed/wheels/test_periodic_update.py
+@@ -501,7 +501,11 @@ def test_new_version_ne() -> None:
+     )
+ 
+ 
+-def test_get_release_unsecure(mocker, caplog) -> None:
++def test_get_release_does_not_retry_unverified(mocker, caplog) -> None:
++    mocker.patch(
++        "virtualenv.seed.wheels.periodic_update.ssl._create_unverified_context",
++        side_effect=AssertionError("must not disable TLS verification"),
++    )
+     @contextmanager
+     def _release(of, context):
+         assert of == "https://pypi.org/pypi/pip/json"
+@@ -515,8 +519,8 @@ def test_get_release_unsecure(mocker, caplog) -> None:
+ 
+     result = release_date_for_wheel_path(Path("pip-20.1.whl"))
+ 
+-    assert result == datetime(year=2020, month=12, day=22, hour=12, minute=12, second=12, tzinfo=timezone.utc)
+-    assert url_o.call_count == 2
++    assert result is None
++    assert url_o.call_count == 1
+     assert "insecure" in caplog.text
+     assert " failed " in caplog.text
+ 
+@@ -564,7 +568,7 @@ def test_download_stop_with_embed(tmp_path, mocker, time_freeze) -> None:
+     do_update("pip", "3.9", str(wheel.path), str(app_data_outer), [], True)
+ 
+     assert download_wheel.call_count == 3
+-    assert url_o.call_count == 2
++    assert url_o.call_count == 1
+ 
+     assert read_dict.call_count == 1
+     assert write.call_count == 1
+@@ -587,7 +591,7 @@ def test_download_manual_stop_after_one_download(tmp_path, mocker, time_freeze)
+     do_update("pip", "3.9", str(wheel.path), str(app_data_outer), [], False)
+ 
+     assert download_wheel.call_count == 1
+-    assert url_o.call_count == 2
++    assert url_o.call_count == 1
+     assert read_dict.call_count == 1
+     assert write.call_count == 1
+ 
+@@ -610,7 +614,7 @@ def test_download_manual_ignores_pre_release(tmp_path, mocker, time_freeze) -> N
+     do_update("pip", "3.9", str(wheel.path), str(app_data_outer), [], False)
+ 
+     assert download_wheel.call_count == 1
+-    assert url_o.call_count == 2
++    assert url_o.call_count == 1
+     assert read_dict.call_count == 1
+     assert write.call_count == 1
+     wrote_json = write.call_args[0][0]
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p1.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p1.patch
new file mode 100644
index 0000000000..8ab2eb0940
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p1.patch
@@ -0,0 +1,309 @@
+From a01ed3e2f239d6ab1fce62c5c7664ccf268fff6d Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Fri, 18 Sep 2026 03:37:42 +0200
+Subject: [PATCH] 🐛 fix(seed): verify downloaded wheel digests (#3251)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Co-authored-by: pre-commit-ci[bot] <66853113+pre-commit-ci[bot]@users.noreply.github.com>
+
+CVE: CVE-2026-102930
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/a01ed3e2f239d6ab1fce62c5c7664ccf268fff6d]
+
+Backport Changes:
+- Omit the upstream release changelog fragment and additions to the
+  downloader docstring, which describes validation APIs not in 21.2.1.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/seed/wheels/acquire.py         | 27 ++++++++--
+ src/virtualenv/seed/wheels/periodic_update.py | 38 ++++++++++++++
+ tests/unit/seed/wheels/test_acquire.py        | 52 +++++++++++++++++++
+ .../unit/seed/wheels/test_periodic_update.py  | 52 +++++++++++++++++++
+ 4 files changed, 165 insertions(+), 4 deletions(-)
+
+diff --git a/src/virtualenv/seed/wheels/acquire.py b/src/virtualenv/seed/wheels/acquire.py
+index b6a6533..58d7af6 100644
+--- a/src/virtualenv/seed/wheels/acquire.py
++++ b/src/virtualenv/seed/wheels/acquire.py
+@@ -7,10 +7,10 @@ import sys
+ from operator import eq, lt
+ from pathlib import Path
+ from subprocess import PIPE, CalledProcessError, Popen
+-from typing import TYPE_CHECKING
++from typing import TYPE_CHECKING, Final
+ 
+ from .bundle import from_bundle
+-from .periodic_update import add_wheel_to_update_log
++from .periodic_update import add_wheel_to_update_log, verify_wheel_digest
+ from .util import Version, Wheel, discover_wheels
+ 
+ if TYPE_CHECKING:
+@@ -18,6 +18,19 @@ if TYPE_CHECKING:
+ 
+ LOGGER = logging.getLogger(__name__)
+ 
++# A private index can legitimately serve a rebuilt wheel under the same distribution, version, and
++# filename PyPI also uses - an internal mirror re-signing or re-packaging a release for policy reasons,
++# for example. Verifying that file against PyPI's own digest would then reject a wheel that came from
++# exactly the source it was configured to come from, not a compromised one. This does not attempt to
++# find every way pip can be pointed elsewhere (a pip.conf file has the same effect and is invisible
++# here), only the common, explicit one, so treat this as a conservative signal rather than proof either
++# way: it exists to avoid false rejections, not to guarantee verification runs whenever it safely could.
++_CUSTOM_INDEX_ENV_VARS: Final[tuple[str, ...]] = ("PIP_INDEX_URL", "PIP_EXTRA_INDEX_URL", "PIP_INDEX")
++
++
++def _uses_default_index(env: dict[str, str]) -> bool:
++    return not any(env.get(var) for var in _CUSTOM_INDEX_ENV_VARS)
++
+ 
+ def get_wheel(  # noqa: PLR0913
+     distribution: str,
+@@ -81,6 +94,7 @@ def download_wheel(  # noqa: PLR0913
+         str(to_folder),
+         to_download,
+     ]
++    verify_against_pypi = _uses_default_index(env)
+     # pip has no interface in python - must be a new sub-process
+     env = pip_wheel_env_run(search_dirs, app_data, env)
+     process = Popen(cmd, env=env, stdout=PIPE, stderr=PIPE, universal_newlines=True, encoding="utf-8")
+@@ -89,8 +103,13 @@ def download_wheel(  # noqa: PLR0913
+         kwargs = {"output": out, "stderr": err}
+         raise CalledProcessError(process.returncode, cmd, **kwargs)
+     result = _find_downloaded_wheel(distribution, version_spec, for_py_version, to_folder, out)
+-    LOGGER.debug("downloaded wheel %s", result.name)  # ty: ignore[unresolved-attribute]
+-    return result  # ty: ignore[invalid-return-type]
++    if result is None:
++        msg = f"could not find downloaded wheel for {to_download}"
++        raise RuntimeError(msg)
++    LOGGER.debug("downloaded wheel %s", result.name)
++    if verify_against_pypi:
++        verify_wheel_digest(result)
++    return result
+ 
+ 
+ def _find_downloaded_wheel(
+diff --git a/src/virtualenv/seed/wheels/periodic_update.py b/src/virtualenv/seed/wheels/periodic_update.py
+index 67a0337..f911882 100644
+--- a/src/virtualenv/seed/wheels/periodic_update.py
++++ b/src/virtualenv/seed/wheels/periodic_update.py
+@@ -2,6 +2,7 @@
+ 
+ from __future__ import annotations
+ 
++import hashlib
+ import json
+ import logging
+ import os
+@@ -360,6 +361,42 @@ def release_date_for_wheel_path(dest: Path) -> datetime | None:
+     return None
+ 
+ 
++def verify_wheel_digest(wheel: Wheel) -> None:
++    """Verify a downloaded wheel's sha256 against the digest PyPI's JSON API reports for that release.
++
++    ``pip download`` trusts whatever index it is configured to use, and nothing else in this module checks the bytes it
++    hands back. A missing PyPI record only means this check cannot run - the wheel may come from a private index PyPI
++    has never heard of - so that case is logged and let through. An actual mismatch means the file on disk is not the
++    release PyPI published under that filename, which is what a compromised index, a stale mirror, or a MITM'd download
++    would produce, so that case is fatal: the wheel must never be cached or seeded into a venv.
++
++    :raises RuntimeError: if PyPI's record for this exact filename exists and the digest does not match.
++
++    """
++    entry = _pypi_release_entry_for_wheel(wheel)
++    if entry is None:
++        LOGGER.debug("could not verify %s against PyPI: no matching release record", wheel.name)
++        return
++    digests = entry.get("digests")
++    expected = digests.get("sha256") if isinstance(digests, dict) else None
++    if not isinstance(expected, str):
++        LOGGER.debug("could not verify %s against PyPI: no sha256 digest published", wheel.name)
++        return
++    actual = hashlib.sha256(wheel.path.read_bytes()).hexdigest()
++    if actual != expected:
++        msg = f"downloaded wheel {wheel.name} has sha256 {actual}, but PyPI reports {expected} for this release"
++        raise RuntimeError(msg)
++
++
++def _pypi_release_entry_for_wheel(wheel: Wheel) -> dict[str, object] | None:
++    content = _pypi_get_distribution_info_cached(wheel.distribution)
++    releases = content.get("releases") if isinstance(content, dict) else None
++    entries = releases.get(wheel.version) if isinstance(releases, dict) else None
++    if not isinstance(entries, list):
++        return None
++    return next((entry for entry in entries if isinstance(entry, dict) and entry.get("filename") == wheel.name), None)
++
++
+ def _request_context() -> Generator[ssl.SSLContext | None, None, None]:
+     yield None
+ 
+@@ -453,4 +490,5 @@ __all__ = [
+     "periodic_update",
+     "release_date_for_wheel_path",
+     "trigger_update",
++    "verify_wheel_digest",
+ ]
+diff --git a/tests/unit/seed/wheels/test_acquire.py b/tests/unit/seed/wheels/test_acquire.py
+index 7754a8c..b9f7b5b 100644
+--- a/tests/unit/seed/wheels/test_acquire.py
++++ b/tests/unit/seed/wheels/test_acquire.py
+@@ -38,6 +38,7 @@ def test_download_wheel_bad_output(mocker, for_py_version, session_app_data) ->
+     distribution = "setuptools"
+     p_open = mocker.MagicMock()
+     mocker.patch("virtualenv.seed.wheels.acquire.Popen", return_value=p_open)
++    mocker.patch("virtualenv.seed.wheels.acquire.verify_wheel_digest")
+     p_open.communicate.return_value = "", ""
+     p_open.returncode = 0
+ 
+@@ -58,6 +59,19 @@ def test_download_wheel_bad_output(mocker, for_py_version, session_app_data) ->
+     assert result.path == embed.path
+ 
+ 
++def test_download_wheel_not_found_raises(mocker, for_py_version, session_app_data) -> None:
++    """download_wheel must raise a clear error rather than crash when no wheel can be identified at all."""
++    p_open = mocker.MagicMock()
++    mocker.patch("virtualenv.seed.wheels.acquire.Popen", return_value=p_open)
++    p_open.communicate.return_value = "", ""
++    p_open.returncode = 0
++    as_path = mocker.MagicMock()
++    as_path.iterdir.return_value = []
++
++    with pytest.raises(RuntimeError, match="could not find downloaded wheel"):
++        download_wheel("setuptools", None, for_py_version, [], session_app_data, as_path, os.environ)
++
++
+ def test_download_fails(mocker, for_py_version, session_app_data) -> None:
+     p_open = mocker.MagicMock()
+     mocker.patch("virtualenv.seed.wheels.acquire.Popen", return_value=p_open)
+@@ -94,6 +108,7 @@ def test_download_wheel_python_io_encoding(mocker, for_py_version, session_app_d
+     mock_popen.return_value.communicate.return_value = "Saved a-b-c.whl", ""
+     mock_popen.return_value.returncode = 0
+     mocker.patch("pathlib.Path.absolute", return_value=Path("a-b-c.whl"))
++    mocker.patch("virtualenv.seed.wheels.acquire.verify_wheel_digest")
+ 
+     download_wheel("pip", "==1", for_py_version, [], session_app_data, "folder", os.environ.copy())
+ 
+@@ -101,6 +116,43 @@ def test_download_wheel_python_io_encoding(mocker, for_py_version, session_app_d
+     assert env["PYTHONIOENCODING"] == "utf-8"
+ 
+ 
++def test_download_wheel_verifies_digest(mocker, for_py_version, session_app_data) -> None:
++    """download_wheel must reject a wheel whose bytes do not match PyPI's published digest."""
++    mock_popen = mocker.patch("virtualenv.seed.wheels.acquire.Popen")
++    mock_popen.return_value.communicate.return_value = "Saved a-b-c.whl", ""
++    mock_popen.return_value.returncode = 0
++    mocker.patch("pathlib.Path.absolute", return_value=Path("a-b-c.whl"))
++    verify = mocker.patch(
++        "virtualenv.seed.wheels.acquire.verify_wheel_digest",
++        side_effect=RuntimeError("digest mismatch"),
++    )
++
++    with pytest.raises(RuntimeError, match="digest mismatch"):
++        download_wheel("pip", "==1", for_py_version, [], session_app_data, "folder", os.environ.copy())
++
++    assert verify.call_count == 1
++
++
++@pytest.mark.parametrize("env_var", ["PIP_INDEX_URL", "PIP_EXTRA_INDEX_URL", "PIP_INDEX"])
++def test_download_wheel_skips_digest_check_for_custom_index(mocker, for_py_version, session_app_data, env_var) -> None:
++    """A configured custom index may legitimately serve a same-named wheel PyPI never built."""
++    mock_popen = mocker.patch("virtualenv.seed.wheels.acquire.Popen")
++    mock_popen.return_value.communicate.return_value = "Saved a-b-c.whl", ""
++    mock_popen.return_value.returncode = 0
++    mocker.patch("pathlib.Path.absolute", return_value=Path("a-b-c.whl"))
++    verify = mocker.patch(
++        "virtualenv.seed.wheels.acquire.verify_wheel_digest",
++        side_effect=RuntimeError("would have rejected a legitimate wheel"),
++    )
++    env = os.environ.copy()
++    env[env_var] = "https://example.com/simple"
++
++    result = download_wheel("pip", "==1", for_py_version, [], session_app_data, "folder", env)
++
++    assert result.name == "a-b-c.whl"
++    assert verify.call_count == 0
++
++
+ @pytest.fixture
+ def downloaded_wheel(mocker):
+     wheel = Wheel.from_path(Path("setuptools-0.0.0-py2.py3-none-any.whl"))
+diff --git a/tests/unit/seed/wheels/test_periodic_update.py b/tests/unit/seed/wheels/test_periodic_update.py
+index 3fabf75..6a54455 100644
+--- a/tests/unit/seed/wheels/test_periodic_update.py
++++ b/tests/unit/seed/wheels/test_periodic_update.py
+@@ -1,5 +1,6 @@
+ from __future__ import annotations
+ 
++import hashlib
+ import json
+ import os
+ import subprocess
+@@ -29,6 +30,7 @@ from virtualenv.seed.wheels.periodic_update import (
+     periodic_update,
+     release_date_for_wheel_path,
+     trigger_update,
++    verify_wheel_digest,
+ )
+ from virtualenv.util.subprocess import CREATE_NO_WINDOW
+ 
+@@ -536,6 +538,56 @@ def test_get_release_fails(mocker, caplog) -> None:
+     assert repr(exc) in caplog.text
+ 
+ 
++def _pypi_release_response(mocker, filename, digests, version="20.1"):
++    entry = {"filename": filename, "digests": digests}
++    body = json.dumps({"releases": {version: [entry]}})
++    return mocker.patch("virtualenv.seed.wheels.periodic_update.urlopen", return_value=StringIO(body))
++
++
++def test_verify_wheel_digest_matches(tmp_path, mocker) -> None:
++    wheel = Wheel(tmp_path / "pip-20.1-py3-none-any.whl")
++    wheel.path.write_bytes(b"content")
++    sha256 = hashlib.sha256(b"content").hexdigest()
++    _pypi_release_response(mocker, wheel.name, {"sha256": sha256})
++
++    verify_wheel_digest(wheel)  # must not raise
++
++
++def test_verify_wheel_digest_mismatch(tmp_path, mocker) -> None:
++    wheel = Wheel(tmp_path / "pip-20.1-py3-none-any.whl")
++    wheel.path.write_bytes(b"content")
++    _pypi_release_response(mocker, wheel.name, {"sha256": "0" * 64})
++
++    with pytest.raises(RuntimeError, match=r"has sha256 .* but PyPI reports"):
++        verify_wheel_digest(wheel)
++
++
++@pytest.mark.parametrize(
++    ("filename", "digests", "version"),
++    [
++        pytest.param("setuptools-99.0-py3-none-any.whl", {"sha256": "0" * 64}, "20.1", id="filename_not_in_release"),
++        pytest.param(
++            "pip-20.1-py3-none-any.whl", {"md5": "d41d8cd98f00b204e9800998ecf8427e"}, "20.1", id="no_sha256_digest"
++        ),
++        pytest.param("pip-20.1-py3-none-any.whl", {"sha256": "0" * 64}, "19.0", id="version_not_in_releases"),
++    ],
++)
++def test_verify_wheel_digest_skips_when_unverifiable(tmp_path, mocker, filename, digests, version) -> None:
++    wheel = Wheel(tmp_path / "pip-20.1-py3-none-any.whl")
++    wheel.path.write_bytes(b"content")
++    _pypi_release_response(mocker, filename, digests, version)
++
++    verify_wheel_digest(wheel)  # must not raise: nothing to compare against
++
++
++def test_verify_wheel_digest_skips_on_pypi_lookup_failure(tmp_path, mocker) -> None:
++    wheel = Wheel(tmp_path / "pip-20.1-py3-none-any.whl")
++    wheel.path.write_bytes(b"content")
++    mocker.patch("virtualenv.seed.wheels.periodic_update.urlopen", side_effect=URLError("offline"))
++
++    verify_wheel_digest(wheel)  # must not raise: a private mirror PyPI never heard of is legitimate
++
++
+ def mock_download(mocker, pip_version_remote):
+     def download():
+         index = 0
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p2.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p2.patch
new file mode 100644
index 0000000000..b528700c76
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p2.patch
@@ -0,0 +1,293 @@
+From 91460add8f53f4654c4aae3898e739c03fb69946 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Tue, 22 Sep 2026 17:10:31 -0700
+Subject: [PATCH] 🐛 fix(seed): fail closed when PyPI digest is unknown (#3302)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-102930
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/91460add8f53f4654c4aae3898e739c03fb69946]
+
+Backport Changes:
+- Omit the upstream release changelog fragment and its edit to the
+  newer downloader docstring, which is absent from 21.2.1.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/seed/wheels/acquire.py         | 27 ++++++----
+ src/virtualenv/seed/wheels/periodic_update.py | 53 ++++++++++++-------
+ tests/unit/seed/wheels/test_acquire.py        | 22 +++++++-
+ .../unit/seed/wheels/test_periodic_update.py  | 42 +++++++++++++--
+ 4 files changed, 109 insertions(+), 35 deletions(-)
+
+diff --git a/src/virtualenv/seed/wheels/acquire.py b/src/virtualenv/seed/wheels/acquire.py
+index 58d7af6..9127db1 100644
+--- a/src/virtualenv/seed/wheels/acquire.py
++++ b/src/virtualenv/seed/wheels/acquire.py
+@@ -10,7 +10,7 @@ from subprocess import PIPE, CalledProcessError, Popen
+ from typing import TYPE_CHECKING, Final
+ 
+ from .bundle import from_bundle
+-from .periodic_update import add_wheel_to_update_log, verify_wheel_digest
++from .periodic_update import UnverifiedWheelError, add_wheel_to_update_log, verify_wheel_digest
+ from .util import Version, Wheel, discover_wheels
+ 
+ if TYPE_CHECKING:
+@@ -52,15 +52,22 @@ def get_wheel(  # noqa: PLR0913
+ 
+     if download and wheel is None and version != Version.embed:
+         # 2. download from the internet
+-        wheel = download_wheel(
+-            distribution=distribution,
+-            version_spec=Version.as_version_spec(version),
+-            for_py_version=for_py_version,
+-            search_dirs=search_dirs,
+-            app_data=app_data,
+-            to_folder=app_data.house,
+-            env=env,
+-        )
++        try:
++            wheel = download_wheel(
++                distribution=distribution,
++                version_spec=Version.as_version_spec(version),
++                for_py_version=for_py_version,
++                search_dirs=search_dirs,
++                app_data=app_data,
++                to_folder=app_data.house,
++                env=env,
++            )
++        except UnverifiedWheelError as exception:
++            # only the bundle request has a local wheel that satisfies it; a pinned version must fail
++            if version != Version.bundle:
++                raise
++            LOGGER.warning("%s, seeding the bundled %s instead", exception, distribution)
++            return from_bundle(distribution, version, for_py_version, search_dirs, app_data, do_periodic_update, env)
+         if wheel is not None and app_data.can_update:
+             add_wheel_to_update_log(wheel, for_py_version, app_data)
+ 
+diff --git a/src/virtualenv/seed/wheels/periodic_update.py b/src/virtualenv/seed/wheels/periodic_update.py
+index f911882..b7b79d6 100644
+--- a/src/virtualenv/seed/wheels/periodic_update.py
++++ b/src/virtualenv/seed/wheels/periodic_update.py
+@@ -15,7 +15,8 @@ from shutil import copy2
+ from subprocess import DEVNULL, Popen
+ from textwrap import dedent
+ from threading import Thread
+-from typing import TYPE_CHECKING
++from time import sleep
++from typing import TYPE_CHECKING, Final
+ from urllib.error import URLError
+ from urllib.request import urlopen
+ 
+@@ -361,40 +362,53 @@ def release_date_for_wheel_path(dest: Path) -> datetime | None:
+     return None
+ 
+ 
++#: Pauses between PyPI metadata lookups before refusing a wheel we could not verify, to ride out a brief outage or a JSON
++#: API that has not caught up with a fresh upload.
++_DIGEST_RETRY_DELAYS: Final[tuple[float, ...]] = (1.0, 2.0, 4.0)
++
++
+ def verify_wheel_digest(wheel: Wheel) -> None:
+     """Verify a downloaded wheel's sha256 against the digest PyPI's JSON API reports for that release.
+ 
+     ``pip download`` trusts whatever index it is configured to use, and nothing else in this module checks the bytes it
+-    hands back. A missing PyPI record only means this check cannot run - the wheel may come from a private index PyPI
+-    has never heard of - so that case is logged and let through. An actual mismatch means the file on disk is not the
+-    release PyPI published under that filename, which is what a compromised index, a stale mirror, or a MITM'd download
+-    would produce, so that case is fatal: the wheel must never be cached or seeded into a venv.
++    hands back. Callers run this only when pip used the default index, so PyPI served the file and must list its digest.
++    A failed metadata request, an unknown filename or a missing sha256 therefore fails like a mismatch: accepting the
++    wheel in those cases would let anyone who can block ``pypi.org/pypi`` turn the check off.
+ 
+-    :raises RuntimeError: if PyPI's record for this exact filename exists and the digest does not match.
++    :raises UnverifiedWheelError: if PyPI's sha256 for this exact filename cannot be obtained after retrying.
++    :raises RuntimeError: if the sha256 does not match.
+ 
+     """
+-    entry = _pypi_release_entry_for_wheel(wheel)
+-    if entry is None:
+-        LOGGER.debug("could not verify %s against PyPI: no matching release record", wheel.name)
+-        return
+-    digests = entry.get("digests")
+-    expected = digests.get("sha256") if isinstance(digests, dict) else None
+-    if not isinstance(expected, str):
+-        LOGGER.debug("could not verify %s against PyPI: no sha256 digest published", wheel.name)
+-        return
+-    actual = hashlib.sha256(wheel.path.read_bytes()).hexdigest()
+-    if actual != expected:
++    expected = _pypi_sha256_for_wheel(wheel)
++    for delay in _DIGEST_RETRY_DELAYS:
++        if expected is not None:
++            break
++        LOGGER.warning("could not obtain the sha256 of %s from PyPI, retrying in %s seconds", wheel.name, delay)
++        _PYPI_CACHE.pop(wheel.distribution, None)
++        sleep(delay)
++        expected = _pypi_sha256_for_wheel(wheel)
++    if expected is None:
++        msg = f"refusing downloaded wheel {wheel.name}: could not obtain its sha256 from PyPI to verify it"
++        raise UnverifiedWheelError(msg)
++    if (actual := hashlib.sha256(wheel.path.read_bytes()).hexdigest()) != expected:
+         msg = f"downloaded wheel {wheel.name} has sha256 {actual}, but PyPI reports {expected} for this release"
+         raise RuntimeError(msg)
+ 
+ 
+-def _pypi_release_entry_for_wheel(wheel: Wheel) -> dict[str, object] | None:
++class UnverifiedWheelError(RuntimeError):
++    """PyPI's digest for a downloaded wheel was unavailable, so a caller may fall back to the bundled wheel."""
++
++
++def _pypi_sha256_for_wheel(wheel: Wheel) -> str | None:
+     content = _pypi_get_distribution_info_cached(wheel.distribution)
+     releases = content.get("releases") if isinstance(content, dict) else None
+     entries = releases.get(wheel.version) if isinstance(releases, dict) else None
+     if not isinstance(entries, list):
+         return None
+-    return next((entry for entry in entries if isinstance(entry, dict) and entry.get("filename") == wheel.name), None)
++    entry = next((entry for entry in entries if isinstance(entry, dict) and entry.get("filename") == wheel.name), {})
++    digests = entry.get("digests")
++    sha256 = digests.get("sha256") if isinstance(digests, dict) else None
++    return sha256 if isinstance(sha256, str) else None
+ 
+ 
+ def _request_context() -> Generator[ssl.SSLContext | None, None, None]:
+@@ -481,6 +495,7 @@ def _run_manual_upgrade(app_data: AppData, distribution: str, for_py_version: st
+ 
+ __all__ = [
+     "NewVersion",
++    "UnverifiedWheelError",
+     "UpdateLog",
+     "add_wheel_to_update_log",
+     "do_update",
+diff --git a/tests/unit/seed/wheels/test_acquire.py b/tests/unit/seed/wheels/test_acquire.py
+index b9f7b5b..7122070 100644
+--- a/tests/unit/seed/wheels/test_acquire.py
++++ b/tests/unit/seed/wheels/test_acquire.py
+@@ -12,7 +12,7 @@ import pytest
+ from virtualenv.app_data import AppDataDiskFolder
+ from virtualenv.seed.wheels.acquire import download_wheel, get_wheel, pip_wheel_env_run
+ from virtualenv.seed.wheels.embed import BUNDLE_FOLDER, get_embed_wheel
+-from virtualenv.seed.wheels.periodic_update import dump_datetime
++from virtualenv.seed.wheels.periodic_update import UnverifiedWheelError, dump_datetime
+ from virtualenv.seed.wheels.util import Wheel, discover_wheels
+ 
+ if TYPE_CHECKING:
+@@ -184,6 +184,26 @@ def test_get_wheel_download_not_called(mocker, for_py_version, session_app_data,
+     assert write.call_count == 0
+ 
+ 
++def test_get_wheel_falls_back_to_bundle_when_unverified(
++    mocker: MockerFixture, for_py_version: str, session_app_data: AppDataDiskFolder
++) -> None:
++    mocker.patch("virtualenv.seed.wheels.acquire.download_wheel", side_effect=UnverifiedWheelError("refusing"))
++
++    wheel = get_wheel("setuptools", "bundle", for_py_version, [], True, session_app_data, False, os.environ)
++
++    assert wheel is not None
++    assert wheel.name == get_embed_wheel("setuptools", for_py_version).name
++
++
++def test_get_wheel_unverified_pinned_version_fails(
++    mocker: MockerFixture, for_py_version: str, session_app_data: AppDataDiskFolder
++) -> None:
++    mocker.patch("virtualenv.seed.wheels.acquire.download_wheel", side_effect=UnverifiedWheelError("refusing"))
++
++    with pytest.raises(UnverifiedWheelError, match="refusing"):
++        get_wheel("setuptools", "0.0.0", for_py_version, [], True, session_app_data, False, os.environ)
++
++
+ def test_get_wheel_download_cached(
+     tmp_path: Path,
+     mocker: MockerFixture,
+diff --git a/tests/unit/seed/wheels/test_periodic_update.py b/tests/unit/seed/wheels/test_periodic_update.py
+index 6a54455..a53eafc 100644
+--- a/tests/unit/seed/wheels/test_periodic_update.py
++++ b/tests/unit/seed/wheels/test_periodic_update.py
+@@ -12,6 +12,7 @@ from io import StringIO
+ from itertools import zip_longest
+ from pathlib import Path
+ from textwrap import dedent
++from typing import TYPE_CHECKING
+ from urllib.error import URLError
+ 
+ import pytest
+@@ -22,6 +23,7 @@ from virtualenv.seed.wheels import Wheel
+ from virtualenv.seed.wheels.embed import BUNDLE_SUPPORT, get_embed_wheel
+ from virtualenv.seed.wheels.periodic_update import (
+     NewVersion,
++    UnverifiedWheelError,
+     UpdateLog,
+     do_update,
+     dump_datetime,
+@@ -34,12 +36,26 @@ from virtualenv.seed.wheels.periodic_update import (
+ )
+ from virtualenv.util.subprocess import CREATE_NO_WINDOW
+ 
++if TYPE_CHECKING:
++    from collections.abc import Generator
++    from unittest.mock import MagicMock
++
++    from pytest_mock import MockerFixture
++
+ 
+ @pytest.fixture(autouse=True)
+-def _clear_pypi_info_cache() -> None:
++def _clear_pypi_info_cache() -> Generator[None, None, None]:
+     from virtualenv.seed.wheels.periodic_update import _PYPI_CACHE  # noqa: PLC0415
+ 
+     _PYPI_CACHE.clear()
++    yield
++    # the mocked responses must not leak into later tests that verify real downloads in this process
++    _PYPI_CACHE.clear()
++
++
++@pytest.fixture
++def retry_sleep(mocker: MockerFixture) -> MagicMock:
++    return mocker.patch("virtualenv.seed.wheels.periodic_update.sleep")
+ 
+ 
+ def test_manual_upgrade(session_app_data, caplog, mocker, for_py_version) -> None:
+@@ -572,20 +588,36 @@ def test_verify_wheel_digest_mismatch(tmp_path, mocker) -> None:
+         pytest.param("pip-20.1-py3-none-any.whl", {"sha256": "0" * 64}, "19.0", id="version_not_in_releases"),
+     ],
+ )
+-def test_verify_wheel_digest_skips_when_unverifiable(tmp_path, mocker, filename, digests, version) -> None:
++@pytest.mark.usefixtures("retry_sleep")
++def test_verify_wheel_digest_rejects_when_unverifiable(tmp_path, mocker, filename, digests, version) -> None:
+     wheel = Wheel(tmp_path / "pip-20.1-py3-none-any.whl")
+     wheel.path.write_bytes(b"content")
+     _pypi_release_response(mocker, filename, digests, version)
+ 
+-    verify_wheel_digest(wheel)  # must not raise: nothing to compare against
++    with pytest.raises(UnverifiedWheelError, match=r"could not obtain its sha256 from PyPI"):
++        verify_wheel_digest(wheel)
+ 
+ 
+-def test_verify_wheel_digest_skips_on_pypi_lookup_failure(tmp_path, mocker) -> None:
++def test_verify_wheel_digest_rejects_after_retrying_pypi_lookup(tmp_path, mocker, retry_sleep) -> None:
+     wheel = Wheel(tmp_path / "pip-20.1-py3-none-any.whl")
+     wheel.path.write_bytes(b"content")
+     mocker.patch("virtualenv.seed.wheels.periodic_update.urlopen", side_effect=URLError("offline"))
+ 
+-    verify_wheel_digest(wheel)  # must not raise: a private mirror PyPI never heard of is legitimate
++    with pytest.raises(UnverifiedWheelError, match=r"could not obtain its sha256 from PyPI"):
++        verify_wheel_digest(wheel)
++
++    assert [entry.args for entry in retry_sleep.call_args_list] == [(1.0,), (2.0,), (4.0,)]
++
++
++@pytest.mark.usefixtures("retry_sleep")
++def test_verify_wheel_digest_recovers_on_retry(tmp_path, mocker) -> None:
++    wheel = Wheel(tmp_path / "pip-20.1-py3-none-any.whl")
++    wheel.path.write_bytes(b"content")
++    body = json.dumps({"releases": {"20.1": [{"filename": wheel.name, "digests": {"sha256": "0" * 64}}]}})
++    mocker.patch("virtualenv.seed.wheels.periodic_update.urlopen", side_effect=[URLError("offline"), StringIO(body)])
++
++    with pytest.raises(RuntimeError, match=r"has sha256 .* but PyPI reports 0{64}"):
++        verify_wheel_digest(wheel)
+ 
+ 
+ def mock_download(mocker, pip_version_remote):
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p3.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p3.patch
new file mode 100644
index 0000000000..898d85fca5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p3.patch
@@ -0,0 +1,777 @@
+From 7babec66e043e1cc8bc66869a063653898719d96 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 03:30:06 -0700
+Subject: [PATCH] 🐛 fix(seed): verify wheels before caching (#3430)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-102930 CVE-2026-113714 CVE-2026-113717
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/7babec66e043e1cc8bc66869a063653898719d96]
+
+Backport Changes:
+- Keep the 21.2.1 python -m pip invocation; the newer PIP_RUN launcher
+  belongs to a separate upstream change and is not needed for staged
+  verification.
+- Retain the existing downloader argument interfaces instead of adding
+  newer distribution/version validation helpers. Adapt the downloader
+  docstring accordingly, keeping the staged-file and digest checks.
+- Declare packaging>=23.1 as a runtime dependency for the new wheel
+  project/version checks; 21.2.1 only declared it for its test suite.
+- Retain the Python 3.8 wheel-seeding case in the adapted pip-seeder
+  tests. Omit the upstream local-pip-module test, which depends on the
+  separate PIP_RUN launcher change.
+- Add regressions for forged pip Saved output, malformed staging
+  contents, and the pip seeder's private wheel selection and download
+  policy. Update existing tests for offline pinned-wheel installation.
+- Omit the upstream release changelog fragment.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ pyproject.toml                           |   1 +
+ src/virtualenv/seed/embed/pip_invoke.py  |  54 +++--
+ src/virtualenv/seed/wheels/acquire.py    | 101 ++++----
+ tests/unit/seed/embed/test_pip_invoke.py | 151 ++++++------
+ tests/unit/seed/wheels/test_acquire.py   | 288 ++++++++++++++---------
+ 5 files changed, 350 insertions(+), 245 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 471684f..0b96c7a 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -49,6 +49,7 @@ dependencies = [
+   "filelock>=3.16.1,<=3.19.1; python_version<'3.10'",
+   "filelock>=3.24.2,<4; python_version>='3.10'",
+   "importlib-metadata>=6.6; python_version<'3.8'",
++  "packaging>=23.1",
+   "platformdirs>=3.9.1,<5",
+   "python-discovery>=1",
+   "typing-extensions>=4.13.2; python_version<'3.11'",
+diff --git a/src/virtualenv/seed/embed/pip_invoke.py b/src/virtualenv/seed/embed/pip_invoke.py
+index fb44229..1f333d3 100644
+--- a/src/virtualenv/seed/embed/pip_invoke.py
++++ b/src/virtualenv/seed/embed/pip_invoke.py
+@@ -2,16 +2,19 @@ from __future__ import annotations
+ 
+ import logging
+ from contextlib import contextmanager
++from pathlib import Path
++from shutil import copyfile
+ from subprocess import Popen
+-from typing import TYPE_CHECKING
++from tempfile import TemporaryDirectory
++from typing import TYPE_CHECKING, Final
+ 
+ from virtualenv.seed.embed.base_embed import BaseEmbed
+-from virtualenv.seed.wheels import Version, get_wheel, pip_wheel_env_run
++from virtualenv.seed.wheels import get_wheel, pip_wheel_env_run
++from virtualenv.seed.wheels.util import Version
+ from virtualenv.util.subprocess import LogCmd
+ 
+ if TYPE_CHECKING:
+     from collections.abc import Generator
+-    from pathlib import Path
+ 
+     from virtualenv.config.cli.parser import VirtualEnvOptions
+     from virtualenv.create.creator import Creator
+@@ -43,7 +46,7 @@ class PipInvoke(BaseEmbed):
+ 
+     @contextmanager
+     def get_pip_install_cmd(self, exe: Path, for_py_version: str) -> Generator[list[str], None, None]:
+-        cmd = [
++        cmd: Final = [
+             str(exe),
+             "-m",
+             "pip",
+@@ -53,29 +56,28 @@ class PipInvoke(BaseEmbed):
+             ":all:",
+             "--disable-pip-version-check",
+             "--ignore-installed",
++            "--no-index",
+         ]
+-        if not self.download:
+-            cmd.append("--no-index")
+-        folders = set()
+-        for dist, version in self.distribution_to_versions().items():
+-            wheel = get_wheel(
+-                distribution=dist,
+-                version=version,
+-                for_py_version=for_py_version,
+-                search_dirs=self.extra_search_dir,
+-                download=False,
+-                app_data=self.app_data,
+-                do_periodic_update=self.periodic_update,
+-                env=self.env,
+-            )
+-            if wheel is None:
+-                msg = f"could not get wheel for distribution {dist}"
+-                raise RuntimeError(msg)
+-            folders.add(str(wheel.path.parent))
+-            cmd.append(Version.as_pip_req(dist, wheel.version))
+-        for folder in sorted(folders):
+-            cmd.extend(["--find-links", str(folder)])
+-        yield cmd
++        # Only the selected archives may participate in pip's filename-based selection.
++        with TemporaryDirectory(prefix="virtualenv-seed-") as folder:
++            cmd.extend(["--find-links", folder])
++            for dist, version in self.distribution_to_versions().items():
++                wheel: Final = get_wheel(
++                    distribution=dist,
++                    version=version,
++                    for_py_version=for_py_version,
++                    search_dirs=self.extra_search_dir,
++                    download=self.download,
++                    app_data=self.app_data,
++                    do_periodic_update=self.periodic_update,
++                    env=self.env,
++                )
++                if wheel is None:
++                    msg: Final = f"could not get wheel for distribution {dist}"
++                    raise RuntimeError(msg)
++                copyfile(wheel.path, Path(folder) / wheel.name)
++                cmd.append(Version.as_pip_req(dist, wheel.version))
++            yield cmd
+ 
+ 
+ __all__ = [
+diff --git a/src/virtualenv/seed/wheels/acquire.py b/src/virtualenv/seed/wheels/acquire.py
+index 9127db1..9b394b9 100644
+--- a/src/virtualenv/seed/wheels/acquire.py
++++ b/src/virtualenv/seed/wheels/acquire.py
+@@ -7,8 +7,12 @@ import sys
+ from operator import eq, lt
+ from pathlib import Path
+ from subprocess import PIPE, CalledProcessError, Popen
++from tempfile import TemporaryDirectory
+ from typing import TYPE_CHECKING, Final
+ 
++from packaging.specifiers import Specifier
++from packaging.utils import canonicalize_name
++
+ from .bundle import from_bundle
+ from .periodic_update import UnverifiedWheelError, add_wheel_to_update_log, verify_wheel_digest
+ from .util import Version, Wheel, discover_wheels
+@@ -83,54 +87,67 @@ def download_wheel(  # noqa: PLR0913
+     to_folder: Path,
+     env: dict[str, str],
+ ) -> Wheel:
+-    to_download = f"{distribution}{version_spec or ''}"
++    """Download one wheel into a private staging directory and move it into ``to_folder`` once it checks out.
++
++    :raises CalledProcessError: when ``pip download`` fails.
++    :raises UnverifiedWheelError: when PyPI cannot supply the digest to verify against.
++    :raises RuntimeError: when the staged file is not the requested wheel, its digest differs from PyPI's, or it does
++        not support ``for_py_version``; nothing reaches ``to_folder`` in these cases.
++
++    """
++    to_download: Final = f"{distribution}{version_spec or ''}"
+     LOGGER.debug("download wheel %s %s to %s", to_download, for_py_version, to_folder)
+-    cmd = [
+-        sys.executable,
+-        "-m",
+-        "pip",
+-        "download",
+-        "--progress-bar",
+-        "off",
+-        "--disable-pip-version-check",
+-        "--only-binary=:all:",
+-        "--no-deps",
+-        "--python-version",
+-        for_py_version,
+-        "-d",
+-        str(to_folder),
+-        to_download,
+-    ]
+-    verify_against_pypi = _uses_default_index(env)
+-    # pip has no interface in python - must be a new sub-process
++    verify_against_pypi: Final = _uses_default_index(env)
+     env = pip_wheel_env_run(search_dirs, app_data, env)
+-    process = Popen(cmd, env=env, stdout=PIPE, stderr=PIPE, universal_newlines=True, encoding="utf-8")
+-    out, err = process.communicate()
+-    if process.returncode != 0:
+-        kwargs = {"output": out, "stderr": err}
+-        raise CalledProcessError(process.returncode, cmd, **kwargs)
+-    result = _find_downloaded_wheel(distribution, version_spec, for_py_version, to_folder, out)
+-    if result is None:
+-        msg = f"could not find downloaded wheel for {to_download}"
++    to_folder.mkdir(parents=True, exist_ok=True)
++    with TemporaryDirectory(dir=to_folder, prefix="download-") as staging:
++        cmd: Final = [
++            sys.executable,
++            "-m",
++            "pip",
++            "download",
++            "--progress-bar",
++            "off",
++            "--disable-pip-version-check",
++            "--only-binary=:all:",
++            "--no-deps",
++            "--python-version",
++            for_py_version,
++            "-d",
++            staging,
++            to_download,
++        ]
++        process: Final = Popen(cmd, env=env, stdout=PIPE, stderr=PIPE, universal_newlines=True, encoding="utf-8")
++        out, err = process.communicate()
++        if process.returncode != 0:
++            raise CalledProcessError(process.returncode, cmd, output=out, stderr=err)
++        result: Final = _downloaded_wheel(Path(staging), distribution, version_spec)
++        if verify_against_pypi:
++            verify_wheel_digest(result)
++        if not result.support_py(for_py_version):
++            msg: Final = f"downloaded wheel {result.name} does not support Python {for_py_version}"
++            raise RuntimeError(msg)
++        destination: Final = to_folder / result.name
++        result.path.replace(destination)
++        return Wheel(destination)
++
++
++def _downloaded_wheel(folder: Path, distribution: str, version_spec: str | None) -> Wheel:
++    files: Final = list(folder.iterdir())
++    if len(files) != 1 or files[0].is_symlink() or not files[0].is_file():
++        msg: Final = f"could not find downloaded wheel for {distribution}: expected one archive"
++        raise RuntimeError(msg)
++    result: Final = Wheel.from_path(files[0])
++    if (
++        result is None
++        or canonicalize_name(result.distribution) != canonicalize_name(distribution)
++        or (version_spec and not Specifier(version_spec).contains(result.version))
++    ):
++        msg: Final = f"unexpected downloaded wheel {files[0].name} for {distribution}{version_spec or ''}"
+         raise RuntimeError(msg)
+-    LOGGER.debug("downloaded wheel %s", result.name)
+-    if verify_against_pypi:
+-        verify_wheel_digest(result)
+     return result
+ 
+ 
+-def _find_downloaded_wheel(
+-    distribution: str, version_spec: str | None, for_py_version: str, to_folder: Path, out: str
+-) -> Wheel | None:
+-    for line in out.splitlines():
+-        stripped_line = line.lstrip()
+-        for marker in ("Saved ", "File was already downloaded "):
+-            if stripped_line.startswith(marker):
+-                return Wheel(Path(stripped_line[len(marker) :]).absolute())
+-    # if for some reason the output does not match fallback to the latest version with that spec
+-    return find_compatible_in_house(distribution, version_spec, for_py_version, to_folder)
+-
+-
+ def find_compatible_in_house(
+     distribution: str, version_spec: str | None, for_py_version: str, in_folder: Path
+ ) -> Wheel | None:
+diff --git a/tests/unit/seed/embed/test_pip_invoke.py b/tests/unit/seed/embed/test_pip_invoke.py
+index 6753fc2..9892bc9 100644
+--- a/tests/unit/seed/embed/test_pip_invoke.py
++++ b/tests/unit/seed/embed/test_pip_invoke.py
+@@ -1,93 +1,100 @@
+ from __future__ import annotations
+ 
+-import itertools
++import subprocess
+ import sys
+-from shutil import copy2
++from pathlib import Path
++from types import SimpleNamespace
++from typing import Final
+ 
+ import pytest
+ 
+ from virtualenv.run import cli_run
+ from virtualenv.seed.embed.pip_invoke import PipInvoke
+-from virtualenv.seed.wheels.bundle import load_embed_wheel
+-from virtualenv.seed.wheels.embed import BUNDLE_FOLDER, BUNDLE_SUPPORT
++from virtualenv.seed.wheels.embed import get_embed_wheel
+ 
+ 
+-@pytest.mark.slow
+-@pytest.mark.parametrize("no", ["pip", "setuptools", "wheel", ""])
+-def test_base_bootstrap_via_pip_invoke(tmp_path, coverage_env, mocker, current_fastest, no) -> None:  # noqa: C901
+-    extra_search_dir = tmp_path / "extra"
+-    extra_search_dir.mkdir()
+-    for_py_version = f"{sys.version_info.major}.{sys.version_info.minor}"
+-    new = BUNDLE_SUPPORT[for_py_version]
+-    for wheel_filename in BUNDLE_SUPPORT[for_py_version].values():
+-        copy2(str(BUNDLE_FOLDER / wheel_filename), str(extra_search_dir))
+-
+-    def _load_embed_wheel(app_data, distribution, _for_py_version, version):
+-        return load_embed_wheel(app_data, distribution, old_ver, version)
+-
+-    old_ver = "3.8"
+-    old = BUNDLE_SUPPORT[old_ver]
+-    mocker.patch("virtualenv.seed.wheels.bundle.load_embed_wheel", side_effect=_load_embed_wheel)
+-
+-    def _execute(cmd, env):
+-        expected = set()
+-        for distribution, with_version in versions.items():
+-            if distribution == no:
+-                continue
+-            if with_version == "embed" or old[distribution] == new[distribution]:
+-                expected.add(BUNDLE_FOLDER)
+-            else:
+-                expected.add(extra_search_dir)
+-        expected_list = list(
+-            itertools.chain.from_iterable(["--find-links", str(e)] for e in sorted(expected, key=str)),
+-        )
+-        found = cmd[-len(expected_list) :] if expected_list else []
+-        assert "--no-index" not in cmd
+-        cmd.append("--no-index")
+-        assert found == expected_list
+-        return original(cmd, env)
+-
+-    original = PipInvoke._execute  # noqa: SLF001
+-    run = mocker.patch.object(PipInvoke, "_execute", side_effect=_execute)
+-    versions = {"pip": "embed", "setuptools": "bundle"}
+-    if sys.version_info[:2] == (3, 8):
+-        versions["wheel"] = new["wheel"].split("-")[1]
+-
+-    create_cmd = [
++@pytest.mark.parametrize(
++    "excluded",
++    [
++        pytest.param("pip", id="no-pip"),
++        pytest.param("setuptools", id="no-setuptools"),
++        pytest.param("wheel", id="no-wheel"),
++        pytest.param("", id="all"),
++    ],
++)
++def test_base_bootstrap_via_pip_invoke(tmp_path: Path, current_fastest: str, excluded: str) -> None:
++    command: Final = [
+         "--seeder",
+         "pip",
+         str(tmp_path / "env"),
+         "--download",
+         "--creator",
+         current_fastest,
+-        "--extra-search-dir",
+-        str(extra_search_dir),
+-        "--app-data",
+-        str(tmp_path / "app-data"),
++        "--pip",
++        "embed",
++        "--setuptools",
++        "embed",
++        "--no-periodic-update",
+     ]
+-    for dist, version in versions.items():
+-        create_cmd.extend([f"--{dist}", version])
+-    if no:
+-        create_cmd.append(f"--no-{no}")
+-    result = cli_run(create_cmd)
+-    coverage_env()
++    expected = {"pip", "setuptools"}
++    if sys.version_info[:2] == (3, 8):
++        command.extend(["--wheel", "embed"])
++        expected.add("wheel")
++    if excluded:
++        command.append(f"--no-{excluded}")
++    session: Final = cli_run(command)
++    assert {path.name for path in session.creator.purelib.iterdir()} & expected == expected - {excluded}
++
++
++def test_pip_invoke_reports_unavailable_wheel(tmp_path: Path) -> None:
++    with pytest.raises(RuntimeError, match="could not get wheel for distribution pip"):
++        cli_run([
++            str(tmp_path / "env"),
++            "--seeder",
++            "pip",
++            "--pip",
++            "0.0.0",
++            "--no-download",
++            "--no-periodic-update",
++        ])
+ 
+-    assert result
+-    assert run.call_count == 1
+ 
+-    site_package = result.creator.purelib
+-    pip = site_package / "pip"
+-    setuptools = site_package / "setuptools"
+-    wheel = site_package / "wheel"
+-    files_post_first_create = list(site_package.iterdir())
++@pytest.mark.usefixtures("_no_coverage")
++def test_pip_invoke_freeze_uses_version_pin(tmp_path: Path) -> None:
++    session: Final = cli_run([
++        str(tmp_path / "env"),
++        "--seeder",
++        "pip",
++        "--pip",
++        "embed",
++        "--no-setuptools",
++        "--no-periodic-update",
++    ])
++    result: Final = subprocess.run(
++        [str(session.creator.exe), "-I", "-m", "pip", "freeze", "--all"],
++        capture_output=True,
++        text=True,
++        encoding="utf-8",
++        check=True,
++    )
++    version: Final = get_embed_wheel("pip", f"{sys.version_info.major}.{sys.version_info.minor}").version
++    assert f"pip=={version}" in result.stdout.splitlines()
+ 
+-    if no:
+-        no_file = locals()[no]
+-        assert no not in files_post_first_create
+ 
+-    for key in ("pip", "setuptools", "wheel"):
+-        if key == no:
+-            continue
+-        if sys.version_info[:2] >= (3, 9) and key == "wheel":
+-            continue
+-        assert locals()[key] in files_post_first_create
++@pytest.mark.parametrize("download", [False, True])
++def test_pip_invoke_only_installs_selected_verified_archives(mocker, for_py_version, download) -> None:
++    wheel = get_embed_wheel("pip", for_py_version)
++    get_wheel = mocker.patch("virtualenv.seed.embed.pip_invoke.get_wheel", return_value=wheel)
++    seeder = SimpleNamespace(
++        download=download, extra_search_dir=[], app_data=object(),
++        periodic_update=False, env={},
++        distribution_to_versions=lambda: {"pip": "bundle"},
++    )
++    with PipInvoke.get_pip_install_cmd(seeder, Path(sys.executable), for_py_version) as command:
++        assert "--no-index" in command
++        assert get_wheel.call_args.kwargs["download"] is download
++        folder = Path(command[command.index("--find-links") + 1])
++        assert list(folder.iterdir()) == [folder / wheel.name]
++        assert (folder / wheel.name).read_bytes() == wheel.path.read_bytes()
++        assert f"pip=={wheel.version}" in command
++    assert not folder.exists()
+diff --git a/tests/unit/seed/wheels/test_acquire.py b/tests/unit/seed/wheels/test_acquire.py
+index 7122070..8b03310 100644
+--- a/tests/unit/seed/wheels/test_acquire.py
++++ b/tests/unit/seed/wheels/test_acquire.py
+@@ -1,11 +1,14 @@
+ from __future__ import annotations
+ 
++import hashlib
++import json
+ import os
+ import sys
+ from datetime import datetime, timezone
++from io import BytesIO
+ from pathlib import Path
+-from subprocess import CalledProcessError
+-from typing import TYPE_CHECKING
++from subprocess import CalledProcessError, Popen
++from typing import TYPE_CHECKING, Final
+ 
+ import pytest
+ 
+@@ -13,10 +16,11 @@ from virtualenv.app_data import AppDataDiskFolder
+ from virtualenv.seed.wheels.acquire import download_wheel, get_wheel, pip_wheel_env_run
+ from virtualenv.seed.wheels.embed import BUNDLE_FOLDER, get_embed_wheel
+ from virtualenv.seed.wheels.periodic_update import UnverifiedWheelError, dump_datetime
+-from virtualenv.seed.wheels.util import Wheel, discover_wheels
++from virtualenv.seed.wheels.util import Wheel
+ 
+ if TYPE_CHECKING:
+     from collections.abc import Callable
++    from ssl import SSLContext
+     from unittest.mock import MagicMock
+ 
+     from pytest_mock import MockerFixture
+@@ -33,124 +37,198 @@ def test_pip_wheel_env_run_could_not_find(session_app_data, mocker) -> None:
+         pip_wheel_env_run([], session_app_data, os.environ)
+ 
+ 
+-def test_download_wheel_bad_output(mocker, for_py_version, session_app_data) -> None:
+-    """if the download contains no match for what wheel was downloaded, pick one that matches from target"""
+-    distribution = "setuptools"
+-    p_open = mocker.MagicMock()
+-    mocker.patch("virtualenv.seed.wheels.acquire.Popen", return_value=p_open)
+-    mocker.patch("virtualenv.seed.wheels.acquire.verify_wheel_digest")
+-    p_open.communicate.return_value = "", ""
+-    p_open.returncode = 0
+-
+-    embed = get_embed_wheel(distribution, for_py_version)
+-    as_path = mocker.MagicMock()
+-    available = discover_wheels(BUNDLE_FOLDER, "setuptools", None, for_py_version)
+-    as_path.iterdir.return_value = [i.path for i in available]
+-
+-    result = download_wheel(
+-        distribution,
+-        f"=={embed.version}",
+-        for_py_version,
+-        [],
+-        session_app_data,
+-        as_path,
+-        os.environ,
++@pytest.mark.parametrize(
++    "version_spec",
++    [
++        pytest.param(lambda _wheel: None, id="latest"),
++        pytest.param(lambda _wheel: "", id="unpinned"),
++        pytest.param(lambda wheel: f"=={wheel.version}", id="pinned"),
++    ],
++)
++def test_download_wheel_uses_staged_archive(
++    download_process: tuple[MagicMock, Wheel, bytearray],
++    for_py_version: str,
++    session_app_data: AppDataDiskFolder,
++    tmp_path: Path,
++    version_spec: Callable[[Wheel], str | None],
++) -> None:
++    _, expected, _ = download_process
++    result: Final = download_wheel("pip", version_spec(expected), for_py_version, [], session_app_data, tmp_path, {})
++    assert (result.path, result.path.read_bytes(), list(tmp_path.iterdir())) == (
++        tmp_path / expected.name,
++        expected.path.read_bytes(),
++        [tmp_path / expected.name],
+     )
+-    assert result.path == embed.path
+-
+ 
+-def test_download_wheel_not_found_raises(mocker, for_py_version, session_app_data) -> None:
+-    """download_wheel must raise a clear error rather than crash when no wheel can be identified at all."""
+-    p_open = mocker.MagicMock()
+-    mocker.patch("virtualenv.seed.wheels.acquire.Popen", return_value=p_open)
+-    p_open.communicate.return_value = "", ""
+-    p_open.returncode = 0
+-    as_path = mocker.MagicMock()
+-    as_path.iterdir.return_value = []
+ 
++def test_download_wheel_not_found_raises(
++    download_process: tuple[MagicMock, Wheel, bytearray],
++    for_py_version: str,
++    session_app_data: AppDataDiskFolder,
++    tmp_path: Path,
++) -> None:
++    download_process[0].side_effect = None
+     with pytest.raises(RuntimeError, match="could not find downloaded wheel"):
+-        download_wheel("setuptools", None, for_py_version, [], session_app_data, as_path, os.environ)
++        download_wheel("pip", None, for_py_version, [], session_app_data, tmp_path, {})
++    assert list(tmp_path.iterdir()) == []
++
++
++@pytest.mark.usefixtures("download_process")
++def test_download_wheel_rejects_wrong_version(
++    for_py_version: str,
++    session_app_data: AppDataDiskFolder,
++    tmp_path: Path,
++) -> None:
++    with pytest.raises(RuntimeError, match="unexpected downloaded wheel"):
++        download_wheel("pip", "==0.0.0", for_py_version, [], session_app_data, tmp_path, {})
++    assert list(tmp_path.iterdir()) == []
+ 
+ 
+-def test_download_fails(mocker, for_py_version, session_app_data) -> None:
+-    p_open = mocker.MagicMock()
+-    mocker.patch("virtualenv.seed.wheels.acquire.Popen", return_value=p_open)
+-    p_open.communicate.return_value = "out", "err"
+-    p_open.returncode = 1
++@pytest.mark.usefixtures("download_process")
++def test_download_wheel_rejects_unsupported_python(
++    session_app_data: AppDataDiskFolder,
++    tmp_path: Path,
++) -> None:
++    with pytest.raises(RuntimeError, match="does not support Python"):
++        download_wheel("pip", None, "2.7", [], session_app_data, tmp_path, {})
++    assert list(tmp_path.iterdir()) == []
+ 
+-    as_path = mocker.MagicMock()
++
++def test_download_fails(
++    download_process: tuple[MagicMock, Wheel, bytearray],
++    for_py_version: str,
++    session_app_data: AppDataDiskFolder,
++    tmp_path: Path,
++) -> None:
++    download_process[0].return_value.configure_mock(returncode=7)
+     with pytest.raises(CalledProcessError) as context:
+-        download_wheel("pip", "==1", for_py_version, [], session_app_data, as_path, os.environ)
+-    exc = context.value
+-    assert exc.output == "out"
+-    assert exc.stderr == "err"
+-    assert exc.returncode == 1
+-    assert [
+-        sys.executable,
+-        "-m",
+-        "pip",
+-        "download",
+-        "--progress-bar",
+-        "off",
+-        "--disable-pip-version-check",
+-        "--only-binary=:all:",
+-        "--no-deps",
+-        "--python-version",
+-        for_py_version,
+-        "-d",
+-        str(as_path),
+-        "pip==1",
+-    ] == exc.cmd
+-
+-
+-def test_download_wheel_python_io_encoding(mocker, for_py_version, session_app_data) -> None:
+-    mock_popen = mocker.patch("virtualenv.seed.wheels.acquire.Popen")
+-    mock_popen.return_value.communicate.return_value = "Saved a-b-c.whl", ""
+-    mock_popen.return_value.returncode = 0
+-    mocker.patch("pathlib.Path.absolute", return_value=Path("a-b-c.whl"))
+-    mocker.patch("virtualenv.seed.wheels.acquire.verify_wheel_digest")
+-
+-    download_wheel("pip", "==1", for_py_version, [], session_app_data, "folder", os.environ.copy())
+-
+-    env = mock_popen.call_args[1]["env"]
+-    assert env["PYTHONIOENCODING"] == "utf-8"
+-
+-
+-def test_download_wheel_verifies_digest(mocker, for_py_version, session_app_data) -> None:
+-    """download_wheel must reject a wheel whose bytes do not match PyPI's published digest."""
+-    mock_popen = mocker.patch("virtualenv.seed.wheels.acquire.Popen")
+-    mock_popen.return_value.communicate.return_value = "Saved a-b-c.whl", ""
+-    mock_popen.return_value.returncode = 0
+-    mocker.patch("pathlib.Path.absolute", return_value=Path("a-b-c.whl"))
+-    verify = mocker.patch(
+-        "virtualenv.seed.wheels.acquire.verify_wheel_digest",
+-        side_effect=RuntimeError("digest mismatch"),
++        download_wheel("pip", None, for_py_version, [], session_app_data, tmp_path, {})
++    error: Final = context.value
++    assert (error.output, error.stderr, error.returncode, error.cmd[:3], list(tmp_path.iterdir())) == (
++        "progress complete",
++        "",
++        7,
++        [sys.executable, "-m", "pip"],
++        [],
+     )
+ 
+-    with pytest.raises(RuntimeError, match="digest mismatch"):
+-        download_wheel("pip", "==1", for_py_version, [], session_app_data, "folder", os.environ.copy())
+ 
+-    assert verify.call_count == 1
++def test_download_wheel_python_io_encoding(
++    download_process: tuple[MagicMock, Wheel, bytearray],
++    for_py_version: str,
++    session_app_data: AppDataDiskFolder,
++    tmp_path: Path,
++) -> None:
++    download_wheel("pip", None, for_py_version, [], session_app_data, tmp_path, {})
++    assert download_process[0].call_args.kwargs["env"]["PYTHONIOENCODING"] == "utf-8"
+ 
+ 
+-@pytest.mark.parametrize("env_var", ["PIP_INDEX_URL", "PIP_EXTRA_INDEX_URL", "PIP_INDEX"])
+-def test_download_wheel_skips_digest_check_for_custom_index(mocker, for_py_version, session_app_data, env_var) -> None:
+-    """A configured custom index may legitimately serve a same-named wheel PyPI never built."""
+-    mock_popen = mocker.patch("virtualenv.seed.wheels.acquire.Popen")
+-    mock_popen.return_value.communicate.return_value = "Saved a-b-c.whl", ""
+-    mock_popen.return_value.returncode = 0
+-    mocker.patch("pathlib.Path.absolute", return_value=Path("a-b-c.whl"))
+-    verify = mocker.patch(
+-        "virtualenv.seed.wheels.acquire.verify_wheel_digest",
+-        side_effect=RuntimeError("would have rejected a legitimate wheel"),
++def test_download_wheel_keeps_failed_verification_out_of_cache(
++    download_process: tuple[MagicMock, Wheel, bytearray],
++    for_py_version: str,
++    session_app_data: AppDataDiskFolder,
++    tmp_path: Path,
++) -> None:
++    download_process[2].extend(b"\n")
++    with pytest.raises(RuntimeError, match="but PyPI reports"):
++        download_wheel("pip", None, for_py_version, [], session_app_data, tmp_path, {})
++    assert list(tmp_path.iterdir()) == []
++
++
++def test_download_wheel_ignores_forged_saved_output(download_process, for_py_version, session_app_data, tmp_path) -> None:
++    process, genuine, payload = download_process
++    process.return_value.communicate.return_value = (f"Saved {genuine.path}", "")
++    payload.extend(b"\n")
++    with pytest.raises(RuntimeError, match="but PyPI reports"):
++        download_wheel("pip", None, for_py_version, [], session_app_data, tmp_path, {})
++    assert list(tmp_path.iterdir()) == []
++
++
++@pytest.mark.parametrize("invalid", ["extra", "wrong-project", "not-wheel", "symlink"])
++def test_download_wheel_rejects_unexpected_staging(download_process, for_py_version, session_app_data, tmp_path, invalid):
++    process, wheel, _payload = download_process
++    original = process.side_effect
++
++    def downloaded(command, **kwargs):
++        result = original(command, **kwargs)
++        staging = Path(command[command.index("-d") + 1])
++        actual = staging / wheel.name
++        if invalid == "extra":
++            (staging / "extra.whl").write_bytes(b"extra")
++        elif invalid == "wrong-project":
++            actual.rename(staging / wheel.name.replace("pip-", "other-", 1))
++        elif invalid == "not-wheel":
++            actual.rename(staging / "not-a-wheel.zip")
++        else:
++            actual.unlink()
++            actual.symlink_to(wheel.path)
++        return result
++
++    process.side_effect = downloaded
++    with pytest.raises(RuntimeError, match="could not find downloaded wheel|unexpected downloaded wheel"):
++        download_wheel("pip", None, for_py_version, [], session_app_data, tmp_path, {})
++    assert list(tmp_path.iterdir()) == []
++
++
++@pytest.mark.parametrize(
++    "env_var",
++    [
++        pytest.param(name, id=name.lower())
++        for name in (
++            "PIP_INDEX_URL",
++            "PIP_EXTRA_INDEX_URL",
++            "PIP_INDEX",
++        )
++    ],
++)
++def test_download_wheel_preserves_custom_index_policy(
++    download_process: tuple[MagicMock, Wheel, bytearray],
++    for_py_version: str,
++    session_app_data: AppDataDiskFolder,
++    tmp_path: Path,
++    env_var: str,
++) -> None:
++    download_process[2].extend(b"\n")
++    result: Final = download_wheel(
++        "pip",
++        None,
++        for_py_version,
++        [],
++        session_app_data,
++        tmp_path,
++        {env_var: "https://index.example/simple"},
+     )
+-    env = os.environ.copy()
+-    env[env_var] = "https://example.com/simple"
++    assert result.path.read_bytes() == bytes(download_process[2])
+ 
+-    result = download_wheel("pip", "==1", for_py_version, [], session_app_data, "folder", env)
+ 
+-    assert result.name == "a-b-c.whl"
+-    assert verify.call_count == 0
++@pytest.fixture
++def download_process(mocker: MockerFixture, for_py_version: str) -> tuple[MagicMock, Wheel, bytearray]:
++    wheel: Final = get_embed_wheel("pip", for_py_version)
++    payload: Final = bytearray(wheel.path.read_bytes())
++    # PyPy can retain the hash input buffer until garbage collection.
++    metadata: Final = json.dumps({
++        "releases": {
++            wheel.version: [
++                {
++                    "filename": wheel.name,
++                    "digests": {"sha256": hashlib.sha256(bytes(payload)).hexdigest()},
++                }
++            ]
++        }
++    }).encode()
++
++    def metadata_response(*_args: str, **_kwargs: SSLContext | None) -> BytesIO:
++        return BytesIO(metadata)
++
++    mocker.patch("virtualenv.seed.wheels.periodic_update.urlopen", autospec=True, side_effect=metadata_response)
++
++    def downloaded(cmd: list[str], **_kwargs: str | int | bool | dict[str, str]) -> Popen[str]:
++        (Path(cmd[cmd.index("-d") + 1]) / wheel.name).write_bytes(payload)
++        return process.return_value
++
++    process: Final = mocker.patch("virtualenv.seed.wheels.acquire.Popen", autospec=True, side_effect=downloaded)
++    process.return_value.configure_mock(**{"communicate.return_value": ("progress complete", ""), "returncode": 0})
++    return process, wheel, payload
+ 
+ 
+ @pytest.fixture
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
index 8b1aee5e0a..397c8bfafc 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
@@ -10,6 +10,10 @@ SRC_URI[sha256sum] = "b66ffe81301766c0d5e2208fc3576652c59d44e7b731fc5f5ed701c9b5
 
 SRC_URI += " \
     file://CVE-2026-102938.patch \
+    file://CVE-2026-102930-dependent.patch \
+    file://CVE-2026-102930_p1.patch \
+    file://CVE-2026-102930_p2.patch \
+    file://CVE-2026-102930_p3.patch \
 "
 
 BBCLASSEXTEND = "native nativesdk"
@@ -26,6 +30,7 @@ RDEPENDS:${PN} += " \
     python3-json \
     python3-misc \
     python3-modules \
+    python3-packaging \
     python3-platformdirs \
 "
 
-- 
2.35.6


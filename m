Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5ACAC61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:27:04 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6021.1787722018714000830
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WwGd3bb6;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8132; q=dns/txt;
  s=iport01; t=1787722018; x=1788931618;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e4W0Uo4TXKu9Np03p6q8Hbi8OG4x5zJ/cjvrRVichmc=;
  b=WwGd3bb678ZgA+yGpxT1UOs1BF67fRuYRPxciqtpGu6FpO8w8v6TB50U
   tATgy1Ir7816pCloWAiU21wXQzM+NNpb5wSNJLQqR55R2a6QNaT4r4K9U
   AW5qY9nqzmXlaopG8Rw+CiCXlJJ0Nnt7e8gCTiHQHJHm0Pu2QVa1amaP3
   GTIU5ZEkMu0BaEG9Zhy72lUpLEDLmXFm6btHD8Cqq7wqpesnJGmkXNC9w
   Od1rCwG09ThEWws7DbH/jFctLRZf0lcwIPRiP84cZLtKY5b6sRkC4TjDV
   jreEr1hw7Anz0L1oiOFkXMLyx0BFvbO7RPxF4rk2HxnV33K/zyvZR5zeE
   g==;
X-CSE-ConnectionGUID: XyX/yt6FTpGGgCQsyWxplA==
X-CSE-MsgGUID: YSfmKydYQKmJ5/kXQAIxoA==
X-IPAS-Result: =?us-ascii?q?A0BKAgBDeI5q/5QQJK1aHgEBCxIMggULgld0XkNJA4RUk?=
 =?us-ascii?q?XMDnhuBfg8BAQEPRA0EAQGEP0YCjWwCJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECAQMjDwEYAS0QHAMBAgMCJgICKyMIGYMCA?=
 =?us-ascii?q?YJ0AxG+VnqBMoEBgygBPwJDUNswAQsUAYEKLoU/gx8BhQJdGAGEfCcbG4Fyh?=
 =?us-ascii?q?Ah2gQWBXAEBgTiEA4JqBIIiehKBWoIIh1KILkiBAhwDWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XNVgbBgWBHYEohBAjGTZ8gQlegSspYAESF4EJggcCglqCB?=
 =?us-ascii?q?QIBSUMOB0c+CxgNSBEsNxQZBD0BbgeOax+CSQEVJyQtASoBfwY+CkgXBRcCH?=
 =?us-ascii?q?pJdMCeCao8cgTWfWgoog3aMIpIwgwoaM4FWhAWlEQuYfY4KlgBQhGmBaDyBK?=
 =?us-ascii?q?AEeCwdwFUgUghIBAQExCUoZD444g2uBf4NlxlUnMgIJAy8BAQcCBw4DC4Fok?=
 =?us-ascii?q?AGBfQEB?=
IronPort-Data: A9a23:KpeS26CcUjyd0RVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDN01jJTz
 WccW2uHOarZNzTzc912Od+0pkMO7cCEz99jOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA//hWYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE8+ReS1AqY6Mk4slYDkp37
 u0nOCgJR0XW7w626OrTpuhEj8AnKozveYgYoHwllGifBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWoHgBfoO3WjPn8bC586lea5j1H0ciZTrxSeoq9fD237nFUggeOybYOPEjCMbfRukEO7t
 273xkf8IExdN+ym4BuV9Vv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/ONpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:9HkK5a8IHg2gzGyXzv5uk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HJoB17726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: 9a23:qZoOem/+gXPUedKeMmOVv34FKoc0biPz8G//DECTMH14d62NTXbFrQ==
X-Talos-MUID: 9a23:ygo80AtAVqjQPPkiT82ntQpsMeR575WXK0UvzNIFi/CtFDx3EmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="819937512"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:26:57 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 7F51518000994;
	Wed, 26 Aug 2026 05:26:57 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 18CE2CCD9B2; Tue, 25 Aug 2026 22:26:57 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 2/3] python3-django: fix CVE-2026-15337
Date: Tue, 25 Aug 2026 22:26:53 -0700
Message-Id: <20260826052654.723156-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260826052654.723156-1-dkelaiya@cisco.com>
References: <20260826052654.723156-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 05:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129477

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/django/django/commit/c72a5dbb64d0777f3f471f1be94e8b2ca91e0959
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-15337

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../CVE-2026-15337.patch                      | 163 ++++++++++++++++++
 .../python/python3-django_5.0.14.bb           |   1 +
 2 files changed, 164 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2026-15337.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2026-15337.patch b/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2026-15337.patch
new file mode 100644
index 0000000000..4cd5022034
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2026-15337.patch
@@ -0,0 +1,163 @@
+From 8c63ca97dd33e3cb7e4a6f78c5f616f2e45ecaf1 Mon Sep 17 00:00:00 2001
+From: Natalia <124304+nessita@users.noreply.github.com>
+Date: Fri, 10 Jul 2026 18:30:21 -0300
+Subject: [PATCH] [5.2.x] Fixed CVE-2026-15337 -- Mitigated potential DoS in
+ check_for_language().
+
+Language codes longer than 500 characters are now rejected before the
+cached lookup, so they are no longer retained as cache keys consuming
+memory from each process.
+
+Thanks Jaeyoung Jang for the report, and Sarah Boyce for reviews.
+
+Backport of 27137e655e442e81095f1f8f77ff3870d9fdf169 from main.
+
+CVE: CVE-2026-15337
+Upstream-Status: Backport [https://github.com/django/django/commit/c72a5dbb64d0777f3f471f1be94e8b2ca91e0959]
+
+Backport Changes:
+- Dropped the docs/release file as current version
+  is 5.0.14 for Scarthgap.
+
+(cherry picked from commit c72a5dbb64d0777f3f471f1be94e8b2ca91e0959)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ django/test/signals.py                 |  2 +-
+ django/utils/translation/trans_real.py | 27 ++++++++++++++++++--------
+ docs/ref/utils.txt                     |  3 +++
+ tests/i18n/tests.py                    | 24 ++++++++++++++++++++++-
+ 4 files changed, 46 insertions(+), 10 deletions(-)
+
+diff --git a/django/test/signals.py b/django/test/signals.py
+index c16f4aa5ee..51ff9c3d98 100644
+--- a/django/test/signals.py
++++ b/django/test/signals.py
+@@ -152,7 +152,7 @@ def language_changed(*, setting, **kwargs):
+         from django.utils.translation import trans_real
+ 
+         trans_real._translations = {}
+-        trans_real.check_for_language.cache_clear()
++        trans_real.translation_catalog_exists.cache_clear()
+ 
+ 
+ @receiver(setting_changed)
+diff --git a/django/utils/translation/trans_real.py b/django/utils/translation/trans_real.py
+index 1c42330451..67937a6470 100644
+--- a/django/utils/translation/trans_real.py
++++ b/django/utils/translation/trans_real.py
+@@ -31,9 +31,10 @@ _default = None
+ # magic gettext number to separate context from message
+ CONTEXT_SEPARATOR = "\x04"
+ 
+-# Maximum number of characters that will be parsed from the Accept-Language
+-# header or cookie to prevent possible denial of service or memory exhaustion
+-# attacks. About 10x longer than the longest value shown on MDN’s
++# Maximum length of a language code that will be processed, to prevent possible
++# denial of service or memory exhaustion attacks. Language codes are taken from
++# the Accept-Language header, the language cookie, the URL path prefix, or the
++# set_language() view. 500 is about 10x the longest value shown on MDN's
+ # Accept-Language page.
+ LANGUAGE_CODE_MAX_LENGTH = 500
+ 
+@@ -65,7 +66,7 @@ def reset_cache(*, setting, **kwargs):
+     languages should no longer be accepted.
+     """
+     if setting in ("LANGUAGES", "LANGUAGE_CODE"):
+-        check_for_language.cache_clear()
++        translation_catalog_exists.cache_clear()
+         get_languages.cache_clear()
+         get_supported_language_variant.cache_clear()
+ 
+@@ -461,19 +462,29 @@ def all_locale_paths():
+     return [globalpath, *settings.LOCALE_PATHS, *app_paths]
+ 
+ 
+-@functools.lru_cache(maxsize=1000)
+ def check_for_language(lang_code):
+     """
+     Check whether there is a global language file for the given language
+     code. This is used to decide whether a user-provided language is
+     available.
+ 
+-    lru_cache should have a maxsize to prevent from memory exhaustion attacks,
+-    as the provided language codes are taken from the HTTP request. See also
++    Reject over-length codes before the cached lookup so that oversized,
++    attacker-controlled values are not retained as cache keys.
++    """
++    if lang_code is None or len(lang_code) > LANGUAGE_CODE_MAX_LENGTH:
++        return False
++    return translation_catalog_exists(lang_code)
++
++
++@functools.lru_cache(maxsize=1000)
++def translation_catalog_exists(lang_code):
++    """Return whether a translation catalog exists for the given language code.
++
++    lru_cache should have a maxsize to prevent memory exhaustion attacks. See:
+     <https://www.djangoproject.com/weblog/2007/oct/26/security-fix/>.
+     """
+     # First, a quick check to make sure lang_code is well-formed (#21458)
+-    if lang_code is None or not language_code_re.search(lang_code):
++    if not language_code_re.search(lang_code):
+         return False
+     return any(
+         gettext_module.find("django", path, [to_locale(lang_code)]) is not None
+diff --git a/docs/ref/utils.txt b/docs/ref/utils.txt
+index 1d0178a263..1f44b4eb85 100644
+--- a/docs/ref/utils.txt
++++ b/docs/ref/utils.txt
+@@ -1082,6 +1082,9 @@ For a complete discussion on the usage of the following see the
+     code (e.g. 'fr', 'pt_BR'). This is used to decide whether a user-provided
+     language is available.
+ 
++    ``lang_code`` has a maximum accepted length of 500 characters. ``False``
++    is returned if it exceeds this limit, before any language-file lookup.
++
+ .. function:: get_language()
+ 
+     Returns the currently selected language code. Returns ``None`` if
+diff --git a/tests/i18n/tests.py b/tests/i18n/tests.py
+index f74e33bf79..b83c9d6a68 100644
+--- a/tests/i18n/tests.py
++++ b/tests/i18n/tests.py
+@@ -58,7 +58,10 @@ from django.utils.translation.reloader import (
+     translation_file_changed,
+     watch_for_translation_changes,
+ )
+-from django.utils.translation.trans_real import LANGUAGE_CODE_MAX_LENGTH
++from django.utils.translation.trans_real import (
++    LANGUAGE_CODE_MAX_LENGTH,
++    translation_catalog_exists,
++)
+ 
+ from .forms import CompanyForm, I18nForm, SelectDateForm
+ from .models import Company, TestModel
+@@ -1995,6 +1998,25 @@ class CountrySpecificLanguageTests(SimpleTestCase):
+         self.assertFalse(check_for_language("tr-TR.UTF8"))
+         self.assertFalse(check_for_language("de-DE.utf-8"))
+ 
++    def test_check_for_language_lang_code_max_length(self):
++        self.addCleanup(translation_catalog_exists.cache_clear)
++
++        # Overly long codes are rejected before the cached lookup, so they are
++        # not retained as cache keys, potentially consuming too much memory.
++        # Codes at the maximum length can reach the cached lookup.
++        for length, cache_size in [
++            (LANGUAGE_CODE_MAX_LENGTH - 1, 1),
++            (LANGUAGE_CODE_MAX_LENGTH, 1),
++            (LANGUAGE_CODE_MAX_LENGTH + 1, 0),
++        ]:
++            translation_catalog_exists.cache_clear()
++            with self.subTest(length=length):
++                self.assertIs(check_for_language("a" * length), False)
++                self.assertEqual(
++                    translation_catalog_exists.cache_info().currsize,
++                    cache_size,
++                )
++
+     def test_check_for_language_null(self):
+         self.assertIs(trans_null.check_for_language("en"), True)
+ 
+-- 
+2.44.4
+
diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.14.bb b/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
index c54e96fd7a..8e98efcdac 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://CVE-2025-64460.patch \
             file://CVE-2025-57833.patch \
             file://CVE-2025-59681.patch \
             file://CVE-2026-15307.patch \
+            file://CVE-2026-15337.patch \
            "
 SRC_URI[sha256sum] = "29019a5763dbd48da1720d687c3522ef40d1c61be6fb2fad27ed79e9f655bc11"
 
-- 
2.35.6



Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B816CCCF9E3
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 13:31:51 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8359.1762510912260254532
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Nov 2025 02:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XIT/7x/j;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4923; q=dns/txt;
  s=iport01; t=1762510912; x=1763720512;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u73RISfebOFaTYSN5zWbxOs89YxU+c9fMogp/eGfZAs=;
  b=XIT/7x/jt6/muOMxNlUZSAJNXAtGWQtEFd4UfuSKuS0JX95EOJPOlVlt
   6okOvGduaPahKu21CDvjKvodSUN/ywpl4P7BQleBwHWYAvxF1KffYGbIa
   vS5RnT9npqVotNi3HybNNMBzxJ42U8ep/J1l2IidXtKIo1+2j6n3UUGzp
   7zThRzGy+7lzKbc36VEQbcTn1ckmuTJ3SV6fXD1xtp/1NCgRvHedfJpzm
   qEnH6zZ3XZ8o1Q9+Rlf9dbJaE1bPbmp0eKKNaUMjEmg/SijGC6hN+k9m5
   vnKWp1STopy0nJuiss2XxplBo3fv57L6Igk8008RnolqOwYsLUWnrbqzx
   Q==;
X-CSE-ConnectionGUID: 7DLmU0GgQaSKNFHaaNHRfg==
X-CSE-MsgGUID: hkTWBbDdQL66Hk+2dkg4gg==
X-IPAS-Result: =?us-ascii?q?A0CwBADIxw1p/5L/Ja1aglmCR3tdQ0mWSAOeGoF/DwEBA?=
 =?us-ascii?q?Q89FAQBAYRBRgKMWAImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWgECAQMyARgBLRAcAwECLysjCBmDAgGCcwMRsGqCLIEBg?=
 =?us-ascii?q?ygBPwJDT9sqgUqFO4gWWBgBhHgnGxuBcoEVgTuCLYEFgVwBAYgkBIIiehSGJ?=
 =?us-ascii?q?3iBWyARkCJIgR4DWSwBVRMNCgsHBYFjAzUMCyoVbjIdgSRBGHGEXSJoDwaBE?=
 =?us-ascii?q?oNRBoEuh3APiksDCxgNSBEsNxQbBj5uB5QPgnyBDgErIF+BLR6TBxqSNaEOC?=
 =?us-ascii?q?iiDdIwelTkaM4VbpRALmHuOCJYGSoRpgWg8gUcLB3AVgyIJSRkPjjgng0KBf?=
 =?us-ascii?q?4NltQElMgI6AgcLAQEDCZNnAQE?=
IronPort-Data: A9a23:0sJ5rKCDNHXX/RVW/3niw5YqxClBgxIJ4kV8jS/XYbTApGkigj0Bm
 DMcCj+FM/bZZWr3fIglboy1o05T75PRzNNrOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357gUmthh
 fuo+5eCYQb9hGYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEnNlKCXxuEoIh891UJ09u/
 PU+CAoDYUXW7w626OrTpuhEnM8vKozveYgYoHwllWCfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYxBPjDS0Un1lM/AZ45muihnHTXeDxDo1XTrq0yi4TW5FAriue1YIaPJrRmQ+1VnXqnj
 Gjq813dXE86N5/FxTmKrn2j07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MskCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:8dtfDa+NAD9pKKP+WMhuk+DfI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdg7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNDU1ZmIK9PoTJ2KDYrAd/OU=
X-Talos-CUID: 9a23:rFZbNm/KjDwQ2/DWcL+VvxE4PsUYKlLS9X7rAGmWKW9gbp2vR1DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3Ay/gaNg2jLepFUCc6wQ4ONgTNrjUj46eSN2oHvZk?=
 =?us-ascii?q?/n5faFS8zYTueg2i4Tdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.19,286,1754956800"; 
   d="scan'208";a="422708424"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Nov 2025 10:21:31 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 636931800022C;
	Fri,  7 Nov 2025 10:21:31 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 10E58CC1288; Fri,  7 Nov 2025 02:21:31 -0800 (PST)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-openembedded] [scarthgap] [PATCH 2/2] python3-django 5.0.11: Fix CVE-2025-26699
Date: Fri,  7 Nov 2025 02:21:15 -0800
Message-ID: <20251107102116.924586-2-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20251107102116.924586-1-adongare@cisco.com>
References: <20251107102116.924586-1-adongare@cisco.com>
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Nov 2025 13:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121374

From: Anil Dongare <adongare@cisco.com>

Upstream Repository: https://github.com/django/django.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-26699
Type: Security Fix
CVE: CVE-2025-26699
Score: 7.5
Patch: https://github.com/django/django/commit/e88f7376fe68

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../python3-django/CVE-2025-26699.patch       | 100 ++++++++++++++++++
 .../python/python3-django_5.0.11.bb           |   2 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
new file mode 100644
index 0000000000..bba65eaee3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
@@ -0,0 +1,100 @@
+From 5fd7c868791b635ef20d2991cc028516b9021dd4 Mon Sep 17 00:00:00 2001
+From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
+Date: Tue, 25 Feb 2025 09:40:54 +0100
+Subject: [PATCH] [5.0.x] Fixed CVE-2025-26699 -- Mitigated potential DoS in
+ wordwrap template filter.
+
+Thanks sw0rd1ight for the report.
+
+Backport of 55d89e25f4115c5674cdd9b9bcba2bb2bb6d820b from main.
+
+CVE: CVE-2025-26699
+Upstream-Status: Backport [https://github.com/django/django/commit/e88f7376fe68]
+
+Backport Changes:
+- The fix has been adapted from the upstream Django v4.2.20 patch for
+  CVE-2025-26699, applied to the python3-django_5.0.11.bb recipe.
+
+- The upstream patch includes changes to a 4.2.20.txt release-note file.
+  This file does not exist in the Django 5.0.11 source tree, so it was
+  intentionally omitted from this backport.
+
+- Only the relevant code changes from the upstream patch were applied.
+  No functional differences exist in the vulnerable logic between
+  Django 4.2.x and 5.0.x.
+
+(cherry picked from commit e88f7376fe68dbf4ebaf11fad1513ce700b45860)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ django/utils/text.py                          | 28 +++++++------------
+ .../filter_tests/test_wordwrap.py             | 11 ++++++++
+ 2 files changed, 21 insertions(+), 18 deletions(-)
+
+diff --git a/django/utils/text.py b/django/utils/text.py
+index d992f80dd2..36ab6a9efc 100644
+--- a/django/utils/text.py
++++ b/django/utils/text.py
+@@ -1,6 +1,7 @@
+ import gzip
+ import re
+ import secrets
++import textwrap
+ import unicodedata
+ from gzip import GzipFile
+ from gzip import compress as gzip_compress
+@@ -97,24 +98,15 @@ def wrap(text, width):
+     ``width``.
+     """
+ 
+-    def _generator():
+-        for line in text.splitlines(True):  # True keeps trailing linebreaks
+-            max_width = min((line.endswith("\n") and width + 1 or width), width)
+-            while len(line) > max_width:
+-                space = line[: max_width + 1].rfind(" ") + 1
+-                if space == 0:
+-                    space = line.find(" ") + 1
+-                    if space == 0:
+-                        yield line
+-                        line = ""
+-                        break
+-                yield "%s\n" % line[: space - 1]
+-                line = line[space:]
+-                max_width = min((line.endswith("\n") and width + 1 or width), width)
+-            if line:
+-                yield line
+-
+-    return "".join(_generator())
++    wrapper = textwrap.TextWrapper(
++        width=width,
++        break_long_words=False,
++        break_on_hyphens=False,
++    )
++    result = []
++    for line in text.splitlines(True):
++        result.extend(wrapper.wrap(line))
++    return "\n".join(result)
+ 
+ 
+ def add_truncation_text(text, truncate=None):
+diff --git a/tests/template_tests/filter_tests/test_wordwrap.py b/tests/template_tests/filter_tests/test_wordwrap.py
+index 88fbd274da..4afa1dd234 100644
+--- a/tests/template_tests/filter_tests/test_wordwrap.py
++++ b/tests/template_tests/filter_tests/test_wordwrap.py
+@@ -78,3 +78,14 @@ class FunctionTests(SimpleTestCase):
+             "this is a long\nparagraph of\ntext that\nreally needs\nto be wrapped\n"
+             "I'm afraid",
+         )
++
++    def test_wrap_long_text(self):
++        long_text = (
++            "this is a long paragraph of text that really needs"
++            " to be wrapped I'm afraid " * 20_000
++        )
++        self.assertIn(
++            "this is a\nlong\nparagraph\nof text\nthat\nreally\nneeds to\nbe wrapped\n"
++            "I'm afraid",
++            wordwrap(long_text, 10),
++        )
+-- 
+2.43.5
+
diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.11.bb b/meta-python/recipes-devtools/python/python3-django_5.0.11.bb
index 43be30c7ec..0d26c7928d 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.11.bb
@@ -4,6 +4,8 @@ inherit setuptools3
 # Windows-specific DoS via NFKC normalization, not applicable to Linux
 CVE_STATUS[CVE-2025-27556] = "not-applicable-platform: Issue only applies on Windows"
 
+SRC_URI = "file://CVE-2025-26699.patch \
+           "
 SRC_URI[sha256sum] = "e7d98fa05ce09cb3e8d5ad6472fb602322acd1740bfdadc29c8404182d664f65"
 
 RDEPENDS:${PN} += "\
-- 
2.44.1



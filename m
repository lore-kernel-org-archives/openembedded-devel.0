Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78028C0723F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:20 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.2281.1699061894488854594
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CEWz+e2w;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hrXQcPjr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b97fb1653-9109c398-73d3-4c3d-892d-c5a74b433c5b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bzFFKqwDDtEq2NHgPw2ZGI1eNx9dCqHnQD0V0aP9oVA=;
	b=CEWz+e2wqBDHKuUMQeFl63JtJWtfhZa7gwP3NC9x3qyK3GS/FbJUEsEuvZRWemYi
	Woi/N6L+qOffLBicEDhFmIacWe8GwtIngG5MIOBUsNOSRZYs0kY9Na3intINXlZLnNz
	wC8SoViQxXxVwZrWKDy3Qsl+uwMygu4Tj2wgvTg0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bzFFKqwDDtEq2NHgPw2ZGI1eNx9dCqHnQD0V0aP9oVA=;
	b=hrXQcPjrLg6OpOEpAxbt9go9qTLwmxZcjNKRhhZQchKvLxYHtOE8mWY5H1HrwSzz
	4yYmO6Xor528G624PXdfK1Rqdyk7Db/psHJdjib+yP9dkf/sBOqjwix7ETgND1Kn7b6
	+vXjm1x7hlH+z9UVsaJ/dFYJHecW10fHgjPjwHtk=
Content-Type: multipart/mixed; boundary="===============7576213570290508843=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pylint: upgrading to 3.0.2 SUCCEEDED
Message-ID: <0101018b97fb1653-9109c398-73d3-4c3d-892d-c5a74b433c5b-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106148

--===============7576213570290508843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pylint* to *3.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pylint-upgrade-3.0.1-3.0.2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 2c0b2fac635ced0511f16a0e03025e7f656f210c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 23:49:45 +0000
Subject: [PATCH] python3-pylint: upgrade 3.0.1 -> 3.0.2

---
 .../{python3-pylint_3.0.1.bb => python3-pylint_3.0.2.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_3.0.1.bb => python3-pylint_3.0.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.0.1.bb b/meta-python/recipes-devtools/python/python3-pylint_3.0.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pylint_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pylint_3.0.2.bb
index 7de38b768..03e878b2b 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.0.2.bb
@@ -3,10 +3,9 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRC_URI += " \
-        git://github.com/pylint-dev/pylint;branch=main;protocol=https \
-        file://run-ptest \
-        "
+SRC_URI += "git://github.com/pylint-dev/pylint;branch=maintenance/3.0.x;protocol=https \
+           file://run-ptest \
+           "
 SRCREV ?= "f2cded41f7f3d4b45236cbe107b366b6caf84bde"
 
 inherit python_setuptools_build_meta ptest
@@ -50,3 +49,5 @@ do_install_ptest() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+SRCREV = "efee9618894795cc8847727108522aa79431ee25"
-- 
2.39.2


--===============7576213570290508843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pylint: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-pylint: SRC_URI changed from "git://github.com/pylint-dev/pylint;branch=main;protocol=https file://run-ptest" to "git://github.com/pylint-dev/pylint;branch=maintenance/3.0.x;protocol=https file://run-ptest"
packages/core2-64-poky-linux/python3-pylint: PV changed from "3.0.1" to "3.0.2"
packages/core2-64-poky-linux/python3-pylint/python3-pylint-dbg: PV changed from "3.0.1" to "3.0.2"
packages/core2-64-poky-linux/python3-pylint/python3-pylint-dbg: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-pylint/python3-pylint-dev: PV changed from "3.0.1" to "3.0.2"
packages/core2-64-poky-linux/python3-pylint/python3-pylint-dev: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-pylint/python3-pylint-doc: PV changed from "3.0.1" to "3.0.2"
packages/core2-64-poky-linux/python3-pylint/python3-pylint-doc: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-pylint/python3-pylint-locale: PV changed from "3.0.1" to "3.0.2"
packages/core2-64-poky-linux/python3-pylint/python3-pylint-locale: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-pylint/python3-pylint-ptest: FILELIST: added "/usr/lib/python3-pylint/ptest/tests/functional/n/nested_min_max_py39.txt /usr/lib/python3-pylint/ptest/tests/functional/i/inconsistent/inconsistent_quotes_fstring_py312.rc /usr/lib/python3-pylint/ptest/tests/functional/i/inconsistent/inconsistent_quotes_fstring.rc /usr/lib/python3-pylint/ptest/tests/functional/i/inconsistent/inconsistent_quotes_fstring_py312_311.py /usr/lib/python3-pylint/ptest/tests/regrtest_data/duplicate_code/ignore_conditional_imports/file_two.py /usr/lib/python3-pylint/ptest/tests/functional/u/used/used_before_assignment_py312.py /usr/lib/python3-pylint/ptest/tests/functional/n/nested_min_max_py39.rc /usr/lib/python3-pylint/ptest/tests/functional/u/used/used_before_assignment_py312.rc /usr/lib/python3-pylint/ptest/tests/functional/i/inconsistent/inconsistent_quotes_fstring_py312_311.rc /usr/lib/python3-pylint/ptest/tests/regrtest_data/duplicate_code/ignore_conditional_imports/file
 _one.py /usr/lib/python3-pylint/ptest/tests/functional/i/inconsistent/inconsistent_quotes_fstring_py312.txt /usr/lib/python3-pylint/ptest/tests/functional/i/inconsistent/inconsistent_quotes_fstring_py312.py /usr/lib/python3-pylint/ptest/tests/functional/n/nested_min_max_py39.py /usr/lib/python3-pylint/ptest/tests/functional/i/inconsistent/inconsistent_quotes_fstring.py /usr/lib/python3-pylint/ptest/tests/regrtest_data/duplicate_code/ignore_conditional_imports/__init__.py"
packages/core2-64-poky-linux/python3-pylint/python3-pylint-ptest: PKGSIZE changed from 2109375 to 2112750 (+0%)
packages/core2-64-poky-linux/python3-pylint/python3-pylint-ptest: PV changed from "3.0.1" to "3.0.2"
packages/core2-64-poky-linux/python3-pylint/python3-pylint-ptest: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-pylint/python3-pylint-src: PV changed from "3.0.1" to "3.0.2"
packages/core2-64-poky-linux/python3-pylint/python3-pylint-src: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-pylint/python3-pylint-staticdev: PV changed from "3.0.1" to "3.0.2"
packages/core2-64-poky-linux/python3-pylint/python3-pylint-staticdev: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-pylint/python3-pylint: PKGSIZE changed from 3886483 to 3889010 (+0%)
packages/core2-64-poky-linux/python3-pylint/python3-pylint: PV changed from "3.0.1" to "3.0.2"
packages/core2-64-poky-linux/python3-pylint/python3-pylint: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
Changes to packages/core2-64-poky-linux/python3-pylint (sysroot):
  /usr/lib/python3.11/site-packages/pylint-3.0.1.dist-info moved to /usr/lib/python3.11/site-packages/pylint-3.0.2.dist-info

--===============7576213570290508843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pylint/python3-pylint-ptest: FILELIST: added "/usr/lib/python3-pylint/ptest/tests/functional/n/nested_min_max_py39.rc /usr/lib/python3-pylint/ptest/tests/functional/n/nested_min_max_py39.py /usr/lib/python3-pylint/ptest/tests/functional/i/inconsistent/inconsistent_quotes_fstring_py312.py /usr/lib/python3-pylint/ptest/tests/functional/n/nested_min_max_py39.txt /usr/lib/python3-pylint/ptest/tests/functional/u/used/used_before_assignment_py312.py /usr/lib/python3-pylint/ptest/tests/functional/i/inconsistent/inconsistent_quotes_fstring.rc /usr/lib/python3-pylint/ptest/tests/regrtest_data/duplicate_code/ignore_conditional_imports/file_two.py /usr/lib/python3-pylint/ptest/tests/regrtest_data/duplicate_code/ignore_conditional_imports/file_one.py /usr/lib/python3-pylint/ptest/tests/functional/i/inconsistent/inconsistent_quotes_fstring.py /usr/lib/python3-pylint/ptest/tests/functional/i/inconsistent/inconsistent_quotes_fstring_py312_311.py /usr/lib/python3
 -pylint/ptest/tests/functional/i/inconsistent/inconsistent_quotes_fstring_py312_311.rc /usr/lib/python3-pylint/ptest/tests/regrtest_data/duplicate_code/ignore_conditional_imports/__init__.py /usr/lib/python3-pylint/ptest/tests/functional/i/inconsistent/inconsistent_quotes_fstring_py312.rc /usr/lib/python3-pylint/ptest/tests/functional/i/inconsistent/inconsistent_quotes_fstring_py312.txt /usr/lib/python3-pylint/ptest/tests/functional/u/used/used_before_assignment_py312.rc"
Changes to packages/core2-64-poky-linux/python3-pylint (sysroot):
  /usr/lib/python3.11/site-packages/pylint-3.0.1.dist-info moved to /usr/lib/python3.11/site-packages/pylint-3.0.2.dist-info

--===============7576213570290508843==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pylint-upgrade-3.0.1-3.0.2.patch"

RnJvbSAyYzBiMmZhYzYzNWNlZDA1MTFmMTZhMGUwMzAyNWU3ZjY1NmYyMTBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMzo0OTo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlsaW50OiB1cGdyYWRlIDMuMC4xIC0+IDMuMC4yCgotLS0KIC4uLi97cHl0aG9uMy1w
eWxpbnRfMy4wLjEuYmIgPT4gcHl0aG9uMy1weWxpbnRfMy4wLjIuYmJ9IHwgOSArKysrKy0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlsaW50XzMuMC4x
LmJiID0+IHB5dGhvbjMtcHlsaW50XzMuMC4yLmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEt
cHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlsaW50XzMuMC4xLmJiIGIv
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWxpbnRfMy4wLjIu
YmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weWxpbnRfMy4wLjEuYmIKcmVuYW1lIHRvIG1ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlsaW50XzMuMC4yLmJiCmluZGV4
IDdkZTM4Yjc2OC4uMDNlODc4YjJiIDEwMDY0NAotLS0gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5bGludF8zLjAuMS5iYgorKysgYi9tZXRhLXB5dGhvbi9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5bGludF8zLjAuMi5iYgpAQCAtMywxMCAr
Myw5IEBAIEhPTUVQQUdFPSAiaHR0cDovL3d3dy5weWxpbnQub3JnLyIKIExJQ0VOU0UgPSAiR1BM
LTIuMC1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YzEwN2Nm
NzU0NTUwZTY1NzU1YzQyOTg1YTVkNGU5YzkiCiAKLVNSQ19VUkkgKz0gIiBcCi0gICAgICAgIGdp
dDovL2dpdGh1Yi5jb20vcHlsaW50LWRldi9weWxpbnQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0
cHMgXAotICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKLSAgICAgICAgIgorU1JDX1VSSSArPSAi
Z2l0Oi8vZ2l0aHViLmNvbS9weWxpbnQtZGV2L3B5bGludDticmFuY2g9bWFpbnRlbmFuY2UvMy4w
Lng7cHJvdG9jb2w9aHR0cHMgXAorICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKKyAgICAg
ICAgICAgIgogU1JDUkVWID89ICJmMmNkZWQ0MWY3ZjNkNGI0NTIzNmNiZTEwN2IzNjZiNmNhZjg0
YmRlIgogCiBpbmhlcml0IHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgcHRlc3QKQEAgLTUw
LDMgKzQ5LDUgQEAgZG9faW5zdGFsbF9wdGVzdCgpIHsKIH0KIAogQkJDTEFTU0VYVEVORCA9ICJu
YXRpdmUgbmF0aXZlc2RrIgorCitTUkNSRVYgPSAiZWZlZTk2MTg4OTQ3OTVjYzg4NDc3MjcxMDg1
MjJhYTc5NDMxZWUyNSIKLS0gCjIuMzkuMgoK

--===============7576213570290508843==--


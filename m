Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19CEFC04FDE
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:20 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.2197.1699061893831492029
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EkPeTT/j;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PwdazgYy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b97fb186c-d4ea56bf-17ad-450b-81f0-addbacf94e0e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ri/c5BMyEufBW3FhFPm7ZeV0PTsyHVQeN/u7SZQYQaA=;
	b=EkPeTT/jQ/zcMlkdHUFHxNIb6KDbpL1QBCHy/oPDJDTaaCJi1WyP/auLmz6C30r9
	sLIG7eaSP0U8yU9GsxHT7n3gw0hMJY6mAnmfY3+SebSoZtl1QrIuvFWcsiEM+QhZc8j
	3JvZ90yrCKbri5hEniyvcf77bNbh2/kZdUMwA1HU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ri/c5BMyEufBW3FhFPm7ZeV0PTsyHVQeN/u7SZQYQaA=;
	b=PwdazgYyvaMRDJFn0qihZu3ygk/h9Hfy35mou4Q2Ed1sb2lKg6JN8/K1ybG1z80b
	zYRwP4gYoPrzrvdbFhbblouPeZqztHX3Z35aH90o8N7goVn3OsqUsr2ha7qSPZF6/V0
	d3jGJ0cis3Ah0732LQZWXTEPh6YJsN+pL3Mz8FPw=
Content-Type: multipart/mixed; boundary="===============5587699960839146868=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-reedsolo: upgrading to 2.0.13 SUCCEEDED
Message-ID: <0101018b97fb186c-d4ea56bf-17ad-450b-81f0-addbacf94e0e-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106161

--===============5587699960839146868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-reedsolo* to *2.0.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-reedsolo-upgrade-1.7.0-2.0.13.patch
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
From a04954b1b99cadb5fc2be38f59aef7bb03eb9433 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 00:24:52 +0000
Subject: [PATCH] python3-reedsolo: upgrade 1.7.0 -> 2.0.13

---
 .../{python3-reedsolo_1.7.0.bb => python3-reedsolo_2.0.13.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-reedsolo/{python3-reedsolo_1.7.0.bb => python3-reedsolo_2.0.13.bb} (75%)

diff --git a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
similarity index 75%
rename from meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb
rename to meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
index b6c40921c..bb5b973d8 100644
--- a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb
+++ b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/tomerfiliba/reedsolomon"
 LICENSE = "MIT-0 | Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ffde61aeb8917e70e0257e0a4b6d103c"
 
-SRC_URI[sha256sum] = "c1359f02742751afe0f1c0de9f0772cc113835aa2855d2db420ea24393c87732"
+SRC_URI[sha256sum] = "71b4121c6860a55899435c552051a19d5f023c50358be4b1c0fa0c6e2f4ac717"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============5587699960839146868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-reedsolo: PKGV changed from 1.7.0 [default] to 2.0.13 [default]
packages/core2-64-poky-linux/python3-reedsolo: PV changed from "1.7.0" to "2.0.13"
packages/core2-64-poky-linux/python3-reedsolo: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/reedsolo/reedsolo-1.7.0.tar.gz;downloadfilename=reedsolo-1.7.0.tar.gz" to "https://files.pythonhosted.org/packages/source/r/reedsolo/reedsolo-2.0.13.tar.gz;downloadfilename=reedsolo-2.0.13.tar.gz"
packages/core2-64-poky-linux/python3-reedsolo/python3-reedsolo-dbg: PKGV changed from 1.7.0 [default] to 2.0.13 [default]
packages/core2-64-poky-linux/python3-reedsolo/python3-reedsolo-dbg: PV changed from "1.7.0" to "2.0.13"
packages/core2-64-poky-linux/python3-reedsolo/python3-reedsolo-dev: PKGV changed from 1.7.0 [default] to 2.0.13 [default]
packages/core2-64-poky-linux/python3-reedsolo/python3-reedsolo-dev: PV changed from "1.7.0" to "2.0.13"
packages/core2-64-poky-linux/python3-reedsolo/python3-reedsolo-doc: PKGV changed from 1.7.0 [default] to 2.0.13 [default]
packages/core2-64-poky-linux/python3-reedsolo/python3-reedsolo-doc: PV changed from "1.7.0" to "2.0.13"
packages/core2-64-poky-linux/python3-reedsolo/python3-reedsolo-locale: PKGV changed from 1.7.0 [default] to 2.0.13 [default]
packages/core2-64-poky-linux/python3-reedsolo/python3-reedsolo-locale: PV changed from "1.7.0" to "2.0.13"
packages/core2-64-poky-linux/python3-reedsolo/python3-reedsolo-src: PKGV changed from 1.7.0 [default] to 2.0.13 [default]
packages/core2-64-poky-linux/python3-reedsolo/python3-reedsolo-src: PV changed from "1.7.0" to "2.0.13"
packages/core2-64-poky-linux/python3-reedsolo/python3-reedsolo-staticdev: PKGV changed from 1.7.0 [default] to 2.0.13 [default]
packages/core2-64-poky-linux/python3-reedsolo/python3-reedsolo-staticdev: PV changed from "1.7.0" to "2.0.13"
packages/core2-64-poky-linux/python3-reedsolo/python3-reedsolo: FILELIST: directory renamed /usr/lib/python3.11/site-packages/reedsolo-1.7.0.dist-info -> /usr/lib/python3.11/site-packages/reedsolo-2.0.13.dist-info, added "/usr/lib/python3.11/site-packages/tests/test_creedsolo.py /usr/lib/python3.11/site-packages/tests/__pycache__/perf.cpython-311.pyc /usr/lib/python3.11/site-packages/tests/__pycache__/test_creedsolo.cpython-311.pyc /usr/lib/python3.11/site-packages/tests/__pycache__/test_reedsolo.cpython-311.pyc /usr/lib/python3.11/site-packages/tests/perf.py /usr/lib/python3.11/site-packages/tests/test_reedsolo.py"
packages/core2-64-poky-linux/python3-reedsolo/python3-reedsolo: PKGV changed from 1.7.0 [default] to 2.0.13 [default]
packages/core2-64-poky-linux/python3-reedsolo/python3-reedsolo: PKGSIZE changed from 146449 to 347227 (+137%)
packages/core2-64-poky-linux/python3-reedsolo/python3-reedsolo: PV changed from "1.7.0" to "2.0.13"
Changes to packages/core2-64-poky-linux/python3-reedsolo (sysroot):
  /usr/lib/python3.11/site-packages/reedsolo-2.0.13.dist-info was added
  /usr/lib/python3.11/site-packages/reedsolo-2.0.13.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/reedsolo-2.0.13.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/reedsolo-2.0.13.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/reedsolo-2.0.13.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/reedsolo-2.0.13.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/tests was added
  /usr/lib/python3.11/site-packages/tests/perf.py was added
  /usr/lib/python3.11/site-packages/tests/__pycache__ was added
  /usr/lib/python3.11/site-packages/tests/__pycache__/perf.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/tests/__pycache__/test_creedsolo.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/tests/__pycache__/test_reedsolo.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/tests/test_creedsolo.py was added
  /usr/lib/python3.11/site-packages/tests/test_reedsolo.py was added
  /usr/lib/python3.11/site-packages/reedsolo-1.7.0.dist-info was removed
  /usr/lib/python3.11/site-packages/reedsolo-1.7.0.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/reedsolo-1.7.0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/reedsolo-1.7.0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/reedsolo-1.7.0.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/reedsolo-1.7.0.dist-info/WHEEL was removed

--===============5587699960839146868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-reedsolo/python3-reedsolo: PKGSIZE changed from 146449 to 347227 (+137%)
packages/core2-64-poky-linux/python3-reedsolo/python3-reedsolo: FILELIST: directory renamed /usr/lib/python3.11/site-packages/reedsolo-1.7.0.dist-info -> /usr/lib/python3.11/site-packages/reedsolo-2.0.13.dist-info, added "/usr/lib/python3.11/site-packages/tests/perf.py /usr/lib/python3.11/site-packages/tests/test_creedsolo.py /usr/lib/python3.11/site-packages/tests/test_reedsolo.py /usr/lib/python3.11/site-packages/tests/__pycache__/perf.cpython-311.pyc /usr/lib/python3.11/site-packages/tests/__pycache__/test_creedsolo.cpython-311.pyc /usr/lib/python3.11/site-packages/tests/__pycache__/test_reedsolo.cpython-311.pyc"
Changes to packages/core2-64-poky-linux/python3-reedsolo (sysroot):
  /usr/lib/python3.11/site-packages/reedsolo-2.0.13.dist-info was added
  /usr/lib/python3.11/site-packages/reedsolo-2.0.13.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/reedsolo-2.0.13.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/reedsolo-2.0.13.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/reedsolo-2.0.13.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/reedsolo-2.0.13.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/tests was added
  /usr/lib/python3.11/site-packages/tests/perf.py was added
  /usr/lib/python3.11/site-packages/tests/__pycache__ was added
  /usr/lib/python3.11/site-packages/tests/__pycache__/perf.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/tests/__pycache__/test_creedsolo.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/tests/__pycache__/test_reedsolo.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/tests/test_creedsolo.py was added
  /usr/lib/python3.11/site-packages/tests/test_reedsolo.py was added
  /usr/lib/python3.11/site-packages/reedsolo-1.7.0.dist-info was removed
  /usr/lib/python3.11/site-packages/reedsolo-1.7.0.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/reedsolo-1.7.0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/reedsolo-1.7.0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/reedsolo-1.7.0.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/reedsolo-1.7.0.dist-info/WHEEL was removed

--===============5587699960839146868==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-reedsolo-upgrade-1.7.0-2.0.13.patch"

RnJvbSBhMDQ5NTRiMWI5OWNhZGI1ZmMyYmUzOGY1OWFlZjdiYjAzZWI5NDMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMDoyNDo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcmVlZHNvbG86IHVwZ3JhZGUgMS43LjAgLT4gMi4wLjEzCgotLS0KIC4uLi97cHl0aG9u
My1yZWVkc29sb18xLjcuMC5iYiA9PiBweXRob24zLXJlZWRzb2xvXzIuMC4xMy5iYn0gICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uMy1yZWVkc29sby97cHl0aG9uMy1y
ZWVkc29sb18xLjcuMC5iYiA9PiBweXRob24zLXJlZWRzb2xvXzIuMC4xMy5iYn0gKDc1JSkKCmRp
ZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbjMtcmVlZHNvbG8v
cHl0aG9uMy1yZWVkc29sb18xLjcuMC5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uMy1yZWVkc29sby9weXRob24zLXJlZWRzb2xvXzIuMC4xMy5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDc1JQpyZW5hbWUgZnJvbSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbjMt
cmVlZHNvbG8vcHl0aG9uMy1yZWVkc29sb18xLjcuMC5iYgpyZW5hbWUgdG8gbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24zLXJlZWRzb2xvL3B5dGhvbjMtcmVlZHNvbG9fMi4wLjEz
LmJiCmluZGV4IGI2YzQwOTIxYy4uYmI1Yjk3M2Q4IDEwMDY0NAotLS0gYS9tZXRhLXB5dGhvbi9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbjMtcmVlZHNvbG8vcHl0aG9uMy1yZWVkc29sb18xLjcuMC5i
YgorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbjMtcmVlZHNvbG8vcHl0
aG9uMy1yZWVkc29sb18yLjAuMTMuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBz
Oi8vZ2l0aHViLmNvbS90b21lcmZpbGliYS9yZWVkc29sb21vbiIKIExJQ0VOU0UgPSAiTUlULTAg
fCBVbmxpY2Vuc2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mZmRl
NjFhZWI4OTE3ZTcwZTAyNTdlMGE0YjZkMTAzYyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImMx
MzU5ZjAyNzQyNzUxYWZlMGYxYzBkZTlmMDc3MmNjMTEzODM1YWEyODU1ZDJkYjQyMGVhMjQzOTNj
ODc3MzIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzFiNDEyMWM2ODYwYTU1ODk5NDM1YzU1MjA1
MWExOWQ1ZjAyM2M1MDM1OGJlNGIxYzBmYTBjNmUyZjRhYzcxNyIKIAogaW5oZXJpdCBweXBpIHNl
dHVwdG9vbHMzCiAKLS0gCjIuMzkuMgoK

--===============5587699960839146868==--


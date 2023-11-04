Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6657C07EBE
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:21 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.2282.1699061894545459158
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LyRz3vos;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=H9JFTJUd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b97fb0d49-38dd927f-0a14-4907-be1d-420441a3eadf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gnmt3ZO8/5TQT6I4/Pw32K0WteqnGvQBk5OSt+pw9cU=;
	b=LyRz3vosMMX4ZyeNwESXI4dZ71CvyNJ4moF6a0hX2cAe7MgSsmO1oML2oia/mgp1
	uwp49SOQd7nGuLo+K50uV+8jvnstXMrgxrpJxEmx42Mip38l5Rb3hxCTyL4EonuiMK8
	/LzqfqoH+A5/5cROR+fmrJ7N+YLAe3tnFRXCPqOM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gnmt3ZO8/5TQT6I4/Pw32K0WteqnGvQBk5OSt+pw9cU=;
	b=H9JFTJUdu1BBHHGlVtAVPFHtEBLu3W0vMtd4JUFtFe2uHLt97ttF7l6FrNrMM9xq
	OnMGcyk+adVnmBdh3+1Uwe1xUytajWwN6aSwTC+eg59XYg8lJ0P3W0N7Q9OpBZ4AMXU
	YGrGFPaWAN8bMmw/bqv8Yg3sJE9KlgdeLh4Sv1EU=
Content-Type: multipart/mixed; boundary="===============3089880387506131039=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-executing: upgrading to 2.0.1 SUCCEEDED
Message-ID: <0101018b97fb0d49-38dd927f-0a14-4907-be1d-420441a3eadf-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106119

--===============3089880387506131039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-executing* to *2.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-executing-upgrade-2.0.0-2.0.1.patch
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
From dda1069ad6c15a97650a69985ee66b37af96445b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 21:01:36 +0000
Subject: [PATCH] python3-executing: upgrade 2.0.0 -> 2.0.1

---
 .../{python3-executing_2.0.0.bb => python3-executing_2.0.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-executing_2.0.0.bb => python3-executing_2.0.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-executing_2.0.0.bb b/meta-python/recipes-devtools/python/python3-executing_2.0.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-executing_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-executing_2.0.1.bb
index 4c4fd4516..3ee1e66f9 100644
--- a/meta-python/recipes-devtools/python/python3-executing_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-executing_2.0.1.bb
@@ -6,4 +6,4 @@ DEPENDS = "python3-setuptools-scm-native"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "0ff053696fdeef426cda5bd18eacd94f82c91f49823a2e9090124212ceea9b08"
+SRC_URI[sha256sum] = "35afe2ce3affba8ee97f2d69927fa823b08b472b7b994e36a52a964b93d16147"
-- 
2.39.2


--===============3089880387506131039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-executing: SRC_URI changed from "https://files.pythonhosted.org/packages/source/e/executing/executing-2.0.0.tar.gz;downloadfilename=executing-2.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/e/executing/executing-2.0.1.tar.gz;downloadfilename=executing-2.0.1.tar.gz"
packages/core2-64-poky-linux/python3-executing: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-executing: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-executing/python3-executing-dbg: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-executing/python3-executing-dbg: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-executing/python3-executing-dev: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-executing/python3-executing-dev: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-executing/python3-executing-doc: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-executing/python3-executing-doc: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-executing/python3-executing-locale: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-executing/python3-executing-locale: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-executing/python3-executing-src: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-executing/python3-executing-src: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-executing/python3-executing-staticdev: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-executing/python3-executing-staticdev: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-executing/python3-executing: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-executing/python3-executing: PKGSIZE changed from 172840 to 172863 (+0%)
packages/core2-64-poky-linux/python3-executing/python3-executing: PV changed from "2.0.0" to "2.0.1"
Changes to packages/core2-64-poky-linux/python3-executing (sysroot):
  /usr/lib/python3.11/site-packages/executing-2.0.0.dist-info moved to /usr/lib/python3.11/site-packages/executing-2.0.1.dist-info

--===============3089880387506131039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-executing (sysroot):
  /usr/lib/python3.11/site-packages/executing-2.0.0.dist-info moved to /usr/lib/python3.11/site-packages/executing-2.0.1.dist-info

--===============3089880387506131039==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-executing-upgrade-2.0.0-2.0.1.patch"

RnJvbSBkZGExMDY5YWQ2YzE1YTk3NjUwYTY5OTg1ZWU2NmIzN2FmOTY0NDViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMTowMTozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZXhlY3V0aW5nOiB1cGdyYWRlIDIuMC4wIC0+IDIuMC4xCgotLS0KIC4uLi97cHl0aG9u
My1leGVjdXRpbmdfMi4wLjAuYmIgPT4gcHl0aG9uMy1leGVjdXRpbmdfMi4wLjEuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWV4ZWN1dGluZ18y
LjAuMC5iYiA9PiBweXRob24zLWV4ZWN1dGluZ18yLjAuMS5iYn0gKDc0JSkKCmRpZmYgLS1naXQg
YS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWV4ZWN1dGluZ18y
LjAuMC5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZXhl
Y3V0aW5nXzIuMC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggNzQlCnJlbmFtZSBmcm9tIG1ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZXhlY3V0aW5nXzIuMC4wLmJiCnJl
bmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWV4ZWN1
dGluZ18yLjAuMS5iYgppbmRleCA0YzRmZDQ1MTYuLjNlZTFlNjZmOSAxMDA2NDQKLS0tIGEvbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1leGVjdXRpbmdfMi4wLjAu
YmIKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1leGVj
dXRpbmdfMi4wLjEuYmIKQEAgLTYsNCArNiw0IEBAIERFUEVORFMgPSAicHl0aG9uMy1zZXR1cHRv
b2xzLXNjbS1uYXRpdmUiCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9t
ZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwZmYwNTM2OTZmZGVlZjQyNmNkYTViZDE4ZWFj
ZDk0ZjgyYzkxZjQ5ODIzYTJlOTA5MDEyNDIxMmNlZWE5YjA4IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjM1YWZlMmNlM2FmZmJhOGVlOTdmMmQ2OTkyN2ZhODIzYjA4YjQ3MmI3Yjk5NGUzNmE1MmE5
NjRiOTNkMTYxNDciCi0tIAoyLjM5LjIKCg==

--===============3089880387506131039==--


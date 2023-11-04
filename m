Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C355CC0032E
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:19 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.2288.1699061895893924145
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=D/rwBOKG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RXxzMqEP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b97fb1a6f-61f2d360-c9f1-4556-8300-f06b4fb9dd15-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061898;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=voJXlQbiZuMJOK3RocygqQc91RS67aaxxBWk+xNRU8w=;
	b=D/rwBOKGh05NLB53GDRPthgReSEpqW8hHTKQhc51H6iLvn8UG5H3HsDvyRhhQF5A
	Qm4OEvsc5v4AxpNV7WCR2DGGpwaMTAwMNIpdQTzgqfVJLYTAN8xnprHvuEtoMV6VxMN
	eBwQdWdFE5dY38CfPuffusDJwSjIqtkEzTioSQek=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061898;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=voJXlQbiZuMJOK3RocygqQc91RS67aaxxBWk+xNRU8w=;
	b=RXxzMqEPCKusSBLty+MHXB9NujJjXcpHsxNtBbw4OFiEqa7jEVm+QVudHrhSLRTs
	yr7IzPJI5mLZ5D1unTtkKaF/0bil0L0Qr9FikY0qP6zrH1moDi+JNgk2MYQ9LrKzwB2
	2XVxXw7fA8igxyi0iTKUHrFNuUOcXyG+tziKIDoQ=
Content-Type: multipart/mixed; boundary="===============0418044507412390636=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-tomlkit: upgrading to 0.12.2 SUCCEEDED
Message-ID: <0101018b97fb1a6f-61f2d360-c9f1-4556-8300-f06b4fb9dd15-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106170

--===============0418044507412390636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-tomlkit* to *0.12.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-tomlkit-upgrade-0.12.1-0.12.2.patch
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
From e9fcde0e28d6ff07666b44001bd1f0ab98ba3e4a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 00:47:00 +0000
Subject: [PATCH] python3-tomlkit: upgrade 0.12.1 -> 0.12.2

---
 .../{python3-tomlkit_0.12.1.bb => python3-tomlkit_0.12.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tomlkit_0.12.1.bb => python3-tomlkit_0.12.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb b/meta-python/recipes-devtools/python/python3-tomlkit_0.12.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb
rename to meta-python/recipes-devtools/python/python3-tomlkit_0.12.2.bb
index 59e83e00d..bbc5356d8 100644
--- a/meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tomlkit_0.12.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tomlkit/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82"
 
-SRC_URI[sha256sum] = "38e1ff8edb991273ec9f6181244a6a391ac30e9f5098e7535640ea6be97a7c86"
+SRC_URI[sha256sum] = "df32fab589a81f0d7dc525a4267b6d7a64ee99619cbd1eeb0fae32c1dd426977"
 
 inherit pypi python_poetry_core ptest
 
-- 
2.39.2


--===============0418044507412390636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-tomlkit: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/tomlkit/tomlkit-0.12.1.tar.gz;downloadfilename=tomlkit-0.12.1.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/t/tomlkit/tomlkit-0.12.2.tar.gz;downloadfilename=tomlkit-0.12.2.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-tomlkit: PKGV changed from 0.12.1 [default] to 0.12.2 [default]
packages/core2-64-poky-linux/python3-tomlkit: PV changed from "0.12.1" to "0.12.2"
packages/core2-64-poky-linux/python3-tomlkit/python3-tomlkit-dbg: PKGV changed from 0.12.1 [default] to 0.12.2 [default]
packages/core2-64-poky-linux/python3-tomlkit/python3-tomlkit-dbg: PV changed from "0.12.1" to "0.12.2"
packages/core2-64-poky-linux/python3-tomlkit/python3-tomlkit-dev: PKGV changed from 0.12.1 [default] to 0.12.2 [default]
packages/core2-64-poky-linux/python3-tomlkit/python3-tomlkit-dev: PV changed from "0.12.1" to "0.12.2"
packages/core2-64-poky-linux/python3-tomlkit/python3-tomlkit-doc: PKGV changed from 0.12.1 [default] to 0.12.2 [default]
packages/core2-64-poky-linux/python3-tomlkit/python3-tomlkit-doc: PV changed from "0.12.1" to "0.12.2"
packages/core2-64-poky-linux/python3-tomlkit/python3-tomlkit-locale: PKGV changed from 0.12.1 [default] to 0.12.2 [default]
packages/core2-64-poky-linux/python3-tomlkit/python3-tomlkit-locale: PV changed from "0.12.1" to "0.12.2"
packages/core2-64-poky-linux/python3-tomlkit/python3-tomlkit-ptest: PKGV changed from 0.12.1 [default] to 0.12.2 [default]
packages/core2-64-poky-linux/python3-tomlkit/python3-tomlkit-ptest: PKGSIZE changed from 1757272 to 1757340 (+0%)
packages/core2-64-poky-linux/python3-tomlkit/python3-tomlkit-ptest: PV changed from "0.12.1" to "0.12.2"
packages/core2-64-poky-linux/python3-tomlkit/python3-tomlkit-src: PKGV changed from 0.12.1 [default] to 0.12.2 [default]
packages/core2-64-poky-linux/python3-tomlkit/python3-tomlkit-src: PV changed from "0.12.1" to "0.12.2"
packages/core2-64-poky-linux/python3-tomlkit/python3-tomlkit-staticdev: PKGV changed from 0.12.1 [default] to 0.12.2 [default]
packages/core2-64-poky-linux/python3-tomlkit/python3-tomlkit-staticdev: PV changed from "0.12.1" to "0.12.2"
packages/core2-64-poky-linux/python3-tomlkit/python3-tomlkit: PKGV changed from 0.12.1 [default] to 0.12.2 [default]
packages/core2-64-poky-linux/python3-tomlkit/python3-tomlkit: PKGSIZE changed from 394705 to 396001 (+0%)
packages/core2-64-poky-linux/python3-tomlkit/python3-tomlkit: PV changed from "0.12.1" to "0.12.2"
Changes to packages/core2-64-poky-linux/python3-tomlkit (sysroot):
  /usr/lib/python3.11/site-packages/tomlkit-0.12.1.dist-info moved to /usr/lib/python3.11/site-packages/tomlkit-0.12.2.dist-info

--===============0418044507412390636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-tomlkit (sysroot):
  /usr/lib/python3.11/site-packages/tomlkit-0.12.1.dist-info moved to /usr/lib/python3.11/site-packages/tomlkit-0.12.2.dist-info

--===============0418044507412390636==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-tomlkit-upgrade-0.12.1-0.12.2.patch"

RnJvbSBlOWZjZGUwZTI4ZDZmZjA3NjY2YjQ0MDAxYmQxZjBhYjk4YmEzZTRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMDo0NzowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdG9tbGtpdDogdXBncmFkZSAwLjEyLjEgLT4gMC4xMi4yCgotLS0KIC4uLi97cHl0aG9u
My10b21sa2l0XzAuMTIuMS5iYiA9PiBweXRob24zLXRvbWxraXRfMC4xMi4yLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXRvbWxraXRfMC4x
Mi4xLmJiID0+IHB5dGhvbjMtdG9tbGtpdF8wLjEyLjIuYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10b21sa2l0XzAuMTIu
MS5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdG9tbGtp
dF8wLjEyLjIuYmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10b21sa2l0XzAuMTIuMS5iYgpyZW5hbWUg
dG8gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10b21sa2l0XzAu
MTIuMi5iYgppbmRleCA1OWU4M2UwMGQuLmJiYzUzNTZkOCAxMDA2NDQKLS0tIGEvbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10b21sa2l0XzAuMTIuMS5iYgorKysg
Yi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRvbWxraXRfMC4x
Mi4yLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2pl
Y3QvdG9tbGtpdC8iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PTMxYWFjMGRiYzFiYWJkMjc4ZDUzODZkYWRiN2Y4ZTgyIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMzhlMWZmOGVkYjk5MTI3M2VjOWY2MTgxMjQ0YTZhMzkxYWMzMGU5ZjUw
OThlNzUzNTY0MGVhNmJlOTdhN2M4NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkZjMyZmFiNTg5
YTgxZjBkN2RjNTI1YTQyNjdiNmQ3YTY0ZWU5OTYxOWNiZDFlZWIwZmFlMzJjMWRkNDI2OTc3Igog
CiBpbmhlcml0IHB5cGkgcHl0aG9uX3BvZXRyeV9jb3JlIHB0ZXN0CiAKLS0gCjIuMzkuMgoK

--===============0418044507412390636==--


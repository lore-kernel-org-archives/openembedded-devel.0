Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F6EC4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:19 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.2288.1699061895893924145
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=boI5UTZK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jiBYSRBK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b97fb1da0-a5412c8c-255b-4c1f-ae44-ede9e6f373cd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061898;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IgW/Aktvy7Og2em4K4QDa3zpc4RkiyEM8Z++1jLAPng=;
	b=boI5UTZKUpW9gvV2RqDdU4uIWHa9ofWFzyOIUjwpppEsFuCszyOjzVSlVbGjBogb
	kQ0OxMrL93VTrf5MunU8TME0QMTY30oFp/P7RPMjlpf3y07iJJUzXpG/UprqiND9jAU
	y1Ww0VpOa4T9nkSYmsckI9xhJVlPGL3OZI0z5YW4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061898;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IgW/Aktvy7Og2em4K4QDa3zpc4RkiyEM8Z++1jLAPng=;
	b=jiBYSRBKJJISo/bDyINLAEEssP7X+6R490Me2jLCZM1T7klzUaD4dclAY3G2vWLX
	oU4+RkWofaMteHnYiXIoSe4Gj+RzJb79yG36o5QN3WCiwGdYk8PbUxev72QxpY0v080
	wme3WGPyW3glfwgzhgAMjK+iWt5sfNNBw2uqkr8o=
Content-Type: multipart/mixed; boundary="===============3309412669399072905=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-xlsxwriter: upgrading to 3.1.9 SUCCEEDED
Message-ID: <0101018b97fb1da0-a5412c8c-255b-4c1f-ae44-ede9e6f373cd-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106178

--===============3309412669399072905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-xlsxwriter* to *3.1.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-xlsxwriter-upgrade-3.1.8-3.1.9.patch
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
From 0be3182ad6abe2299a14f832b2231adf7ea219b3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 01:26:57 +0000
Subject: [PATCH] python3-xlsxwriter: upgrade 3.1.8 -> 3.1.9

---
 ...{python3-xlsxwriter_3.1.8.bb => python3-xlsxwriter_3.1.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.1.8.bb => python3-xlsxwriter_3.1.9.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.8.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.9.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.8.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.9.bb
index 06797f485..ee7dab35c 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.9.bb
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "059d0786fbfa3055588e81e9d5acf4ace28394bf09353a31ae2cae635740fc15"
+SRC_URI[sha256sum] = "de810bf328c6a4550f4ffd6b0b34972aeb7ffcf40f3d285a0413734f9b63a929"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


--===============3309412669399072905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-xlsxwriter: PV changed from "3.1.8" to "3.1.9"
packages/core2-64-poky-linux/python3-xlsxwriter: PKGV changed from 3.1.8 [default] to 3.1.9 [default]
packages/core2-64-poky-linux/python3-xlsxwriter: SRC_URI changed from "https://files.pythonhosted.org/packages/source/X/XlsxWriter/XlsxWriter-3.1.8.tar.gz;downloadfilename=XlsxWriter-3.1.8.tar.gz" to "https://files.pythonhosted.org/packages/source/X/XlsxWriter/XlsxWriter-3.1.9.tar.gz;downloadfilename=XlsxWriter-3.1.9.tar.gz"
packages/core2-64-poky-linux/python3-xlsxwriter/python3-xlsxwriter-dbg: PV changed from "3.1.8" to "3.1.9"
packages/core2-64-poky-linux/python3-xlsxwriter/python3-xlsxwriter-dbg: PKGV changed from 3.1.8 [default] to 3.1.9 [default]
packages/core2-64-poky-linux/python3-xlsxwriter/python3-xlsxwriter-dev: PV changed from "3.1.8" to "3.1.9"
packages/core2-64-poky-linux/python3-xlsxwriter/python3-xlsxwriter-dev: PKGV changed from 3.1.8 [default] to 3.1.9 [default]
packages/core2-64-poky-linux/python3-xlsxwriter/python3-xlsxwriter-doc: PV changed from "3.1.8" to "3.1.9"
packages/core2-64-poky-linux/python3-xlsxwriter/python3-xlsxwriter-doc: PKGV changed from 3.1.8 [default] to 3.1.9 [default]
packages/core2-64-poky-linux/python3-xlsxwriter/python3-xlsxwriter-locale: PV changed from "3.1.8" to "3.1.9"
packages/core2-64-poky-linux/python3-xlsxwriter/python3-xlsxwriter-locale: PKGV changed from 3.1.8 [default] to 3.1.9 [default]
packages/core2-64-poky-linux/python3-xlsxwriter/python3-xlsxwriter-src: PV changed from "3.1.8" to "3.1.9"
packages/core2-64-poky-linux/python3-xlsxwriter/python3-xlsxwriter-src: PKGV changed from 3.1.8 [default] to 3.1.9 [default]
packages/core2-64-poky-linux/python3-xlsxwriter/python3-xlsxwriter-staticdev: PV changed from "3.1.8" to "3.1.9"
packages/core2-64-poky-linux/python3-xlsxwriter/python3-xlsxwriter-staticdev: PKGV changed from 3.1.8 [default] to 3.1.9 [default]
packages/core2-64-poky-linux/python3-xlsxwriter/python3-xlsxwriter: PV changed from "3.1.8" to "3.1.9"
packages/core2-64-poky-linux/python3-xlsxwriter/python3-xlsxwriter: PKGV changed from 3.1.8 [default] to 3.1.9 [default]
packages/core2-64-poky-linux/python3-xlsxwriter/python3-xlsxwriter: PKGSIZE changed from 1566522 to 1566520 (-0%)
Changes to packages/core2-64-poky-linux/python3-xlsxwriter (sysroot):
  /usr/lib/python3.11/site-packages/XlsxWriter-3.1.8.dist-info moved to /usr/lib/python3.11/site-packages/XlsxWriter-3.1.9.dist-info

--===============3309412669399072905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-xlsxwriter (sysroot):
  /usr/lib/python3.11/site-packages/XlsxWriter-3.1.8.dist-info moved to /usr/lib/python3.11/site-packages/XlsxWriter-3.1.9.dist-info

--===============3309412669399072905==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-xlsxwriter-upgrade-3.1.8-3.1.9.patch"

RnJvbSAwYmUzMTgyYWQ2YWJlMjI5OWExNGY4MzJiMjIzMWFkZjdlYTIxOWIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMToyNjo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMteGxzeHdyaXRlcjogdXBncmFkZSAzLjEuOCAtPiAzLjEuOQoKLS0tCiAuLi57cHl0aG9u
My14bHN4d3JpdGVyXzMuMS44LmJiID0+IHB5dGhvbjMteGxzeHdyaXRlcl8zLjEuOS5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy14bHN4d3JpdGVy
XzMuMS44LmJiID0+IHB5dGhvbjMteGxzeHdyaXRlcl8zLjEuOS5iYn0gKDgyJSkKCmRpZmYgLS1n
aXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXhsc3h3cml0
ZXJfMy4xLjguYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXhsc3h3cml0ZXJfMy4xLjkuYmIKc2ltaWxhcml0eSBpbmRleCA4MiUKcmVuYW1lIGZyb20gbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy14bHN4d3JpdGVyXzMuMS44
LmJiCnJlbmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXhsc3h3cml0ZXJfMy4xLjkuYmIKaW5kZXggMDY3OTdmNDg1Li5lZTdkYWIzNWMgMTAwNjQ0Ci0t
LSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMteGxzeHdyaXRl
cl8zLjEuOC5iYgorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXhsc3h3cml0ZXJfMy4xLjkuYmIKQEAgLTE2LDYgKzE2LDYgQEAgUkRFUEVORFM6JHtQTn0g
Kz0gIiBcCiAJcHl0aG9uMy1pbyBcCiAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwNTlkMDc4
NmZiZmEzMDU1NTg4ZTgxZTlkNWFjZjRhY2UyODM5NGJmMDkzNTNhMzFhZTJjYWU2MzU3NDBmYzE1
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRlODEwYmYzMjhjNmE0NTUwZjRmZmQ2YjBiMzQ5NzJh
ZWI3ZmZjZjQwZjNkMjg1YTA0MTM3MzRmOWI2M2E5MjkiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0
aXZlIG5hdGl2ZXNkayIKLS0gCjIuMzkuMgoK

--===============3309412669399072905==--


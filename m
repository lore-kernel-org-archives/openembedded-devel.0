Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99959C001B5
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:19 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.2285.1699061895183596183
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gU60JeJa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IDQ4bjWo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b97fb1c0c-3048fcbf-06d0-40e9-862f-a8b0cfef7b87-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061898;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wmflRlhUm6DGfsE5DSBPVCRjZ+gUyTdkP8I/jcRk988=;
	b=gU60JeJaf7qxS5bNPFUDpNM6qw86+NM1mjg4npJfTsoWypYIYsG7VyS4OZY7TW1E
	8UhVBkRJqN5W27GeRRufkD89UOshnCYTjwdWjA9hNXF9Petdl0XvGkNM/fphajmcM2e
	TjNNNP3Te/syrNLIrvI/7AIVsMTDHWSWdhLb2sNA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061898;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wmflRlhUm6DGfsE5DSBPVCRjZ+gUyTdkP8I/jcRk988=;
	b=IDQ4bjWofGEogmN0jcfQJK9T4rZAwV8l/BWgI9hF9FoVxLNRTyaBJrSRlJ8ngWiI
	/avU84qMZtI3NPE0VItV0JcxbXtrz7DC8EM8QlEhERokrGX5vmRNFNqdLnnvizWeVBI
	pk3ZftOCt9bwWCDT6SvB4XmvGL3/ayYGjwny+hsU=
Content-Type: multipart/mixed; boundary="===============2453597703895031373=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-websockets: upgrading to 12.0 SUCCEEDED
Message-ID: <0101018b97fb1c0c-3048fcbf-06d0-40e9-862f-a8b0cfef7b87-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106174

--===============2453597703895031373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-websockets* to *12.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-websockets-upgrade-11.0.3-12.0.patch
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
From de96d16150ee08f4f714b43c40d9bc384bb0089f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 01:14:23 +0000
Subject: [PATCH] python3-websockets: upgrade 11.0.3 -> 12.0

---
 ...{python3-websockets_11.0.3.bb => python3-websockets_12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websockets_11.0.3.bb => python3-websockets_12.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb b/meta-python/recipes-devtools/python/python3-websockets_12.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb
rename to meta-python/recipes-devtools/python/python3-websockets_12.0.bb
index e6971c829..f89c3b629 100644
--- a/meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-websockets_12.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "88fc51d9a26b10fc331be344f1781224a375b78488fc343620184e95a4b27016"
+SRC_URI[sha256sum] = "81df9cbcbb6c260de1e007e58c011bfebe2dafc8435107b0537f393dd38c8b1b"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.39.2


--===============2453597703895031373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-websockets: PV changed from "11.0.3" to "12.0"
packages/core2-64-poky-linux/python3-websockets: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/websockets/websockets-11.0.3.tar.gz;downloadfilename=websockets-11.0.3.tar.gz" to "https://files.pythonhosted.org/packages/source/w/websockets/websockets-12.0.tar.gz;downloadfilename=websockets-12.0.tar.gz"
packages/core2-64-poky-linux/python3-websockets: PKGV changed from 11.0.3 [default] to 12.0 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dbg: PV changed from "11.0.3" to "12.0"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dbg: PKGV changed from 11.0.3 [default] to 12.0 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dev: PV changed from "11.0.3" to "12.0"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dev: PKGV changed from 11.0.3 [default] to 12.0 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-doc: PV changed from "11.0.3" to "12.0"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-doc: PKGV changed from 11.0.3 [default] to 12.0 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-locale: PV changed from "11.0.3" to "12.0"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-locale: PKGV changed from 11.0.3 [default] to 12.0 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-src: PV changed from "11.0.3" to "12.0"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-src: PKGV changed from 11.0.3 [default] to 12.0 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-staticdev: PV changed from "11.0.3" to "12.0"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-staticdev: PKGV changed from 11.0.3 [default] to 12.0 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.11/site-packages/websockets-11.0.3.dist-info -> /usr/lib/python3.11/site-packages/websockets-12.0.dist-info, removed "/usr/lib/python3.11/site-packages/websockets/sync/compatibility.py /usr/lib/python3.11/site-packages/websockets/sync/__pycache__/compatibility.cpython-311.pyc"
packages/core2-64-poky-linux/python3-websockets/python3-websockets: PKGSIZE changed from 902811 to 907455 (+1%)
packages/core2-64-poky-linux/python3-websockets/python3-websockets: PV changed from "11.0.3" to "12.0"
packages/core2-64-poky-linux/python3-websockets/python3-websockets: PKGV changed from 11.0.3 [default] to 12.0 [default]
Changes to packages/core2-64-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.11/site-packages/websockets-12.0.dist-info was added
  /usr/lib/python3.11/site-packages/websockets-12.0.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/websockets-12.0.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/websockets-12.0.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/websockets-12.0.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/websockets-12.0.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/websockets-11.0.3.dist-info was removed
  /usr/lib/python3.11/site-packages/websockets-11.0.3.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/websockets-11.0.3.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/websockets-11.0.3.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/websockets-11.0.3.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/websockets-11.0.3.dist-info/WHEEL was removed
  /usr/lib/python3.11/site-packages/websockets/sync/compatibility.py was removed
  /usr/lib/python3.11/site-packages/websockets/sync/__pycache__/compatibility.cpython-311.pyc was removed

--===============2453597703895031373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.11/site-packages/websockets-11.0.3.dist-info -> /usr/lib/python3.11/site-packages/websockets-12.0.dist-info, removed "/usr/lib/python3.11/site-packages/websockets/sync/__pycache__/compatibility.cpython-311.pyc /usr/lib/python3.11/site-packages/websockets/sync/compatibility.py"
Changes to packages/core2-64-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.11/site-packages/websockets-12.0.dist-info was added
  /usr/lib/python3.11/site-packages/websockets-12.0.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/websockets-12.0.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/websockets-12.0.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/websockets-12.0.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/websockets-12.0.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/websockets-11.0.3.dist-info was removed
  /usr/lib/python3.11/site-packages/websockets-11.0.3.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/websockets-11.0.3.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/websockets-11.0.3.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/websockets-11.0.3.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/websockets-11.0.3.dist-info/WHEEL was removed
  /usr/lib/python3.11/site-packages/websockets/sync/compatibility.py was removed
  /usr/lib/python3.11/site-packages/websockets/sync/__pycache__/compatibility.cpython-311.pyc was removed

--===============2453597703895031373==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-websockets-upgrade-11.0.3-12.0.patch"

RnJvbSBkZTk2ZDE2MTUwZWUwOGY0ZjcxNGI0M2M0MGQ5YmMzODRiYjAwODlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMToxNDoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2Vic29ja2V0czogdXBncmFkZSAxMS4wLjMgLT4gMTIuMAoKLS0tCiAuLi57cHl0aG9u
My13ZWJzb2NrZXRzXzExLjAuMy5iYiA9PiBweXRob24zLXdlYnNvY2tldHNfMTIuMC5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13ZWJzb2NrZXRz
XzExLjAuMy5iYiA9PiBweXRob24zLXdlYnNvY2tldHNfMTIuMC5iYn0gKDc5JSkKCmRpZmYgLS1n
aXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYnNvY2tl
dHNfMTEuMC4zLmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My13ZWJzb2NrZXRzXzEyLjAuYmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzExLjAu
My5iYgpyZW5hbWUgdG8gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My13ZWJzb2NrZXRzXzEyLjAuYmIKaW5kZXggZTY5NzFjODI5Li5mODljM2I2MjkgMTAwNjQ0Ci0t
LSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2Vic29ja2V0
c18xMS4wLjMuYmIKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy13ZWJzb2NrZXRzXzEyLjAuYmIKQEAgLTYsNyArNiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTUxOTI0YTZhZjQ0OTViOGNmYWVlMWIxZGE4NjliNmY0Igog
CiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg4ZmM1
MWQ5YTI2YjEwZmMzMzFiZTM0NGYxNzgxMjI0YTM3NWI3ODQ4OGZjMzQzNjIwMTg0ZTk1YTRiMjcw
MTYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODFkZjljYmNiYjZjMjYwZGUxZTAwN2U1OGMwMTFi
ZmViZTJkYWZjODQzNTEwN2IwNTM3ZjM5M2RkMzhjOGIxYiIKIAogQkJDTEFTU0VYVEVORCA9ICJu
YXRpdmUgbmF0aXZlc2RrIgogCi0tIAoyLjM5LjIKCg==

--===============2453597703895031373==--


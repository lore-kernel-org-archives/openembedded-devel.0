Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B862C25B69
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:55 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.62974.1699041165700227562
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=S9rPjLMP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ol9TxUTK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b96bee10d-021c1035-76d9-48e1-965b-7c8f7617bc5a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AU9UmqDx2cniPVYbhO2IKp6F2Jj3VJ6dLQDCpnLadtQ=;
	b=S9rPjLMPzluE/lwoUztXnmEkv6ljKYVX2rEqnVmKwpW5IGmKxysdcT59kJ8gAeOR
	ZFjhCBhXIPG6drk4Pzq3COj35t+RRqZFEYn8KkrisnoiCJjccbBSXW015OFwKtRe8/5
	LXSfQlJOwwoX84NbEoOpKjryw9HDArihBwrZd1Yo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AU9UmqDx2cniPVYbhO2IKp6F2Jj3VJ6dLQDCpnLadtQ=;
	b=ol9TxUTKgwbjcvNjwmFPDmlTRiVRayajl8JAOwJjXx1smU96V/fCiG7Pt7z+OTGj
	mY5nLJ2Q184KCzXedCG2duHrbs7/1m1v2CD1CMMkMJzrZh7whQt4lKDONNcuw25h5Pl
	+hZDKchRjWpA7ASu6iM8pRjjCiSZnblV+5JxdR7U=
Content-Type: multipart/mixed; boundary="===============1450453572541044553=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] smarty: upgrading to 4.3.4 SUCCEEDED
Message-ID: <0101018b96bee10d-021c1035-76d9-48e1-965b-7c8f7617bc5a-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106014

--===============1450453572541044553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *smarty* to *4.3.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-smarty-upgrade-4.3.0-4.3.4.patch
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
From efdf5edb75666d64991d18ed88aa3fff13a51ea5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 18:28:36 +0000
Subject: [PATCH] smarty: upgrade 4.3.0 -> 4.3.4

---
 .../smarty/{smarty_4.3.0.bb => smarty_4.3.4.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/smarty/{smarty_4.3.0.bb => smarty_4.3.4.bb} (91%)

diff --git a/meta-oe/recipes-support/smarty/smarty_4.3.0.bb b/meta-oe/recipes-support/smarty/smarty_4.3.4.bb
similarity index 91%
rename from meta-oe/recipes-support/smarty/smarty_4.3.0.bb
rename to meta-oe/recipes-support/smarty/smarty_4.3.4.bb
index bc6fc0d8c..960d0665d 100644
--- a/meta-oe/recipes-support/smarty/smarty_4.3.0.bb
+++ b/meta-oe/recipes-support/smarty/smarty_4.3.4.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 DEPENDS += "php"
 
-SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=support/4.3"
 
-SRCREV = "c02e9e135ea719b91f457a0072748ded0e852e7d"
+SRCREV = "3931d8f54b8f7a4ffab538582d34d4397ba8daa5"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============1450453572541044553==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-smarty-upgrade-4.3.0-4.3.4.patch"

RnJvbSBlZmRmNWVkYjc1NjY2ZDY0OTkxZDE4ZWQ4OGFhM2ZmZjEzYTUxZWE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxODoyODozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNt
YXJ0eTogdXBncmFkZSA0LjMuMCAtPiA0LjMuNAoKLS0tCiAuLi4vc21hcnR5L3tzbWFydHlfNC4z
LjAuYmIgPT4gc21hcnR5XzQuMy40LmJifSAgICAgICAgICAgICAgIHwgNCArKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEtb2Uv
cmVjaXBlcy1zdXBwb3J0L3NtYXJ0eS97c21hcnR5XzQuMy4wLmJiID0+IHNtYXJ0eV80LjMuNC5i
Yn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9zbWFydHkvc21h
cnR5XzQuMy4wLmJiIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvc21hcnR5L3NtYXJ0eV80LjMu
NC5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMtc3Vw
cG9ydC9zbWFydHkvc21hcnR5XzQuMy4wLmJiCnJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtc3Vw
cG9ydC9zbWFydHkvc21hcnR5XzQuMy40LmJiCmluZGV4IGJjNmZjMGQ4Yy4uOTYwZDA2NjVkIDEw
MDY0NAotLS0gYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9zbWFydHkvc21hcnR5XzQuMy4wLmJi
CisrKyBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3NtYXJ0eS9zbWFydHlfNC4zLjQuYmIKQEAg
LTcsOSArNyw5IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTJjMGYy
MTZiMjEyMGZmYzM2N2UyMGYyYjU2ZGY1MWIzIgogCiBERVBFTkRTICs9ICJwaHAiCiAKLVNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9zbWFydHktcGhwL3NtYXJ0eS5naXQ7cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1hc3RlciIKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9zbWFydHktcGhw
L3NtYXJ0eS5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPXN1cHBvcnQvNC4zIgogCi1TUkNSRVYg
PSAiYzAyZTllMTM1ZWE3MTliOTFmNDU3YTAwNzI3NDhkZWQwZTg1MmU3ZCIKK1NSQ1JFViA9ICIz
OTMxZDhmNTRiOGY3YTRmZmFiNTM4NTgyZDM0ZDQzOTdiYThkYWE1IgogCiBTID0gIiR7V09SS0RJ
Un0vZ2l0IgogCi0tIAoyLjM5LjIKCg==

--===============1450453572541044553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/smarty: PV changed from "4.3.0" to "4.3.4"
packages/core2-64-poky-linux/smarty: SRC_URI changed from "git://github.com/smarty-php/smarty.git;protocol=https;branch=master" to "git://github.com/smarty-php/smarty.git;protocol=https;branch=support/4.3"
packages/core2-64-poky-linux/smarty: PKGV changed from 4.3.0 [default] to 4.3.4 [default]
packages/core2-64-poky-linux/smarty/smarty-dbg: PV changed from "4.3.0" to "4.3.4"
packages/core2-64-poky-linux/smarty/smarty-dbg: PKGV changed from 4.3.0 [default] to 4.3.4 [default]
packages/core2-64-poky-linux/smarty/smarty-dev: PV changed from "4.3.0" to "4.3.4"
packages/core2-64-poky-linux/smarty/smarty-dev: PKGV changed from 4.3.0 [default] to 4.3.4 [default]
packages/core2-64-poky-linux/smarty/smarty-doc: PV changed from "4.3.0" to "4.3.4"
packages/core2-64-poky-linux/smarty/smarty-doc: PKGV changed from 4.3.0 [default] to 4.3.4 [default]
packages/core2-64-poky-linux/smarty/smarty-locale: PV changed from "4.3.0" to "4.3.4"
packages/core2-64-poky-linux/smarty/smarty-locale: PKGV changed from 4.3.0 [default] to 4.3.4 [default]
packages/core2-64-poky-linux/smarty/smarty-src: PV changed from "4.3.0" to "4.3.4"
packages/core2-64-poky-linux/smarty/smarty-src: PKGV changed from 4.3.0 [default] to 4.3.4 [default]
packages/core2-64-poky-linux/smarty/smarty-staticdev: PV changed from "4.3.0" to "4.3.4"
packages/core2-64-poky-linux/smarty/smarty-staticdev: PKGV changed from 4.3.0 [default] to 4.3.4 [default]
packages/core2-64-poky-linux/smarty/smarty: PV changed from "4.3.0" to "4.3.4"
packages/core2-64-poky-linux/smarty/smarty: PKGSIZE changed from 1091264 to 1092536 (+0%)
packages/core2-64-poky-linux/smarty/smarty: PKGV changed from 4.3.0 [default] to 4.3.4 [default]

--===============1450453572541044553==--


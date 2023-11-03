Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B020DC18E7D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:52 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.62988.1699041169001019615
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EWeJ8sOI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MRZAQja0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b96bed56f-6ead1541-6283-429d-95f9-c8504abedfe9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XGJEafaWN6ERAgfO0THTiJTcGKL2vcYbiHAL24GMFDI=;
	b=EWeJ8sOIFWaEQl3dzg0U2nuevDgy5qsjmnod09tgoCSrorlSj397s/6JwVS4OB3c
	X9TxHWeEakD7r1odgRR4MF0l5PuYYINqH1CZoxMvuoUCNOy+TFWdWk3YM8NZRrnEV++
	FazuSl19GVemwhHsXM+6FkJAoqM6tqcuYIKiM+f0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XGJEafaWN6ERAgfO0THTiJTcGKL2vcYbiHAL24GMFDI=;
	b=MRZAQja0s3redeBmoIaVLCrticuuTcscXeZDpWyCzfsOOnyXD0WgwoJKdtyrT5Xr
	0tel0JPc2uD7YjTeK8VxM60ImX5f83vmO6XDNpxDXiEa31vw+M1KFLRwZRcwJY8SHwJ
	TO6GwKFvgSDMSltJ7pRCcgCl2sF/oCgXkdh4e+Gc=
Content-Type: multipart/mixed; boundary="===============2192979553294937269=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] mstpd: upgrading to 0.05 SUCCEEDED
Message-ID: <0101018b96bed56f-6ead1541-6283-429d-95f9-c8504abedfe9-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106000

--===============2192979553294937269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mstpd* to *0.05* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mstpd-upgrade-0.1-0.05.patch
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
From a41beb563055325bbde4f6de87158355dae7c2e8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 16:53:42 +0000
Subject: [PATCH] mstpd: upgrade 0.1 -> 0.05

---
 meta-oe/recipes-extended/networking/mstpd_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/networking/mstpd_git.bb b/meta-oe/recipes-extended/networking/mstpd_git.bb
index e2565d620..ed5669e55 100644
--- a/meta-oe/recipes-extended/networking/mstpd_git.bb
+++ b/meta-oe/recipes-extended/networking/mstpd_git.bb
@@ -1,5 +1,4 @@
-PR = "r1"
-PV = "0.1+git${SRCPV}"
+PV = "0.05"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4325afd396febcb659c36b49533135d4"
 
-- 
2.39.2


--===============2192979553294937269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mstpd: PR changed from "r1" to "r0"
packages/core2-64-poky-linux/mstpd: PKGR changed from r1 [default] to r0 [default]
packages/core2-64-poky-linux/mstpd: PV changed from "0.1+git" to "0.05"
packages/core2-64-poky-linux/mstpd: PKGV changed from 0.1+git [default] to 0.05 [default]
packages/core2-64-poky-linux/mstpd/mstpd-dbg: PKGSIZE changed from 576512 to 576472 (-0%)
packages/core2-64-poky-linux/mstpd/mstpd-dbg: PR changed from "r1" to "r0"
packages/core2-64-poky-linux/mstpd/mstpd-dbg: PKGR changed from r1 [default] to r0 [default]
packages/core2-64-poky-linux/mstpd/mstpd-dbg: PKGV changed from 0.1+git0+181c453fc1 to 0.05 [default]
packages/core2-64-poky-linux/mstpd/mstpd-dbg: PV changed from "0.1+git" to "0.05"
packages/core2-64-poky-linux/mstpd/mstpd-dev: PR changed from "r1" to "r0"
packages/core2-64-poky-linux/mstpd/mstpd-dev: PKGR changed from r1 [default] to r0 [default]
packages/core2-64-poky-linux/mstpd/mstpd-dev: PKGV changed from 0.1+git0+181c453fc1 to 0.05 [default]
packages/core2-64-poky-linux/mstpd/mstpd-dev: PV changed from "0.1+git" to "0.05"
packages/core2-64-poky-linux/mstpd/mstpd-doc: PR changed from "r1" to "r0"
packages/core2-64-poky-linux/mstpd/mstpd-doc: PKGR changed from r1 [default] to r0 [default]
packages/core2-64-poky-linux/mstpd/mstpd-doc: PKGV changed from 0.1+git0+181c453fc1 to 0.05 [default]
packages/core2-64-poky-linux/mstpd/mstpd-doc: PV changed from "0.1+git" to "0.05"
packages/core2-64-poky-linux/mstpd/mstpd-locale: PR changed from "r1" to "r0"
packages/core2-64-poky-linux/mstpd/mstpd-locale: PKGR changed from r1 [default] to r0 [default]
packages/core2-64-poky-linux/mstpd/mstpd-locale: PKGV changed from 0.1+git0+181c453fc1 to 0.05 [default]
packages/core2-64-poky-linux/mstpd/mstpd-locale: PV changed from "0.1+git" to "0.05"
packages/core2-64-poky-linux/mstpd/mstpd-mstpd: PR changed from "r1" to "r0"
packages/core2-64-poky-linux/mstpd/mstpd-mstpd: PKGR changed from r1 [default] to r0 [default]
packages/core2-64-poky-linux/mstpd/mstpd-mstpd: PKGV changed from 0.1+git0+181c453fc1 to 0.05 [default]
packages/core2-64-poky-linux/mstpd/mstpd-mstpd: PV changed from "0.1+git" to "0.05"
packages/core2-64-poky-linux/mstpd/mstpd-src: PR changed from "r1" to "r0"
packages/core2-64-poky-linux/mstpd/mstpd-src: PKGR changed from r1 [default] to r0 [default]
packages/core2-64-poky-linux/mstpd/mstpd-src: PKGV changed from 0.1+git0+181c453fc1 to 0.05 [default]
packages/core2-64-poky-linux/mstpd/mstpd-src: PV changed from "0.1+git" to "0.05"
packages/core2-64-poky-linux/mstpd/mstpd-staticdev: PR changed from "r1" to "r0"
packages/core2-64-poky-linux/mstpd/mstpd-staticdev: PKGR changed from r1 [default] to r0 [default]
packages/core2-64-poky-linux/mstpd/mstpd-staticdev: PKGV changed from 0.1+git0+181c453fc1 to 0.05 [default]
packages/core2-64-poky-linux/mstpd/mstpd-staticdev: PV changed from "0.1+git" to "0.05"
packages/core2-64-poky-linux/mstpd/mstpd: PR changed from "r1" to "r0"
packages/core2-64-poky-linux/mstpd/mstpd: PKGR changed from r1 [default] to r0 [default]
packages/core2-64-poky-linux/mstpd/mstpd: PKGV changed from 0.1+git0+181c453fc1 to 0.05 [default]
packages/core2-64-poky-linux/mstpd/mstpd: PV changed from "0.1+git" to "0.05"

--===============2192979553294937269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/mstpd/mstpd-dbg: PKGV changed from 0.1+git0+181c453fc1 to 0.05 [default]
packages/core2-64-poky-linux/mstpd/mstpd-dev: PKGV changed from 0.1+git0+181c453fc1 to 0.05 [default]
packages/core2-64-poky-linux/mstpd/mstpd-doc: PKGV changed from 0.1+git0+181c453fc1 to 0.05 [default]
packages/core2-64-poky-linux/mstpd/mstpd-locale: PKGV changed from 0.1+git0+181c453fc1 to 0.05 [default]
packages/core2-64-poky-linux/mstpd/mstpd-mstpd: PKGV changed from 0.1+git0+181c453fc1 to 0.05 [default]
packages/core2-64-poky-linux/mstpd/mstpd-src: PKGV changed from 0.1+git0+181c453fc1 to 0.05 [default]
packages/core2-64-poky-linux/mstpd/mstpd-staticdev: PKGV changed from 0.1+git0+181c453fc1 to 0.05 [default]
packages/core2-64-poky-linux/mstpd/mstpd: PKGV changed from 0.1+git0+181c453fc1 to 0.05 [default]

--===============2192979553294937269==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-mstpd-upgrade-0.1-0.05.patch"

RnJvbSBhNDFiZWI1NjMwNTUzMjViYmRlNGY2ZGU4NzE1ODM1NWRhZTdjMmU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNjo1Mzo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1z
dHBkOiB1cGdyYWRlIDAuMSAtPiAwLjA1CgotLS0KIG1ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9u
ZXR3b3JraW5nL21zdHBkX2dpdC5iYiB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVu
ZGVkL25ldHdvcmtpbmcvbXN0cGRfZ2l0LmJiIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL25l
dHdvcmtpbmcvbXN0cGRfZ2l0LmJiCmluZGV4IGUyNTY1ZDYyMC4uZWQ1NjY5ZTU1IDEwMDY0NAot
LS0gYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvbmV0d29ya2luZy9tc3RwZF9naXQuYmIKKysr
IGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL25ldHdvcmtpbmcvbXN0cGRfZ2l0LmJiCkBAIC0x
LDUgKzEsNCBAQAotUFIgPSAicjEiCi1QViA9ICIwLjErZ2l0JHtTUkNQVn0iCitQViA9ICIwLjA1
IgogTElDRU5TRSA9ICJHUEwtMi4wLW9yLWxhdGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRTttZDU9NDMyNWFmZDM5NmZlYmNiNjU5YzM2YjQ5NTMzMTM1ZDQiCiAKLS0gCjIu
MzkuMgoK

--===============2192979553294937269==--


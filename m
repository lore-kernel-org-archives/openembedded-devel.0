Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CFCC072A0
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:58 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.4224.1699071646703977614
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gTBqhJD4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UjSCRu95;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b988fdc35-7e8578fc-738c-4bd6-9310-acd50beb7286-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=10SivRZ0gVj51Czv7RjNDeBF9tABPekj/NsZ3gTi/xA=;
	b=gTBqhJD489FymJljd6BmGtbE7YpAXKzMnfwDOV3dh8IHksunVlDTPoWO9kO6pe0V
	vL+Y5wgKhzGU8l+g44iNDBvrQ1gzwItKBaw5F9oqSwR1jCPsvd4eJ0Bik3tLl5Nfk08
	UdDjO4zYTaR2Ey6qOavClf+xM+NuWu8fspgOLFCg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=10SivRZ0gVj51Czv7RjNDeBF9tABPekj/NsZ3gTi/xA=;
	b=UjSCRu95W9YcZj9qySyaRHKx41/w3exZpv+vJmR6Xfd0OQ7aOLhO01ki5uR4SSn9
	9H6ZJMuYetCh5cPIJU9xxB1bApeQdMuKgEc0+nf+IsJlf8Bp2t+Acql/j1VZBmbvzcw
	ro4ezyW5RM1egis608NGaB5gRTDQBavdGxOcmBVc=
Content-Type: multipart/mixed; boundary="===============2647828797057250111=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libdvdcss: upgrading to 1.4.3 SUCCEEDED
Message-ID: <0101018b988fdc35-7e8578fc-738c-4bd6-9310-acd50beb7286-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:46 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106240

--===============2647828797057250111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdvdcss* to *1.4.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdvdcss-upgrade-1.4.2-1.4.3.patch
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
From 55d95cb8d452d49891471e42235230de653aa94c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 03:44:20 +0000
Subject: [PATCH] libdvdcss: upgrade 1.4.2 -> 1.4.3

---
 .../vlc/{libdvdcss_1.4.2.bb => libdvdcss_1.4.3.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/vlc/{libdvdcss_1.4.2.bb => libdvdcss_1.4.3.bb} (76%)

diff --git a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.2.bb b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.3.bb
similarity index 76%
rename from meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.2.bb
rename to meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.3.bb
index 0b472b81d..42c771e0f 100644
--- a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.3.bb
@@ -9,5 +9,4 @@ inherit autotools
 
 EXTRA_OECONF = " --disable-doc "
 
-SRC_URI[md5sum] = "7b74f2e142b13c9de6dc8d807ab912d4"
-SRC_URI[sha256sum] = "78c2ed77ec9c0d8fbed7bf7d3abc82068b8864be494cfad165821377ff3f2575"
+SRC_URI[sha256sum] = "233cc92f5dc01c5d3a96f5b3582be7d5cee5a35a52d3a08158745d3d86070079"
-- 
2.39.2


--===============2647828797057250111==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdvdcss-upgrade-1.4.2-1.4.3.patch"

RnJvbSA1NWQ5NWNiOGQ0NTJkNDk4OTE0NzFlNDIyMzUyMzBkZTY1M2FhOTRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMzo0NDoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmR2ZGNzczogdXBncmFkZSAxLjQuMiAtPiAxLjQuMwoKLS0tCiAuLi4vdmxjL3tsaWJkdmRjc3Nf
MS40LjIuYmIgPT4gbGliZHZkY3NzXzEuNC4zLmJifSAgICAgICAgICAgICB8IDMgKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS1t
dWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS92bGMve2xpYmR2ZGNzc18xLjQuMi5iYiA9PiBs
aWJkdmRjc3NfMS40LjMuYmJ9ICg3NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1tdWx0aW1lZGlhL3Jl
Y2lwZXMtbXVsdGltZWRpYS92bGMvbGliZHZkY3NzXzEuNC4yLmJiIGIvbWV0YS1tdWx0aW1lZGlh
L3JlY2lwZXMtbXVsdGltZWRpYS92bGMvbGliZHZkY3NzXzEuNC4zLmJiCnNpbWlsYXJpdHkgaW5k
ZXggNzYlCnJlbmFtZSBmcm9tIG1ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVkaWEvdmxj
L2xpYmR2ZGNzc18xLjQuMi5iYgpyZW5hbWUgdG8gbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVs
dGltZWRpYS92bGMvbGliZHZkY3NzXzEuNC4zLmJiCmluZGV4IDBiNDcyYjgxZC4uNDJjNzcxZTBm
IDEwMDY0NAotLS0gYS9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL3ZsYy9saWJk
dmRjc3NfMS40LjIuYmIKKysrIGIvbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS92
bGMvbGliZHZkY3NzXzEuNC4zLmJiCkBAIC05LDUgKzksNCBAQCBpbmhlcml0IGF1dG90b29scwog
CiBFWFRSQV9PRUNPTkYgPSAiIC0tZGlzYWJsZS1kb2MgIgogCi1TUkNfVVJJW21kNXN1bV0gPSAi
N2I3NGYyZTE0MmIxM2M5ZGU2ZGM4ZDgwN2FiOTEyZDQiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NzhjMmVkNzdlYzljMGQ4ZmJlZDdiZjdkM2FiYzgyMDY4Yjg4NjRiZTQ5NGNmYWQxNjU4MjEzNzdm
ZjNmMjU3NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyMzNjYzkyZjVkYzAxYzVkM2E5NmY1YjM1
ODJiZTdkNWNlZTVhMzVhNTJkM2EwODE1ODc0NWQzZDg2MDcwMDc5IgotLSAKMi4zOS4yCgo=

--===============2647828797057250111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libdvdcss: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-64-poky-linux/libdvdcss: SRC_URI changed from "http://download.videolan.org/pub/libdvdcss/1.4.2/libdvdcss-1.4.2.tar.bz2" to "http://download.videolan.org/pub/libdvdcss/1.4.3/libdvdcss-1.4.3.tar.bz2"
packages/core2-64-poky-linux/libdvdcss: PV changed from "1.4.2" to "1.4.3"
packages/core2-64-poky-linux/libdvdcss/libdvdcss-dbg: PKGSIZE changed from 83120 to 83320 (+0%)
packages/core2-64-poky-linux/libdvdcss/libdvdcss-dbg: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-64-poky-linux/libdvdcss/libdvdcss-dbg: PV changed from "1.4.2" to "1.4.3"
packages/core2-64-poky-linux/libdvdcss/libdvdcss-dev: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-64-poky-linux/libdvdcss/libdvdcss-dev: PV changed from "1.4.2" to "1.4.3"
packages/core2-64-poky-linux/libdvdcss/libdvdcss-doc: PKGSIZE changed from 144461 to 146413 (+1%)
packages/core2-64-poky-linux/libdvdcss/libdvdcss-doc: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-64-poky-linux/libdvdcss/libdvdcss-doc: PV changed from "1.4.2" to "1.4.3"
packages/core2-64-poky-linux/libdvdcss/libdvdcss-locale: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-64-poky-linux/libdvdcss/libdvdcss-locale: PV changed from "1.4.2" to "1.4.3"
packages/core2-64-poky-linux/libdvdcss/libdvdcss-src: PKGSIZE changed from 199130 to 200032 (+0%)
packages/core2-64-poky-linux/libdvdcss/libdvdcss-src: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-64-poky-linux/libdvdcss/libdvdcss-src: PV changed from "1.4.2" to "1.4.3"
packages/core2-64-poky-linux/libdvdcss/libdvdcss-staticdev: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-64-poky-linux/libdvdcss/libdvdcss-staticdev: PV changed from "1.4.2" to "1.4.3"
packages/core2-64-poky-linux/libdvdcss/libdvdcss: PKGSIZE changed from 34730 to 38826 (+12%)
packages/core2-64-poky-linux/libdvdcss/libdvdcss: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-64-poky-linux/libdvdcss/libdvdcss: PV changed from "1.4.2" to "1.4.3"

--===============2647828797057250111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libdvdcss/libdvdcss: PKGSIZE changed from 34730 to 38826 (+12%)

--===============2647828797057250111==--


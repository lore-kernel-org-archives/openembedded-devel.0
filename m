Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9158AC4167D
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.5390.1699083059847365898
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Cx3q2+kq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MFA8qSxi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b993dff11-8ffa7eda-98ca-4ae1-82b5-0613ae6bfa2e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+MwJ5uhYH+wW0a/VGKFOKMf9N7esqZI+sR+awEDEUsE=;
	b=Cx3q2+kq7qiDuEPMa7k/K0KHRL+i0iaIYmDOqyZJmjX+W+WmKSNb9+ZxbuPcscZh
	P3fWrno8ltqa85NNZF3CF25fIvUP1TxD+eP3eVhGyPbdKLp/6UwYRwDr/NYFP5Sl+9j
	XmEWQVKeEdtS1sFvEgjzAECxwfICTNaWWBRRawwM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+MwJ5uhYH+wW0a/VGKFOKMf9N7esqZI+sR+awEDEUsE=;
	b=MFA8qSxiutoh0Fx4ngcYZuIZCa6ybQr99qv5LB6S5Is73cFV7/4BYnOdtlNazO8g
	cBZzGGBVCuIxP/CdptTFsvvWUm63NE7QFISPfAaoR7MkR5pEuTL1cGuohraRKKbFOtx
	Ao2SWty+buIHz1i/zOkES+Vk6WzDJVw6p1oiKF1c=
Content-Type: multipart/mixed; boundary="===============2652819774351306129=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] garcon: upgrading to 4.19.0 SUCCEEDED
Message-ID: <0101018b993dff11-8ffa7eda-98ca-4ae1-82b5-0613ae6bfa2e-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106301

--===============2652819774351306129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *garcon* to *4.19.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-garcon-upgrade-4.18.1-4.19.0.patch
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
From bb40c859695d424bfd9b64fe8c1b205dff22a102 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 05:18:37 +0000
Subject: [PATCH] garcon: upgrade 4.18.1 -> 4.19.0

---
 .../recipes-xfce/garcon/{garcon_4.18.1.bb => garcon_4.19.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_4.18.1.bb => garcon_4.19.0.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb b/meta-xfce/recipes-xfce/garcon/garcon_4.19.0.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_4.19.0.bb
index c139bfd4c..321f645b0 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_4.19.0.bb
@@ -11,7 +11,7 @@ inherit xfce gtk-doc gobject-introspection features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI += "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"
-SRC_URI[sha256sum] = "fe7a932a6dac95eb1438f3fbfd53096756ff2e1cb179d10d0fb796cefbb4c20b"
+SRC_URI[sha256sum] = "e692f0d02294984c6b787e810a187c753a16f06ca87c68c0bb3de364ea3f6b0c"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-- 
2.39.2


--===============2652819774351306129==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-garcon-upgrade-4.18.1-4.19.0.patch"

RnJvbSBiYjQwYzg1OTY5NWQ0MjRiZmQ5YjY0ZmU4YzFiMjA1ZGZmMjJhMTAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNToxODozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdh
cmNvbjogdXBncmFkZSA0LjE4LjEgLT4gNC4xOS4wCgotLS0KIC4uLi9yZWNpcGVzLXhmY2UvZ2Fy
Y29uL3tnYXJjb25fNC4xOC4xLmJiID0+IGdhcmNvbl80LjE5LjAuYmJ9ICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEteGZj
ZS9yZWNpcGVzLXhmY2UvZ2FyY29uL3tnYXJjb25fNC4xOC4xLmJiID0+IGdhcmNvbl80LjE5LjAu
YmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS14ZmNlL3JlY2lwZXMteGZjZS9nYXJjb24vZ2Fy
Y29uXzQuMTguMS5iYiBiL21ldGEteGZjZS9yZWNpcGVzLXhmY2UvZ2FyY29uL2dhcmNvbl80LjE5
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS14ZmNlL3JlY2lwZXMt
eGZjZS9nYXJjb24vZ2FyY29uXzQuMTguMS5iYgpyZW5hbWUgdG8gbWV0YS14ZmNlL3JlY2lwZXMt
eGZjZS9nYXJjb24vZ2FyY29uXzQuMTkuMC5iYgppbmRleCBjMTM5YmZkNGMuLjMyMWY2NDViMCAx
MDA2NDQKLS0tIGEvbWV0YS14ZmNlL3JlY2lwZXMteGZjZS9nYXJjb24vZ2FyY29uXzQuMTguMS5i
YgorKysgYi9tZXRhLXhmY2UvcmVjaXBlcy14ZmNlL2dhcmNvbi9nYXJjb25fNC4xOS4wLmJiCkBA
IC0xMSw3ICsxMSw3IEBAIGluaGVyaXQgeGZjZSBndGstZG9jIGdvYmplY3QtaW50cm9zcGVjdGlv
biBmZWF0dXJlc19jaGVjawogQU5ZX09GX0RJU1RST19GRUFUVVJFUyA9ICIke0dUSzNESVNUUk9G
RUFUVVJFU30iCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLXhmY2UtYXBwbGljYXRpb25zLm1l
bnUtZG9uLXQtYmxvYXQtc2V0dGluZ3MtbWVudS1ieS0ucGF0Y2giCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZmU3YTkzMmE2ZGFjOTVlYjE0MzhmM2ZiZmQ1MzA5Njc1NmZmMmUxY2IxNzlkMTBkMGZi
Nzk2Y2VmYmI0YzIwYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlNjkyZjBkMDIyOTQ5ODRjNmI3
ODdlODEwYTE4N2M3NTNhMTZmMDZjYTg3YzY4YzBiYjNkZTM2NGVhM2Y2YjBjIgogCiBFWFRSQV9P
RUNPTkYgPSAiLS1kaXNhYmxlLWd0ay1kb2MiCiAKLS0gCjIuMzkuMgoK

--===============2652819774351306129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/garcon/garcon-dbg: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-dbg: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-dev: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-dev: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-doc: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-doc: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-am: PKGSIZE changed from 3763 to 3799 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-am: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-am: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-ar: PKGSIZE changed from 3466 to 3496 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-ar: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-ar: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-ast: PKGSIZE changed from 3136 to 3166 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-ast: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-ast: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-be: PKGSIZE changed from 3900 to 3931 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-be: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-be: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-bg: PKGSIZE changed from 3988 to 4148 (+4%)
packages/core2-64-poky-linux/garcon/garcon-locale-bg: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-bg: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-bn: PKGSIZE changed from 3728 to 3746 (+0%)
packages/core2-64-poky-linux/garcon/garcon-locale-bn: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-bn: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-ca: PKGSIZE changed from 3189 to 3230 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-ca: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-ca: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-cs: PKGSIZE changed from 3179 to 3217 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-cs: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-cs: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-cy: PKGSIZE changed from 3079 to 3058 (-1%)
packages/core2-64-poky-linux/garcon/garcon-locale-cy: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-cy: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-da: PKGSIZE changed from 2705 to 2797 (+3%)
packages/core2-64-poky-linux/garcon/garcon-locale-da: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-da: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-de: PKGSIZE changed from 3262 to 3354 (+3%)
packages/core2-64-poky-linux/garcon/garcon-locale-de: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-de: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-el: PKGSIZE changed from 4167 to 4175 (+0%)
packages/core2-64-poky-linux/garcon/garcon-locale-el: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-el: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-en-au: PKGSIZE changed from 3001 to 3019 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-en-au: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-en-au: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-en-gb: PKGSIZE changed from 3093 to 3185 (+3%)
packages/core2-64-poky-linux/garcon/garcon-locale-en-gb: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-en-gb: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-eo: PKGSIZE changed from 2711 to 2749 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-eo: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-eo: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-es: PKGSIZE changed from 3351 to 3381 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-es: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-es: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-et: PKGSIZE changed from 3173 to 3201 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-et: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-et: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-eu: PKGSIZE changed from 3148 to 3144 (-0%)
packages/core2-64-poky-linux/garcon/garcon-locale-eu: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-eu: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-fi: PKGSIZE changed from 3204 to 3223 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-fi: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-fi: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-fr: PKGSIZE changed from 3329 to 4326 (+30%)
packages/core2-64-poky-linux/garcon/garcon-locale-fr: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-fr: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-gl: PKGSIZE changed from 3257 to 3301 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-gl: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-gl: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-he: PKGSIZE changed from 3498 to 3526 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-he: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-he: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-hi: PKGSIZE changed from 4492 to 4520 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-hi: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-hi: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-hr: PKGSIZE changed from 3084 to 3112 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-hr: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-hr: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-hu: PKGSIZE changed from 3255 to 3282 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-hu: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-hu: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-hy-am: PKGSIZE changed from 3891 to 3897 (+0%)
packages/core2-64-poky-linux/garcon/garcon-locale-hy-am: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-hy-am: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-hy: PKGSIZE changed from 3827 to 3857 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-hy: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-hy: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-hye: PKGSIZE changed from 3873 to 3891 (+0%)
packages/core2-64-poky-linux/garcon/garcon-locale-hye: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-hye: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-id: PKGSIZE changed from 3064 to 3094 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-id: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-id: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-ie: PKGSIZE changed from 3058 to 3087 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-ie: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-ie: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-is: PKGSIZE changed from 3104 to 3144 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-is: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-is: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-it: PKGSIZE changed from 3265 to 3386 (+4%)
packages/core2-64-poky-linux/garcon/garcon-locale-it: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-it: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-ja: PKGSIZE changed from 3730 to 4682 (+26%)
packages/core2-64-poky-linux/garcon/garcon-locale-ja: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-ja: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-ka: PKGSIZE changed from 4898 to 4916 (+0%)
packages/core2-64-poky-linux/garcon/garcon-locale-ka: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-ka: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-kab: PKGSIZE changed from 3020 to 3029 (+0%)
packages/core2-64-poky-linux/garcon/garcon-locale-kab: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-kab: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-kk: PKGSIZE changed from 3752 to 3803 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-kk: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-kk: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-ko: PKGSIZE changed from 3261 to 3305 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-ko: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-ko: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-lt: PKGSIZE changed from 3343 to 3431 (+3%)
packages/core2-64-poky-linux/garcon/garcon-locale-lt: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-lt: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-lv: PKGSIZE changed from 712 to 772 (+8%)
packages/core2-64-poky-linux/garcon/garcon-locale-lv: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-lv: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-ms: PKGSIZE changed from 3096 to 3101 (+0%)
packages/core2-64-poky-linux/garcon/garcon-locale-ms: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-ms: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-nb: PKGSIZE changed from 3098 to 3196 (+3%)
packages/core2-64-poky-linux/garcon/garcon-locale-nb: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-nb: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-nl: PKGSIZE changed from 3238 to 4240 (+31%)
packages/core2-64-poky-linux/garcon/garcon-locale-nl: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-nl: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-nn: PKGSIZE changed from 3025 to 3061 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-nn: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-nn: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-oc: PKGSIZE changed from 3286 to 3287 (+0%)
packages/core2-64-poky-linux/garcon/garcon-locale-oc: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-oc: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-pa: PKGSIZE changed from 751 to 1155 (+54%)
packages/core2-64-poky-linux/garcon/garcon-locale-pa: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-pa: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-pl: PKGSIZE changed from 3387 to 4366 (+29%)
packages/core2-64-poky-linux/garcon/garcon-locale-pl: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-pl: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-pt-br: PKGSIZE changed from 3362 to 3355 (-0%)
packages/core2-64-poky-linux/garcon/garcon-locale-pt-br: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-pt-br: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-pt: PKGSIZE changed from 3380 to 3501 (+4%)
packages/core2-64-poky-linux/garcon/garcon-locale-pt: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-pt: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-ro: PKGSIZE changed from 3193 to 3213 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-ro: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-ro: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-ru: PKGSIZE changed from 4047 to 4107 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-ru: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-ru: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-sk: PKGSIZE changed from 3250 to 3274 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-sk: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-sk: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-sl: PKGSIZE changed from 3279 to 3262 (-1%)
packages/core2-64-poky-linux/garcon/garcon-locale-sl: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-sl: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-sq: PKGSIZE changed from 3189 to 3221 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-sq: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-sq: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-sr: PKGSIZE changed from 4021 to 4130 (+3%)
packages/core2-64-poky-linux/garcon/garcon-locale-sr: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-sr: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-sv: PKGSIZE changed from 3143 to 3165 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-sv: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-sv: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-te: PKGSIZE changed from 4250 to 4294 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-te: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-te: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-th: PKGSIZE changed from 4373 to 4406 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-th: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-th: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-tr: PKGSIZE changed from 3143 to 3169 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-tr: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-tr: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-ug: PKGSIZE changed from 3887 to 3905 (+0%)
packages/core2-64-poky-linux/garcon/garcon-locale-ug: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-ug: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-uk: PKGSIZE changed from 4231 to 5184 (+23%)
packages/core2-64-poky-linux/garcon/garcon-locale-uk: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-uk: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-uz+latn: PKGSIZE changed from 2780 to 2798 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-uz+latn: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-uz+latn: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-uz: PKGSIZE changed from 2876 to 2887 (+0%)
packages/core2-64-poky-linux/garcon/garcon-locale-uz: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-uz: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-zh-cn: PKGSIZE changed from 2956 to 2978 (+1%)
packages/core2-64-poky-linux/garcon/garcon-locale-zh-cn: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-zh-cn: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-zh-hk: PKGSIZE changed from 2917 to 2925 (+0%)
packages/core2-64-poky-linux/garcon/garcon-locale-zh-hk: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-zh-hk: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-locale-zh-tw: PKGSIZE changed from 2999 to 3988 (+33%)
packages/core2-64-poky-linux/garcon/garcon-locale-zh-tw: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-locale-zh-tw: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-src: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-src: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon-staticdev: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon-staticdev: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon/garcon: PKGSIZE changed from 277660 to 277648 (-0%)
packages/core2-64-poky-linux/garcon/garcon: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon/garcon: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon: PKGV changed from 4.18.1 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/garcon: PV changed from "4.18.1" to "4.19.0"
packages/core2-64-poky-linux/garcon: SRC_URI changed from "http://archive.xfce.org/src/xfce/garcon/4.18/garcon-4.18.1.tar.bz2 file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch" to "http://archive.xfce.org/src/xfce/garcon/4.19/garcon-4.19.0.tar.bz2 file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"

--===============2652819774351306129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/garcon/garcon-locale-fr: PKGSIZE changed from 3329 to 4326 (+30%)
packages/core2-64-poky-linux/garcon/garcon-locale-ja: PKGSIZE changed from 3730 to 4682 (+26%)
packages/core2-64-poky-linux/garcon/garcon-locale-nl: PKGSIZE changed from 3238 to 4240 (+31%)
packages/core2-64-poky-linux/garcon/garcon-locale-pa: PKGSIZE changed from 751 to 1155 (+54%)
packages/core2-64-poky-linux/garcon/garcon-locale-pl: PKGSIZE changed from 3387 to 4366 (+29%)
packages/core2-64-poky-linux/garcon/garcon-locale-uk: PKGSIZE changed from 4231 to 5184 (+23%)
packages/core2-64-poky-linux/garcon/garcon-locale-zh-tw: PKGSIZE changed from 2999 to 3988 (+33%)

--===============2652819774351306129==--


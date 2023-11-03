Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8DBC197A0
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:52 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.63883.1699041169692248448
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DFIrwkCK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ongZHybe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b96beccae-43afb2b2-165e-4d3c-bbf0-dd2b1ddd5b56-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=npZ+L341cvbEVhgPSdGLRKxjFRohg2Nw5frfTdg+ef0=;
	b=DFIrwkCKtKcfx/DctXpiZonK/kwXCSQVJNIDKMTRgEWh5S+uhcSf9V5Ox2yyTAkG
	CbvnAxrjYW6ijhrtSdBaclR9a15M2Esv/vBzd9W6HASPn8SRjOdvFQ4fUUvY50HVoRf
	EO1+DgwT+uh+lcNWYSG9nkKm88E8iy1odhad12ko=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=npZ+L341cvbEVhgPSdGLRKxjFRohg2Nw5frfTdg+ef0=;
	b=ongZHybeekHPT/5elD4ZXwUThVHoRV47WV58UKl+7H890gJTTDw7KOJx15b2c67w
	Ee4qM96n1za3oxIRRmShsiO8HeNjT7oG1HuwBylLGmFluDk4LXFdUzr0y0s5sWKyJQc
	pMGEFRBrA2SPReJ2XMdv6piyPDhVi6cCzLmMnQEw=
Content-Type: multipart/mixed; boundary="===============4754372902478965574=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libfastjson: upgrading to 1.2304.0 SUCCEEDED
Message-ID: <0101018b96beccae-43afb2b2-165e-4d3c-bbf0-dd2b1ddd5b56-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105972

--===============4754372902478965574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libfastjson* to *1.2304.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libfastjson-upgrade-0.99.9-1.2304.0.patch
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
From 29723afc65af7f2f2dca6e989fee55f29625ae89 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 13:57:33 +0000
Subject: [PATCH] libfastjson: upgrade 0.99.9 -> 1.2304.0

---
 .../rsyslog/{libfastjson_0.99.9.bb => libfastjson_1.2304.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/rsyslog/{libfastjson_0.99.9.bb => libfastjson_1.2304.0.bb} (85%)

diff --git a/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.9.bb b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
similarity index 85%
rename from meta-oe/recipes-extended/rsyslog/libfastjson_0.99.9.bb
rename to meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
index 24ad17267..f16126d93 100644
--- a/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.9.bb
+++ b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
@@ -8,7 +8,7 @@ DEPENDS = ""
 
 SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https;branch=master"
 
-SRCREV = "0293afb3913f760c449348551cca4d2df59c1a00"
+SRCREV = "3a8402c1de7c7747c95229db26d8d32fb85a7a52"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============4754372902478965574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libfastjson: PKGV changed from 0.99.9 [default] to 1.2304.0 [default]
packages/core2-64-poky-linux/libfastjson: PV changed from "0.99.9" to "1.2304.0"
packages/core2-64-poky-linux/libfastjson/libfastjson-dbg: PKGV changed from 0.99.9 [default] to 1.2304.0 [default]
packages/core2-64-poky-linux/libfastjson/libfastjson-dbg: PKGSIZE changed from 122952 to 121976 (-1%)
packages/core2-64-poky-linux/libfastjson/libfastjson-dbg: PV changed from "0.99.9" to "1.2304.0"
packages/core2-64-poky-linux/libfastjson/libfastjson-dev: PKGV changed from 0.99.9 [default] to 1.2304.0 [default]
packages/core2-64-poky-linux/libfastjson/libfastjson-dev: PKGSIZE changed from 59134 to 59136 (+0%)
packages/core2-64-poky-linux/libfastjson/libfastjson-dev: PV changed from "0.99.9" to "1.2304.0"
packages/core2-64-poky-linux/libfastjson/libfastjson-doc: PKGV changed from 0.99.9 [default] to 1.2304.0 [default]
packages/core2-64-poky-linux/libfastjson/libfastjson-doc: PV changed from "0.99.9" to "1.2304.0"
packages/core2-64-poky-linux/libfastjson/libfastjson-locale: PKGV changed from 0.99.9 [default] to 1.2304.0 [default]
packages/core2-64-poky-linux/libfastjson/libfastjson-locale: PV changed from "0.99.9" to "1.2304.0"
packages/core2-64-poky-linux/libfastjson/libfastjson-src: PKGV changed from 0.99.9 [default] to 1.2304.0 [default]
packages/core2-64-poky-linux/libfastjson/libfastjson-src: PKGSIZE changed from 151419 to 151819 (+0%)
packages/core2-64-poky-linux/libfastjson/libfastjson-src: PV changed from "0.99.9" to "1.2304.0"
packages/core2-64-poky-linux/libfastjson/libfastjson-staticdev: PKGV changed from 0.99.9 [default] to 1.2304.0 [default]
packages/core2-64-poky-linux/libfastjson/libfastjson-staticdev: PV changed from "0.99.9" to "1.2304.0"
packages/core2-64-poky-linux/libfastjson/libfastjson: PKGV changed from 0.99.9 [default] to 1.2304.0 [default]
packages/core2-64-poky-linux/libfastjson/libfastjson: PV changed from "0.99.9" to "1.2304.0"

--===============4754372902478965574==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libfastjson-upgrade-0.99.9-1.2304.0.patch"

RnJvbSAyOTcyM2FmYzY1YWY3ZjJmMmRjYTZlOTg5ZmVlNTVmMjk2MjVhZTg5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMzo1NzozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmZhc3Rqc29uOiB1cGdyYWRlIDAuOTkuOSAtPiAxLjIzMDQuMAoKLS0tCiAuLi4vcnN5c2xvZy97
bGliZmFzdGpzb25fMC45OS45LmJiID0+IGxpYmZhc3Rqc29uXzEuMjMwNC4wLmJifSAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcnN5c2xvZy97bGliZmFzdGpzb25fMC45OS45LmJiID0+
IGxpYmZhc3Rqc29uXzEuMjMwNC4wLmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVj
aXBlcy1leHRlbmRlZC9yc3lzbG9nL2xpYmZhc3Rqc29uXzAuOTkuOS5iYiBiL21ldGEtb2UvcmVj
aXBlcy1leHRlbmRlZC9yc3lzbG9nL2xpYmZhc3Rqc29uXzEuMjMwNC4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9yc3lzbG9nL2xp
YmZhc3Rqc29uXzAuOTkuOS5iYgpyZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3Jz
eXNsb2cvbGliZmFzdGpzb25fMS4yMzA0LjAuYmIKaW5kZXggMjRhZDE3MjY3Li5mMTYxMjZkOTMg
MTAwNjQ0Ci0tLSBhL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9yc3lzbG9nL2xpYmZhc3Rqc29u
XzAuOTkuOS5iYgorKysgYi9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcnN5c2xvZy9saWJmYXN0
anNvbl8xLjIzMDQuMC5iYgpAQCAtOCw3ICs4LDcgQEAgREVQRU5EUyA9ICIiCiAKIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0aHViLmNvbS9yc3lzbG9nL2xpYmZhc3Rqc29uLmdpdDtwcm90b2NvbD1odHRw
czticmFuY2g9bWFzdGVyIgogCi1TUkNSRVYgPSAiMDI5M2FmYjM5MTNmNzYwYzQ0OTM0ODU1MWNj
YTRkMmRmNTljMWEwMCIKK1NSQ1JFViA9ICIzYTg0MDJjMWRlN2M3NzQ3Yzk1MjI5ZGIyNmQ4ZDMy
ZmI4NWE3YTUyIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM5LjIKCg==

--===============4754372902478965574==--


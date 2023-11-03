Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B48FC001DD
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:53:05 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.62982.1699041167393020758
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=P7hbscJa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Q4rJUyeO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b96bef904-67859fd1-3c02-4229-816d-3f6daa78fc57-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041180;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=m4EwtjfV/FCX6L50CaLBFXVzQdruJh4MIgaNfBuDPtE=;
	b=P7hbscJaVRORg45Sd8h4iY7Zqr5bZ1vWyBTIpVCcJrHtDbye8pPJV5rWAaierI7e
	63rp1lZW9wLdtuTApNcDmUHE7KQ3QtirHWgwC1LdE1mDBkq8EApl5rsJE4KwIRLEWud
	cQ2d+GJZjREdq6qsL8WqU5tReDuKOIjI/oA3lcTY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041180;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=m4EwtjfV/FCX6L50CaLBFXVzQdruJh4MIgaNfBuDPtE=;
	b=Q4rJUyeOAzDgO/FqnsyWsc9elSLfiV41uuZc6KsHbQ3PzNO54Gi9HXeNA7nDQVT0
	aIchWuWrrmd97cl/UnNnUuM5Rt0PqZC8oShKpuC7MQuSW/MtOHkK0AcyVkyVObrxtjs
	biSQrN2Gr7fs0hpt9BbgXASiTYg/LO2TX+aE2F2U=
Content-Type: multipart/mixed; boundary="===============7690074898083641740=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xterm: upgrading to 388 SUCCEEDED
Message-ID: <0101018b96bef904-67859fd1-3c02-4229-816d-3f6daa78fc57-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106048

--===============7690074898083641740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xterm* to *388* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xterm-upgrade-387-388.patch
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
From 5ca57810b03d646e8442342ecb161fbc3426319d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 19:39:26 +0000
Subject: [PATCH] xterm: upgrade 387 -> 388

---
 .../recipes-graphics/xorg-app/{xterm_387.bb => xterm_388.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_387.bb => xterm_388.bb} (94%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_387.bb b/meta-oe/recipes-graphics/xorg-app/xterm_388.bb
similarity index 94%
rename from meta-oe/recipes-graphics/xorg-app/xterm_387.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_388.bb
index 09bb2976a..8578f0cc9 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_387.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_388.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[sha256sum] = "81dd59cc2ecef1e849ed21722e37a24756e02b54ec19d157cb545b273813f4b8"
+SRC_URI[sha256sum] = "ac429345e6f937a5945a89d425a265fee6c215fc669dbdc6a0326e21f4c5f674"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.39.2


--===============7690074898083641740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xterm: SRC_URI changed from "http://invisible-mirror.net/archives/xterm/xterm-387.tgz file://0001-Add-configure-time-check-for-setsid.patch" to "http://invisible-mirror.net/archives/xterm/xterm-388.tgz file://0001-Add-configure-time-check-for-setsid.patch"
packages/core2-64-poky-linux/xterm: PV changed from "387" to "388"
packages/core2-64-poky-linux/xterm: PKGV changed from 387 [default] to 388 [default]
packages/core2-64-poky-linux/xterm/xterm-dbg: PV changed from "387" to "388"
packages/core2-64-poky-linux/xterm/xterm-dbg: PKGV changed from 387 [default] to 388 [default]
packages/core2-64-poky-linux/xterm/xterm-dbg: PKGSIZE changed from 2230048 to 2231376 (+0%)
packages/core2-64-poky-linux/xterm/xterm-dev: PV changed from "387" to "388"
packages/core2-64-poky-linux/xterm/xterm-dev: PKGV changed from 387 [default] to 388 [default]
packages/core2-64-poky-linux/xterm/xterm-doc: PV changed from "387" to "388"
packages/core2-64-poky-linux/xterm/xterm-doc: PKGV changed from 387 [default] to 388 [default]
packages/core2-64-poky-linux/xterm/xterm-doc: PKGSIZE changed from 335029 to 335110 (+0%)
packages/core2-64-poky-linux/xterm/xterm-locale: PV changed from "387" to "388"
packages/core2-64-poky-linux/xterm/xterm-locale: PKGV changed from 387 [default] to 388 [default]
packages/core2-64-poky-linux/xterm/xterm-src: PV changed from "387" to "388"
packages/core2-64-poky-linux/xterm/xterm-src: PKGV changed from 387 [default] to 388 [default]
packages/core2-64-poky-linux/xterm/xterm-src: PKGSIZE changed from 2466112 to 2467891 (+0%)
packages/core2-64-poky-linux/xterm/xterm-staticdev: PV changed from "387" to "388"
packages/core2-64-poky-linux/xterm/xterm-staticdev: PKGV changed from 387 [default] to 388 [default]
packages/core2-64-poky-linux/xterm/xterm: PV changed from "387" to "388"
packages/core2-64-poky-linux/xterm/xterm: PKGV changed from 387 [default] to 388 [default]

--===============7690074898083641740==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-xterm-upgrade-387-388.patch"

RnJvbSA1Y2E1NzgxMGIwM2Q2NDZlODQ0MjM0MmVjYjE2MWZiYzM0MjYzMTlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxOTozOToyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHh0
ZXJtOiB1cGdyYWRlIDM4NyAtPiAzODgKCi0tLQogLi4uL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1h
cHAve3h0ZXJtXzM4Ny5iYiA9PiB4dGVybV8zODguYmJ9ICAgIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS1vZS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctYXBwL3t4dGVybV8zODcuYmIgPT4geHRlcm1fMzg4LmJifSAoOTQlKQoK
ZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94dGVybV8zODcu
YmIgYi9tZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveHRlcm1fMzg4LmJiCnNpbWls
YXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LWFwcC94dGVybV8zODcuYmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LWFwcC94dGVybV8zODguYmIKaW5kZXggMDliYjI5NzZhLi44NTc4ZjBjYzkgMTAwNjQ0Ci0tLSBh
L21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94dGVybV8zODcuYmIKKysrIGIvbWV0
YS1vZS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3h0ZXJtXzM4OC5iYgpAQCAtOCw3ICs4LDcg
QEAgU1JDX1VSSSA9ICJodHRwOi8vaW52aXNpYmxlLW1pcnJvci5uZXQvYXJjaGl2ZXMvJHtCUE59
LyR7QlB9LnRneiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUFkZC1jb25maWd1cmUtdGltZS1j
aGVjay1mb3Itc2V0c2lkLnBhdGNoIFwKICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI4MWRkNTljYzJlY2VmMWU4NDllZDIxNzIyZTM3YTI0NzU2ZTAyYjU0ZWMxOWQxNTdjYjU0
NWIyNzM4MTNmNGI4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImFjNDI5MzQ1ZTZmOTM3YTU5NDVh
ODlkNDI1YTI2NWZlZTZjMjE1ZmM2NjlkYmRjNmEwMzI2ZTIxZjRjNWY2NzQiCiAKIFBBQ0tBR0VD
T05GSUcgPz0gIiIKIFBBQ0tBR0VDT05GSUdbeGZ0XSA9ICItLWVuYWJsZS1mcmVldHlwZSwtLWRp
c2FibGUtZnJlZXR5cGUsbGlieGZ0IGZvbnRjb25maWcgZnJlZXR5cGUtbmF0aXZlIgotLSAKMi4z
OS4yCgo=

--===============7690074898083641740==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA017C05032
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:57 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.4229.1699071647427904654
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MUOiZUAk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=R0LG66R2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b988fdc7b-b788f08d-45c1-4a22-b4d3-ce3731393542-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uzi7i+yBS555aYSprrAeEHbmS0XsrdW9Ydpcp/5Gwro=;
	b=MUOiZUAk3G47tCuIM1Cbk69WTWniO7TJNdTB6znzkZlV+q3JHAvS9L/9JfSojcQ/
	akDkGWVBfAp8LZwbhE0FK4MkkYLC/omMnAzcPEJ/i3Z86Kv0cbf/d8aJpMHsoEJt9WG
	m6GLniKy1NrtPzUAEcNovNQi5HH7uvNqlPfs2BOA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uzi7i+yBS555aYSprrAeEHbmS0XsrdW9Ydpcp/5Gwro=;
	b=R0LG66R2dmkYiSA6EE+RHCEgyFK0liSUqbK7eSKDikgaxUNgybiPZbVTOV/RzkqR
	36noFYypp/TpNWtn2flOsCSqjOGpkXmdg/uqZCjQku/VhW2gnem1q/8oj0bwb/ou8ob
	CLAb2RiHexm0aQ60B+BrRODoFm8wux/GuMnGBemo=
Content-Type: multipart/mixed; boundary="===============6753826678945818329=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libmediaart-2.0: upgrading to 1.9.6 SUCCEEDED
Message-ID: <0101018b988fdc7b-b788f08d-45c1-4a22-b4d3-ce3731393542-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:46 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106249

--===============6753826678945818329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libmediaart-2.0* to *1.9.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmediaart-2.0-upgrade-1.9.5-1.9.6.patch
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
From 340fac1ae2f9d5f073fe2fd0dfbf038923bc725b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 03:49:22 +0000
Subject: [PATCH] libmediaart-2.0: upgrade 1.9.5 -> 1.9.6

---
 .../{libmediaart-2.0_1.9.5.bb => libmediaart-2.0_1.9.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-support/libmediaart/{libmediaart-2.0_1.9.5.bb => libmediaart-2.0_1.9.6.bb} (90%)

diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
similarity index 90%
rename from meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb
rename to meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
index ad42e2727..90dc6ab49 100644
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
@@ -12,7 +12,7 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gobject-introspection vala features_check
 
 SRC_URI = "${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.xz"
-SRC_URI[sha256sum] = "07def5a42c482ae71d3e1f77a4d0fdc337f74226059a65284d6d5a241f0e9cd6"
+SRC_URI[sha256sum] = "c3bc5025d7db380587f9c8eb800c611f6b5a16d6b4b78fcff93f62876a677f17"
 
 S = "${WORKDIR}/libmediaart-${PV}"
 
-- 
2.39.2


--===============6753826678945818329==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmediaart-2.0-upgrade-1.9.5-1.9.6.patch"

RnJvbSAzNDBmYWMxYWUyZjlkNWYwNzNmZTJmZDBkZmJmMDM4OTIzYmM3MjViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMzo0OToyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym1lZGlhYXJ0LTIuMDogdXBncmFkZSAxLjkuNSAtPiAxLjkuNgoKLS0tCiAuLi4ve2xpYm1lZGlh
YXJ0LTIuMF8xLjkuNS5iYiA9PiBsaWJtZWRpYWFydC0yLjBfMS45LjYuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1zdXBwb3J0L2xpYm1lZGlhYXJ0L3tsaWJtZWRpYWFydC0y
LjBfMS45LjUuYmIgPT4gbGlibWVkaWFhcnQtMi4wXzEuOS42LmJifSAoOTAlKQoKZGlmZiAtLWdp
dCBhL21ldGEtbXVsdGltZWRpYS9yZWNpcGVzLXN1cHBvcnQvbGlibWVkaWFhcnQvbGlibWVkaWFh
cnQtMi4wXzEuOS41LmJiIGIvbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtc3VwcG9ydC9saWJtZWRp
YWFydC9saWJtZWRpYWFydC0yLjBfMS45LjYuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1l
IGZyb20gbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtc3VwcG9ydC9saWJtZWRpYWFydC9saWJtZWRp
YWFydC0yLjBfMS45LjUuYmIKcmVuYW1lIHRvIG1ldGEtbXVsdGltZWRpYS9yZWNpcGVzLXN1cHBv
cnQvbGlibWVkaWFhcnQvbGlibWVkaWFhcnQtMi4wXzEuOS42LmJiCmluZGV4IGFkNDJlMjcyNy4u
OTBkYzZhYjQ5IDEwMDY0NAotLS0gYS9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1zdXBwb3J0L2xp
Ym1lZGlhYXJ0L2xpYm1lZGlhYXJ0LTIuMF8xLjkuNS5iYgorKysgYi9tZXRhLW11bHRpbWVkaWEv
cmVjaXBlcy1zdXBwb3J0L2xpYm1lZGlhYXJ0L2xpYm1lZGlhYXJ0LTIuMF8xLjkuNi5iYgpAQCAt
MTIsNyArMTIsNyBAQCBHTk9NRUJBU0VCVUlMRENMQVNTID0gIm1lc29uIgogaW5oZXJpdCBnbm9t
ZWJhc2UgZ29iamVjdC1pbnRyb3NwZWN0aW9uIHZhbGEgZmVhdHVyZXNfY2hlY2sKIAogU1JDX1VS
SSA9ICIke0dOT01FX01JUlJPUn0vbGlibWVkaWFhcnQvMS45L2xpYm1lZGlhYXJ0LSR7UFZ9LnRh
ci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwN2RlZjVhNDJjNDgyYWU3MWQzZTFmNzdhNGQw
ZmRjMzM3Zjc0MjI2MDU5YTY1Mjg0ZDZkNWEyNDFmMGU5Y2Q2IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImMzYmM1MDI1ZDdkYjM4MDU4N2Y5YzhlYjgwMGM2MTFmNmI1YTE2ZDZiNGI3OGZjZmY5M2Y2
Mjg3NmE2NzdmMTciCiAKIFMgPSAiJHtXT1JLRElSfS9saWJtZWRpYWFydC0ke1BWfSIKIAotLSAK
Mi4zOS4yCgo=

--===============6753826678945818329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libmediaart-2.0: SRC_URI changed from "https://download.gnome.org/sources//libmediaart/1.9/libmediaart-1.9.5.tar.xz" to "https://download.gnome.org/sources//libmediaart/1.9/libmediaart-1.9.6.tar.xz"
packages/core2-64-poky-linux/libmediaart-2.0: PV changed from "1.9.5" to "1.9.6"
packages/core2-64-poky-linux/libmediaart-2.0: PKGV changed from 1.9.5 [default] to 1.9.6 [default]
packages/core2-64-poky-linux/libmediaart-2.0/libmediaart-2.0-dbg: PV changed from "1.9.5" to "1.9.6"
packages/core2-64-poky-linux/libmediaart-2.0/libmediaart-2.0-dbg: PKGV changed from 1.9.5 [default] to 1.9.6 [default]
packages/core2-64-poky-linux/libmediaart-2.0/libmediaart-2.0-dbg: FILELIST: removed "/usr/lib/.debug/libmediaart-2.0.so.0.905.0", added "/usr/lib/.debug/libmediaart-2.0.so.0.906.0"
packages/core2-64-poky-linux/libmediaart-2.0/libmediaart-2.0-dev: PV changed from "1.9.5" to "1.9.6"
packages/core2-64-poky-linux/libmediaart-2.0/libmediaart-2.0-dev: PKGV changed from 1.9.5 [default] to 1.9.6 [default]
packages/core2-64-poky-linux/libmediaart-2.0/libmediaart-2.0-dev: PKGSIZE changed from 85621 to 85688 (+0%)
packages/core2-64-poky-linux/libmediaart-2.0/libmediaart-2.0-doc: PV changed from "1.9.5" to "1.9.6"
packages/core2-64-poky-linux/libmediaart-2.0/libmediaart-2.0-doc: PKGV changed from 1.9.5 [default] to 1.9.6 [default]
packages/core2-64-poky-linux/libmediaart-2.0/libmediaart-2.0-locale: PV changed from "1.9.5" to "1.9.6"
packages/core2-64-poky-linux/libmediaart-2.0/libmediaart-2.0-locale: PKGV changed from 1.9.5 [default] to 1.9.6 [default]
packages/core2-64-poky-linux/libmediaart-2.0/libmediaart-2.0-src: PV changed from "1.9.5" to "1.9.6"
packages/core2-64-poky-linux/libmediaart-2.0/libmediaart-2.0-src: PKGV changed from 1.9.5 [default] to 1.9.6 [default]
packages/core2-64-poky-linux/libmediaart-2.0/libmediaart-2.0-staticdev: PV changed from "1.9.5" to "1.9.6"
packages/core2-64-poky-linux/libmediaart-2.0/libmediaart-2.0-staticdev: PKGV changed from 1.9.5 [default] to 1.9.6 [default]
packages/core2-64-poky-linux/libmediaart-2.0/libmediaart-2.0: PV changed from "1.9.5" to "1.9.6"
packages/core2-64-poky-linux/libmediaart-2.0/libmediaart-2.0: PKGV changed from 1.9.5 [default] to 1.9.6 [default]
packages/core2-64-poky-linux/libmediaart-2.0/libmediaart-2.0: FILELIST: removed "/usr/lib/libmediaart-2.0.so.0.905.0", added "/usr/lib/libmediaart-2.0.so.0.906.0"
Changes to packages/core2-64-poky-linux/libmediaart-2.0 (sysroot):
  /usr/lib/libmediaart-2.0.so.0 changed symlink target from libmediaart-2.0.so.0.905.0 to libmediaart-2.0.so.0.906.0
  /usr/lib/libmediaart-2.0.so.0.905.0 moved to /usr/lib/libmediaart-2.0.so.0.906.0

--===============6753826678945818329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libmediaart-2.0/libmediaart-2.0: FILELIST: removed "/usr/lib/libmediaart-2.0.so.0.905.0", added "/usr/lib/libmediaart-2.0.so.0.906.0"
Changes to packages/core2-64-poky-linux/libmediaart-2.0 (sysroot):
  /usr/lib/libmediaart-2.0.so.0 changed symlink target from libmediaart-2.0.so.0.905.0 to libmediaart-2.0.so.0.906.0
  /usr/lib/libmediaart-2.0.so.0.905.0 moved to /usr/lib/libmediaart-2.0.so.0.906.0

--===============6753826678945818329==--


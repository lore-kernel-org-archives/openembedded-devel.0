Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42578C05020
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:01 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.5513.1699083059853803018
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XBw3jEJE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nmvjfnpH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b993e03ac-83cb1269-c8b5-4a84-961f-2b768908da3b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eNQX1cuNdszA0nDt/Fw5bGuGalsnNuPDRl6Mv8hRIjA=;
	b=XBw3jEJE2RT/bHh7UMB/G9vQLiJ7r9YN6EfY3odTMz+ONVW6d/d/zMOD7WI21ZoV
	Tru8X9oRVwNKHMR+sLHFX2/j8bQVbhzrdXriMSPylG4cPiwlrhzjq3d4iQrBp+REaFx
	sKFrafp7k3OjxTAIIGwHWTlzIdA98h1NhZoIG6Ok=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eNQX1cuNdszA0nDt/Fw5bGuGalsnNuPDRl6Mv8hRIjA=;
	b=nmvjfnpHFDbWYT6wrQlId0vxnPg+o88+b1l61OH+iuq4HfjEFf+JkzloGDMAVdA1
	IvyQcFdxavVzbO/nPpY/+o8tDNDDGXiTZb7LXf2amUkbLfo3np1Fb9ppKbpjuzPlRFu
	FoB92VG1wsD3M7s0aO1ihMLJPlGcAbfpedjzBFuA=
Content-Type: multipart/mixed; boundary="===============8883597257473341019=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-places-plugin: upgrading to 1.8.3 SUCCEEDED
Message-ID: <0101018b993e03ac-83cb1269-c8b5-4a84-961f-2b768908da3b-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106319

--===============8883597257473341019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-places-plugin* to *1.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-places-plugin-upgrade-1.8.1-1.8.3.patch
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
From f170677bb28a42ca29abd9a4624bd4723b09d655 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 06:39:56 +0000
Subject: [PATCH] xfce4-places-plugin: upgrade 1.8.1 -> 1.8.3

---
 ...ce4-places-plugin_1.8.1.bb => xfce4-places-plugin_1.8.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.8.1.bb => xfce4-places-plugin_1.8.3.bb} (77%)

diff --git a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.1.bb b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.3.bb
similarity index 77%
rename from meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.1.bb
rename to meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.3.bb
index e8e133035..6400e0d3e 100644
--- a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.1.bb
+++ b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.3.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "bde92cbd08f129d517524784e5060816"
-SRC_URI[sha256sum] = "f211219f03c9260f624370e18c79e4176c9d35a8247158e77e5d811327610ab2"
+SRC_URI[sha256sum] = "f11d0e6d03f22ab02c2e6b507d365b5a918532e8819e50647ee1860eca60c743"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.39.2


--===============8883597257473341019==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-places-plugin-upgrade-1.8.1-1.8.3.patch"

RnJvbSBmMTcwNjc3YmIyOGE0MmNhMjlhYmQ5YTQ2MjRiZDQ3MjNiMDlkNjU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjozOTo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LXBsYWNlcy1wbHVnaW46IHVwZ3JhZGUgMS44LjEgLT4gMS44LjMKCi0tLQogLi4uY2U0LXBs
YWNlcy1wbHVnaW5fMS44LjEuYmIgPT4geGZjZTQtcGxhY2VzLXBsdWdpbl8xLjguMy5iYn0gfCAz
ICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvcGxhY2VzL3t4ZmNlNC1wbGFjZXMt
cGx1Z2luXzEuOC4xLmJiID0+IHhmY2U0LXBsYWNlcy1wbHVnaW5fMS44LjMuYmJ9ICg3NyUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy9wbGFjZXMveGZjZTQt
cGxhY2VzLXBsdWdpbl8xLjguMS5iYiBiL21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMv
cGxhY2VzL3hmY2U0LXBsYWNlcy1wbHVnaW5fMS44LjMuYmIKc2ltaWxhcml0eSBpbmRleCA3NyUK
cmVuYW1lIGZyb20gbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy9wbGFjZXMveGZjZTQt
cGxhY2VzLXBsdWdpbl8xLjguMS5iYgpyZW5hbWUgdG8gbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwt
cGx1Z2lucy9wbGFjZXMveGZjZTQtcGxhY2VzLXBsdWdpbl8xLjguMy5iYgppbmRleCBlOGUxMzMw
MzUuLjY0MDBlMGQzZSAxMDA2NDQKLS0tIGEvbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lu
cy9wbGFjZXMveGZjZTQtcGxhY2VzLXBsdWdpbl8xLjguMS5iYgorKysgYi9tZXRhLXhmY2UvcmVj
aXBlcy1wYW5lbC1wbHVnaW5zL3BsYWNlcy94ZmNlNC1wbGFjZXMtcGx1Z2luXzEuOC4zLmJiCkBA
IC02LDggKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iNjk1
MmQ5YTQ3ZmMyYWQwZjMxNTUxMGUxMjkwNDU1ZiIKIAogaW5oZXJpdCB4ZmNlLXBhbmVsLXBsdWdp
bgogCi1TUkNfVVJJW21kNXN1bV0gPSAiYmRlOTJjYmQwOGYxMjlkNTE3NTI0Nzg0ZTUwNjA4MTYi
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjIxMTIxOWYwM2M5MjYwZjYyNDM3MGUxOGM3OWU0MTc2
YzlkMzVhODI0NzE1OGU3N2U1ZDgxMTMyNzYxMGFiMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJm
MTFkMGU2ZDAzZjIyYWIwMmMyZTZiNTA3ZDM2NWI1YTkxODUzMmU4ODE5ZTUwNjQ3ZWUxODYwZWNh
NjBjNzQzIgogCiBQQUNLQUdFQ09ORklHID8/PSAibm90aWZ5IgogUEFDS0FHRUNPTkZJR1tub3Rp
ZnldID0gIi0tZW5hYmxlLW5vdGlmaWNhdGlvbnMsLS1kaXNhYmxlLW5vdGlmaWNhdGlvbnMsbGli
bm90aWZ5IgotLSAKMi4zOS4yCgo=

--===============8883597257473341019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-places-plugin: SRC_URI changed from "http://archive.xfce.org/src/panel-plugins/xfce4-places-plugin/1.8/xfce4-places-plugin-1.8.1.tar.bz2" to "http://archive.xfce.org/src/panel-plugins/xfce4-places-plugin/1.8/xfce4-places-plugin-1.8.3.tar.bz2"
packages/core2-64-poky-linux/xfce4-places-plugin: PACKAGES: removed "xfce4-places-plugin-locale-eo", added "xfce4-places-plugin-locale-hye"
packages/core2-64-poky-linux/xfce4-places-plugin: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-dbg: PKGSIZE changed from 228984 to 228856 (-0%)
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-dbg: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-dbg: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-dev: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-dev: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-doc: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-doc: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-am: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-am: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ar: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ar: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ast: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ast: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-be: PKGSIZE changed from 4596 to 4592 (-0%)
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-be: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-be: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-bg: PKGSIZE changed from 4510 to 4497 (-0%)
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-bg: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-bg: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ca: PKGSIZE changed from 3550 to 3552 (+0%)
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ca: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ca: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-cs: PKGSIZE changed from 3617 to 3635 (+0%)
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-cs: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-cs: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-da: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-da: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-de: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-de: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-el: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-el: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-en-au: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-en-au: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-en-gb: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-en-gb: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-es: PKGSIZE changed from 3547 to 3611 (+2%)
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-es: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-es: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-et: PKGSIZE changed from 332 to 3466 (+944%)
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-et: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-et: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-eu: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-eu: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-fi: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-fi: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-fr: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-fr: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-gl: PKGSIZE changed from 3519 to 3511 (-0%)
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-gl: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-gl: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-he: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-he: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-hr: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-hr: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-hu: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-hu: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-id: PKGSIZE changed from 3415 to 3426 (+0%)
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-id: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-id: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ie: PKGSIZE changed from 3490 to 3469 (-1%)
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ie: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ie: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-is: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-is: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-it: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-it: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ja: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ja: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-kk: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-kk: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ko: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ko: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-lt: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-lt: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-lv: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-lv: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ms: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ms: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-nb: PKGSIZE changed from 3438 to 3427 (-0%)
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-nb: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-nb: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-nl: PKGSIZE changed from 3628 to 3633 (+0%)
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-nl: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-nl: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-oc: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-oc: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-pa: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-pa: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-pl: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-pl: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-pt-br: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-pt-br: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-pt: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-pt: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ro: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ro: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ru: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ru: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-sk: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-sk: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-sl: PKGSIZE changed from 3444 to 3541 (+3%)
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-sl: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-sl: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-sq: PKGSIZE changed from 3527 to 3519 (-0%)
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-sq: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-sq: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-sr: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-sr: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-sv: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-sv: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-th: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-th: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-tr: PKGSIZE changed from 3543 to 3571 (+1%)
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-tr: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-tr: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ug: PKGSIZE changed from 4477 to 4484 (+0%)
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ug: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ug: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-uk: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-uk: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ur-pk: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ur-pk: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ur: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-ur: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-zh-cn: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-zh-cn: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-zh-tw: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-zh-tw: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-src: PKGSIZE changed from 142901 to 143940 (+1%)
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-src: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-src: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-staticdev: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-staticdev: PKGV changed from 1.8.1 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin: PKGSIZE changed from 82674 to 82869 (+0%)
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin: PV changed from "1.8.1" to "1.8.3"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin: PKGV changed from 1.8.1 [default] to 1.8.3 [default]

--===============8883597257473341019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xfce4-places-plugin: PACKAGES: removed "xfce4-places-plugin-locale-eo", added "xfce4-places-plugin-locale-hye"
packages/core2-64-poky-linux/xfce4-places-plugin/xfce4-places-plugin-locale-et: PKGSIZE changed from 332 to 3466 (+944%)

--===============8883597257473341019==--


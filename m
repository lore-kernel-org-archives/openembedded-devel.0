Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A39F1C05027
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:11 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.5402.1699083061178945957
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=R93N2OYh;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iFN/AdDE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b993e0548-559c9aa5-815d-4356-b20f-7165cccd29dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SXhVNSqqpqHyRqesKExP61+67pDyWpnerPp1JkKHNxM=;
	b=R93N2OYh7UIG+jThKnX2/JnMcpZ9UosPFcA0DSWxuGpwb0T+wkCH0yCJUNzRBZdA
	6tmH8iREit06/CZMgRK8dtSxHtgFHQd2skhCuNoRwGkjYOoipOI6TXsQB5YSQvf5j4K
	r4ECqCftauVAgbHjiDAav2MugIXalXu1e1vSHA/s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SXhVNSqqpqHyRqesKExP61+67pDyWpnerPp1JkKHNxM=;
	b=iFN/AdDE6GMN6MEOeD5yeEV0rGnq8hNP18RYwjNG6D6N9fKnV0VWu+xJV65Wr3Vb
	phOTrjyxGlI31iZgIvg7GbaU6cYXJlRDPE3t4Gq5yXzJ15wu3a/4DXAxpEi3H5oWBRA
	TUpWH6Q6RMpQw6TCik9BlNEQXNgd/hU0GG9yxntU=
Content-Type: multipart/mixed; boundary="===============6111106634298783666=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-taskmanager: upgrading to 1.5.6 SUCCEEDED
Message-ID: <0101018b993e0548-559c9aa5-815d-4356-b20f-7165cccd29dd-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106340

--===============6111106634298783666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-taskmanager* to *1.5.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-taskmanager-upgrade-1.5.5-1.5.6.patch
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
From 6af28607b92511cc8f7a25d04cffdee0134fc14d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 07:00:25 +0000
Subject: [PATCH] xfce4-taskmanager: upgrade 1.5.5 -> 1.5.6

---
 .../{xfce4-taskmanager_1.5.5.bb => xfce4-taskmanager_1.5.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/xfce4-taskmanager/{xfce4-taskmanager_1.5.5.bb => xfce4-taskmanager_1.5.6.bb} (72%)

diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.5.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.6.bb
similarity index 72%
rename from meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.5.bb
rename to meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.6.bb
index 802d6af4a..4eddc9fcf 100644
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.5.bb
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.6.bb
@@ -6,4 +6,4 @@ inherit xfce-app
 
 DEPENDS += "gtk+3 cairo libwnck libxfce4ui libxmu xfce4-dev-tools-native"
 
-SRC_URI[sha256sum] = "f64f01ba241a0b8bbf2ed3274e5decc2313c9f8b0e4d160db3ba69b331558ae5"
+SRC_URI[sha256sum] = "20979000761a41faed4f7f63f27bd18bb36fb27db4f7ecc8784a460701fb4abb"
-- 
2.39.2


--===============6111106634298783666==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-taskmanager-upgrade-1.5.5-1.5.6.patch"

RnJvbSA2YWYyODYwN2I5MjUxMWNjOGY3YTI1ZDA0Y2ZmZGVlMDEzNGZjMTRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNzowMDoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LXRhc2ttYW5hZ2VyOiB1cGdyYWRlIDEuNS41IC0+IDEuNS42CgotLS0KIC4uLi97eGZjZTQt
dGFza21hbmFnZXJfMS41LjUuYmIgPT4geGZjZTQtdGFza21hbmFnZXJfMS41LjYuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEteGZjZS9yZWNpcGVzLWFwcHMveGZjZTQtdGFza21hbmFnZXIve3hmY2U0LXRhc2ttYW5h
Z2VyXzEuNS41LmJiID0+IHhmY2U0LXRhc2ttYW5hZ2VyXzEuNS42LmJifSAoNzIlKQoKZGlmZiAt
LWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLWFwcHMveGZjZTQtdGFza21hbmFnZXIveGZjZTQtdGFz
a21hbmFnZXJfMS41LjUuYmIgYi9tZXRhLXhmY2UvcmVjaXBlcy1hcHBzL3hmY2U0LXRhc2ttYW5h
Z2VyL3hmY2U0LXRhc2ttYW5hZ2VyXzEuNS42LmJiCnNpbWlsYXJpdHkgaW5kZXggNzIlCnJlbmFt
ZSBmcm9tIG1ldGEteGZjZS9yZWNpcGVzLWFwcHMveGZjZTQtdGFza21hbmFnZXIveGZjZTQtdGFz
a21hbmFnZXJfMS41LjUuYmIKcmVuYW1lIHRvIG1ldGEteGZjZS9yZWNpcGVzLWFwcHMveGZjZTQt
dGFza21hbmFnZXIveGZjZTQtdGFza21hbmFnZXJfMS41LjYuYmIKaW5kZXggODAyZDZhZjRhLi40
ZWRkYzlmY2YgMTAwNjQ0Ci0tLSBhL21ldGEteGZjZS9yZWNpcGVzLWFwcHMveGZjZTQtdGFza21h
bmFnZXIveGZjZTQtdGFza21hbmFnZXJfMS41LjUuYmIKKysrIGIvbWV0YS14ZmNlL3JlY2lwZXMt
YXBwcy94ZmNlNC10YXNrbWFuYWdlci94ZmNlNC10YXNrbWFuYWdlcl8xLjUuNi5iYgpAQCAtNiw0
ICs2LDQgQEAgaW5oZXJpdCB4ZmNlLWFwcAogCiBERVBFTkRTICs9ICJndGsrMyBjYWlybyBsaWJ3
bmNrIGxpYnhmY2U0dWkgbGlieG11IHhmY2U0LWRldi10b29scy1uYXRpdmUiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJmNjRmMDFiYTI0MWEwYjhiYmYyZWQzMjc0ZTVkZWNjMjMxM2M5ZjhiMGU0
ZDE2MGRiM2JhNjliMzMxNTU4YWU1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIwOTc5MDAwNzYx
YTQxZmFlZDRmN2Y2M2YyN2JkMThiYjM2ZmIyN2RiNGY3ZWNjODc4NGE0NjA3MDFmYjRhYmIiCi0t
IAoyLjM5LjIKCg==

--===============6111106634298783666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-taskmanager: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager: SRC_URI changed from "http://archive.xfce.org/src/apps/xfce4-taskmanager/1.5/xfce4-taskmanager-1.5.5.tar.bz2" to "http://archive.xfce.org/src/apps/xfce4-taskmanager/1.5/xfce4-taskmanager-1.5.6.tar.bz2"
packages/core2-64-poky-linux/xfce4-taskmanager: PV changed from "1.5.5" to "1.5.6"
Changes to packages/core2-64-poky-linux/xfce4-taskmanager (sysroot):
  /usr/share/icons/hicolor/24x24/apps was added
  /usr/share/icons/hicolor/24x24/apps/org.xfce.taskmanager.png was added
  /usr/share/icons/hicolor/32x32 was added
  /usr/share/icons/hicolor/32x32/apps was added
  /usr/share/icons/hicolor/32x32/apps/org.xfce.taskmanager.png was added
  /usr/share/icons/hicolor/64x64 was added
  /usr/share/icons/hicolor/64x64/apps was added
  /usr/share/icons/hicolor/64x64/apps/org.xfce.taskmanager.png was added
  /usr/share/icons/hicolor/96x96 was added
  /usr/share/icons/hicolor/96x96/apps was added
  /usr/share/icons/hicolor/96x96/apps/org.xfce.taskmanager.png was added
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-dbg: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-dbg: PKGSIZE changed from 336840 to 344336 (+2%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-dbg: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-dev: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-dev: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-doc: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-doc: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ar: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ar: PKGSIZE changed from 4048 to 4082 (+1%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ar: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ast: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ast: PKGSIZE changed from 2645 to 2641 (-0%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ast: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-az: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-az: PKGSIZE changed from 5697 to 5153 (-10%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-az: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-be: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-be: PKGSIZE changed from 6462 to 5980 (-7%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-be: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-bg: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-bg: PKGSIZE changed from 6872 to 6559 (-5%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-bg: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ca: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ca: PKGSIZE changed from 5427 to 5039 (-7%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ca: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-cs: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-cs: PKGSIZE changed from 5640 to 5165 (-8%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-cs: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-da: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-da: PKGSIZE changed from 5398 to 5069 (-6%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-da: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-de: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-de: PKGSIZE changed from 5630 to 5288 (-6%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-de: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-el: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-el: PKGSIZE changed from 7046 to 6647 (-6%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-el: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-en-au: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-en-au: PKGSIZE changed from 4524 to 4051 (-10%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-en-au: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-en-gb: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-en-gb: PKGSIZE changed from 4532 to 4954 (+9%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-en-gb: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-es: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-es: PKGSIZE changed from 5825 to 5327 (-9%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-es: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-et: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-et: PKGSIZE changed from 5442 to 5023 (-8%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-et: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-eu: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-eu: PKGSIZE changed from 5247 to 4767 (-9%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-eu: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-fa-ir: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-fa-ir: PKGSIZE changed from 3764 to 3797 (+1%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-fa-ir: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-fi: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-fi: PKGSIZE changed from 5101 to 4574 (-10%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-fi: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-fr: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-fr: PKGSIZE changed from 5785 to 5457 (-6%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-fr: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-gl: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-gl: PKGSIZE changed from 5528 to 5050 (-9%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-gl: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-he: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-he: PKGSIZE changed from 5908 to 5423 (-8%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-he: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-hr: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-hr: PKGSIZE changed from 4912 to 4455 (-9%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-hr: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-hu: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-hu: PKGSIZE changed from 4842 to 4329 (-11%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-hu: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-hy-am: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-hy-am: PKGSIZE changed from 5737 to 5193 (-9%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-hy-am: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-hye: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-hye: PKGSIZE changed from 5937 to 5426 (-9%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-hye: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-id: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-id: PKGSIZE changed from 5494 to 5007 (-9%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-id: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ie: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ie: PKGSIZE changed from 4661 to 4152 (-11%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ie: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-is: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-is: PKGSIZE changed from 4723 to 4255 (-10%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-is: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-it: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-it: PKGSIZE changed from 5770 to 5427 (-6%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-it: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ja: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ja: PKGSIZE changed from 5834 to 5501 (-6%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ja: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-kk: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-kk: PKGSIZE changed from 6513 to 5971 (-8%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-kk: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ko: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ko: PKGSIZE changed from 5562 to 5070 (-9%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ko: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-lt: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-lt: PKGSIZE changed from 5564 to 5227 (-6%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-lt: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-lv: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-lv: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ms: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ms: PKGSIZE changed from 5355 to 4868 (-9%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ms: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-nb: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-nb: PKGSIZE changed from 5672 to 5345 (-6%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-nb: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-nl: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-nl: PKGSIZE changed from 5487 to 5168 (-6%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-nl: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-oc: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-oc: PKGSIZE changed from 3119 to 3150 (+1%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-oc: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-pa: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-pa: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-pl: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-pl: PKGSIZE changed from 6015 to 5689 (-5%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-pl: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-pt-br: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-pt-br: PKGSIZE changed from 5627 to 5269 (-6%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-pt-br: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-pt: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-pt: PKGSIZE changed from 5562 to 5230 (-6%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-pt: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ru: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ru: PKGSIZE changed from 6967 to 6607 (-5%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ru: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-si: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-si: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-sk: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-sk: PKGSIZE changed from 5569 to 5122 (-8%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-sk: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-sl: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-sl: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-sq: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-sq: PKGSIZE changed from 5395 to 5128 (-5%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-sq: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-sr: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-sr: PKGSIZE changed from 6581 to 6269 (-5%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-sr: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-sv: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-sv: PKGSIZE changed from 5360 to 4889 (-9%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-sv: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-te: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-te: PKGSIZE changed from 3154 to 3207 (+2%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-te: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-th: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-th: PKGSIZE changed from 7151 to 6570 (-8%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-th: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-tr: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-tr: PKGSIZE changed from 5563 to 5059 (-9%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-tr: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ug: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ug: PKGSIZE changed from 3601 to 3641 (+1%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ug: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-uk: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-uk: PKGSIZE changed from 7055 to 6670 (-5%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-uk: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ur-pk: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ur-pk: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ur: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ur: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-vi: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-vi: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-zh-cn: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-zh-cn: PKGSIZE changed from 5242 to 4916 (-6%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-zh-cn: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-zh-hk: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-zh-hk: PKGSIZE changed from 2622 to 2690 (+3%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-zh-hk: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-zh-tw: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-zh-tw: PKGSIZE changed from 5276 to 4950 (-6%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-zh-tw: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-src: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-src: PKGSIZE changed from 191025 to 195455 (+2%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-src: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-staticdev: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-staticdev: PV changed from "1.5.5" to "1.5.6"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager: FILELIST: added "/usr/share/icons/hicolor/64x64/apps/org.xfce.taskmanager.png /usr/share/icons/hicolor/96x96/apps/org.xfce.taskmanager.png /usr/share/icons/hicolor/24x24/apps/org.xfce.taskmanager.png /usr/share/icons/hicolor/32x32/apps/org.xfce.taskmanager.png"
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager: PKGSIZE changed from 165627 to 169821 (+3%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager: PV changed from "1.5.5" to "1.5.6"

--===============6111106634298783666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/xfce4-taskmanager (sysroot):
  /usr/share/icons/hicolor/24x24/apps was added
  /usr/share/icons/hicolor/24x24/apps/org.xfce.taskmanager.png was added
  /usr/share/icons/hicolor/32x32 was added
  /usr/share/icons/hicolor/32x32/apps was added
  /usr/share/icons/hicolor/32x32/apps/org.xfce.taskmanager.png was added
  /usr/share/icons/hicolor/64x64 was added
  /usr/share/icons/hicolor/64x64/apps was added
  /usr/share/icons/hicolor/64x64/apps/org.xfce.taskmanager.png was added
  /usr/share/icons/hicolor/96x96 was added
  /usr/share/icons/hicolor/96x96/apps was added
  /usr/share/icons/hicolor/96x96/apps/org.xfce.taskmanager.png was added
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-en-au: PKGSIZE changed from 4524 to 4051 (-10%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-fi: PKGSIZE changed from 5101 to 4574 (-10%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-hu: PKGSIZE changed from 4842 to 4329 (-11%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager-locale-ie: PKGSIZE changed from 4661 to 4152 (-11%)
packages/core2-64-poky-linux/xfce4-taskmanager/xfce4-taskmanager: FILELIST: added "/usr/share/icons/hicolor/32x32/apps/org.xfce.taskmanager.png /usr/share/icons/hicolor/24x24/apps/org.xfce.taskmanager.png /usr/share/icons/hicolor/64x64/apps/org.xfce.taskmanager.png /usr/share/icons/hicolor/96x96/apps/org.xfce.taskmanager.png"

--===============6111106634298783666==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228CCC10DC1
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:51 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.62972.1699041165501419489
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NR5N+XC2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=J75K7Z1b;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b96bebe05-1203abcf-10de-4488-81f8-11b519f9b5a6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Grnxy9Dj4r3A3WPyjmnwXQGwxm/kOy8BG9uGqJKzT2g=;
	b=NR5N+XC23KreohtethBwCJTz9qFLjUkwdRwGqDuujaQk0p0RGqhEA1e7M4cMbO5O
	f3z0Dqx8E91xfvDnatSovSTyMef2+KO7bcn3x3CP+FD+SiOvQIakBV5Vj9nzVbOs2fV
	2BoVrQIpFHjIgbSfRCZ1VdwN+hDW9Z+FqbglxpqA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Grnxy9Dj4r3A3WPyjmnwXQGwxm/kOy8BG9uGqJKzT2g=;
	b=J75K7Z1bl62TrJLhHh4G1YcXs3wt7QUNxvOwnD4iSVRrLh9Jn9Cd21yBtK7c6UE1
	6Ap8uhbp6s1KKna7i3rliq8XHxaRKlsA+wJRr3/xl79IXpQtDg4lFTYv+MtWMWL3i94
	zTLQbKcpqQS61iFYI/o1fGMrbU/oDGU5FzzU6Qvs=
Content-Type: multipart/mixed; boundary="===============2638117526915768248=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] cairomm-1.16: upgrading to 1.18.0 SUCCEEDED
Message-ID: <0101018b96bebe05-1203abcf-10de-4488-81f8-11b519f9b5a6-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:44 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105881

--===============2638117526915768248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cairomm-1.16* to *1.18.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cairomm-1.16-upgrade-1.16.2-1.18.0.patch
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
From 3bcf632f6b016398a3c6dbf33913c535656b0fa1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 11:46:54 +0000
Subject: [PATCH] cairomm-1.16: upgrade 1.16.2 -> 1.18.0

---
 .../cairo/{cairomm-1.16_1.16.2.bb => cairomm-1.16_1.18.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/cairo/{cairomm-1.16_1.16.2.bb => cairomm-1.16_1.18.0.bb} (82%)

diff --git a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.16.2.bb b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
similarity index 82%
rename from meta-oe/recipes-graphics/cairo/cairomm-1.16_1.16.2.bb
rename to meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
index c1e271ffa..b18e1614e 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.16.2.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
@@ -9,7 +9,7 @@ inherit gnomebase
 DEPENDS += "boost cairo libsigc++-3"
 
 SRC_URI = "https://www.cairographics.org/releases/cairomm-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6a63bf98a97dda2b0f55e34d1b5f3fb909ef8b70f9b8d382cb1ff3978e7dc13f"
+SRC_URI[sha256sum] = "b81255394e3ea8e8aa887276d22afa8985fc8daef60692eb2407d23049f03cfb"
 
 S = "${WORKDIR}/cairomm-${PV}"
 
-- 
2.39.2


--===============2638117526915768248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cairomm-1.16/cairomm-1.16-dbg: PKGV changed from 1.16.2 [default] to 1.18.0 [default]
packages/core2-64-poky-linux/cairomm-1.16/cairomm-1.16-dbg: PV changed from "1.16.2" to "1.18.0"
packages/core2-64-poky-linux/cairomm-1.16/cairomm-1.16-dbg: PKGSIZE changed from 1589352 to 1601768 (+1%)
packages/core2-64-poky-linux/cairomm-1.16/cairomm-1.16-dev: PKGV changed from 1.16.2 [default] to 1.18.0 [default]
packages/core2-64-poky-linux/cairomm-1.16/cairomm-1.16-dev: PV changed from "1.16.2" to "1.18.0"
packages/core2-64-poky-linux/cairomm-1.16/cairomm-1.16-dev: PKGSIZE changed from 235244 to 237604 (+1%)
packages/core2-64-poky-linux/cairomm-1.16/cairomm-1.16-doc: PKGV changed from 1.16.2 [default] to 1.18.0 [default]
packages/core2-64-poky-linux/cairomm-1.16/cairomm-1.16-doc: PV changed from "1.16.2" to "1.18.0"
packages/core2-64-poky-linux/cairomm-1.16/cairomm-1.16-locale: PKGV changed from 1.16.2 [default] to 1.18.0 [default]
packages/core2-64-poky-linux/cairomm-1.16/cairomm-1.16-locale: PV changed from "1.16.2" to "1.18.0"
packages/core2-64-poky-linux/cairomm-1.16/cairomm-1.16-src: PKGV changed from 1.16.2 [default] to 1.18.0 [default]
packages/core2-64-poky-linux/cairomm-1.16/cairomm-1.16-src: PV changed from "1.16.2" to "1.18.0"
packages/core2-64-poky-linux/cairomm-1.16/cairomm-1.16-src: PKGSIZE changed from 326836 to 331060 (+1%)
packages/core2-64-poky-linux/cairomm-1.16/cairomm-1.16-staticdev: PKGV changed from 1.16.2 [default] to 1.18.0 [default]
packages/core2-64-poky-linux/cairomm-1.16/cairomm-1.16-staticdev: PV changed from "1.16.2" to "1.18.0"
packages/core2-64-poky-linux/cairomm-1.16/cairomm-1.16: PKGV changed from 1.16.2 [default] to 1.18.0 [default]
packages/core2-64-poky-linux/cairomm-1.16/cairomm-1.16: PV changed from "1.16.2" to "1.18.0"
packages/core2-64-poky-linux/cairomm-1.16/cairomm-1.16: PKGSIZE changed from 198752 to 202848 (+2%)
packages/core2-64-poky-linux/cairomm-1.16: PKGV changed from 1.16.2 [default] to 1.18.0 [default]
packages/core2-64-poky-linux/cairomm-1.16: PV changed from "1.16.2" to "1.18.0"
packages/core2-64-poky-linux/cairomm-1.16: SRC_URI changed from "https://www.cairographics.org/releases/cairomm-1.16.2.tar.xz" to "https://www.cairographics.org/releases/cairomm-1.18.0.tar.xz"

--===============2638117526915768248==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cairomm-1.16-upgrade-1.16.2-1.18.0.patch"

RnJvbSAzYmNmNjMyZjZiMDE2Mzk4YTNjNmRiZjMzOTEzYzUzNTY1NmIwZmExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMTo0Njo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNh
aXJvbW0tMS4xNjogdXBncmFkZSAxLjE2LjIgLT4gMS4xOC4wCgotLS0KIC4uLi9jYWlyby97Y2Fp
cm9tbS0xLjE2XzEuMTYuMi5iYiA9PiBjYWlyb21tLTEuMTZfMS4xOC4wLmJifSAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEtb2UvcmVjaXBlcy1ncmFwaGljcy9jYWlyby97Y2Fpcm9tbS0xLjE2XzEuMTYuMi5iYiA9PiBj
YWlyb21tLTEuMTZfMS4xOC4wLmJifSAoODIlKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBl
cy1ncmFwaGljcy9jYWlyby9jYWlyb21tLTEuMTZfMS4xNi4yLmJiIGIvbWV0YS1vZS9yZWNpcGVz
LWdyYXBoaWNzL2NhaXJvL2NhaXJvbW0tMS4xNl8xLjE4LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4
MiUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL2NhaXJvL2NhaXJvbW0tMS4x
Nl8xLjE2LjIuYmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy9jYWlyby9jYWly
b21tLTEuMTZfMS4xOC4wLmJiCmluZGV4IGMxZTI3MWZmYS4uYjE4ZTE2MTRlIDEwMDY0NAotLS0g
YS9tZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvY2Fpcm8vY2Fpcm9tbS0xLjE2XzEuMTYuMi5iYgor
KysgYi9tZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvY2Fpcm8vY2Fpcm9tbS0xLjE2XzEuMTguMC5i
YgpAQCAtOSw3ICs5LDcgQEAgaW5oZXJpdCBnbm9tZWJhc2UKIERFUEVORFMgKz0gImJvb3N0IGNh
aXJvIGxpYnNpZ2MrKy0zIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3LmNhaXJvZ3JhcGhpY3Mu
b3JnL3JlbGVhc2VzL2NhaXJvbW0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjZhNjNiZjk4YTk3ZGRhMmIwZjU1ZTM0ZDFiNWYzZmI5MDllZjhiNzBmOWI4ZDM4MmNiMWZmMzk3
OGU3ZGMxM2YiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjgxMjU1Mzk0ZTNlYThlOGFhODg3Mjc2
ZDIyYWZhODk4NWZjOGRhZWY2MDY5MmViMjQwN2QyMzA0OWYwM2NmYiIKIAogUyA9ICIke1dPUktE
SVJ9L2NhaXJvbW0tJHtQVn0iCiAKLS0gCjIuMzkuMgoK

--===============2638117526915768248==--


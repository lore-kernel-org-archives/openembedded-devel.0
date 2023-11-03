Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FB8C18E18
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:52 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.63869.1699041166068823599
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gjxI9E2D;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eHixAYTW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b96bed1d2-93ab3f95-ced4-4bf2-8839-56af46090f03-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WGRLV31VBNLp+UWUuU6njTSbROpFYw449A76FstkgwU=;
	b=gjxI9E2Drn0Q8S+5QgGkJERUlklS7+gQM5DnNxGoeLpI52GbnSFY/lRJJDZFNMdI
	ZT9gkYyREP6zhr19R1c7UXYQJ7F9xT7onqw1ADmO5/MjOETtQurYelb6rs5EgEdQc2J
	2ntpYZc7EBMfvI/3NrjNbMEzvhFnGR3v9yaajPnI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WGRLV31VBNLp+UWUuU6njTSbROpFYw449A76FstkgwU=;
	b=eHixAYTWo/Kolrh26acgu5WZGJpBCIsfN4qa8kyiXeyhloJ6KintElJeu4C8Hptg
	frqK/pkyDi3zH1krY+NSduJk0Z1PiWoY/JRdXqjwAtDn73mF1qY4kCQOrlB0f/ON+OE
	/OIp9DTq+OfAZi0nPRWeLVI6uYVUmjOAiHY6QcS4=
Content-Type: multipart/mixed; boundary="===============4614591215915012293=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] mcelog: upgrading to 196 SUCCEEDED
Message-ID: <0101018b96bed1d2-93ab3f95-ced4-4bf2-8839-56af46090f03-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105981

--===============4614591215915012293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mcelog* to *196* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mcelog-upgrade-194-196.patch
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
From b738121705a045b0dc62fb75a51186e32cf29901 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 15:30:50 +0000
Subject: [PATCH] mcelog: upgrade 194 -> 196

---
 meta-oe/recipes-support/mcelog/{mcelog_194.bb => mcelog_196.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_194.bb => mcelog_196.bb} (96%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_194.bb b/meta-oe/recipes-support/mcelog/mcelog_196.bb
similarity index 96%
rename from meta-oe/recipes-support/mcelog/mcelog_194.bb
rename to meta-oe/recipes-support/mcelog/mcelog_196.bb
index 9b5c554d8..06aa30df0 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_194.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_196.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     file://run-ptest \
 "
 
-SRCREV = "8f33fdc47160edce09d75e1316b4d88129ca60a0"
+SRCREV = "edfe78a0dc54a940f4916a9bd681eab7b3f746d1"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.39.2


--===============4614591215915012293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mcelog: PV changed from "194" to "196"
packages/core2-64-poky-linux/mcelog: PKGV changed from 194 [default] to 196 [default]
packages/core2-64-poky-linux/mcelog/mcelog-dbg: PV changed from "194" to "196"
packages/core2-64-poky-linux/mcelog/mcelog-dbg: PKGSIZE changed from 333456 to 340944 (+2%)
packages/core2-64-poky-linux/mcelog/mcelog-dbg: PKGV changed from 194 [default] to 196 [default]
packages/core2-64-poky-linux/mcelog/mcelog-dev: PV changed from "194" to "196"
packages/core2-64-poky-linux/mcelog/mcelog-dev: PKGV changed from 194 [default] to 196 [default]
packages/core2-64-poky-linux/mcelog/mcelog-doc: PV changed from "194" to "196"
packages/core2-64-poky-linux/mcelog/mcelog-doc: PKGV changed from 194 [default] to 196 [default]
packages/core2-64-poky-linux/mcelog/mcelog-locale: PV changed from "194" to "196"
packages/core2-64-poky-linux/mcelog/mcelog-locale: PKGV changed from 194 [default] to 196 [default]
packages/core2-64-poky-linux/mcelog/mcelog-ptest: PV changed from "194" to "196"
packages/core2-64-poky-linux/mcelog/mcelog-ptest: PKGV changed from 194 [default] to 196 [default]
packages/core2-64-poky-linux/mcelog/mcelog-src: PV changed from "194" to "196"
packages/core2-64-poky-linux/mcelog/mcelog-src: PKGSIZE changed from 274526 to 284145 (+4%)
packages/core2-64-poky-linux/mcelog/mcelog-src: PKGV changed from 194 [default] to 196 [default]
packages/core2-64-poky-linux/mcelog/mcelog-src: FILELIST: removed "/usr/src/debug/mcelog/194-r0/client.c /usr/src/debug/mcelog/194-r0/client.h /usr/src/debug/mcelog/194-r0/version.c /usr/src/debug/mcelog/194-r0/page.c /usr/src/debug/mcelog/194-r0/page.h /usr/src/debug/mcelog/194-r0/version.h /usr/src/debug/mcelog/194-r0/sysfs.c /usr/src/debug/mcelog/194-r0/intel.h /usr/src/debug/mcelog/194-r0/intel.c /usr/src/debug/mcelog/194-r0/sysfs.h /usr/src/debug/mcelog/194-r0/config.c /usr/src/debug/mcelog/194-r0/config.h /usr/src/debug/mcelog/194-r0/leaky-bucket.h /usr/src/debug/mcelog/194-r0/memdb.c /usr/src/debug/mcelog/194-r0/memdb.h /usr/src/debug/mcelog/194-r0/leaky-bucket.c /usr/src/debug/mcelog/194-r0/yellow.c /usr/src/debug/mcelog/194-r0/rbtree.c /usr/src/debug/mcelog/194-r0/yellow.h /usr/src/debug/mcelog/194-r0/rbtree.h /usr/src/debug/mcelog/194-r0/broadwell_de.c /usr/src/debug/mcelog/194-r0/bus.c /usr/src/debug/mcelog/194-r0/dmi.c /usr/src/debug/mcelog/194-r0/msg.c /usr/src/debug/mce
 log/194-r0/msr.c /usr/src/debug/mcelog/194-r0/tsc.c /usr/src/debug/mcelog/194-r0/bus.h /usr/src/debug/mcelog/194-r0/dmi.h /usr/src/debug/mcelog/194-r0/msg.h /usr/src/debug/mcelog/194-r0/broadwell_de.h /usr/src/debug/mcelog/194-r0/tsc.h /usr/src/debug/mcelog/194-r0/lookup_intel_cputype.c /usr/src/debug/mcelog/194-r0/bitfield.h /usr/src/debug/mcelog/194-r0/bitfield.c /usr/src/debug/mcelog/194-r0/cputype.h /usr/src/debug/mcelog/194-r0/sandy-bridge.h /usr/src/debug/mcelog/194-r0/i10nm.h /usr/src/debug/mcelog/194-r0/sandy-bridge.c /usr/src/debug/mcelog/194-r0/i10nm.c /usr/src/debug/mcelog/194-r0/mcelog.c /usr/src/debug/mcelog/194-r0/skylake_xeon.h /usr/src/debug/mcelog/194-r0/mcelog.h /usr/src/debug/mcelog/194-r0/skylake_xeon.c /usr/src/debug/mcelog/194-r0/unknown.c /usr/src/debug/mcelog/194-r0/ivy-bridge.h /usr/src/debug/mcelog/194-r0/memutil.h /usr/src/debug/mcelog/194-r0/dunnington.h /usr/src/debug/mcelog/194-r0/ivy-bridge.c /usr/src/debug/mcelog/194-r0/unknown.h /usr/src/debug/mcelog
 /194-r0/dunnington.c /usr/src/debug/mcelog/194-r0/memutil.c /usr/src/debug/mcelog/194-r0/sapphire.c /usr/src/debug/mcelog/194-r0/core2.h /usr/src/debug/mcelog/194-r0/sapphire.h /usr/src/debug/mcelog/194-r0/core2.c /usr/src/debug/mcelog/194-r0/cache.h /usr/src/debug/mcelog/194-r0/list.h /usr/src/debug/mcelog/194-r0/denverton.c /usr/src/debug/mcelog/194-r0/cache.c /usr/src/debug/mcelog/194-r0/denverton.h /usr/src/debug/mcelog/194-r0/haswell.h /usr/src/debug/mcelog/194-r0/haswell.c /usr/src/debug/mcelog/194-r0/k8.h /usr/src/debug/mcelog/194-r0/p4.h /usr/src/debug/mcelog/194-r0/k8.c /usr/src/debug/mcelog/194-r0/p4.c /usr/src/debug/mcelog/194-r0/broadwell_epex.c /usr/src/debug/mcelog/194-r0/broadwell_epex.h /usr/src/debug/mcelog/194-r0/eventloop.c /usr/src/debug/mcelog/194-r0/tulsa.c /usr/src/debug/mcelog/194-r0/eventloop.h /usr/src/debug/mcelog/194-r0/tulsa.h /usr/src/debug/mcelog/194-r0/nehalem.c /usr/src/debug/mcelog/194-r0/nehalem.h /usr/src/debug/mcelog/194-r0/server.c /usr/src/debu
 g/mcelog/194-r0/server.h /usr/src/debug/mcelog/194-r0/trigger.c /usr/src/debug/mcelog/194-r0/trigger.h", added "/usr/src/debug/mcelog/196-r0/leaky-bucket.c /usr/src/debug/mcelog/196-r0/sandy-bridge.h /usr/src/debug/mcelog/196-r0/sandy-bridge.c /usr/src/debug/mcelog/196-r0/leaky-bucket.h /usr/src/debug/mcelog/196-r0/sysfs.c /usr/src/debug/mcelog/196-r0/haswell.c /usr/src/debug/mcelog/196-r0/sysfs.h /usr/src/debug/mcelog/196-r0/haswell.h /usr/src/debug/mcelog/196-r0/intel.h /usr/src/debug/mcelog/196-r0/intel.c /usr/src/debug/mcelog/196-r0/core2.h /usr/src/debug/mcelog/196-r0/trigger.h /usr/src/debug/mcelog/196-r0/eventloop.h /usr/src/debug/mcelog/196-r0/bus.c /usr/src/debug/mcelog/196-r0/dmi.c /usr/src/debug/mcelog/196-r0/msg.c /usr/src/debug/mcelog/196-r0/msr.c /usr/src/debug/mcelog/196-r0/tsc.c /usr/src/debug/mcelog/196-r0/core2.c /usr/src/debug/mcelog/196-r0/trigger.c /usr/src/debug/mcelog/196-r0/bus.h /usr/src/debug/mcelog/196-r0/dmi.h /usr/src/debug/mcelog/196-r0/eventloop.c /usr
 /src/debug/mcelog/196-r0/msg.h /usr/src/debug/mcelog/196-r0/tsc.h /usr/src/debug/mcelog/196-r0/cputype.h /usr/src/debug/mcelog/196-r0/dunnington.h /usr/src/debug/mcelog/196-r0/dunnington.c /usr/src/debug/mcelog/196-r0/i10nm.h /usr/src/debug/mcelog/196-r0/server.c /usr/src/debug/mcelog/196-r0/i10nm.c /usr/src/debug/mcelog/196-r0/server.h /usr/src/debug/mcelog/196-r0/broadwell_de.c /usr/src/debug/mcelog/196-r0/broadwell_de.h /usr/src/debug/mcelog/196-r0/tulsa.c /usr/src/debug/mcelog/196-r0/tulsa.h /usr/src/debug/mcelog/196-r0/nehalem.h /usr/src/debug/mcelog/196-r0/mcelog.h /usr/src/debug/mcelog/196-r0/nehalem.c /usr/src/debug/mcelog/196-r0/mcelog.c /usr/src/debug/mcelog/196-r0/unknown.h /usr/src/debug/mcelog/196-r0/unknown.c /usr/src/debug/mcelog/196-r0/client.h /usr/src/debug/mcelog/196-r0/memutil.c /usr/src/debug/mcelog/196-r0/memutil.h /usr/src/debug/mcelog/196-r0/client.c /usr/src/debug/mcelog/196-r0/rbtree.c /usr/src/debug/mcelog/196-r0/rbtree.h /usr/src/debug/mcelog/196-r0/bitfi
 eld.h /usr/src/debug/mcelog/196-r0/ivy-bridge.c /usr/src/debug/mcelog/196-r0/bitfield.c /usr/src/debug/mcelog/196-r0/ivy-bridge.h /usr/src/debug/mcelog/196-r0/yellow.h /usr/src/debug/mcelog/196-r0/yellow.c /usr/src/debug/mcelog/196-r0/sapphire.c /usr/src/debug/mcelog/196-r0/cache.h /usr/src/debug/mcelog/196-r0/cache.c /usr/src/debug/mcelog/196-r0/sapphire.h /usr/src/debug/mcelog/196-r0/memdb.c /usr/src/debug/mcelog/196-r0/memdb.h /usr/src/debug/mcelog/196-r0/skylake_xeon.h /usr/src/debug/mcelog/196-r0/skylake_xeon.c /usr/src/debug/mcelog/196-r0/page.h /usr/src/debug/mcelog/196-r0/version.c /usr/src/debug/mcelog/196-r0/version.h /usr/src/debug/mcelog/196-r0/page.c /usr/src/debug/mcelog/196-r0/config.c /usr/src/debug/mcelog/196-r0/lookup_intel_cputype.c /usr/src/debug/mcelog/196-r0/config.h /usr/src/debug/mcelog/196-r0/broadwell_epex.c /usr/src/debug/mcelog/196-r0/broadwell_epex.h /usr/src/debug/mcelog/196-r0/list.h /usr/src/debug/mcelog/196-r0/p4.h /usr/src/debug/mcelog/196-r0/denver
 ton.c /usr/src/debug/mcelog/196-r0/k8.c /usr/src/debug/mcelog/196-r0/p4.c /usr/src/debug/mcelog/196-r0/granite.c /usr/src/debug/mcelog/196-r0/k8.h /usr/src/debug/mcelog/196-r0/denverton.h /usr/src/debug/mcelog/196-r0/granite.h"
packages/core2-64-poky-linux/mcelog/mcelog-staticdev: PV changed from "194" to "196"
packages/core2-64-poky-linux/mcelog/mcelog-staticdev: PKGV changed from 194 [default] to 196 [default]
packages/core2-64-poky-linux/mcelog/mcelog: PV changed from "194" to "196"
packages/core2-64-poky-linux/mcelog/mcelog: PKGSIZE changed from 216028 to 225756 (+5%)
packages/core2-64-poky-linux/mcelog/mcelog: PKGV changed from 194 [default] to 196 [default]

--===============4614591215915012293==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-mcelog-upgrade-194-196.patch"

RnJvbSBiNzM4MTIxNzA1YTA0NWIwZGM2MmZiNzVhNTExODZlMzJjZjI5OTAxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNTozMDo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1j
ZWxvZzogdXBncmFkZSAxOTQgLT4gMTk2CgotLS0KIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L21j
ZWxvZy97bWNlbG9nXzE5NC5iYiA9PiBtY2Vsb2dfMTk2LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEtb2UvcmVjaXBl
cy1zdXBwb3J0L21jZWxvZy97bWNlbG9nXzE5NC5iYiA9PiBtY2Vsb2dfMTk2LmJifSAoOTYlKQoK
ZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L21jZWxvZy9tY2Vsb2dfMTk0LmJi
IGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbWNlbG9nL21jZWxvZ18xOTYuYmIKc2ltaWxhcml0
eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbWNlbG9nL21j
ZWxvZ18xOTQuYmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L21jZWxvZy9tY2Vs
b2dfMTk2LmJiCmluZGV4IDliNWM1NTRkOC4uMDZhYTMwZGYwIDEwMDY0NAotLS0gYS9tZXRhLW9l
L3JlY2lwZXMtc3VwcG9ydC9tY2Vsb2cvbWNlbG9nXzE5NC5iYgorKysgYi9tZXRhLW9lL3JlY2lw
ZXMtc3VwcG9ydC9tY2Vsb2cvbWNlbG9nXzE5Ni5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJ
ID0gIlwKICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICIKIAotU1JDUkVWID0gIjhmMzNmZGM0NzE2
MGVkY2UwOWQ3NWUxMzE2YjRkODgxMjljYTYwYTAiCitTUkNSRVYgPSAiZWRmZTc4YTBkYzU0YTk0
MGY0OTE2YTliZDY4MWVhYjdiM2Y3NDZkMSIKIAogTElDRU5TRSA9ICJHUEwtMi4wLW9ubHkiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2
YTgwZmRhZjRhNDI2MyIKLS0gCjIuMzkuMgoK

--===============4614591215915012293==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16267C27C40
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:55 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.62971.1699041165185365512
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MTlrq3ih;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jqR9a6u7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b96bee0d9-46cba568-ce65-4924-b06f-85e4dbf0fda6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JZ2nK9xW/pwf9skpMMUTnVfqwi0jP/yeAoBc5a88sXA=;
	b=MTlrq3ih/teAw45x5fBRL/r8kemryMswGtIJ5z/1b0+ZBkIwxjX4r3QK3sQLGO5m
	VVbp0JRQ4cCyytuY6XTFWk+dywLnWCC+TiDDFUwqUAiMKyR8lg8dytd/Ztk14NQj9dQ
	4ScjGjAS/OLI+b2jiJ84oOEiAkP6QqrqcJua3XCU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JZ2nK9xW/pwf9skpMMUTnVfqwi0jP/yeAoBc5a88sXA=;
	b=jqR9a6u7J0BWIvZBGu1nhDYx5lBsucAY+y4Tuf1E/liYSHATvCAAuTeLuKZ+577U
	8h/HKrXVdotYicyQyCFwViAxVrI56ZMBu450g2MFbPBzaI/8bwbboslmC2Yedw3NHnD
	UDveKVq/XFnbCLGywnBZELq3EMm5f+sEhkVjzQJE=
Content-Type: multipart/mixed; boundary="===============2101144560533882910=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] ser2net: upgrading to 4.5.0 SUCCEEDED
Message-ID: <0101018b96bee0d9-46cba568-ce65-4924-b06f-85e4dbf0fda6-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106011

--===============2101144560533882910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ser2net* to *4.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ser2net-upgrade-4.3.13-4.5.0.patch
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
From 0b7d3bb4d9cda1e0f0b4132aac2b713a082e6e53 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 18:23:34 +0000
Subject: [PATCH] ser2net: upgrade 4.3.13 -> 4.5.0

---
 .../ser2net/{ser2net_4.3.13.bb => ser2net_4.5.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.3.13.bb => ser2net_4.5.0.bb} (83%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.13.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.5.0.bb
similarity index 83%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.3.13.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.5.0.bb
index 47f2c26ce..c7f545318 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.13.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.5.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "ed8b98448d535111d9a593b067601a8b53e2874814d706b2421a9490a660d265"
+SRC_URI[sha256sum] = "6ee1b217aad026948fd17ea00c5ecf6e982de822384c4349118461ad83caa0da"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.39.2


--===============2101144560533882910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ser2net: SRC_URI changed from "https://downloads.sourceforge.net/project/ser2net/ser2net/ser2net-4.3.13.tar.gz" to "https://downloads.sourceforge.net/project/ser2net/ser2net/ser2net-4.5.0.tar.gz"
packages/core2-64-poky-linux/ser2net: PKGV changed from 4.3.13 [default] to 4.5.0 [default]
packages/core2-64-poky-linux/ser2net: PV changed from "4.3.13" to "4.5.0"
packages/core2-64-poky-linux/ser2net/ser2net-dbg: PKGV changed from 4.3.13 [default] to 4.5.0 [default]
packages/core2-64-poky-linux/ser2net/ser2net-dbg: PV changed from "4.3.13" to "4.5.0"
packages/core2-64-poky-linux/ser2net/ser2net-dbg: PKGSIZE changed from 438152 to 407824 (-7%)
packages/core2-64-poky-linux/ser2net/ser2net-dev: PKGV changed from 4.3.13 [default] to 4.5.0 [default]
packages/core2-64-poky-linux/ser2net/ser2net-dev: PV changed from "4.3.13" to "4.5.0"
packages/core2-64-poky-linux/ser2net/ser2net-doc: PKGV changed from 4.3.13 [default] to 4.5.0 [default]
packages/core2-64-poky-linux/ser2net/ser2net-doc: PV changed from "4.3.13" to "4.5.0"
packages/core2-64-poky-linux/ser2net/ser2net-doc: PKGSIZE changed from 51285 to 51765 (+1%)
packages/core2-64-poky-linux/ser2net/ser2net-locale: PKGV changed from 4.3.13 [default] to 4.5.0 [default]
packages/core2-64-poky-linux/ser2net/ser2net-locale: PV changed from "4.3.13" to "4.5.0"
packages/core2-64-poky-linux/ser2net/ser2net-src: PKGV changed from 4.3.13 [default] to 4.5.0 [default]
packages/core2-64-poky-linux/ser2net/ser2net-src: PV changed from "4.3.13" to "4.5.0"
packages/core2-64-poky-linux/ser2net/ser2net-src: PKGSIZE changed from 325884 to 316519 (-3%)
packages/core2-64-poky-linux/ser2net/ser2net-src: FILELIST: removed "/usr/src/debug/ser2net/4.3.13-r0/auth.c /usr/src/debug/ser2net/4.3.13-r0/led.h /usr/src/debug/ser2net/4.3.13-r0/ser2net_str.c /usr/src/debug/ser2net/4.3.13-r0/ser2net.h /usr/src/debug/ser2net/4.3.13-r0/led.c /usr/src/debug/ser2net/4.3.13-r0/ser2net.c /usr/src/debug/ser2net/4.3.13-r0/rotator.c /usr/src/debug/ser2net/4.3.13-r0/dataxfer.h /usr/src/debug/ser2net/4.3.13-r0/port.c /usr/src/debug/ser2net/4.3.13-r0/portconfig.c /usr/src/debug/ser2net/4.3.13-r0/readconfig.c /usr/src/debug/ser2net/4.3.13-r0/addsysattrs.c /usr/src/debug/ser2net/4.3.13-r0/readconfig.h /usr/src/debug/ser2net/4.3.13-r0/dataxfer.c /usr/src/debug/ser2net/4.3.13-r0/port.h /usr/src/debug/ser2net/4.3.13-r0/mdns.h /usr/src/debug/ser2net/4.3.13-r0/portinfo.c /usr/src/debug/ser2net/4.3.13-r0/mdns.c /usr/src/debug/ser2net/4.3.13-r0/yamlconf.c /usr/src/debug/ser2net/4.3.13-r0/trace.c /usr/src/debug/ser2net/4.3.13-r0/controller.c /usr/src/debug/ser2net/4.3.
 13-r0/controller.h /usr/src/debug/ser2net/4.3.13-r0/led_sysfs.c /usr/src/debug/ser2net/4.3.13-r0/gbuf.h /usr/src/debug/ser2net/4.3.13-r0/absout.h /usr/src/debug/ser2net/4.3.13-r0/gbuf.c /usr/src/debug/ser2net/4.3.13-r0/led_sysfs.h /usr/src/debug/ser2net/4.3.13-r0/defaults.c /usr/src/debug/ser2net/4.3.13-r0/defaults.h", added "/usr/src/debug/ser2net/4.5.0-r0/gbuf.h /usr/src/debug/ser2net/4.5.0-r0/gbuf.c /usr/src/debug/ser2net/4.5.0-r0/timeproc.h /usr/src/debug/ser2net/4.5.0-r0/timeproc.c /usr/src/debug/ser2net/4.5.0-r0/auth.c /usr/src/debug/ser2net/4.5.0-r0/addsysattrs.c /usr/src/debug/ser2net/4.5.0-r0/rotator.c /usr/src/debug/ser2net/4.5.0-r0/dataxfer.h /usr/src/debug/ser2net/4.5.0-r0/defaults.h /usr/src/debug/ser2net/4.5.0-r0/dataxfer.c /usr/src/debug/ser2net/4.5.0-r0/defaults.c /usr/src/debug/ser2net/4.5.0-r0/absout.h /usr/src/debug/ser2net/4.5.0-r0/port.h /usr/src/debug/ser2net/4.5.0-r0/port.c /usr/src/debug/ser2net/4.5.0-r0/trace.c /usr/src/debug/ser2net/4.5.0-r0/readconfig.h /u
 sr/src/debug/ser2net/4.5.0-r0/ser2net_str.c /usr/src/debug/ser2net/4.5.0-r0/mdns.c /usr/src/debug/ser2net/4.5.0-r0/readconfig.c /usr/src/debug/ser2net/4.5.0-r0/portinfo.c /usr/src/debug/ser2net/4.5.0-r0/mdns.h /usr/src/debug/ser2net/4.5.0-r0/yamlconf.c /usr/src/debug/ser2net/4.5.0-r0/ser2net.c /usr/src/debug/ser2net/4.5.0-r0/controller.c /usr/src/debug/ser2net/4.5.0-r0/fileio.c /usr/src/debug/ser2net/4.5.0-r0/ser2net.h /usr/src/debug/ser2net/4.5.0-r0/fileio.h /usr/src/debug/ser2net/4.5.0-r0/controller.h /usr/src/debug/ser2net/4.5.0-r0/portconfig.c /usr/src/debug/ser2net/4.5.0-r0/led.c /usr/src/debug/ser2net/4.5.0-r0/led_sysfs.c /usr/src/debug/ser2net/4.5.0-r0/led.h /usr/src/debug/ser2net/4.5.0-r0/led_sysfs.h"
packages/core2-64-poky-linux/ser2net/ser2net-staticdev: PKGV changed from 4.3.13 [default] to 4.5.0 [default]
packages/core2-64-poky-linux/ser2net/ser2net-staticdev: PV changed from "4.3.13" to "4.5.0"
packages/core2-64-poky-linux/ser2net/ser2net: PKGV changed from 4.3.13 [default] to 4.5.0 [default]
packages/core2-64-poky-linux/ser2net/ser2net: PV changed from "4.3.13" to "4.5.0"
packages/core2-64-poky-linux/ser2net/ser2net: PKGSIZE changed from 143200 to 134720 (-6%)

--===============2101144560533882910==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ser2net-upgrade-4.3.13-4.5.0.patch"

RnJvbSAwYjdkM2JiNGQ5Y2RhMWUwZjBiNDEzMmFhYzJiNzEzYTA4MmU2ZTUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxODoyMzozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNl
cjJuZXQ6IHVwZ3JhZGUgNC4zLjEzIC0+IDQuNS4wCgotLS0KIC4uLi9zZXIybmV0L3tzZXIybmV0
XzQuMy4xMy5iYiA9PiBzZXIybmV0XzQuNS4wLmJifSAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEtb2Uv
cmVjaXBlcy1jb25uZWN0aXZpdHkvc2VyMm5ldC97c2VyMm5ldF80LjMuMTMuYmIgPT4gc2VyMm5l
dF80LjUuMC5iYn0gKDgzJSkKCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2
aXR5L3NlcjJuZXQvc2VyMm5ldF80LjMuMTMuYmIgYi9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2
aXR5L3NlcjJuZXQvc2VyMm5ldF80LjUuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgzJQpyZW5hbWUg
ZnJvbSBtZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L3NlcjJuZXQvc2VyMm5ldF80LjMuMTMu
YmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvc2VyMm5ldC9zZXIybmV0
XzQuNS4wLmJiCmluZGV4IDQ3ZjJjMjZjZS4uYzdmNTQ1MzE4IDEwMDY0NAotLS0gYS9tZXRhLW9l
L3JlY2lwZXMtY29ubmVjdGl2aXR5L3NlcjJuZXQvc2VyMm5ldF80LjMuMTMuYmIKKysrIGIvbWV0
YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zZXIybmV0L3NlcjJuZXRfNC41LjAuYmIKQEAgLTks
NyArOSw3IEBAIERFUEVORFMgPSAiZ2Vuc2lvIGxpYnlhbWwiCiAKIFNSQ19VUkkgPSAiJHtTT1VS
Q0VGT1JHRV9NSVJST1J9L3Byb2plY3Qvc2VyMm5ldC9zZXIybmV0L3NlcjJuZXQtJHtQVn0udGFy
Lmd6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWQ4Yjk4NDQ4ZDUzNTExMWQ5YTU5M2IwNjc2
MDFhOGI1M2UyODc0ODE0ZDcwNmIyNDIxYTk0OTBhNjYwZDI2NSIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI2ZWUxYjIxN2FhZDAyNjk0OGZkMTdlYTAwYzVlY2Y2ZTk4MmRlODIyMzg0YzQzNDkxMTg0
NjFhZDgzY2FhMGRhIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cDovL3NvdXJjZWZvcmdl
Lm5ldC9wcm9qZWN0cy9zZXIybmV0L2ZpbGVzL3NlcjJuZXQiCiAKLS0gCjIuMzkuMgoK

--===============2101144560533882910==--


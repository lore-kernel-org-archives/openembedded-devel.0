Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62126C05022
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:49 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.62976.1699041165918300934
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=V8lCA92a;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WFIiarlR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b96bec519-078206c0-d8cb-457e-b944-31bffdeaf9f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041166;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZVnVxGyhQm9WgsYzJpn+v8v6LLps2B+SIUN+Uqpc60Q=;
	b=V8lCA92amg5LQG6DbaZwB5Nr+n1vFTOUGUZzwTTIYB1cZZRyYTqDua5lX6F9TJT+
	8OWzbwgj5yNnI/1LEABwDevb0t+CDoybWzzGdkbUmfc9RastHi85Oh39OS5uA8O5ak/
	8RbB2sSywtqZiJLKIGoPiWUNX76G9bwH0DHzgjoY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041166;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZVnVxGyhQm9WgsYzJpn+v8v6LLps2B+SIUN+Uqpc60Q=;
	b=WFIiarlRp46aJPQm0MvKFxQLeB5okrQNKKKMGDWSXOjss4B2GZ9RU7ZOk3dsNUxm
	m62pVoNRY4tTGgdEc+weLONiCrCWkEF++ODrGBb980ARM/CaXG+wEWu23KYGjwt1B08
	cUQrz9mS+86KxZcYMCLueD2yp478cd0qoWkEYY28=
Content-Type: multipart/mixed; boundary="===============6830019614963215631=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] gcab: upgrading to 1.6 SUCCEEDED
Message-ID: <0101018b96bec519-078206c0-d8cb-457e-b944-31bffdeaf9f0-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:46 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105917

--===============6830019614963215631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gcab* to *1.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gcab-upgrade-1.4-1.6.patch
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
From ec612ae3c8cd7882b863bec318f0e41143429499 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 12:32:58 +0000
Subject: [PATCH] gcab: upgrade 1.4 -> 1.6

---
 meta-oe/recipes-gnome/gcab/{gcab_1.4.bb => gcab_1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/gcab/{gcab_1.4.bb => gcab_1.6.bb} (89%)

diff --git a/meta-oe/recipes-gnome/gcab/gcab_1.4.bb b/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
similarity index 89%
rename from meta-oe/recipes-gnome/gcab/gcab_1.4.bb
rename to meta-oe/recipes-gnome/gcab/gcab_1.6.bb
index 321e7c36a..4278fc945 100644
--- a/meta-oe/recipes-gnome/gcab/gcab_1.4.bb
+++ b/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
@@ -9,7 +9,7 @@ SRC_URI = "\
     ${GNOME_MIRROR}/gcab/${PV}/gcab-${PV}.tar.xz \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "67a5fa9be6c923fbc9197de6332f36f69a33dadc9016a2b207859246711c048f"
+SRC_URI[sha256sum] = "2f0c9615577c4126909e251f9de0626c3ee7a152376c15b5544df10fc87e560b"
 
 inherit gobject-introspection gtk-doc manpages meson ptest-gnome vala
 
-- 
2.39.2


--===============6830019614963215631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gcab/gcab-dbg: PKGSIZE changed from 325984 to 331952 (+2%)
packages/core2-64-poky-linux/gcab/gcab-dbg: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-dbg: FILELIST: removed "/usr/lib/.debug/libgcab-1.0.so.0.1.0", added "/usr/lib/.debug/libgcab-1.0.so.0.3.0"
packages/core2-64-poky-linux/gcab/gcab-dbg: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-dev: PKGSIZE changed from 71583 to 74450 (+4%)
packages/core2-64-poky-linux/gcab/gcab-dev: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-dev: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-doc: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-doc: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-bs: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-bs: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-cs: PKGSIZE changed from 2912 to 2913 (+0%)
packages/core2-64-poky-linux/gcab/gcab-locale-cs: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-cs: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-da: PKGSIZE changed from 2719 to 2770 (+2%)
packages/core2-64-poky-linux/gcab/gcab-locale-da: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-da: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-de: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-de: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-el: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-el: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-en-gb: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-en-gb: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-es: PKGSIZE changed from 2944 to 2968 (+1%)
packages/core2-64-poky-linux/gcab/gcab-locale-es: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-es: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-eu: PKGSIZE changed from 3383 to 2941 (-13%)
packages/core2-64-poky-linux/gcab/gcab-locale-eu: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-eu: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-fi: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-fi: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-fr: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-fr: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-fur: PKGSIZE changed from 2761 to 2853 (+3%)
packages/core2-64-poky-linux/gcab/gcab-locale-fur: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-fur: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-gl: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-gl: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-hu: PKGSIZE changed from 2970 to 2986 (+1%)
packages/core2-64-poky-linux/gcab/gcab-locale-hu: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-hu: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-id: PKGSIZE changed from 2841 to 2854 (+0%)
packages/core2-64-poky-linux/gcab/gcab-locale-id: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-id: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-lt: PKGSIZE changed from 3416 to 2930 (-14%)
packages/core2-64-poky-linux/gcab/gcab-locale-lt: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-lt: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-lv: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-lv: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-nb: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-nb: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-nl: PKGSIZE changed from 2836 to 2888 (+2%)
packages/core2-64-poky-linux/gcab/gcab-locale-nl: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-nl: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-oc: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-oc: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-pl: PKGSIZE changed from 2932 to 3029 (+3%)
packages/core2-64-poky-linux/gcab/gcab-locale-pl: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-pl: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-pt-br: PKGSIZE changed from 2974 to 2975 (+0%)
packages/core2-64-poky-linux/gcab/gcab-locale-pt-br: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-pt-br: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-pt: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-pt: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-ro: PKGSIZE changed from 3462 to 3022 (-13%)
packages/core2-64-poky-linux/gcab/gcab-locale-ro: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-ro: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-ru: PKGSIZE changed from 4238 to 3621 (-15%)
packages/core2-64-poky-linux/gcab/gcab-locale-ru: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-ru: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-sl: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-sl: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-sr+latin: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-sr+latin: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-sr: PKGSIZE changed from 3703 to 3723 (+1%)
packages/core2-64-poky-linux/gcab/gcab-locale-sr: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-sr: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-sv: PKGSIZE changed from 2760 to 2765 (+0%)
packages/core2-64-poky-linux/gcab/gcab-locale-sv: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-sv: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-tg: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-tg: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-tr: PKGSIZE changed from 2840 to 2898 (+2%)
packages/core2-64-poky-linux/gcab/gcab-locale-tr: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-tr: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-locale-zh-cn: PKGSIZE changed from 2997 to 2738 (-9%)
packages/core2-64-poky-linux/gcab/gcab-locale-zh-cn: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-locale-zh-cn: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-ptest: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-ptest: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-src: PKGSIZE changed from 177760 to 181788 (+2%)
packages/core2-64-poky-linux/gcab/gcab-src: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-src: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab-staticdev: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab-staticdev: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab/gcab: PKGSIZE changed from 103820 to 104004 (+0%)
packages/core2-64-poky-linux/gcab/gcab: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab/gcab: FILELIST: removed "/usr/lib/libgcab-1.0.so.0.1.0", added "/usr/lib/libgcab-1.0.so.0.3.0"
packages/core2-64-poky-linux/gcab/gcab: PV changed from "1.4" to "1.6"
packages/core2-64-poky-linux/gcab: PACKAGES: added "gcab-locale-ja gcab-locale-uk gcab-locale-hr gcab-locale-ka"
packages/core2-64-poky-linux/gcab: SRC_URI changed from "https://download.gnome.org/sources//gcab/1.4/gcab-1.4.tar.xz file://run-ptest" to "https://download.gnome.org/sources//gcab/1.6/gcab-1.6.tar.xz file://run-ptest"
packages/core2-64-poky-linux/gcab: PKGV changed from 1.4 [default] to 1.6 [default]
packages/core2-64-poky-linux/gcab: PV changed from "1.4" to "1.6"
Changes to packages/core2-64-poky-linux/gcab (sysroot):
  /usr/lib/libgcab-1.0.so.0 changed symlink target from libgcab-1.0.so.0.1.0 to libgcab-1.0.so.0.3.0
  /usr/lib/libgcab-1.0.so.0.1.0 moved to /usr/lib/libgcab-1.0.so.0.3.0

--===============6830019614963215631==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-gcab-upgrade-1.4-1.6.patch"

RnJvbSBlYzYxMmFlM2M4Y2Q3ODgyYjg2M2JlYzMxOGYwZTQxMTQzNDI5NDk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMjozMjo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdj
YWI6IHVwZ3JhZGUgMS40IC0+IDEuNgoKLS0tCiBtZXRhLW9lL3JlY2lwZXMtZ25vbWUvZ2NhYi97
Z2NhYl8xLjQuYmIgPT4gZ2NhYl8xLjYuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS1vZS9yZWNpcGVzLWdub21lL2dj
YWIve2djYWJfMS40LmJiID0+IGdjYWJfMS42LmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEt
b2UvcmVjaXBlcy1nbm9tZS9nY2FiL2djYWJfMS40LmJiIGIvbWV0YS1vZS9yZWNpcGVzLWdub21l
L2djYWIvZ2NhYl8xLjYuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS1v
ZS9yZWNpcGVzLWdub21lL2djYWIvZ2NhYl8xLjQuYmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBl
cy1nbm9tZS9nY2FiL2djYWJfMS42LmJiCmluZGV4IDMyMWU3YzM2YS4uNDI3OGZjOTQ1IDEwMDY0
NAotLS0gYS9tZXRhLW9lL3JlY2lwZXMtZ25vbWUvZ2NhYi9nY2FiXzEuNC5iYgorKysgYi9tZXRh
LW9lL3JlY2lwZXMtZ25vbWUvZ2NhYi9nY2FiXzEuNi5iYgpAQCAtOSw3ICs5LDcgQEAgU1JDX1VS
SSA9ICJcCiAgICAgJHtHTk9NRV9NSVJST1J9L2djYWIvJHtQVn0vZ2NhYi0ke1BWfS50YXIueHog
XAogICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY3YTVm
YTliZTZjOTIzZmJjOTE5N2RlNjMzMmYzNmY2OWEzM2RhZGM5MDE2YTJiMjA3ODU5MjQ2NzExYzA0
OGYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmYwYzk2MTU1NzdjNDEyNjkwOWUyNTFmOWRlMDYy
NmMzZWU3YTE1MjM3NmMxNWI1NTQ0ZGYxMGZjODdlNTYwYiIKIAogaW5oZXJpdCBnb2JqZWN0LWlu
dHJvc3BlY3Rpb24gZ3RrLWRvYyBtYW5wYWdlcyBtZXNvbiBwdGVzdC1nbm9tZSB2YWxhCiAKLS0g
CjIuMzkuMgoK

--===============6830019614963215631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gcab/gcab-locale-eu: PKGSIZE changed from 3383 to 2941 (-13%)
packages/core2-64-poky-linux/gcab/gcab-locale-lt: PKGSIZE changed from 3416 to 2930 (-14%)
packages/core2-64-poky-linux/gcab/gcab-locale-ro: PKGSIZE changed from 3462 to 3022 (-13%)
packages/core2-64-poky-linux/gcab/gcab-locale-ru: PKGSIZE changed from 4238 to 3621 (-15%)
packages/core2-64-poky-linux/gcab/gcab: FILELIST: removed "/usr/lib/libgcab-1.0.so.0.1.0", added "/usr/lib/libgcab-1.0.so.0.3.0"
packages/core2-64-poky-linux/gcab: PACKAGES: added "gcab-locale-ka gcab-locale-uk gcab-locale-hr gcab-locale-ja"
Changes to packages/core2-64-poky-linux/gcab (sysroot):
  /usr/lib/libgcab-1.0.so.0 changed symlink target from libgcab-1.0.so.0.1.0 to libgcab-1.0.so.0.3.0
  /usr/lib/libgcab-1.0.so.0.1.0 moved to /usr/lib/libgcab-1.0.so.0.3.0

--===============6830019614963215631==--


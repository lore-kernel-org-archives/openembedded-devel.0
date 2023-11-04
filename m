Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74309C04A68
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 05:12:29 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.4519.1699074743595124809
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 22:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NKz8nD6e;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kIsLJApo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b98bf1a6f-dbddadf4-6e76-4f00-b4d6-e638d4ed728b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699074743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JAMEbi/JgmCPmfRsrvB3qdHXoUN7IplHVb6V/znU6UU=;
	b=NKz8nD6eOUw/MU0YUb8kAMDDho8ObEScG5W5Adxbboek29Q4q+hzxA4BHchMOsW8
	0yhFiHg4VvFtUJWp8T/uMqIr2RzG56d68vp+o/1qnycTo61VDvk6haR6I4DytAur61Z
	G9htgBvA/TOqyDZ0bgPUKJXcrOBd9pVElXG7LrKM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699074743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JAMEbi/JgmCPmfRsrvB3qdHXoUN7IplHVb6V/znU6UU=;
	b=kIsLJApo6TJn7ewFo1RE4rnBogiNytOXbXAX7CPvSbG12dt4pcAXWsu8ypKQJSI4
	jsNt97Ulys8XOsTHgKzNLA3tN+sO+xsVHLIed3dUTMaXB9qilrVPak/VGVxUn0FtpQ9
	GskrvZcgVbaWrNtPa4rckFHLFPCJTbgKq0JpeWV8=
Content-Type: multipart/mixed; boundary="===============7547095618105058432=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] tracker-miners: upgrading to 3.6.2 SUCCEEDED
Message-ID: <0101018b98bf1a6f-dbddadf4-6e76-4f00-b4d6-e638d4ed728b-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 05:12:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 05:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106295

--===============7547095618105058432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *tracker-miners* to *3.6.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-tracker-miners-upgrade-3.6.0-3.6.2.patch
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
From 51571081b6f6695e3df3b71e1129a37daca0a092 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 05:03:24 +0000
Subject: [PATCH] tracker-miners: upgrade 3.6.0 -> 3.6.2

---
 .../{tracker-miners_3.6.0.bb => tracker-miners_3.6.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.6.0.bb => tracker-miners_3.6.2.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.0.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.0.bb
rename to meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
index d89915502..a0a41d7f8 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
@@ -20,7 +20,7 @@ SRC_URI:append = " \
 	file://0001-fix-reproducibility.patch \
 	file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch \
 "
-SRC_URI[archive.sha256sum] = "c2ed9f6b0410195863b84c7b5467c5bc1255e96d658741192b5e92568a3bebd0"
+SRC_URI[archive.sha256sum] = "0ad722f3d532c21d757cf488f942960679ea8f457925efa97656ed4c9e9ba4ff"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.39.2


--===============7547095618105058432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/tracker-miners: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners: SRC_URI changed from "https://download.gnome.org/sources//tracker-miners/3.6/tracker-miners-3.6.0.tar.xz;name=archive file://0001-fix-reproducibility.patch file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch" to "https://download.gnome.org/sources//tracker-miners/3.6/tracker-miners-3.6.2.tar.xz;name=archive file://0001-fix-reproducibility.patch file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch"
packages/core2-64-poky-linux/tracker-miners: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-bash-completion: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-bash-completion: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-dbg: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-dbg: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-dbg: PKGSIZE changed from 4646760 to 4649056 (+0%)
packages/core2-64-poky-linux/tracker-miners/tracker-miners-dev: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-dev: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-doc: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-doc: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ab: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ab: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ar: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ar: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-as: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-as: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-be+latin: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-be+latin: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-be: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-be: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-bg: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-bg: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-bs: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-bs: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ca+valencia: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ca+valencia: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ca: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ca: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-cs: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-cs: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-da: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-da: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-de: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-de: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-dz: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-dz: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-el: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-el: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-en-gb: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-en-gb: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-eo: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-eo: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-eo: PKGSIZE changed from 8664 to 14448 (+67%)
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-es: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-es: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-et: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-et: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-eu: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-eu: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-fa: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-fa: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-fi: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-fi: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-fr: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-fr: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-fur: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-fur: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-gl: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-gl: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-he: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-he: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-hr: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-hr: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-hu: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-hu: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-id: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-id: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-it: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-it: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ja: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ja: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ka: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ka: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ka: PKGSIZE changed from 18712 to 31159 (+67%)
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-kk: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-kk: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ko: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ko: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-lt: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-lt: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-lv: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-lv: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-mk: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-mk: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ml: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ml: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ms: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ms: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-nb: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-nb: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-nds: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-nds: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ne: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ne: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-nl: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-nl: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-oc: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-oc: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-pa: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-pa: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-pl: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-pl: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-pt-br: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-pt-br: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-pt: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-pt: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ro: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ro: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ru: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ru: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-sk: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-sk: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-sl: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-sl: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-sr+latin: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-sr+latin: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-sr: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-sr: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-sv: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-sv: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-te: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-te: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-tg: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-tg: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-th: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-th: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-tr: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-tr: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-uk: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-uk: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-vi: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-vi: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-zh-cn: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-zh-cn: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-zh-hk: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-zh-hk: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-zh-tw: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-zh-tw: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-src: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-src: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners-src: PKGSIZE changed from 1919863 to 1915177 (-0%)
packages/core2-64-poky-linux/tracker-miners/tracker-miners-src: FILELIST: directory renamed /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker -> /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker, directory renamed /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-control -> /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-control, directory renamed /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-writeback -> /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-writeback, directory renamed /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-extract -> /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-extract, removed "/usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/extract-resources.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract.h /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-controller.h /usr/src/debug/tracker-miners/3.6.0-r0/s
 rc/tracker-extract/tracker-extract-controller.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-miner-proxy.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-sched.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-indexing-tree.h /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-miners-enum-types.h /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-miner-proxy.h /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-sched.h /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-miners-enum-types.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-indexing-tree.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-miner-fs.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-desktop.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-miner.c /usr/src/debug
 /tracker-miners/3.6.0-r0/src/miners/fs/tracker-miner-fs.h /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-miner.h /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-power.h /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-miner-enums.h /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-miner-files.h /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-miner-files.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-msoffice.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-monitor-glib.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-monitor-glib.h /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-epub.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-html.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/miner-fs-resources.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-miner-fil
 es-methods.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-icon.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-jpeg.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-text.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-tiff.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-fts-config.h /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-mp3.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-miner-files-methods.h /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-fts-config.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-main.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-read.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-pdf.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-main.h /usr/src/de
 bug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-read.h /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-file-utils.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-term-utils.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-type-utils.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-lru.h /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-file-utils.h /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-term-utils.h /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-type-utils.h /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-raw.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-lru.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-priority-queue.h /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-priority-queue.c /usr/src/debug/tracker-miners
 /3.6.0-r0/src/tracker-extract/tracker-extract-abw.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-locale.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-locale.h /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-extract-watchdog.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-extract-watchdog.h /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-utils.h /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-utils.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-config.h /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-config.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-seccomp.h /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-domain-ontology.h /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-seccomp.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tra
 cker-domain-ontology.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-file-notifier.h /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-sparql-buffer.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-file-notifier.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-sparql-buffer.h /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-main.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-dbus.h /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-dbus.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-storage.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-date-time.h /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-decorator.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-gsf.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-date-time.c /usr/src/debug/tracker-mi
 ners/3.6.0-r0/src/miners/fs/tracker-storage.h /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-monitor-private.h /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-decorator.h /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-gsf.h /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-ps.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-error-report.h /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-bmp.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-error-report.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-power-upower.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-task-pool.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-dummy.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-monitor.h /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-
 extract/tracker-extract-oasis.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-task-pool.h /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-monitor.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-ioprio.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-ioprio.h /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-miner-enum-types.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-decorator.h /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-decorator.c /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-controller.h /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-config.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-config.h /usr/src/debug/tracker-miners/3.6.0-r0/src/miners/fs/tracker-controller.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-cue-sheet.h /usr/src/debug/tracker-miners/3.6.
 0-r0/src/tracker-extract/tracker-extract-png.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-cue-sheet.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-debug.h /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-debug.c /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-utils.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-persistence.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-persistence.h /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-enums.h /usr/src/debug/tracker-miners/3.6.0-r0/src/libtracker-miners-common/tracker-utils.h /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-msoffice-xml.c /usr/src/debug/tracker-miners/3.6.0-r0/src/tracker-extract/tracker-extract-gstreamer.c", added "/usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/extract-resources.c /usr/src
 /debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract.h /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-controller.h /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-controller.c /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-miner-proxy.c /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-sched.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-indexing-tree.h /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-miners-enum-types.h /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-miner-proxy.h /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-sched.h /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-miners-enum-types.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/track
 er-indexing-tree.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-miner-fs.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-desktop.c /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-miner.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-miner-fs.h /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-miner.h /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-power.h /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-miner-enums.h /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-miner-files.h /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-miner-files.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-msoffice.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-monitor-glib.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-monitor-glib.h /usr/src/debug/tracker-miners/3.6.
 2-r0/src/tracker-extract/tracker-extract-epub.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-html.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/miner-fs-resources.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-miner-files-methods.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-icon.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-jpeg.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-text.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-tiff.c /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-fts-config.h /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-mp3.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-miner-files-methods.h /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-fts-config.c /usr/src/debug/tracker-miners/3.6.2-r0/s
 rc/tracker-extract/tracker-main.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-read.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-pdf.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-main.h /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-read.h /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-file-utils.c /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-term-utils.c /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-type-utils.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-lru.h /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-file-utils.h /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-term-utils.h /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-type-utils.h /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/
 tracker-extract-raw.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-lru.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-priority-queue.h /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-priority-queue.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-abw.c /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-locale.c /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-locale.h /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-extract-watchdog.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-extract-watchdog.h /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-utils.h /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-utils.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-config.h /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-config.c /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-co
 mmon/tracker-seccomp.h /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-domain-ontology.h /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-seccomp.c /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-domain-ontology.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-file-notifier.h /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-sparql-buffer.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-file-notifier.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-sparql-buffer.h /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-main.c /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-dbus.h /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-dbus.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-files-interface.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-storage.c /usr/src
 /debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-decorator.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-gsf.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-storage.h /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-files-interface.h /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-monitor-private.h /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-decorator.h /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-gsf.h /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-ps.c /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-error-report.h /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-bmp.c /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-error-report.c /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-power-upower.c /usr/src/debug/tracker
 -miners/3.6.2-r0/src/miners/fs/tracker-task-pool.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-dummy.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-monitor.h /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-oasis.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-task-pool.h /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-monitor.c /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-ioprio.c /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-ioprio.h /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-miner-enum-types.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-decorator.h /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-decorator.c /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-controller.h /usr/src/debug/tracker-miners/3.6.2-r0/src/miners/fs/tracker-controller.c /usr/src/
 debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-cue-sheet.h /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-png.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-cue-sheet.c /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-debug.h /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-debug.c /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-utils.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-persistence.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-persistence.h /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-enums.h /usr/src/debug/tracker-miners/3.6.2-r0/src/libtracker-miners-common/tracker-utils.h /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-msoffice-xml.c /usr/src/debug/tracker-miners/3.6.2-r0/src/tracker-extract/tracker-extract-gstr
 eamer.c"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-staticdev: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners-staticdev: PKGV changed from 3.6.0 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/tracker-miners/tracker-miners: PV changed from "3.6.0" to "3.6.2"
packages/core2-64-poky-linux/tracker-miners/tracker-miners: PKGV changed from 3.6.0 [default] to 3.6.2 [default]

--===============7547095618105058432==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tracker-miners-upgrade-3.6.0-3.6.2.patch"

RnJvbSA1MTU3MTA4MWI2ZjY2OTVlM2RmM2I3MWUxMTI5YTM3ZGFjYTBhMDkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNTowMzoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRy
YWNrZXItbWluZXJzOiB1cGdyYWRlIDMuNi4wIC0+IDMuNi4yCgotLS0KIC4uLi97dHJhY2tlci1t
aW5lcnNfMy42LjAuYmIgPT4gdHJhY2tlci1taW5lcnNfMy42LjIuYmJ9ICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEtZ25vbWUvcmVjaXBlcy1nbm9tZS90cmFja2VyL3t0cmFja2VyLW1pbmVyc18zLjYuMC5iYiA9
PiB0cmFja2VyLW1pbmVyc18zLjYuMi5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhLWdub21l
L3JlY2lwZXMtZ25vbWUvdHJhY2tlci90cmFja2VyLW1pbmVyc18zLjYuMC5iYiBiL21ldGEtZ25v
bWUvcmVjaXBlcy1nbm9tZS90cmFja2VyL3RyYWNrZXItbWluZXJzXzMuNi4yLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEtZ25vbWUvcmVjaXBlcy1nbm9tZS90cmFja2Vy
L3RyYWNrZXItbWluZXJzXzMuNi4wLmJiCnJlbmFtZSB0byBtZXRhLWdub21lL3JlY2lwZXMtZ25v
bWUvdHJhY2tlci90cmFja2VyLW1pbmVyc18zLjYuMi5iYgppbmRleCBkODk5MTU1MDIuLmEwYTQx
ZDdmOCAxMDA2NDQKLS0tIGEvbWV0YS1nbm9tZS9yZWNpcGVzLWdub21lL3RyYWNrZXIvdHJhY2tl
ci1taW5lcnNfMy42LjAuYmIKKysrIGIvbWV0YS1nbm9tZS9yZWNpcGVzLWdub21lL3RyYWNrZXIv
dHJhY2tlci1taW5lcnNfMy42LjIuYmIKQEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSTphcHBlbmQg
PSAiIFwKIAlmaWxlOi8vMDAwMS1maXgtcmVwcm9kdWNpYmlsaXR5LnBhdGNoIFwKIAlmaWxlOi8v
MDAwMS1TZXQtaGVhZGVyLWZpbGUtdG8tYS1maXhlZC1wYXRoLWluc3RlYWQtb2YtYS1ob3N0LXBh
LnBhdGNoIFwKICIKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImMyZWQ5ZjZiMDQxMDE5
NTg2M2I4NGM3YjU0NjdjNWJjMTI1NWU5NmQ2NTg3NDExOTJiNWU5MjU2OGEzYmViZDAiCitTUkNf
VVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICIwYWQ3MjJmM2Q1MzJjMjFkNzU3Y2Y0ODhmOTQyOTYw
Njc5ZWE4ZjQ1NzkyNWVmYTk3NjU2ZWQ0YzllOWJhNGZmIgogCiAjIGdvYmplY3QtaW50cm9zcGVj
dGlvbiBpcyBtYW5kYXRvcnkgYW5kIGNhbm5vdCBiZSBjb25maWd1cmVkCiBSRVFVSVJFRF9ESVNU
Uk9fRkVBVFVSRVMgPSAiZ29iamVjdC1pbnRyb3NwZWN0aW9uLWRhdGEiCi0tIAoyLjM5LjIKCg==

--===============7547095618105058432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4890 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3052 cached, 3 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 146 recipes from the core2-64 sysroot...done.
Removing 152 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:7dedd2ee0716a9621f78bac7f3d96c25675b26c4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 1080 Local 1046 Mirrors 0 Missed 34 Current 239 (96% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 254 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 257 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 259 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 260 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 265 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 266 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 267 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 272 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 275 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 276 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/inih/libinih_57.bb:do_create_spdx_setscene)
NOTE: Running setscene task 277 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/inih/libinih_57.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb:do_create_spdx_setscene)
NOTE: Running setscene task 283 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 284 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libraw/libraw_0.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 285 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libstemmer/libstemmer_2.2.0.bb:do_create_spdx_setscene)
NOTE: recipe exiv2-0.28.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe brotli-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gexiv2-0.14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgsf-1.14.50-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe brotli-1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstemmer-2.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe jasper-2.0.33-r0: task do_create_spdx_setscene: Started
NOTE: recipe tracker-miners-3.6.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe libraw-0.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libinih-57-r0: task do_create_spdx_setscene: Started
NOTE: recipe jasper-2.0.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libinih-57-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tracker-3.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tracker-miners-3.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe networkmanager-1.44.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe networkmanager-1.44.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libraw-0.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 286 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libraw/libraw_0.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe gexiv2-0.14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe tracker-miners-3.6.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe exiv2-0.28.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 287 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgsf-1.14.50-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 288 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libstemmer/libstemmer_2.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 290 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb:do_recipe_qa_setscene)
NOTE: recipe tracker-miners-3.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libinih-57-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe jasper-2.0.33-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstemmer-2.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 291 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 292 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/inih/libinih_57.bb:do_packagedata_setscene)
NOTE: recipe tracker-3.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 293 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libstemmer/libstemmer_2.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe networkmanager-1.44.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe brotli-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 296 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb:do_package_setscene)
NOTE: recipe libinih-57-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libraw-0.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstemmer-2.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe networkmanager-1.44.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe exiv2-0.28.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstemmer-2.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gexiv2-0.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgsf-1.14.50-r0: task do_recipe_qa_setscene: Started
NOTE: recipe jasper-2.0.33-r0: task do_packagedata_setscene: Started
NOTE: recipe libinih-57-r0: task do_packagedata_setscene: Started
NOTE: recipe tracker-miners-3.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe jasper-2.0.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe brotli-1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tracker-3.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe networkmanager-1.44.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libraw-0.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe exiv2-0.28.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgsf-1.14.50-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tracker-miners-3.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gexiv2-0.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tracker-3.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libinih-57-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstemmer-2.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe jasper-2.0.33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 302 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 303 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 306 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/inih/libinih_57.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 308 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nss/nss_3.74.bb:do_create_spdx_setscene)
NOTE: Running setscene task 312 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/poppler/poppler_23.04.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 314 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/upower/upower_0.99.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 315 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/upower/upower_0.99.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 320 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 321 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_create_spdx_setscene)
NOTE: recipe libstemmer-2.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 331 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libstemmer/libstemmer_2.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe openjpeg-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe jasper-2.0.33-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openjpeg-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nss-3.74-r0: task do_create_spdx_setscene: Started
NOTE: recipe libinih-57-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe poppler-23.04.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstemmer-2.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe upower-0.99.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe upower-0.99.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe jasper-2.0.33-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libinih-57-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 332 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe nss-3.74-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe poppler-23.04.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libstemmer-2.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 338 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 339 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/poppler/poppler_23.04.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 340 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe openjpeg-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 341 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb:do_packagedata_setscene)
NOTE: recipe upower-0.99.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 343 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/lcms/lcms_2.15.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 344 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/upower/upower_0.99.17.bb:do_packagedata_setscene)
NOTE: recipe upower-0.99.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 347 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 348 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe networkmanager-1.44.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe poppler-23.04.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lcms-2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe openjpeg-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe json-glib-1.6.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 353 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openjpeg-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 354 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb:do_packagedata_setscene)
NOTE: recipe upower-0.99.17-r0: task do_packagedata_setscene: Started
NOTE: recipe ffmpeg-6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ffmpeg-6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe poppler-23.04.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 355 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libndp-1.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 356 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nss/nss_3.74.bb:do_packagedata_setscene)
NOTE: recipe lcms-2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 357 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nss/nss_3.74.bb:do_populate_sysroot_setscene)
NOTE: recipe json-glib-1.6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe networkmanager-1.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 358 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openjpeg-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 363 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/lcms/lcms_2.15.bb:do_packagedata_setscene)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 364 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/lcms/lcms_2.15.bb:do_populate_sysroot_setscene)
NOTE: recipe brotli-1.0.9-r0: task do_package_setscene: Started
NOTE: recipe ffmpeg-6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 365 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata_setscene)
NOTE: recipe libndp-1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nss-3.74-r0: task do_packagedata_setscene: Started
NOTE: recipe upower-0.99.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nss-3.74-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 368 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/upower/upower_0.99.17.bb:do_recipe_qa_setscene)
NOTE: recipe networkmanager-1.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 371 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe openjpeg-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libndp-1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 373 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/newt/libnewt_0.52.23.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lcms-2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe lcms-2.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe upower-0.99.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openjpeg-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 374 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/newt/libnewt_0.52.23.bb:do_populate_sysroot_setscene)
NOTE: recipe nss-3.74-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 376 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nspr/nspr_4.35.bb:do_packagedata_setscene)
NOTE: recipe libnewt-0.52.23-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 381 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe libndp-1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 383 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb:do_recipe_qa_setscene)
NOTE: recipe nss-3.74-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nspr/nspr_4.35.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nss/nss_3.74.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 391 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe upower-0.99.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 392 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnewt-0.52.23-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 396 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 397 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_recipe_qa_setscene)
NOTE: recipe ffmpeg-6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lcms-2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe nspr-4.35-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 402 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe libndp-1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lcms-2.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 404 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/lcms/lcms_2.15.bb:do_recipe_qa_setscene)
NOTE: recipe nspr-4.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nss-3.74-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libndp-1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 405 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: recipe brotli-1.0.9-r0: task do_package_setscene: Succeeded
NOTE: recipe nspr-4.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 407 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb:do_recipe_qa_setscene)
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe lcms-2.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 416 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_create_spdx_setscene)
NOTE: recipe libnewt-0.52.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 417 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_populate_sysroot_setscene)
NOTE: recipe nss-3.74-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 418 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 419 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nspr-4.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 426 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nspr/nspr_4.35.bb:do_recipe_qa_setscene)
NOTE: recipe lcms-2.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe brotli-1.0.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 427 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_deb_setscene)
NOTE: recipe ffmpeg-6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 429 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 431 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 433 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_ipk_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe brotli-1.0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nspr-4.35-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 434 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_deb_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnewt-0.52.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 437 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/newt/libnewt_0.52.23.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 439 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/slang/slang_2.3.3.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 440 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/slang/slang_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe nspr-4.35-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ffmpeg-6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 443 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 447 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 453 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 454 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_packagedata_setscene)
NOTE: recipe libnewt-0.52.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 455 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/boost/boost_1.83.0.bb:do_create_spdx_setscene)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 464 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/boost/boost_1.83.0.bb:do_populate_sysroot_setscene)
NOTE: recipe slang-2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe slang-2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 467 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 470 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 471 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ffmpeg-6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnewt-0.52.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 472 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe boost-1.83.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe boost-1.83.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-glib-1.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 473 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe slang-2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 477 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ffmpeg-6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 480 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 481 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_create_spdx_setscene)
NOTE: recipe slang-2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 483 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/slang/slang_2.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 501 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 505 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libexif/libexif_0.6.24.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe consolekit-0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 512 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe boost-1.83.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 527 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/boost/boost_1.83.0.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe slang-2.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libexif-0.6.24-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe boost-1.83.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe slang-2.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 533 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libexif/libexif_0.6.24.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 535 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 537 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_create_spdx_setscene)
NOTE: recipe consolekit-0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 538 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 539 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libexif-0.6.24-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 550 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libexif/libexif_0.6.24.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libnl/libnl_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe libexif-0.6.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe consolekit-0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 562 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe libexif-0.6.24-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnl-1_3.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 564 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 565 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot_setscene)
NOTE: recipe consolekit-0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 566 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe boost-1.83.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 568 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libexif-0.6.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 569 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 570 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 573 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 574 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libnl-1_3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 576 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libexif-0.6.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 582 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 585 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 593 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-glib-0.112-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 594 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 598 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 601 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 604 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 606 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 607 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 611 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 612 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 614 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 617 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 618 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libexif/libexif_0.6.24.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 629 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 630 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 636 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 638 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 640 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 642 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libexif-0.6.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 643 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libexif-0.6.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 645 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 647 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libnl/libnl_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 651 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 653 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 655 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 665 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 666 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 667 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 672 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 675 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 676 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libnl/libnl_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 684 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre_8.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 685 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 687 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_create_spdx_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 689 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 690 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsoup-3.4.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre-8.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 700 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnl-1_3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 703 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 706 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsoup-3.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 708 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 709 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 714 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 716 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 719 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe boost-1.83.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 723 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 727 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 732 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 734 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 736 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 738 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 743 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 746 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 751 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 753 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 755 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 757 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 760 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 767 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/boost/boost_1.83.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 769 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 774 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 777 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe boost-1.83.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 779 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 783 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 786 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 787 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe boost-1.83.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 795 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 796 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 800 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 801 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 804 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libsoup-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 805 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 817 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 820 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 822 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 823 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 826 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 827 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 828 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 829 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 831 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 881 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 894 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 895 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 922 of 1319 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 923 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 925 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 926 of 1319 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 928 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 930 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 931 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 933 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa_setscene)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 935 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 936 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pygobject-native-3.46.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 937 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pygobject-native-3.46.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsoup-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 938 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 939 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 940 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 943 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pygobject-native-3.46.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 944 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 945 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 947 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 949 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 950 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 952 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 954 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 955 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 957 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pygobject-native-3.46.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 959 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 962 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 963 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 964 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 966 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 967 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 968 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 969 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 971 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 974 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 975 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 977 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 982 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 983 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 984 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 985 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 986 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 989 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 991 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 993 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 995 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 997 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 999 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1001 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1002 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1003 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1006 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1007 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1010 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1012 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1013 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1016 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1018 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1020 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1024 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1025 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.57.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1026 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1027 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1031 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1033 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1035 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1037 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1039 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1041 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nghttp2-1.57.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1046 of 1319 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1059 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nghttp2-1.57.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1134 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1137 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pygobject-native-3.46.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1152 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1153 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nghttp2-1.57.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1155 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pygobject-native-3.46.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1157 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1160 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1161 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1162 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1163 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 1164 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1166 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1167 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1168 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1169 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1170 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1171 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 1172 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1173 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1249 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb:do_fetch)
NOTE: Running setscene task 1174 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1175 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1176 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1178 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1179 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1180 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe brotli-1.0.9-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe brotli-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1181 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1183 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1187 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1188 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1190 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1192 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1195 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1201 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1203 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1206 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1207 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1209 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1211 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1496 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb:do_unpack)
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1514 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb:do_fetch)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1600 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/poppler/poppler_23.04.0.bb:do_fetch)
NOTE: Running setscene task 1215 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1217 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1219 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe brotli-1.0.9-r0: task do_unpack: Started
NOTE: recipe exiv2-0.28.0-r0: task do_fetch: Started
NOTE: Running setscene task 1221 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_recipe_qa_setscene)
NOTE: recipe exiv2-0.28.0-r0: task do_fetch: Succeeded
NOTE: Running task 1675 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb:do_fetch)
NOTE: Running task 1676 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libraw/libraw_0.20.2.bb:do_fetch)
NOTE: Running task 1680 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb:do_fetch)
NOTE: Running task 1682 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb:do_fetch)
NOTE: Running task 1687 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb:do_unpack)
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe poppler-23.04.0-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1223 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe poppler-23.04.0-r0: task do_fetch: Succeeded
NOTE: Running task 1786 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb:do_fetch)
NOTE: Running task 1803 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/poppler/poppler_23.04.0.bb:do_unpack)
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1818 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb:do_write_config)
NOTE: Running setscene task 1225 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1226 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libraw-0.20.2-r0: task do_fetch: Started
NOTE: recipe exiv2-0.28.0-r0: task do_unpack: Started
NOTE: recipe gexiv2-0.14.2-r0: task do_fetch: Started
NOTE: recipe libgsf-1.14.50-r0: task do_fetch: Started
NOTE: recipe tracker-3.6.0-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgsf-1.14.50-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1227 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1228 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1230 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe gexiv2-0.14.2-r0: task do_fetch: Succeeded
NOTE: recipe tracker-3.6.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1231 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1232 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1233 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1234 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe poppler-23.04.0-r0: task do_unpack: Started
NOTE: recipe tracker-miners-3.6.2-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gexiv2-0.14.2-r0: task do_write_config: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tracker-miners-3.6.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1235 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1236 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gexiv2-0.14.2-r0: task do_write_config: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1844 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1845 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libraw-0.20.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1239 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1241 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1242 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1851 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libraw/libraw_0.20.2.bb:do_unpack)
NOTE: recipe gexiv2-0.14.2-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe poppler-23.04.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1244 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1852 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/poppler/poppler_23.04.0.bb:do_patch)
NOTE: Running task 1853 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb:do_unpack)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1854 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb:do_unpack)
NOTE: Running setscene task 1248 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: Running task 1862 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb:do_write_config)
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgsf-1.14.50-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1250 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libraw-0.20.2-r0: task do_unpack: Started
NOTE: recipe brotli-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe poppler-23.04.0-r0: task do_patch: Started
NOTE: Running task 1923 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb:do_write_config)
NOTE: recipe tracker-3.6.0-r0: task do_unpack: Started
NOTE: recipe gexiv2-0.14.2-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1924 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb:do_patch)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tracker-3.6.0-r0: task do_write_config: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tracker-miners-3.6.2-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgsf-1.14.50-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2015 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb:do_patch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1253 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tracker-3.6.0-r0: task do_write_config: Succeeded
NOTE: recipe tracker-miners-3.6.2-r0: task do_write_config: Started
NOTE: recipe gexiv2-0.14.2-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gexiv2-0.14.2-r0: task do_patch: Succeeded
NOTE: recipe tracker-miners-3.6.2-r0: task do_write_config: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgsf-1.14.50-r0: task do_patch: Started
NOTE: recipe exiv2-0.28.0-r0: task do_unpack: Succeeded
NOTE: Running task 2085 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb:do_patch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe poppler-23.04.0-r0: task do_patch: Succeeded
NOTE: recipe libgsf-1.14.50-r0: task do_patch: Succeeded
NOTE: Running task 2091 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/poppler/poppler_23.04.0.bb:do_generate_toolchain_file)
NOTE: recipe exiv2-0.28.0-r0: task do_patch: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tracker-3.6.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1255 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1256 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1258 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running task 2094 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb:do_patch)
NOTE: recipe poppler-23.04.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe exiv2-0.28.0-r0: task do_patch: Succeeded
NOTE: Running task 2095 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb:do_generate_toolchain_file)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libraw-0.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 2097 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libraw/libraw_0.20.2.bb:do_patch)
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tracker-3.6.0-r0: task do_patch: Started
NOTE: recipe poppler-23.04.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe exiv2-0.28.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe tracker-miners-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libraw-0.20.2-r0: task do_patch: Started
NOTE: Running task 2103 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb:do_patch)
NOTE: recipe tracker-3.6.0-r0: task do_patch: Succeeded
NOTE: recipe exiv2-0.28.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libraw-0.20.2-r0: task do_patch: Succeeded
NOTE: recipe tracker-miners-3.6.2-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1260 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1261 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1262 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1264 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tracker-miners-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1269 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1271 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1273 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1274 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1276 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1278 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1279 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1281 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1282 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1284 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1286 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1287 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1288 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1289 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1290 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1292 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1300 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1301 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1303 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1306 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1308 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1309 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1311 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1319 of 1319 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3043 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3148 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libraw/libraw_0.20.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3150 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/poppler/poppler_23.04.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3153 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3155 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe exiv2-0.28.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libraw-0.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe poppler-23.04.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3400 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb:do_collect_spdx_deps)
NOTE: recipe libgsf-1.14.50-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3465 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libraw/libraw_0.20.2.bb:do_collect_spdx_deps)
NOTE: Running task 3468 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/poppler/poppler_23.04.0.bb:do_collect_spdx_deps)
NOTE: recipe tracker-3.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3472 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb:do_collect_spdx_deps)
NOTE: Running task 3474 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb:do_collect_spdx_deps)
NOTE: recipe brotli-1.0.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe libraw-0.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libraw-0.20.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3487 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libraw/libraw_0.20.2.bb:do_configure)
NOTE: recipe exiv2-0.28.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3488 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb:do_configure)
NOTE: recipe poppler-23.04.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libraw-0.20.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe brotli-1.0.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgsf-1.14.50-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3489 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb:do_create_spdx)
NOTE: recipe tracker-3.6.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libraw-0.20.2-r0: task do_configure: Started
NOTE: recipe exiv2-0.28.0-r0: task do_configure: Started
NOTE: recipe brotli-1.0.9-r0: task do_create_spdx: Started
NOTE: recipe libgsf-1.14.50-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgsf-1.14.50-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3490 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb:do_configure)
NOTE: recipe libgsf-1.14.50-r0: task do_configure: Started
NOTE: recipe tracker-3.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tracker-3.6.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3491 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb:do_configure)
NOTE: recipe brotli-1.0.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 3492 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb:do_collect_spdx_deps)
NOTE: recipe tracker-3.6.0-r0: task do_configure: Started
NOTE: recipe exiv2-0.28.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe exiv2-0.28.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe poppler-23.04.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe poppler-23.04.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3493 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/poppler/poppler_23.04.0.bb:do_configure)
NOTE: recipe poppler-23.04.0-r0: task do_configure: Started
NOTE: recipe exiv2-0.28.0-r0: task do_configure: Succeeded
NOTE: Running task 3494 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb:do_compile)
NOTE: recipe exiv2-0.28.0-r0: task do_compile: Started
NOTE: recipe tracker-3.6.0-r0: task do_configure: Succeeded
NOTE: Running task 3495 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb:do_compile)
NOTE: recipe poppler-23.04.0-r0: task do_configure: Succeeded
NOTE: Running task 3496 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/poppler/poppler_23.04.0.bb:do_compile)
NOTE: recipe tracker-3.6.0-r0: task do_compile: Started
NOTE: recipe poppler-23.04.0-r0: task do_compile: Started
NOTE: recipe libraw-0.20.2-r0: task do_configure: Succeeded
NOTE: Running task 3497 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libraw/libraw_0.20.2.bb:do_compile)
NOTE: recipe libraw-0.20.2-r0: task do_compile: Started
NOTE: recipe libgsf-1.14.50-r0: task do_configure: Succeeded
NOTE: Running task 3498 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb:do_compile)
NOTE: recipe libgsf-1.14.50-r0: task do_compile: Started
NOTE: recipe tracker-3.6.0-r0: task do_compile: Succeeded
NOTE: Running task 3499 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb:do_install)
NOTE: recipe tracker-3.6.0-r0: task do_install: Started
NOTE: recipe tracker-3.6.0-r0: task do_install: Succeeded
NOTE: Running task 3500 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb:do_package)
NOTE: Running task 3501 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb:do_populate_sysroot)
NOTE: recipe libraw-0.20.2-r0: task do_compile: Succeeded
NOTE: recipe tracker-3.6.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3502 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libraw/libraw_0.20.2.bb:do_install)
NOTE: recipe tracker-3.6.0-r0: task do_package: Started
NOTE: recipe libraw-0.20.2-r0: task do_install: Started
NOTE: recipe tracker-3.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libraw-0.20.2-r0: task do_install: Succeeded
NOTE: Running task 3503 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libraw/libraw_0.20.2.bb:do_package)
NOTE: Running task 3504 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libraw/libraw_0.20.2.bb:do_populate_sysroot)
NOTE: recipe libraw-0.20.2-r0: task do_populate_sysroot: Started
NOTE: recipe libraw-0.20.2-r0: task do_package: Started
NOTE: recipe libraw-0.20.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libraw-0.20.2-r0: task do_package: Succeeded
NOTE: Running task 3505 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libraw/libraw_0.20.2.bb:do_packagedata)
NOTE: recipe libraw-0.20.2-r0: task do_packagedata: Started
NOTE: recipe tracker-3.6.0-r0: task do_package: Succeeded
NOTE: Running task 3506 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb:do_packagedata)
NOTE: recipe tracker-3.6.0-r0: task do_packagedata: Started
NOTE: recipe libgsf-1.14.50-r0: task do_compile: Succeeded
NOTE: Running task 3507 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb:do_install)
NOTE: recipe libgsf-1.14.50-r0: task do_install: Started
NOTE: recipe tracker-3.6.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3508 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb:do_create_spdx)
NOTE: recipe tracker-3.6.0-r0: task do_create_spdx: Started
NOTE: recipe tracker-3.6.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libgsf-1.14.50-r0: task do_install: Succeeded
NOTE: Running task 3509 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb:do_package)
NOTE: Running task 3510 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb:do_populate_sysroot)
NOTE: recipe libgsf-1.14.50-r0: task do_populate_sysroot: Started
NOTE: recipe libgsf-1.14.50-r0: task do_package: Started
NOTE: recipe libgsf-1.14.50-r0: task do_populate_sysroot: Succeeded
NOTE: recipe exiv2-0.28.0-r0: task do_compile: Succeeded
NOTE: Running task 3511 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb:do_install)
NOTE: recipe exiv2-0.28.0-r0: task do_install: Started
NOTE: recipe exiv2-0.28.0-r0: task do_install: Succeeded
NOTE: Running task 3512 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb:do_populate_sysroot)
NOTE: Running task 3513 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb:do_package)
NOTE: recipe exiv2-0.28.0-r0: task do_populate_sysroot: Started
NOTE: recipe exiv2-0.28.0-r0: task do_package: Started
NOTE: recipe exiv2-0.28.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3514 of 3547 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gexiv2-0.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libraw-0.20.2-r0: task do_packagedata: Failed
NOTE: recipe gexiv2-0.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgsf-1.14.50-r0: task do_package: Succeeded
NOTE: recipe exiv2-0.28.0-r0: task do_package: Succeeded
NOTE: recipe poppler-23.04.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3514 tasks of which 3448 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104050212.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104050212.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libraw/libraw_0.20.2.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libraw-0.20.2-r0 do_packagedata: QA Issue: Package version for package libraw-src went backwards which would break package feeds (from 0:0.21.1-r0 to 0:0.20.2-r0) [version-going-backwards]
ERROR: libraw-0.20.2-r0 do_packagedata: QA Issue: Package version for package libraw-dbg went backwards which would break package feeds (from 0:0.21.1-r0 to 0:0.20.2-r0) [version-going-backwards]
ERROR: libraw-0.20.2-r0 do_packagedata: QA Issue: Package version for package libraw-staticdev went backwards which would break package feeds (from 0:0.21.1-r0 to 0:0.20.2-r0) [version-going-backwards]
ERROR: libraw-0.20.2-r0 do_packagedata: QA Issue: Package version for package libraw-dev went backwards which would break package feeds (from 0:0.21.1-r0 to 0:0.20.2-r0) [version-going-backwards]
ERROR: libraw-0.20.2-r0 do_packagedata: QA Issue: Package version for package libraw-doc went backwards which would break package feeds (from 0:0.21.1-r0 to 0:0.20.2-r0) [version-going-backwards]
ERROR: libraw-0.20.2-r0 do_packagedata: QA Issue: Package version for package libraw-locale went backwards which would break package feeds (from 0:0.21.1-r0 to 0:0.20.2-r0) [version-going-backwards]
ERROR: libraw-0.20.2-r0 do_packagedata: QA Issue: Package version for package libraw went backwards which would break package feeds (from 0:0.21.1-r0 to 0:0.20.2-r0) [version-going-backwards]
ERROR: libraw-0.20.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/libraw/0.20.2/temp/log.do_packagedata.1684222
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libraw/libraw_0.20.2.bb:do_packagedata) failed with exit code '1'

--===============7547095618105058432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-eo: PKGSIZE changed from 8664 to 14448 (+67%)
packages/core2-64-poky-linux/tracker-miners/tracker-miners-locale-ka: PKGSIZE changed from 18712 to 31159 (+67%)

--===============7547095618105058432==--


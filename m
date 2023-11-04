Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F38FC07533
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:12 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.5518.1699083060510395695
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cKxgTIdI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bg+4ms/8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b993e05c2-4011d971-af1d-441e-a4c3-b354d9d3231a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PLXQQLI0wEWr3rv0banJyJEl4hTUr8+/XLYE8P9Lhgs=;
	b=cKxgTIdIn3Snj5/++75vf0iCn9QDxV8xTCvSJuvFiwqRAzKSu9vYjMgp0RJxiRL4
	AKJt1qiyb7qApr9JNBU8H525PdzYJjAM8R1GL0tAfcaiBHatHx9DC3zDpqigdz3Qk7l
	BjWThnCn2UnI8bvK8h/f5TdWLFJd+wjhxLP+YWT0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PLXQQLI0wEWr3rv0banJyJEl4hTUr8+/XLYE8P9Lhgs=;
	b=bg+4ms/8Ou2mys+TxcbQfFzDhTmrw16AwcAE7GR4yJkJEZ1YE9Jm/U0+eqgxvIHV
	gwuvjwaZ81jFyDj4jwbRf5soVF16uOJjVu+w1Xeb90lw624XUnCjz0sr3M6Jo0KSBaq
	+AE/UyaX+MPfhRS8WsTkjmPJ74D8CDhfgodsgq+I=
Content-Type: multipart/mixed; boundary="===============8889982631584762601=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-weather-plugin: upgrading to 0.11.1 SUCCEEDED
Message-ID: <0101018b993e05c2-4011d971-af1d-441e-a4c3-b354d9d3231a-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106335

--===============8889982631584762601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-weather-plugin* to *0.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-weather-plugin-upgrade-0.11.0-0.11.1.patch
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
From 029b13ccf3f41ba5aeffa709d69d57ad6dde58d2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 07:14:05 +0000
Subject: [PATCH] xfce4-weather-plugin: upgrade 0.11.0 -> 0.11.1

---
 ...-weather-plugin_0.11.0.bb => xfce4-weather-plugin_0.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.11.0.bb => xfce4-weather-plugin_0.11.1.bb} (80%)

diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.0.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.1.bb
similarity index 80%
rename from meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.0.bb
rename to meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.1.bb
index ede98e992..858bd5459 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.0.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.1.bb
@@ -7,6 +7,6 @@ inherit xfce-panel-plugin
 
 DEPENDS += "libsoup-2.4 dbus-glib upower"
 
-SRC_URI[sha256sum] = "e3242ea951d51bc0fded1d02a4f1f662bec16a1fb10c855f71bda6541a1153fc"
+SRC_URI[sha256sum] = "a45146f9a0dcdc95d191c09c64ad279ae289cf8f811c4433e08e31a656845239"
 
 FILES:${PN} += "${datadir}/xfce4/weather"
-- 
2.39.2


--===============8889982631584762601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-weather-plugin: SRC_URI changed from "http://archive.xfce.org/src/panel-plugins/xfce4-weather-plugin/0.11/xfce4-weather-plugin-0.11.0.tar.bz2" to "http://archive.xfce.org/src/panel-plugins/xfce4-weather-plugin/0.11/xfce4-weather-plugin-0.11.1.tar.bz2"
packages/core2-64-poky-linux/xfce4-weather-plugin: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin: PV changed from "0.11.0" to "0.11.1"
Changes to packages/core2-64-poky-linux/xfce4-weather-plugin (sysroot):
  /usr/share/icons/hicolor/128x128 was added
  /usr/share/icons/hicolor/128x128/apps was added
  /usr/share/icons/hicolor/128x128/apps/org.xfce.panel.weather.png was added
  /usr/share/icons/hicolor/16x16 was added
  /usr/share/icons/hicolor/16x16/apps was added
  /usr/share/icons/hicolor/16x16/apps/org.xfce.panel.weather.png was added
  /usr/share/icons/hicolor/32x32 was added
  /usr/share/icons/hicolor/32x32/apps was added
  /usr/share/icons/hicolor/32x32/apps/org.xfce.panel.weather.png was added
  /usr/share/icons/hicolor/48x48/apps/org.xfce.panel.weather.png was added
  /usr/share/icons/hicolor/scalable was added
  /usr/share/icons/hicolor/scalable/apps was added
  /usr/share/icons/hicolor/scalable/apps/org.xfce.panel.weather.svg was added
  /usr/share/icons/hicolor/48x48/apps/xfce4-weather.png was removed
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-dbg: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-dbg: PKGSIZE changed from 496752 to 502168 (+1%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-dbg: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-dev: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-dev: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-doc: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-doc: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ar: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ar: PKGSIZE changed from 62075 to 61620 (-1%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ar: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ast: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ast: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-be: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-be: PKGSIZE changed from 70344 to 69736 (-1%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-be: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-bg: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-bg: PKGSIZE changed from 75969 to 75560 (-1%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-bg: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ca: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ca: PKGSIZE changed from 45226 to 44766 (-1%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ca: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-cs: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-cs: PKGSIZE changed from 56164 to 56014 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-cs: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-da: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-da: PKGSIZE changed from 54695 to 54535 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-da: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-de: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-de: PKGSIZE changed from 58235 to 58073 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-de: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-el: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-el: PKGSIZE changed from 76653 to 76381 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-el: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-en-au: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-en-au: PKGSIZE changed from 52992 to 52528 (-1%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-en-au: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-en-gb: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-en-gb: PKGSIZE changed from 51312 to 54306 (+6%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-en-gb: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-es: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-es: PKGSIZE changed from 57504 to 57015 (-1%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-es: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-et: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-et: PKGSIZE changed from 21402 to 22231 (+4%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-et: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-eu: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-eu: PKGSIZE changed from 15790 to 41648 (+164%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-eu: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-fi: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-fi: PKGSIZE changed from 53597 to 53135 (-1%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-fi: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-fr: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-fr: PKGSIZE changed from 60011 to 59931 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-fr: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-gl: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-gl: PKGSIZE changed from 56745 to 56618 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-gl: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-he: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-he: PKGSIZE changed from 64450 to 64267 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-he: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-hr: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-hr: PKGSIZE changed from 52925 to 52454 (-1%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-hr: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-hu: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-hu: PKGSIZE changed from 44396 to 43923 (-1%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-hu: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-hye: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-hye: PKGSIZE changed from 25143 to 24594 (-2%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-hye: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-id: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-id: PKGSIZE changed from 55275 to 55104 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-id: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-is: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-is: PKGSIZE changed from 23434 to 22935 (-2%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-is: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-it: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-it: PKGSIZE changed from 57350 to 57273 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-it: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ja: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ja: PKGSIZE changed from 52228 to 52066 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ja: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ko: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ko: PKGSIZE changed from 57003 to 56838 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ko: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-lt: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-lt: PKGSIZE changed from 57971 to 57823 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-lt: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-lv: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-lv: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ms: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ms: PKGSIZE changed from 53310 to 54694 (+3%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ms: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-nb: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-nb: PKGSIZE changed from 54589 to 54428 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-nb: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-nl: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-nl: PKGSIZE changed from 46021 to 45877 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-nl: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-nn: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-nn: PKGSIZE changed from 22685 to 22306 (-2%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-nn: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-oc: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-oc: PKGSIZE changed from 56238 to 57396 (+2%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-oc: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-pa: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-pa: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-pl: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-pl: PKGSIZE changed from 58052 to 57883 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-pl: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-pt-br: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-pt-br: PKGSIZE changed from 57407 to 57292 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-pt-br: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-pt: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-pt: PKGSIZE changed from 56038 to 55935 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-pt: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ru: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ru: PKGSIZE changed from 71567 to 71335 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ru: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-sk: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-sk: PKGSIZE changed from 18761 to 22359 (+19%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-sk: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-sl: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-sl: PKGSIZE changed from 52071 to 51900 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-sl: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-sq: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-sq: PKGSIZE changed from 57368 to 57230 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-sq: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-sr: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-sr: PKGSIZE changed from 71858 to 71647 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-sr: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-sv: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-sv: PKGSIZE changed from 54923 to 54763 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-sv: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-te: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-te: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-th: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-th: PKGSIZE changed from 84557 to 86599 (+2%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-th: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-tr: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-tr: PKGSIZE changed from 55392 to 55206 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-tr: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ug: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ug: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-uk: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-uk: PKGSIZE changed from 76283 to 77772 (+2%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-uk: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ur-pk: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ur-pk: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ur: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-ur: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-zh-cn: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-zh-cn: PKGSIZE changed from 51186 to 51010 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-zh-cn: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-zh-tw: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-zh-tw: PKGSIZE changed from 51478 to 51289 (-0%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-zh-tw: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-src: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-src: PKGSIZE changed from 413671 to 417962 (+1%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-src: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-staticdev: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-staticdev: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin: PKGSIZE changed from 2246632 to 2264390 (+1%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin: PV changed from "0.11.0" to "0.11.1"
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin: FILELIST: removed "/usr/share/icons/hicolor/48x48/apps/xfce4-weather.png", added "/usr/share/icons/hicolor/16x16/apps/org.xfce.panel.weather.png /usr/share/icons/hicolor/32x32/apps/org.xfce.panel.weather.png /usr/share/icons/hicolor/48x48/apps/org.xfce.panel.weather.png /usr/share/icons/hicolor/128x128/apps/org.xfce.panel.weather.png /usr/share/icons/hicolor/scalable/apps/org.xfce.panel.weather.svg"

--===============8889982631584762601==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-weather-plugin-upgrade-0.11.0-0.11.1.patch"

RnJvbSAwMjliMTNjY2YzZjQxYmE1YWVmZmE3MDlkNjlkNTdhZDZkZGU1OGQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNzoxNDowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LXdlYXRoZXItcGx1Z2luOiB1cGdyYWRlIDAuMTEuMCAtPiAwLjExLjEKCi0tLQogLi4uLXdl
YXRoZXItcGx1Z2luXzAuMTEuMC5iYiA9PiB4ZmNlNC13ZWF0aGVyLXBsdWdpbl8wLjExLjEuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy93ZWF0aGVyL3t4ZmNlNC13ZWF0
aGVyLXBsdWdpbl8wLjExLjAuYmIgPT4geGZjZTQtd2VhdGhlci1wbHVnaW5fMC4xMS4xLmJifSAo
ODAlKQoKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvd2VhdGhl
ci94ZmNlNC13ZWF0aGVyLXBsdWdpbl8wLjExLjAuYmIgYi9tZXRhLXhmY2UvcmVjaXBlcy1wYW5l
bC1wbHVnaW5zL3dlYXRoZXIveGZjZTQtd2VhdGhlci1wbHVnaW5fMC4xMS4xLmJiCnNpbWlsYXJp
dHkgaW5kZXggODAlCnJlbmFtZSBmcm9tIG1ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMv
d2VhdGhlci94ZmNlNC13ZWF0aGVyLXBsdWdpbl8wLjExLjAuYmIKcmVuYW1lIHRvIG1ldGEteGZj
ZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvd2VhdGhlci94ZmNlNC13ZWF0aGVyLXBsdWdpbl8wLjEx
LjEuYmIKaW5kZXggZWRlOThlOTkyLi44NThiZDU0NTkgMTAwNjQ0Ci0tLSBhL21ldGEteGZjZS9y
ZWNpcGVzLXBhbmVsLXBsdWdpbnMvd2VhdGhlci94ZmNlNC13ZWF0aGVyLXBsdWdpbl8wLjExLjAu
YmIKKysrIGIvbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy93ZWF0aGVyL3hmY2U0LXdl
YXRoZXItcGx1Z2luXzAuMTEuMS5iYgpAQCAtNyw2ICs3LDYgQEAgaW5oZXJpdCB4ZmNlLXBhbmVs
LXBsdWdpbgogCiBERVBFTkRTICs9ICJsaWJzb3VwLTIuNCBkYnVzLWdsaWIgdXBvd2VyIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZTMyNDJlYTk1MWQ1MWJjMGZkZWQxZDAyYTRmMWY2NjJiZWMx
NmExZmIxMGM4NTVmNzFiZGE2NTQxYTExNTNmYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhNDUx
NDZmOWEwZGNkYzk1ZDE5MWMwOWM2NGFkMjc5YWUyODljZjhmODExYzQ0MzNlMDhlMzFhNjU2ODQ1
MjM5IgogCiBGSUxFUzoke1BOfSArPSAiJHtkYXRhZGlyfS94ZmNlNC93ZWF0aGVyIgotLSAKMi4z
OS4yCgo=

--===============8889982631584762601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/xfce4-weather-plugin (sysroot):
  /usr/share/icons/hicolor/128x128 was added
  /usr/share/icons/hicolor/128x128/apps was added
  /usr/share/icons/hicolor/128x128/apps/org.xfce.panel.weather.png was added
  /usr/share/icons/hicolor/16x16 was added
  /usr/share/icons/hicolor/16x16/apps was added
  /usr/share/icons/hicolor/16x16/apps/org.xfce.panel.weather.png was added
  /usr/share/icons/hicolor/32x32 was added
  /usr/share/icons/hicolor/32x32/apps was added
  /usr/share/icons/hicolor/32x32/apps/org.xfce.panel.weather.png was added
  /usr/share/icons/hicolor/48x48/apps/org.xfce.panel.weather.png was added
  /usr/share/icons/hicolor/scalable was added
  /usr/share/icons/hicolor/scalable/apps was added
  /usr/share/icons/hicolor/scalable/apps/org.xfce.panel.weather.svg was added
  /usr/share/icons/hicolor/48x48/apps/xfce4-weather.png was removed
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-eu: PKGSIZE changed from 15790 to 41648 (+164%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin-locale-sk: PKGSIZE changed from 18761 to 22359 (+19%)
packages/core2-64-poky-linux/xfce4-weather-plugin/xfce4-weather-plugin: FILELIST: removed "/usr/share/icons/hicolor/48x48/apps/xfce4-weather.png", added "/usr/share/icons/hicolor/16x16/apps/org.xfce.panel.weather.png /usr/share/icons/hicolor/scalable/apps/org.xfce.panel.weather.svg /usr/share/icons/hicolor/32x32/apps/org.xfce.panel.weather.png /usr/share/icons/hicolor/128x128/apps/org.xfce.panel.weather.png /usr/share/icons/hicolor/48x48/apps/org.xfce.panel.weather.png"

--===============8889982631584762601==--


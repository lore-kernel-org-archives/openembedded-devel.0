Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C575C0032E
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:57 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.4057.1699071647773540111
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GIhPEOrg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PzwJJ1Hj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b988fdd59-e41d0058-34fb-4e03-9126-e4a195efdab9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1L679yf8/AVroxQTjQkPrWaxfXiWQJ4HsdRz9M+OE4A=;
	b=GIhPEOrgHJoJHWc6wXTFhykyFfkMp+PeZOsQ84Jn2ISSlDmo3jDhp0ke0pjSNbq6
	t3OzZxBaK8+E6V8T9piccsBcsumzcvSVjcQSySI+FuKahaDYRFeF5SXjZYcyykG0us+
	OfNVJgZoDRNPkXv2GmU8QSPaSZCMwsm/YTWlz69c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1L679yf8/AVroxQTjQkPrWaxfXiWQJ4HsdRz9M+OE4A=;
	b=PzwJJ1HjXjYXAYJbUL02bG7xxWmYwqssrDHU5AZhWLpjR6HUMD9aScGwwN0Vnav2
	lme6R5REfSNJ84VE0fJqw9d1E/hc8+HnCg9k8rYxGpEF0jESlsXSz+C4HillrauhaJm
	4LHZk2pi7PzgwZYBQkB9rwHKa8LGTvzjGV2dWunw=
Content-Type: multipart/mixed; boundary="===============6657647255674188297=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] ncmpc: upgrading to 0.49 SUCCEEDED
Message-ID: <0101018b988fdd59-e41d0058-34fb-4e03-9126-e4a195efdab9-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106261

--===============6657647255674188297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ncmpc* to *0.49* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ncmpc-upgrade-0.47-0.49.patch
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
From c6155625531253d0d938804c9844d9d3f83dffc1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 03:59:13 +0000
Subject: [PATCH] ncmpc: upgrade 0.47 -> 0.49

---
 ...egular-integer-to-fix-Wenum-constexp.patch | 37 -------------------
 .../musicpd/{ncmpc_0.47.bb => ncmpc_0.49.bb}  |  7 +---
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/musicpd/ncmpc/0001-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch
 rename meta-multimedia/recipes-multimedia/musicpd/{ncmpc_0.47.bb => ncmpc_0.49.bb} (87%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc/0001-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch b/meta-multimedia/recipes-multimedia/musicpd/ncmpc/0001-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch
deleted file mode 100644
index 92094af1f..000000000
--- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc/0001-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 2e8dc2c28c0938dbbb85ebbac2b9a60be9ccd9f3 Mon Sep 17 00:00:00 2001
-From: Max Kellermann <max@musicpd.org>
-Date: Wed, 23 Nov 2022 12:25:50 +0100
-Subject: [PATCH] SearchPage: use regular integer to fix -Wenum-constexpr-conversion
-
-Upstream-Status: Backport [https://github.com/MusicPlayerDaemon/ncmpc/commit/ddd1757907f0376b5843f707bf182b7827ff6591]
----
- src/SearchPage.cxx | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/SearchPage.cxx b/src/SearchPage.cxx
-index 2fa5edbc..3f91c4fe 100644
---- a/src/SearchPage.cxx
-+++ b/src/SearchPage.cxx
-@@ -81,7 +81,7 @@ search_get_tag_id(const char *name)
- }
- 
- struct SearchMode {
--	enum mpd_tag_type table;
-+	int table;
- 	const char *label;
- };
- 
-@@ -89,8 +89,8 @@ static constexpr SearchMode mode[] = {
- 	{ MPD_TAG_TITLE, N_("Title") },
- 	{ MPD_TAG_ARTIST, N_("Artist") },
- 	{ MPD_TAG_ALBUM, N_("Album") },
--	{ (enum mpd_tag_type)SEARCH_URI, N_("Filename") },
--	{ (enum mpd_tag_type)SEARCH_ARTIST_TITLE, N_("Artist + Title") },
-+	{ SEARCH_URI, N_("Filename") },
-+	{ SEARCH_ARTIST_TITLE, N_("Artist + Title") },
- 	{ MPD_TAG_COUNT, nullptr }
- };
- 
--- 
-2.39.0
-
diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.47.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.49.bb
similarity index 87%
rename from meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.47.bb
rename to meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.49.bb
index 44046912e..d93c054f4 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.47.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.49.bb
@@ -32,9 +32,6 @@ PACKAGECONFIG[lyrics_screen] = "-Dlyrics_screen=true,-Dlyrics_screen=false"
 PACKAGECONFIG[outputs_screen] = "-Doutputs_screen=true,-Doutputs_screen=false"
 PACKAGECONFIG[chat_screen] = "-Dchat_screen=true,-Dchat_screen=false"
 
-SRC_URI = " \
-    git://github.com/MusicPlayerDaemon/ncmpc;branch=master;protocol=https \
-    file://0001-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch \
-"
-SRCREV = "fc8de01c71acdf10ad07c7aae756dc522b848124"
+SRC_URI = "git://github.com/MusicPlayerDaemon/ncmpc;branch=master;protocol=https"
+SRCREV = "f81f875fc5785383d24f54fb9bd3cf06efd915a4"
 S = "${WORKDIR}/git"
-- 
2.39.2


--===============6657647255674188297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ncmpc: SRC_URI changed from "git://github.com/MusicPlayerDaemon/ncmpc;branch=master;protocol=https file://0001-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch" to "git://github.com/MusicPlayerDaemon/ncmpc;branch=master;protocol=https"
packages/core2-64-poky-linux/ncmpc: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-dbg: PKGSIZE changed from 7471176 to 7552984 (+1%)
packages/core2-64-poky-linux/ncmpc/ncmpc-dbg: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-dbg: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-dev: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-dev: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-doc: PKGSIZE changed from 44624 to 44916 (+1%)
packages/core2-64-poky-linux/ncmpc/ncmpc-doc: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-doc: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-cs: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-cs: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-da: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-da: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-de: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-de: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-en: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-en: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-eo: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-eo: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-es: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-es: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-fa: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-fa: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-fi: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-fi: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-fr: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-fr: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-gl: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-gl: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-he: PKGSIZE changed from 17185 to 17344 (+1%)
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-he: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-he: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-hu: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-hu: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-ie: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-ie: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-it: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-it: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-ja: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-ja: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-ko: PKGSIZE changed from 16076 to 16118 (+0%)
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-ko: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-ko: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-lt: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-lt: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-nb: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-nb: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-nl: PKGSIZE changed from 3077 to 7443 (+142%)
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-nl: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-nl: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-pl: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-pl: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-pt-br: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-pt-br: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-pt: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-pt: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-ru: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-ru: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-sk: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-sk: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-sv: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-sv: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-uk: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-uk: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-zh-cn: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-locale-zh-cn: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-src: PKGSIZE changed from 792489 to 603277 (-24%)
packages/core2-64-poky-linux/ncmpc/ncmpc-src: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-src: FILELIST: directory renamed /usr/src/debug/ncmpc/0.47-r0/src/net -> /usr/src/debug/ncmpc/0.49-r0/src/net, directory renamed /usr/src/debug/ncmpc/0.47-r0/src/event -> /usr/src/debug/ncmpc/0.49-r0/src/event, directory renamed /usr/src/debug/ncmpc/0.47-r0/src/io -> /usr/src/debug/ncmpc/0.49-r0/src/io, directory renamed /usr/src/debug/ncmpc/0.47-r0/src/system -> /usr/src/debug/ncmpc/0.49-r0/src/system, directory renamed /usr/src/debug/ncmpc/0.47-r0/src/event/net -> /usr/src/debug/ncmpc/0.49-r0/src/event/net, directory renamed /usr/src/debug/ncmpc/0.47-r0/src/time -> /usr/src/debug/ncmpc/0.49-r0/src/time, removed "/usr/src/debug/ncmpc/0.47-r0/src/WaitUserInput.hxx /usr/src/debug/ncmpc/0.47-r0/src/QueuePage.cxx /usr/src/debug/ncmpc/0.47-r0/src/xterm_title.hxx /usr/src/debug/ncmpc/0.47-r0/src/FileBrowserPage.hxx /usr/src/debug/ncmpc/0.47-r0/src/PageMeta.hxx /usr/src/debug/ncmpc/0.47-r0/src/Command.cxx /usr/src/debug/ncmpc/0.47-r0/src/KeyName.cxx
  /usr/src/debug/ncmpc/0.47-r0/src/Options.cxx /usr/src/debug/ncmpc/0.47-r0/src/charset.cxx /usr/src/debug/ncmpc/0.47-r0/src/signals.cxx /usr/src/debug/ncmpc/0.47-r0/src/wreadln.cxx /usr/src/debug/ncmpc/0.47-r0/src/screen_status.hxx /usr/src/debug/ncmpc/0.47-r0/src/screen_status.cxx /usr/src/debug/ncmpc/0.47-r0/src/util/PrintException.hxx /usr/src/debug/ncmpc/0.47-r0/src/TagFilter.hxx /usr/src/debug/ncmpc/0.47-r0/src/player_command.hxx /usr/src/debug/ncmpc/0.47-r0/src/util/StringCompare.cxx /usr/src/debug/ncmpc/0.47-r0/src/Bindings.hxx /usr/src/debug/ncmpc/0.47-r0/src/LyricsPage.cxx /usr/src/debug/ncmpc/0.47-r0/src/util/LocaleString.cxx /usr/src/debug/ncmpc/0.47-r0/src/BasicMarquee.cxx /usr/src/debug/ncmpc/0.47-r0/src/BasicMarquee.hxx /usr/src/debug/ncmpc/0.47-r0/src/ProxyPage.hxx /usr/src/debug/ncmpc/0.47-r0/src/ConfigFile.hxx /usr/src/debug/ncmpc/0.47-r0/src/LyricsCache.hxx /usr/src/debug/ncmpc/0.47-r0/src/DelayedSeek.hxx /usr/src/debug/ncmpc/0.47-r0/src/ListWindow.cxx /usr/src/deb
 ug/ncmpc/0.47-r0/src/HelpPage.cxx /usr/src/debug/ncmpc/0.47-r0/src/TextListRenderer.hxx /usr/src/debug/ncmpc/0.47-r0/src/TextPage.cxx /usr/src/debug/ncmpc/0.47-r0/src/ListCursor.hxx /usr/src/debug/ncmpc/0.47-r0/src/LyricsPage.hxx /usr/src/debug/ncmpc/0.47-r0/src/HelpPage.hxx /usr/src/debug/ncmpc/0.47-r0/src/ListPage.hxx /usr/src/debug/ncmpc/0.47-r0/src/TextPage.hxx /usr/src/debug/ncmpc/0.47-r0/src/util/UriUtil.cxx /usr/src/debug/ncmpc/0.47-r0/src/util/UriUtil.hxx /usr/src/debug/ncmpc/0.47-r0/src/ProgressBar.hxx /usr/src/debug/ncmpc/0.47-r0/src/screen_client.cxx /usr/src/debug/ncmpc/0.47-r0/src/screen_client.hxx /usr/src/debug/ncmpc/0.47-r0/src/Styles.cxx /usr/src/debug/ncmpc/0.47-r0/src/Main.cxx /usr/src/debug/ncmpc/0.47-r0/src/Size.hxx /usr/src/debug/ncmpc/0.47-r0/src/screen.cxx /usr/src/debug/ncmpc/0.47-r0/src/screen_utils.cxx /usr/src/debug/ncmpc/0.47-r0/src/screen_utils.hxx /usr/src/debug/ncmpc/0.47-r0/src/xterm_title.cxx /usr/src/debug/ncmpc/0.47-r0/src/util/Exception.cxx /usr/
 src/debug/ncmpc/0.47-r0/src/mpdclient.hxx /usr/src/debug/ncmpc/0.47-r0/src/util/CharUtil.hxx /usr/src/debug/ncmpc/0.47-r0/src/LyricsCache.cxx /usr/src/debug/ncmpc/0.47-r0/src/screen_list.cxx /usr/src/debug/ncmpc/0.47-r0/src/Match.cxx /usr/src/debug/ncmpc/0.47-r0/src/Match.hxx /usr/src/debug/ncmpc/0.47-r0/src/Queue.cxx /usr/src/debug/ncmpc/0.47-r0/src/Queue.hxx /usr/src/debug/ncmpc/0.47-r0/src/gidle.cxx /usr/src/debug/ncmpc/0.47-r0/src/gidle.hxx /usr/src/debug/ncmpc/0.47-r0/src/TagFilter.cxx /usr/src/debug/ncmpc/0.47-r0/src/ConfigParser.hxx /usr/src/debug/ncmpc/0.47-r0/src/ConfigParser.cxx /usr/src/debug/ncmpc/0.47-r0/src/aconnect.hxx /usr/src/debug/ncmpc/0.47-r0/src/screen_find.hxx /usr/src/debug/ncmpc/0.47-r0/src/util/FNVHash.hxx /usr/src/debug/ncmpc/0.47-r0/src/AsyncUserInput.hxx /usr/src/debug/ncmpc/0.47-r0/src/mpdclient.cxx /usr/src/debug/ncmpc/0.47-r0/src/FileBrowserPage.cxx /usr/src/debug/ncmpc/0.47-r0/src/wreadln.hxx /usr/src/debug/ncmpc/0.47-r0/src/Command.hxx /usr/src/debug
 /ncmpc/0.47-r0/src/KeyName.hxx /usr/src/debug/ncmpc/0.47-r0/src/ListCursor.cxx /usr/src/debug/ncmpc/0.47-r0/src/Options.hxx /usr/src/debug/ncmpc/0.47-r0/src/util/ScopeExit.hxx /usr/src/debug/ncmpc/0.47-r0/src/charset.hxx /usr/src/debug/ncmpc/0.47-r0/src/ncu.cxx /usr/src/debug/ncmpc/0.47-r0/src/FileListPage.cxx /usr/src/debug/ncmpc/0.47-r0/src/FileListPage.hxx /usr/src/debug/ncmpc/0.47-r0/src/LibraryPage.hxx /usr/src/debug/ncmpc/0.47-r0/src/TagListPage.hxx /usr/src/debug/ncmpc/0.47-r0/src/db_completion.cxx /usr/src/debug/ncmpc/0.47-r0/src/db_completion.hxx /usr/src/debug/ncmpc/0.47-r0/src/Completion.hxx /usr/src/debug/ncmpc/0.47-r0/src/util/LocaleString.hxx /usr/src/debug/ncmpc/0.47-r0/src/util/PrintException.cxx /usr/src/debug/ncmpc/0.47-r0/src/callbacks.cxx /usr/src/debug/ncmpc/0.47-r0/src/util/OffsetPointer.hxx /usr/src/debug/ncmpc/0.47-r0/src/util/OptionalCounter.hxx /usr/src/debug/ncmpc/0.47-r0/src/strfsong.hxx /usr/src/debug/ncmpc/0.47-r0/src/Styles.hxx /usr/src/debug/ncmpc/0.4
 7-r0/src/Window.hxx /usr/src/debug/ncmpc/0.47-r0/src/screen.hxx /usr/src/debug/ncmpc/0.47-r0/src/screen_find.cxx /usr/src/debug/ncmpc/0.47-r0/src/filelist.cxx /usr/src/debug/ncmpc/0.47-r0/src/LibraryPage.cxx /usr/src/debug/ncmpc/0.47-r0/src/TagListPage.cxx /usr/src/debug/ncmpc/0.47-r0/src/ConfigFile.cxx /usr/src/debug/ncmpc/0.47-r0/src/ProxyPage.cxx /usr/src/debug/ncmpc/0.47-r0/src/util/IntrusiveList.hxx /usr/src/debug/ncmpc/0.47-r0/src/hscroll.cxx /usr/src/debug/ncmpc/0.47-r0/src/time_format.hxx /usr/src/debug/ncmpc/0.47-r0/src/CustomColors.cxx /usr/src/debug/ncmpc/0.47-r0/src/CustomColors.hxx /usr/src/debug/ncmpc/0.47-r0/src/LyricsLoader.cxx /usr/src/debug/ncmpc/0.47-r0/src/LyricsLoader.hxx /usr/src/debug/ncmpc/0.47-r0/src/ListWindow.hxx /usr/src/debug/ncmpc/0.47-r0/src/ncu.hxx /usr/src/debug/ncmpc/0.47-r0/src/util/Exception.hxx /usr/src/debug/ncmpc/0.47-r0/src/StatusBar.hxx /usr/src/debug/ncmpc/0.47-r0/src/KeyDefPage.cxx /usr/src/debug/ncmpc/0.47-r0/src/SearchPage.cxx /usr/src/de
 bug/ncmpc/0.47-r0/src/callbacks.hxx /usr/src/debug/ncmpc/0.47-r0/src/QueuePage.hxx /usr/src/debug/ncmpc/0.47-r0/src/Instance.cxx /usr/src/debug/ncmpc/0.47-r0/src/SongPage.cxx /usr/src/debug/ncmpc/0.47-r0/src/TitleBar.cxx /usr/src/debug/ncmpc/0.47-r0/src/XdgBaseDirectory.hxx /usr/src/debug/ncmpc/0.47-r0/src/KeyDefPage.hxx /usr/src/debug/ncmpc/0.47-r0/src/SearchPage.hxx /usr/src/debug/ncmpc/0.47-r0/src/Instance.hxx /usr/src/debug/ncmpc/0.47-r0/src/SongPage.hxx /usr/src/debug/ncmpc/0.47-r0/src/util/StringUTF8.cxx /usr/src/debug/ncmpc/0.47-r0/src/GlobalBindings.hxx /usr/src/debug/ncmpc/0.47-r0/src/strfsong.cxx /usr/src/debug/ncmpc/0.47-r0/src/TabBar.cxx /usr/src/debug/ncmpc/0.47-r0/src/Page.hxx /usr/src/debug/ncmpc/0.47-r0/src/plugin.cxx /usr/src/debug/ncmpc/0.47-r0/src/time_format.cxx /usr/src/debug/ncmpc/0.47-r0/src/player_command.cxx /usr/src/debug/ncmpc/0.47-r0/src/util/StringCompare.hxx /usr/src/debug/ncmpc/0.47-r0/src/Completion.cxx /usr/src/debug/ncmpc/0.47-r0/src/util/RuntimeErr
 or.hxx /usr/src/debug/ncmpc/0.47-r0/src/BasicColors.hxx /usr/src/debug/ncmpc/0.47-r0/src/save_playlist.cxx /usr/src/debug/ncmpc/0.47-r0/src/save_playlist.hxx /usr/src/debug/ncmpc/0.47-r0/src/XdgBaseDirectory.cxx /usr/src/debug/ncmpc/0.47-r0/src/Point.hxx /usr/src/debug/ncmpc/0.47-r0/src/ncmpc.hxx /usr/src/debug/ncmpc/0.47-r0/src/paint.hxx /usr/src/debug/ncmpc/0.47-r0/src/screen_paint.cxx /usr/src/debug/ncmpc/0.47-r0/src/aconnect.cxx /usr/src/debug/ncmpc/0.47-r0/src/ListText.hxx /usr/src/debug/ncmpc/0.47-r0/src/filelist.hxx /usr/src/debug/ncmpc/0.47-r0/src/Deleter.hxx /usr/src/debug/ncmpc/0.47-r0/src/History.hxx /usr/src/debug/ncmpc/0.47-r0/src/TagMask.hxx /usr/src/debug/ncmpc/0.47-r0/src/hscroll.hxx /usr/src/debug/ncmpc/0.47-r0/src/TextListRenderer.cxx /usr/src/debug/ncmpc/0.47-r0/src/util/ByteOrder.hxx /usr/src/debug/ncmpc/0.47-r0/src/util/StringUTF8.hxx /usr/src/debug/ncmpc/0.47-r0/src/util/Cancellable.hxx /usr/src/debug/ncmpc/0.47-r0/src/TitleBar.hxx /usr/src/debug/ncmpc/0.47-r0/
 src/util/Cast.hxx /usr/src/debug/ncmpc/0.47-r0/src/OutputsPage.hxx /usr/src/debug/ncmpc/0.47-r0/src/util/StringAPI.hxx /usr/src/debug/ncmpc/0.47-r0/src/util/StringStrip.hxx /usr/src/debug/ncmpc/0.47-r0/src/Bindings.cxx /usr/src/debug/ncmpc/0.47-r0/src/ListRenderer.hxx /usr/src/debug/ncmpc/0.47-r0/src/ProgressBar.cxx /usr/src/debug/ncmpc/0.47-r0/src/StatusBar.cxx /usr/src/debug/ncmpc/0.47-r0/src/screen_init.cxx /usr/src/debug/ncmpc/0.47-r0/src/screen_list.hxx /usr/src/debug/ncmpc/0.47-r0/src/AsyncUserInput.cxx /usr/src/debug/ncmpc/0.47-r0/src/util/Manual.hxx /usr/src/debug/ncmpc/0.47-r0/src/TabBar.hxx /usr/src/debug/ncmpc/0.47-r0/src/plugin.hxx /usr/src/debug/ncmpc/0.47-r0/src/util/StringStrip.cxx /usr/src/debug/ncmpc/0.47-r0/src/DelayedSeek.cxx /usr/src/debug/ncmpc/0.47-r0/src/SongRowPaint.cxx /usr/src/debug/ncmpc/0.47-r0/src/SongRowPaint.hxx /usr/src/debug/ncmpc/0.47-r0/src/BasicColors.cxx /usr/src/debug/ncmpc/0.47-r0/src/GlobalBindings.cxx /usr/src/debug/ncmpc/0.47-r0/src/util/Bin
 dMethod.hxx /usr/src/debug/ncmpc/0.47-r0/src/OutputsPage.cxx", added "/usr/src/debug/ncmpc/0.49-r0/src/LyricsPage.hxx /usr/src/debug/ncmpc/0.49-r0/src/TableLayout.cxx /usr/src/debug/ncmpc/0.49-r0/src/util/StringStrip.cxx /usr/src/debug/ncmpc/0.49-r0/src/XdgBaseDirectory.hxx /usr/src/debug/ncmpc/0.49-r0/src/BasicMarquee.cxx /usr/src/debug/ncmpc/0.49-r0/src/BasicMarquee.hxx /usr/src/debug/ncmpc/0.49-r0/src/SongRowPaint.cxx /usr/src/debug/ncmpc/0.49-r0/src/SongRowPaint.hxx /usr/src/debug/ncmpc/0.49-r0/src/TabBar.cxx /usr/src/debug/ncmpc/0.49-r0/src/plugin.cxx /usr/src/debug/ncmpc/0.49-r0/src/BasicColors.hxx /usr/src/debug/ncmpc/0.49-r0/src/db_completion.cxx /usr/src/debug/ncmpc/0.49-r0/src/db_completion.hxx /usr/src/debug/ncmpc/0.49-r0/src/KeyDefPage.cxx /usr/src/debug/ncmpc/0.49-r0/src/SearchPage.cxx /usr/src/debug/ncmpc/0.49-r0/src/util/RuntimeError.hxx /usr/src/debug/ncmpc/0.49-r0/src/screen_find.cxx /usr/src/debug/ncmpc/0.49-r0/src/callbacks.hxx /usr/src/debug/ncmpc/0.49-r0/src/Sty
 les.hxx /usr/src/debug/ncmpc/0.49-r0/src/Window.hxx /usr/src/debug/ncmpc/0.49-r0/src/screen.hxx /usr/src/debug/ncmpc/0.49-r0/src/util/OptionalCounter.hxx /usr/src/debug/ncmpc/0.49-r0/src/util/StringCompare.hxx /usr/src/debug/ncmpc/0.49-r0/src/HelpPage.hxx /usr/src/debug/ncmpc/0.49-r0/src/ListPage.hxx /usr/src/debug/ncmpc/0.49-r0/src/TextPage.hxx /usr/src/debug/ncmpc/0.49-r0/src/TextListRenderer.hxx /usr/src/debug/ncmpc/0.49-r0/src/Bindings.hxx /usr/src/debug/ncmpc/0.49-r0/src/PageMeta.hxx /usr/src/debug/ncmpc/0.49-r0/src/ListCursor.hxx /usr/src/debug/ncmpc/0.49-r0/src/TableStructure.hxx /usr/src/debug/ncmpc/0.49-r0/src/TagFilter.cxx /usr/src/debug/ncmpc/0.49-r0/src/TablePaint.hxx /usr/src/debug/ncmpc/0.49-r0/src/TableGlue.hxx /usr/src/debug/ncmpc/0.49-r0/src/util/IntrusiveList.hxx /usr/src/debug/ncmpc/0.49-r0/src/util/PrintException.cxx /usr/src/debug/ncmpc/0.49-r0/src/util/Cancellable.hxx /usr/src/debug/ncmpc/0.49-r0/src/util/Cast.hxx /usr/src/debug/ncmpc/0.49-r0/src/util/LocaleStr
 ing.hxx /usr/src/debug/ncmpc/0.49-r0/src/ListCursor.cxx /usr/src/debug/ncmpc/0.49-r0/src/Point.hxx /usr/src/debug/ncmpc/0.49-r0/src/ncmpc.hxx /usr/src/debug/ncmpc/0.49-r0/src/paint.hxx /usr/src/debug/ncmpc/0.49-r0/src/Completion.cxx /usr/src/debug/ncmpc/0.49-r0/src/LibraryPage.cxx /usr/src/debug/ncmpc/0.49-r0/src/TagListPage.cxx /usr/src/debug/ncmpc/0.49-r0/src/ListText.hxx /usr/src/debug/ncmpc/0.49-r0/src/filelist.hxx /usr/src/debug/ncmpc/0.49-r0/src/util/FNVHash.hxx /usr/src/debug/ncmpc/0.49-r0/src/StatusBar.hxx /usr/src/debug/ncmpc/0.49-r0/src/TablePaint.cxx /usr/src/debug/ncmpc/0.49-r0/src/util/StringStrip.hxx /usr/src/debug/ncmpc/0.49-r0/src/util/StringUTF8.cxx /usr/src/debug/ncmpc/0.49-r0/src/screen_paint.cxx /usr/src/debug/ncmpc/0.49-r0/src/TextListRenderer.cxx /usr/src/debug/ncmpc/0.49-r0/src/TitleBar.cxx /usr/src/debug/ncmpc/0.49-r0/src/QueuePage.hxx /usr/src/debug/ncmpc/0.49-r0/src/TagFilter.hxx /usr/src/debug/ncmpc/0.49-r0/src/util/Exception.cxx /usr/src/debug/ncmpc/0.49-
 r0/src/util/Manual.hxx /usr/src/debug/ncmpc/0.49-r0/src/TableColumn.hxx /usr/src/debug/ncmpc/0.49-r0/src/ncu.hxx /usr/src/debug/ncmpc/0.49-r0/src/ListRenderer.hxx /usr/src/debug/ncmpc/0.49-r0/src/util/OffsetPointer.hxx /usr/src/debug/ncmpc/0.49-r0/src/mpdclient.cxx /usr/src/debug/ncmpc/0.49-r0/src/ListWindow.hxx /usr/src/debug/ncmpc/0.49-r0/src/time_format.cxx /usr/src/debug/ncmpc/0.49-r0/src/FileBrowserPage.cxx /usr/src/debug/ncmpc/0.49-r0/src/screen_init.cxx /usr/src/debug/ncmpc/0.49-r0/src/Deleter.hxx /usr/src/debug/ncmpc/0.49-r0/src/History.hxx /usr/src/debug/ncmpc/0.49-r0/src/QueuePage.cxx /usr/src/debug/ncmpc/0.49-r0/src/TagMask.hxx /usr/src/debug/ncmpc/0.49-r0/src/hscroll.hxx /usr/src/debug/ncmpc/0.49-r0/src/util/Exception.hxx /usr/src/debug/ncmpc/0.49-r0/src/AsyncUserInput.hxx /usr/src/debug/ncmpc/0.49-r0/src/xterm_title.cxx /usr/src/debug/ncmpc/0.49-r0/src/filelist.cxx /usr/src/debug/ncmpc/0.49-r0/src/util/CharUtil.hxx /usr/src/debug/ncmpc/0.49-r0/src/xterm_title.hxx /usr/s
 rc/debug/ncmpc/0.49-r0/src/HelpPage.cxx /usr/src/debug/ncmpc/0.49-r0/src/TextPage.cxx /usr/src/debug/ncmpc/0.49-r0/src/Main.cxx /usr/src/debug/ncmpc/0.49-r0/src/Size.hxx /usr/src/debug/ncmpc/0.49-r0/src/ConfigFile.cxx /usr/src/debug/ncmpc/0.49-r0/src/LibraryPage.hxx /usr/src/debug/ncmpc/0.49-r0/src/TagListPage.hxx /usr/src/debug/ncmpc/0.49-r0/src/hscroll.cxx /usr/src/debug/ncmpc/0.49-r0/src/KeyDefPage.hxx /usr/src/debug/ncmpc/0.49-r0/src/SearchPage.hxx /usr/src/debug/ncmpc/0.49-r0/src/mpdclient.hxx /usr/src/debug/ncmpc/0.49-r0/src/wreadln.cxx /usr/src/debug/ncmpc/0.49-r0/src/screen_client.cxx /usr/src/debug/ncmpc/0.49-r0/src/screen_client.hxx /usr/src/debug/ncmpc/0.49-r0/src/Bindings.cxx /usr/src/debug/ncmpc/0.49-r0/src/LyricsCache.cxx /usr/src/debug/ncmpc/0.49-r0/src/Styles.cxx /usr/src/debug/ncmpc/0.49-r0/src/screen.cxx /usr/src/debug/ncmpc/0.49-r0/src/TableLayout.hxx /usr/src/debug/ncmpc/0.49-r0/src/signals.cxx /usr/src/debug/ncmpc/0.49-r0/src/util/ScopeExit.hxx /usr/src/debug/nc
 mpc/0.49-r0/src/DelayedSeek.cxx /usr/src/debug/ncmpc/0.49-r0/src/util/LocaleString.cxx /usr/src/debug/ncmpc/0.49-r0/src/ncu.cxx /usr/src/debug/ncmpc/0.49-r0/src/util/IntrusiveHookMode.hxx /usr/src/debug/ncmpc/0.49-r0/src/LyricsPage.cxx /usr/src/debug/ncmpc/0.49-r0/src/ProgressBar.cxx /usr/src/debug/ncmpc/0.49-r0/src/TableGlue.cxx /usr/src/debug/ncmpc/0.49-r0/src/util/IntrusiveSortedList.hxx /usr/src/debug/ncmpc/0.49-r0/src/util/BindMethod.hxx /usr/src/debug/ncmpc/0.49-r0/src/TabBar.hxx /usr/src/debug/ncmpc/0.49-r0/src/plugin.hxx /usr/src/debug/ncmpc/0.49-r0/src/Instance.hxx /usr/src/debug/ncmpc/0.49-r0/src/SongPage.hxx /usr/src/debug/ncmpc/0.49-r0/src/XdgBaseDirectory.cxx /usr/src/debug/ncmpc/0.49-r0/src/util/StringAPI.hxx /usr/src/debug/ncmpc/0.49-r0/src/ConfigFile.hxx /usr/src/debug/ncmpc/0.49-r0/src/time_format.hxx /usr/src/debug/ncmpc/0.49-r0/src/util/UriUtil.cxx /usr/src/debug/ncmpc/0.49-r0/src/util/UriUtil.hxx /usr/src/debug/ncmpc/0.49-r0/src/LyricsCache.hxx /usr/src/debug/ncm
 pc/0.49-r0/src/screen_utils.cxx /usr/src/debug/ncmpc/0.49-r0/src/screen_utils.hxx /usr/src/debug/ncmpc/0.49-r0/src/ConfigParser.cxx /usr/src/debug/ncmpc/0.49-r0/src/ConfigParser.hxx /usr/src/debug/ncmpc/0.49-r0/src/Match.cxx /usr/src/debug/ncmpc/0.49-r0/src/Match.hxx /usr/src/debug/ncmpc/0.49-r0/src/Queue.cxx /usr/src/debug/ncmpc/0.49-r0/src/AsyncUserInput.cxx /usr/src/debug/ncmpc/0.49-r0/src/Queue.hxx /usr/src/debug/ncmpc/0.49-r0/src/gidle.cxx /usr/src/debug/ncmpc/0.49-r0/src/gidle.hxx /usr/src/debug/ncmpc/0.49-r0/src/GlobalBindings.cxx /usr/src/debug/ncmpc/0.49-r0/src/OutputsPage.cxx /usr/src/debug/ncmpc/0.49-r0/src/screen_list.cxx /usr/src/debug/ncmpc/0.49-r0/src/util/PrintException.hxx /usr/src/debug/ncmpc/0.49-r0/src/aconnect.hxx /usr/src/debug/ncmpc/0.49-r0/src/callbacks.cxx /usr/src/debug/ncmpc/0.49-r0/src/util/ByteOrder.hxx /usr/src/debug/ncmpc/0.49-r0/src/ListWindow.cxx /usr/src/debug/ncmpc/0.49-r0/src/Command.cxx /usr/src/debug/ncmpc/0.49-r0/src/WaitUserInput.hxx /usr/src/
 debug/ncmpc/0.49-r0/src/screen_status.cxx /usr/src/debug/ncmpc/0.49-r0/src/DelayedSeek.hxx /usr/src/debug/ncmpc/0.49-r0/src/screen_status.hxx /usr/src/debug/ncmpc/0.49-r0/src/ProxyPage.hxx /usr/src/debug/ncmpc/0.49-r0/src/FileListPage.cxx /usr/src/debug/ncmpc/0.49-r0/src/FileListPage.hxx /usr/src/debug/ncmpc/0.49-r0/src/strfsong.cxx /usr/src/debug/ncmpc/0.49-r0/src/player_command.cxx /usr/src/debug/ncmpc/0.49-r0/src/Options.cxx /usr/src/debug/ncmpc/0.49-r0/src/Completion.hxx /usr/src/debug/ncmpc/0.49-r0/src/BasicColors.cxx /usr/src/debug/ncmpc/0.49-r0/src/ProgressBar.hxx /usr/src/debug/ncmpc/0.49-r0/src/StatusBar.cxx /usr/src/debug/ncmpc/0.49-r0/src/strfsong.hxx /usr/src/debug/ncmpc/0.49-r0/src/Command.hxx /usr/src/debug/ncmpc/0.49-r0/src/KeyName.hxx /usr/src/debug/ncmpc/0.49-r0/src/Options.hxx /usr/src/debug/ncmpc/0.49-r0/src/KeyName.cxx /usr/src/debug/ncmpc/0.49-r0/src/ProxyPage.cxx /usr/src/debug/ncmpc/0.49-r0/src/charset.hxx /usr/src/debug/ncmpc/0.49-r0/src/player_command.hxx /u
 sr/src/debug/ncmpc/0.49-r0/src/TitleBar.hxx /usr/src/debug/ncmpc/0.49-r0/src/wreadln.hxx /usr/src/debug/ncmpc/0.49-r0/src/aconnect.cxx /usr/src/debug/ncmpc/0.49-r0/src/screen_list.hxx /usr/src/debug/ncmpc/0.49-r0/src/save_playlist.cxx /usr/src/debug/ncmpc/0.49-r0/src/CustomColors.cxx /usr/src/debug/ncmpc/0.49-r0/src/SongPage.cxx /usr/src/debug/ncmpc/0.49-r0/src/CustomColors.hxx /usr/src/debug/ncmpc/0.49-r0/src/Instance.cxx /usr/src/debug/ncmpc/0.49-r0/src/GlobalBindings.hxx /usr/src/debug/ncmpc/0.49-r0/src/LyricsLoader.cxx /usr/src/debug/ncmpc/0.49-r0/src/LyricsLoader.hxx /usr/src/debug/ncmpc/0.49-r0/src/Page.hxx /usr/src/debug/ncmpc/0.49-r0/src/save_playlist.hxx /usr/src/debug/ncmpc/0.49-r0/src/FileBrowserPage.hxx /usr/src/debug/ncmpc/0.49-r0/src/screen_find.hxx /usr/src/debug/ncmpc/0.49-r0/src/OutputsPage.hxx /usr/src/debug/ncmpc/0.49-r0/src/util/StringUTF8.hxx /usr/src/debug/ncmpc/0.49-r0/src/charset.cxx /usr/src/debug/ncmpc/0.49-r0/src/util/StringCompare.cxx"
packages/core2-64-poky-linux/ncmpc/ncmpc-src: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc-staticdev: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc-staticdev: PKGV changed from 0.47 [default] to 0.49 [default]
packages/core2-64-poky-linux/ncmpc/ncmpc: PKGSIZE changed from 361936 to 356973 (-1%)
packages/core2-64-poky-linux/ncmpc/ncmpc: PV changed from "0.47" to "0.49"
packages/core2-64-poky-linux/ncmpc/ncmpc: PKGV changed from 0.47 [default] to 0.49 [default]

--===============6657647255674188297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ncmpc/ncmpc-locale-nl: PKGSIZE changed from 3077 to 7443 (+142%)
packages/core2-64-poky-linux/ncmpc/ncmpc-src: PKGSIZE changed from 792489 to 603277 (-24%)

--===============6657647255674188297==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ncmpc-upgrade-0.47-0.49.patch"

RnJvbSBjNjE1NTYyNTUzMTI1M2QwZDkzODgwNGM5ODQ0ZDlkM2Y4M2RmZmMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMzo1OToxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5j
bXBjOiB1cGdyYWRlIDAuNDcgLT4gMC40OQoKLS0tCiAuLi5lZ3VsYXItaW50ZWdlci10by1maXgt
V2VudW0tY29uc3RleHAucGF0Y2ggfCAzNyAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4vbXVzaWNw
ZC97bmNtcGNfMC40Ny5iYiA9PiBuY21wY18wLjQ5LmJifSAgfCAgNyArLS0tCiAyIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2
NDQgbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9tdXNpY3BkL25jbXBjLzAwMDEt
U2VhcmNoUGFnZS11c2UtcmVndWxhci1pbnRlZ2VyLXRvLWZpeC1XZW51bS1jb25zdGV4cC5wYXRj
aAogcmVuYW1lIG1ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVkaWEvbXVzaWNwZC97bmNt
cGNfMC40Ny5iYiA9PiBuY21wY18wLjQ5LmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEtbXVs
dGltZWRpYS9yZWNpcGVzLW11bHRpbWVkaWEvbXVzaWNwZC9uY21wYy8wMDAxLVNlYXJjaFBhZ2Ut
dXNlLXJlZ3VsYXItaW50ZWdlci10by1maXgtV2VudW0tY29uc3RleHAucGF0Y2ggYi9tZXRhLW11
bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL211c2ljcGQvbmNtcGMvMDAwMS1TZWFyY2hQYWdl
LXVzZS1yZWd1bGFyLWludGVnZXItdG8tZml4LVdlbnVtLWNvbnN0ZXhwLnBhdGNoCmRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCA5MjA5NGFmMWYuLjAwMDAwMDAwMAotLS0gYS9tZXRhLW11
bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL211c2ljcGQvbmNtcGMvMDAwMS1TZWFyY2hQYWdl
LXVzZS1yZWd1bGFyLWludGVnZXItdG8tZml4LVdlbnVtLWNvbnN0ZXhwLnBhdGNoCisrKyAvZGV2
L251bGwKQEAgLTEsMzcgKzAsMCBAQAotRnJvbSAyZThkYzJjMjhjMDkzOGRiYmI4NWViYmFjMmI5
YTYwYmU5Y2NkOWYzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogTWF4IEtlbGxlcm1h
bm4gPG1heEBtdXNpY3BkLm9yZz4KLURhdGU6IFdlZCwgMjMgTm92IDIwMjIgMTI6MjU6NTAgKzAx
MDAKLVN1YmplY3Q6IFtQQVRDSF0gU2VhcmNoUGFnZTogdXNlIHJlZ3VsYXIgaW50ZWdlciB0byBm
aXggLVdlbnVtLWNvbnN0ZXhwci1jb252ZXJzaW9uCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3Bv
cnQgW2h0dHBzOi8vZ2l0aHViLmNvbS9NdXNpY1BsYXllckRhZW1vbi9uY21wYy9jb21taXQvZGRk
MTc1NzkwN2YwMzc2YjU4NDNmNzA3YmYxODJiNzgyN2ZmNjU5MV0KLS0tLQotIHNyYy9TZWFyY2hQ
YWdlLmN4eCB8IDYgKysrLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3NyYy9TZWFyY2hQYWdlLmN4eCBiL3NyYy9TZWFy
Y2hQYWdlLmN4eAotaW5kZXggMmZhNWVkYmMuLjNmOTFjNGZlIDEwMDY0NAotLS0tIGEvc3JjL1Nl
YXJjaFBhZ2UuY3h4Ci0rKysgYi9zcmMvU2VhcmNoUGFnZS5jeHgKLUBAIC04MSw3ICs4MSw3IEBA
IHNlYXJjaF9nZXRfdGFnX2lkKGNvbnN0IGNoYXIgKm5hbWUpCi0gfQotIAotIHN0cnVjdCBTZWFy
Y2hNb2RlIHsKLS0JZW51bSBtcGRfdGFnX3R5cGUgdGFibGU7Ci0rCWludCB0YWJsZTsKLSAJY29u
c3QgY2hhciAqbGFiZWw7Ci0gfTsKLSAKLUBAIC04OSw4ICs4OSw4IEBAIHN0YXRpYyBjb25zdGV4
cHIgU2VhcmNoTW9kZSBtb2RlW10gPSB7Ci0gCXsgTVBEX1RBR19USVRMRSwgTl8oIlRpdGxlIikg
fSwKLSAJeyBNUERfVEFHX0FSVElTVCwgTl8oIkFydGlzdCIpIH0sCi0gCXsgTVBEX1RBR19BTEJV
TSwgTl8oIkFsYnVtIikgfSwKLS0JeyAoZW51bSBtcGRfdGFnX3R5cGUpU0VBUkNIX1VSSSwgTl8o
IkZpbGVuYW1lIikgfSwKLS0JeyAoZW51bSBtcGRfdGFnX3R5cGUpU0VBUkNIX0FSVElTVF9USVRM
RSwgTl8oIkFydGlzdCArIFRpdGxlIikgfSwKLSsJeyBTRUFSQ0hfVVJJLCBOXygiRmlsZW5hbWUi
KSB9LAotKwl7IFNFQVJDSF9BUlRJU1RfVElUTEUsIE5fKCJBcnRpc3QgKyBUaXRsZSIpIH0sCi0g
CXsgTVBEX1RBR19DT1VOVCwgbnVsbHB0ciB9Ci0gfTsKLSAKLS0tIAotMi4zOS4wCi0KZGlmZiAt
LWdpdCBhL21ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVkaWEvbXVzaWNwZC9uY21wY18w
LjQ3LmJiIGIvbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9tdXNpY3BkL25jbXBj
XzAuNDkuYmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS1tdWx0aW1lZGlh
L3JlY2lwZXMtbXVsdGltZWRpYS9tdXNpY3BkL25jbXBjXzAuNDcuYmIKcmVuYW1lIHRvIG1ldGEt
bXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVkaWEvbXVzaWNwZC9uY21wY18wLjQ5LmJiCmluZGV4
IDQ0MDQ2OTEyZS4uZDkzYzA1NGY0IDEwMDY0NAotLS0gYS9tZXRhLW11bHRpbWVkaWEvcmVjaXBl
cy1tdWx0aW1lZGlhL211c2ljcGQvbmNtcGNfMC40Ny5iYgorKysgYi9tZXRhLW11bHRpbWVkaWEv
cmVjaXBlcy1tdWx0aW1lZGlhL211c2ljcGQvbmNtcGNfMC40OS5iYgpAQCAtMzIsOSArMzIsNiBA
QCBQQUNLQUdFQ09ORklHW2x5cmljc19zY3JlZW5dID0gIi1EbHlyaWNzX3NjcmVlbj10cnVlLC1E
bHlyaWNzX3NjcmVlbj1mYWxzZSIKIFBBQ0tBR0VDT05GSUdbb3V0cHV0c19zY3JlZW5dID0gIi1E
b3V0cHV0c19zY3JlZW49dHJ1ZSwtRG91dHB1dHNfc2NyZWVuPWZhbHNlIgogUEFDS0FHRUNPTkZJ
R1tjaGF0X3NjcmVlbl0gPSAiLURjaGF0X3NjcmVlbj10cnVlLC1EY2hhdF9zY3JlZW49ZmFsc2Ui
CiAKLVNSQ19VUkkgPSAiIFwKLSAgICBnaXQ6Ly9naXRodWIuY29tL011c2ljUGxheWVyRGFlbW9u
L25jbXBjO2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAotICAgIGZpbGU6Ly8wMDAxLVNl
YXJjaFBhZ2UtdXNlLXJlZ3VsYXItaW50ZWdlci10by1maXgtV2VudW0tY29uc3RleHAucGF0Y2gg
XAotIgotU1JDUkVWID0gImZjOGRlMDFjNzFhY2RmMTBhZDA3YzdhYWU3NTZkYzUyMmI4NDgxMjQi
CitTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vTXVzaWNQbGF5ZXJEYWVtb24vbmNtcGM7YnJh
bmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIKK1NSQ1JFViA9ICJmODFmODc1ZmM1Nzg1MzgzZDI0
ZjU0ZmI5YmQzY2YwNmVmZDkxNWE0IgogUyA9ICIke1dPUktESVJ9L2dpdCIKLS0gCjIuMzkuMgoK

--===============6657647255674188297==--


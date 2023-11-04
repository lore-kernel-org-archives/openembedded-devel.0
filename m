Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11DF5C0723F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:58 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.4231.1699071647668327703
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ib8+iaw4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FMNfq6PT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b988fdb41-922c9669-f081-4b6b-a795-dc198876ba0d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tpx7P+py/0kJ07Sk64NwcIQUFROeNSa8zykgUd7RIlc=;
	b=Ib8+iaw4mjMIw95uNThDVcuha0OzBQmCNrvjawrFIlzuOEIfmRCO6AnLbmTYyz/E
	T96daUVGbgf3Zac8H7bnz2HEzX2razXmzIIm5yTcOmDNKjv27ZrUwBZSj94NhRtcdr2
	7c3zidz29TFq2oAGDgZKbIRvAs8mBsA1WJt9217M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tpx7P+py/0kJ07Sk64NwcIQUFROeNSa8zykgUd7RIlc=;
	b=FMNfq6PTYnzB45N0KYHvKYvCNzQKnWP02F/rNQmx3xueQ/uSUFF5TLxi9IWCLQkL
	B1T7YElMWxP5smfusRV2FiWGB8YBeTKYQYnTlNOWeUswYCMxi4YdpNPtft8JgCc9KFV
	35ZjFzbAXCLnGeLuKc3eOaOnTZlmDK6ZoJweXxhA=
Content-Type: multipart/mixed; boundary="===============6796660456198287086=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] gerbera: upgrading to 1.12.1 SUCCEEDED
Message-ID: <0101018b988fdb41-922c9669-f081-4b6b-a795-dc198876ba0d-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:46 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106256

--===============6796660456198287086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gerbera* to *1.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gerbera-upgrade-1.11.0-1.12.1.patch
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
From 4d673eee05417287c9a492b4550a8c5897058fa8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 03:22:10 +0000
Subject: [PATCH] gerbera: upgrade 1.11.0 -> 1.12.1

---
 .../gerbera/0001-Fix-build-with-fmt-9.0.patch | 37 -------------------
 .../{gerbera_1.11.0.bb => gerbera_1.12.1.bb}  |  3 +-
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-build-with-fmt-9.0.patch
 rename meta-multimedia/recipes-multimedia/gerbera/{gerbera_1.11.0.bb => gerbera_1.12.1.bb} (90%)

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-build-with-fmt-9.0.patch b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-build-with-fmt-9.0.patch
deleted file mode 100644
index bb8e43830..000000000
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-build-with-fmt-9.0.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From d7b8fafbc94405c20753fed569abd8878cccde89 Mon Sep 17 00:00:00 2001
-From: Felix Yan <felixonmars@archlinux.org>
-Date: Fri, 19 Aug 2022 15:22:10 +0300
-Subject: [PATCH] Fix build with fmt 9.0
-
-Fixes #2681
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/database/sql_format.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/database/sql_format.h b/src/database/sql_format.h
-index 32dc00ef..e4e1909a 100644
---- a/src/database/sql_format.h
-+++ b/src/database/sql_format.h
-@@ -42,7 +42,7 @@ struct SQLIdentifier {
- template <>
- struct fmt::formatter<SQLIdentifier> : formatter<std::string_view> {
-     template <typename FormatContext>
--    auto format(const SQLIdentifier& tn, FormatContext& ctx) -> decltype(ctx.out())
-+    auto format(const SQLIdentifier& tn, FormatContext& ctx) const -> decltype(ctx.out())
-     {
-         return format_to(ctx.out(), "{}{}{}", tn.quote_begin, tn.name, tn.quote_end);
-     }
-@@ -61,7 +61,7 @@ struct ColumnUpdate {
- template <>
- struct fmt::formatter<ColumnUpdate> : formatter<std::string_view> {
-     template <typename FormatContext>
--    auto format(const ColumnUpdate& a, FormatContext& ctx) -> decltype(ctx.out())
-+    auto format(const ColumnUpdate& a, FormatContext& ctx) const -> decltype(ctx.out())
-     {
-         return format_to(ctx.out(), "{} = {}", a.column, a.value);
-     }
--- 
-2.38.0.rc1.362.ged0d419d3c-goog
-
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.11.0.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.12.1.bb
similarity index 90%
rename from meta-multimedia/recipes-multimedia/gerbera/gerbera_1.11.0.bb
rename to meta-multimedia/recipes-multimedia/gerbera/gerbera_1.12.1.bb
index 2a6d32871..89cc51e0e 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.11.0.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.12.1.bb
@@ -4,11 +4,10 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
 
 SRC_URI = "git://github.com/gerbera/gerbera.git;protocol=https;branch=master \
-           file://0001-Fix-build-with-fmt-9.0.patch \
            file://0001-Fix-build-against-fmt-10.patch \
            "
 
-SRCREV = "d73d8c1346213d784753c02ea771970500e0df2a"
+SRCREV = "559e1d1a92f5977ce8cff7393aa85330dbf2d1d6"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============6796660456198287086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gerbera/gerbera-dbg: PV changed from "1.11.0" to "1.12.1"
packages/core2-64-poky-linux/gerbera/gerbera-dbg: PKGSIZE changed from 99603504 to 95296488 (-4%)
packages/core2-64-poky-linux/gerbera/gerbera-dbg: PKGV changed from 1.11.0 [default] to 1.12.1 [default]
packages/core2-64-poky-linux/gerbera/gerbera-dev: PV changed from "1.11.0" to "1.12.1"
packages/core2-64-poky-linux/gerbera/gerbera-dev: PKGV changed from 1.11.0 [default] to 1.12.1 [default]
packages/core2-64-poky-linux/gerbera/gerbera-doc: PV changed from "1.11.0" to "1.12.1"
packages/core2-64-poky-linux/gerbera/gerbera-doc: PKGSIZE changed from 4440 to 4635 (+4%)
packages/core2-64-poky-linux/gerbera/gerbera-doc: PKGV changed from 1.11.0 [default] to 1.12.1 [default]
packages/core2-64-poky-linux/gerbera/gerbera-locale: PV changed from "1.11.0" to "1.12.1"
packages/core2-64-poky-linux/gerbera/gerbera-locale: PKGV changed from 1.11.0 [default] to 1.12.1 [default]
packages/core2-64-poky-linux/gerbera/gerbera-src: PV changed from "1.11.0" to "1.12.1"
packages/core2-64-poky-linux/gerbera/gerbera-src: PKGSIZE changed from 1529720 to 1605873 (+5%)
packages/core2-64-poky-linux/gerbera/gerbera-src: PKGV changed from 1.11.0 [default] to 1.12.1 [default]
packages/core2-64-poky-linux/gerbera/gerbera-src: FILELIST: directory renamed /usr/src/debug/gerbera/1.11.0-r0/src/database -> /usr/src/debug/gerbera/1.12.1-r0/src/database, directory renamed /usr/src/debug/gerbera/1.11.0-r0/src/contrib -> /usr/src/debug/gerbera/1.12.1-r0/src/contrib, directory renamed /usr/src/debug/gerbera/1.11.0-r0/src/content -> /usr/src/debug/gerbera/1.12.1-r0/src/content, directory renamed /usr/src/debug/gerbera/1.11.0-r0/src/content/onlineservice -> /usr/src/debug/gerbera/1.12.1-r0/src/content/onlineservice, directory renamed /usr/src/debug/gerbera/1.11.0-r0/src/config/setup -> /usr/src/debug/gerbera/1.12.1-r0/src/config/setup, directory renamed /usr/src/debug/gerbera/1.11.0-r0/src/config -> /usr/src/debug/gerbera/1.12.1-r0/src/config, directory renamed /usr/src/debug/gerbera/1.11.0-r0/src/iohandler -> /usr/src/debug/gerbera/1.12.1-r0/src/iohandler, directory renamed /usr/src/debug/gerbera/1.11.0-r0/src/content/layout -> /usr/src/debug/gerbera/1.12.1-r0/src/co
 ntent/layout, directory renamed /usr/src/debug/gerbera/1.11.0-r0/src/content/scripting -> /usr/src/debug/gerbera/1.12.1-r0/src/content/scripting, directory renamed /usr/src/debug/gerbera/1.11.0-r0/src/metadata -> /usr/src/debug/gerbera/1.12.1-r0/src/metadata, directory renamed /usr/src/debug/gerbera/1.11.0-r0/src/transcoding -> /usr/src/debug/gerbera/1.12.1-r0/src/transcoding, directory renamed /usr/src/debug/gerbera/1.11.0-r0/src/web -> /usr/src/debug/gerbera/1.12.1-r0/src/web, removed "/usr/src/debug/gerbera/1.11.0-r0/src/util/xml_to_json.h /usr/src/debug/gerbera/1.11.0-r0/src/cds_objects.h /usr/src/debug/gerbera/1.11.0-r0/src/cds_objects.cc /usr/src/debug/gerbera/1.11.0-r0/src/upnp_xml.h /usr/src/debug/gerbera/1.11.0-r0/src/request_handler.h /usr/src/debug/gerbera/1.11.0-r0/src/util/mt_inotify.h /usr/src/debug/gerbera/1.11.0-r0/src/util/grb_fs.h /usr/src/debug/gerbera/1.11.0-r0/src/url_request_handler.cc /usr/src/debug/gerbera/1.11.0-r0/src/util/logger.h /usr/src/debug/gerbera/1.
 11.0-r0/src/util/string_converter.h /usr/src/debug/gerbera/1.11.0-r0/src/util/url_utils.h /usr/src/debug/gerbera/1.11.0-r0/src/upnp_cm.h /usr/src/debug/gerbera/1.11.0-r0/src/upnp_cds.cc /usr/src/debug/gerbera/1.11.0-r0/src/util/upnp_quirks.h /usr/src/debug/gerbera/1.11.0-r0/src/util/upnp_headers.cc /usr/src/debug/gerbera/1.11.0-r0/src/exceptions.cc /usr/src/debug/gerbera/1.11.0-r0/src/context.h /usr/src/debug/gerbera/1.11.0-r0/src/context.cc /usr/src/debug/gerbera/1.11.0-r0/src/exceptions.h /usr/src/debug/gerbera/1.11.0-r0/src/cds_resource.cc /usr/src/debug/gerbera/1.11.0-r0/src/util/timer.h /usr/src/debug/gerbera/1.11.0-r0/src/util/tools.h /usr/src/debug/gerbera/1.11.0-r0/src/util/upnp_headers.h /usr/src/debug/gerbera/1.11.0-r0/src/util/grb_net.cc /usr/src/debug/gerbera/1.11.0-r0/src/util/url.h /usr/src/debug/gerbera/1.11.0-r0/src/util/mime.cc /usr/src/debug/gerbera/1.11.0-r0/src/main.cc /usr/src/debug/gerbera/1.11.0-r0/src/util/upnp_quirks.cc /usr/src/debug/gerbera/1.11.0-r0/src/u
 pnp_mrreg.h /usr/src/debug/gerbera/1.11.0-r0/src/util/xml_to_json.cc /usr/src/debug/gerbera/1.11.0-r0/src/util/process_executor.h /usr/src/debug/gerbera/1.11.0-r0/src/database/sqlite3/sqlite_database.cc /usr/src/debug/gerbera/1.11.0-r0/src/util/thread_executor.h /usr/src/debug/gerbera/1.11.0-r0/src/device_description_handler.cc /usr/src/debug/gerbera/1.11.0-r0/src/util/string_converter.cc /usr/src/debug/gerbera/1.11.0-r0/src/util/process_executor.cc /usr/src/debug/gerbera/1.11.0-r0/src/util/mt_inotify.cc /usr/src/debug/gerbera/1.11.0-r0/src/util/upnp_clients.h /usr/src/debug/gerbera/1.11.0-r0/src/upnp_mrreg.cc /usr/src/debug/gerbera/1.11.0-r0/src/url_request_handler.h /usr/src/debug/gerbera/1.11.0-r0/src/file_request_handler.h /usr/src/debug/gerbera/1.11.0-r0/src/util/generic_task.h /usr/src/debug/gerbera/1.11.0-r0/src/util/upnp_clients.cc /usr/src/debug/gerbera/1.11.0-r0/src/util/url.cc /usr/src/debug/gerbera/1.11.0-r0/src/util/thread_runner.h /usr/src/debug/gerbera/1.11.0-r0/src/u
 pnp_xml.cc /usr/src/debug/gerbera/1.11.0-r0/src/database/sqlite3/sqlite_database.h /usr/src/debug/gerbera/1.11.0-r0/src/cds_resource.h /usr/src/debug/gerbera/1.11.0-r0/src/server.h /usr/src/debug/gerbera/1.11.0-r0/src/server.cc /usr/src/debug/gerbera/1.11.0-r0/src/action_request.h /usr/src/debug/gerbera/1.11.0-r0/src/action_request.cc /usr/src/debug/gerbera/1.11.0-r0/src/util/executor.h /usr/src/debug/gerbera/1.11.0-r0/src/util/grb_net.h /usr/src/debug/gerbera/1.11.0-r0/src/upnp_cm.cc /usr/src/debug/gerbera/1.11.0-r0/src/util/generic_task.cc /usr/src/debug/gerbera/1.11.0-r0/src/util/thread_executor.cc /usr/src/debug/gerbera/1.11.0-r0/src/subscription_request.cc /usr/src/debug/gerbera/1.11.0-r0/src/subscription_request.h /usr/src/debug/gerbera/1.11.0-r0/src/util/mime.h /usr/src/debug/gerbera/1.11.0-r0/src/util/timer.cc /usr/src/debug/gerbera/1.11.0-r0/src/util/tools.cc /usr/src/debug/gerbera/1.11.0-r0/src/file_request_handler.cc /usr/src/debug/gerbera/1.11.0-r0/src/util/url_utils.cc 
 /usr/src/debug/gerbera/1.11.0-r0/src/upnp_cds.h /usr/src/debug/gerbera/1.11.0-r0/src/common.h /usr/src/debug/gerbera/1.11.0-r0/src/device_description_handler.h /usr/src/debug/gerbera/1.11.0-r0/src/util/grb_fs.cc /usr/src/debug/gerbera/1.11.0-r0/src/request_handler.cc", added "/usr/src/debug/gerbera/1.12.1-r0/src/util/grb_fs.h /usr/src/debug/gerbera/1.12.1-r0/src/util/logger.h /usr/src/debug/gerbera/1.12.1-r0/src/database/sqlite3/sl_task.cc /usr/src/debug/gerbera/1.12.1-r0/src/main.cc /usr/src/debug/gerbera/1.12.1-r0/src/upnp_mrreg.h /usr/src/debug/gerbera/1.12.1-r0/src/util/xml_to_json.cc /usr/src/debug/gerbera/1.12.1-r0/src/util/thread_runner.h /usr/src/debug/gerbera/1.12.1-r0/src/util/executor.h /usr/src/debug/gerbera/1.12.1-r0/src/action_request.h /usr/src/debug/gerbera/1.12.1-r0/src/util/grb_time.cc /usr/src/debug/gerbera/1.12.1-r0/src/upnp_cm.cc /usr/src/debug/gerbera/1.12.1-r0/src/request_handler.h /usr/src/debug/gerbera/1.12.1-r0/src/util/mt_inotify.h /usr/src/debug/gerbera/1
 .12.1-r0/src/url_request_handler.cc /usr/src/debug/gerbera/1.12.1-r0/src/util/grb_time.h /usr/src/debug/gerbera/1.12.1-r0/src/cds/cds_container.h /usr/src/debug/gerbera/1.12.1-r0/src/upnp_cm.h /usr/src/debug/gerbera/1.12.1-r0/src/cds/cds_item.h /usr/src/debug/gerbera/1.12.1-r0/src/database/sqlite3/sl_task.h /usr/src/debug/gerbera/1.12.1-r0/src/util/url.h /usr/src/debug/gerbera/1.12.1-r0/src/util/process_executor.h /usr/src/debug/gerbera/1.12.1-r0/src/database/sqlite3/sqlite_database.cc /usr/src/debug/gerbera/1.12.1-r0/src/util/thread_executor.h /usr/src/debug/gerbera/1.12.1-r0/src/util/string_converter.cc /usr/src/debug/gerbera/1.12.1-r0/src/util/process_executor.cc /usr/src/debug/gerbera/1.12.1-r0/src/file_request_handler.h /usr/src/debug/gerbera/1.12.1-r0/src/util/generic_task.h /usr/src/debug/gerbera/1.12.1-r0/src/util/url.cc /usr/src/debug/gerbera/1.12.1-r0/src/database/sqlite3/sqlite_database.h /usr/src/debug/gerbera/1.12.1-r0/src/server.h /usr/src/debug/gerbera/1.12.1-r0/src/s
 erver.cc /usr/src/debug/gerbera/1.12.1-r0/src/util/grb_net.h /usr/src/debug/gerbera/1.12.1-r0/src/util/generic_task.cc /usr/src/debug/gerbera/1.12.1-r0/src/util/thread_executor.cc /usr/src/debug/gerbera/1.12.1-r0/src/subscription_request.cc /usr/src/debug/gerbera/1.12.1-r0/src/util/url_utils.cc /usr/src/debug/gerbera/1.12.1-r0/src/common.h /usr/src/debug/gerbera/1.12.1-r0/src/cds/cds_container.cc /usr/src/debug/gerbera/1.12.1-r0/src/util/xml_to_json.h /usr/src/debug/gerbera/1.12.1-r0/src/upnp_xml.h /usr/src/debug/gerbera/1.12.1-r0/src/request_handler.cc /usr/src/debug/gerbera/1.12.1-r0/src/upnp_cds.cc /usr/src/debug/gerbera/1.12.1-r0/src/util/upnp_headers.cc /usr/src/debug/gerbera/1.12.1-r0/src/context.h /usr/src/debug/gerbera/1.12.1-r0/src/context.cc /usr/src/debug/gerbera/1.12.1-r0/src/util/timer.h /usr/src/debug/gerbera/1.12.1-r0/src/util/tools.h /usr/src/debug/gerbera/1.12.1-r0/src/util/grb_net.cc /usr/src/debug/gerbera/1.12.1-r0/src/util/mime.cc /usr/src/debug/gerbera/1.12.1-r0
 /src/util/upnp_quirks.cc /usr/src/debug/gerbera/1.12.1-r0/src/cds/cds_objects.h /usr/src/debug/gerbera/1.12.1-r0/src/util/mt_inotify.cc /usr/src/debug/gerbera/1.12.1-r0/src/url_request_handler.h /usr/src/debug/gerbera/1.12.1-r0/src/util/upnp_clients.cc /usr/src/debug/gerbera/1.12.1-r0/src/cds/cds_resource.cc /usr/src/debug/gerbera/1.12.1-r0/src/action_request.cc /usr/src/debug/gerbera/1.12.1-r0/src/cds/cds_resource.h /usr/src/debug/gerbera/1.12.1-r0/src/upnp_cds.h /usr/src/debug/gerbera/1.12.1-r0/src/device_description_handler.h /usr/src/debug/gerbera/1.12.1-r0/src/util/grb_fs.cc /usr/src/debug/gerbera/1.12.1-r0/src/util/logger.cc /usr/src/debug/gerbera/1.12.1-r0/src/util/string_converter.h /usr/src/debug/gerbera/1.12.1-r0/src/util/url_utils.h /usr/src/debug/gerbera/1.12.1-r0/src/util/enum_iterator.h /usr/src/debug/gerbera/1.12.1-r0/src/exceptions.cc /usr/src/debug/gerbera/1.12.1-r0/src/util/upnp_quirks.h /usr/src/debug/gerbera/1.12.1-r0/src/exceptions.h /usr/src/debug/gerbera/1.12.
 1-r0/src/util/upnp_headers.h /usr/src/debug/gerbera/1.12.1-r0/src/cds/cds_item.cc /usr/src/debug/gerbera/1.12.1-r0/src/cds/cds_objects.cc /usr/src/debug/gerbera/1.12.1-r0/src/device_description_handler.cc /usr/src/debug/gerbera/1.12.1-r0/src/util/upnp_clients.h /usr/src/debug/gerbera/1.12.1-r0/src/upnp_mrreg.cc /usr/src/debug/gerbera/1.12.1-r0/src/upnp_xml.cc /usr/src/debug/gerbera/1.12.1-r0/src/subscription_request.h /usr/src/debug/gerbera/1.12.1-r0/src/util/mime.h /usr/src/debug/gerbera/1.12.1-r0/src/util/timer.cc /usr/src/debug/gerbera/1.12.1-r0/src/util/tools.cc /usr/src/debug/gerbera/1.12.1-r0/src/file_request_handler.cc"
packages/core2-64-poky-linux/gerbera/gerbera-staticdev: PV changed from "1.11.0" to "1.12.1"
packages/core2-64-poky-linux/gerbera/gerbera-staticdev: PKGV changed from 1.11.0 [default] to 1.12.1 [default]
packages/core2-64-poky-linux/gerbera/gerbera: PV changed from "1.11.0" to "1.12.1"
packages/core2-64-poky-linux/gerbera/gerbera: PKGSIZE changed from 7326222 to 7206425 (-2%)
packages/core2-64-poky-linux/gerbera/gerbera: PKGV changed from 1.11.0 [default] to 1.12.1 [default]
packages/core2-64-poky-linux/gerbera/gerbera: FILELIST: added "/usr/share/gerbera/js/metadata.js"
packages/core2-64-poky-linux/gerbera: PV changed from "1.11.0" to "1.12.1"
packages/core2-64-poky-linux/gerbera: SRC_URI changed from "git://github.com/gerbera/gerbera.git;protocol=https;branch=master file://0001-Fix-build-with-fmt-9.0.patch file://0001-Fix-build-against-fmt-10.patch" to "git://github.com/gerbera/gerbera.git;protocol=https;branch=master file://0001-Fix-build-against-fmt-10.patch"
packages/core2-64-poky-linux/gerbera: PKGV changed from 1.11.0 [default] to 1.12.1 [default]
Changes to packages/core2-64-poky-linux/gerbera (sysroot):
  /usr/share/gerbera/js/metadata.js was added

--===============6796660456198287086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gerbera/gerbera: FILELIST: added "/usr/share/gerbera/js/metadata.js"
Changes to packages/core2-64-poky-linux/gerbera (sysroot):
  /usr/share/gerbera/js/metadata.js was added

--===============6796660456198287086==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gerbera-upgrade-1.11.0-1.12.1.patch"

RnJvbSA0ZDY3M2VlZTA1NDE3Mjg3YzlhNDkyYjQ1NTBhOGM1ODk3MDU4ZmE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMzoyMjoxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdl
cmJlcmE6IHVwZ3JhZGUgMS4xMS4wIC0+IDEuMTIuMQoKLS0tCiAuLi4vZ2VyYmVyYS8wMDAxLUZp
eC1idWlsZC13aXRoLWZtdC05LjAucGF0Y2ggfCAzNyAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
e2dlcmJlcmFfMS4xMS4wLmJiID0+IGdlcmJlcmFfMS4xMi4xLmJifSAgfCAgMyArLQogMiBmaWxl
cyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMzkgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9nZXJiZXJhL2dlcmJlcmEv
MDAwMS1GaXgtYnVpbGQtd2l0aC1mbXQtOS4wLnBhdGNoCiByZW5hbWUgbWV0YS1tdWx0aW1lZGlh
L3JlY2lwZXMtbXVsdGltZWRpYS9nZXJiZXJhL3tnZXJiZXJhXzEuMTEuMC5iYiA9PiBnZXJiZXJh
XzEuMTIuMS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dlcmJlcmEvZ2VyYmVyYS8wMDAxLUZpeC1idWlsZC13aXRoLWZtdC05LjAucGF0
Y2ggYi9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL2dlcmJlcmEvZ2VyYmVyYS8w
MDAxLUZpeC1idWlsZC13aXRoLWZtdC05LjAucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IGJiOGU0MzgzMC4uMDAwMDAwMDAwCi0tLSBhL21ldGEtbXVsdGltZWRpYS9yZWNpcGVz
LW11bHRpbWVkaWEvZ2VyYmVyYS9nZXJiZXJhLzAwMDEtRml4LWJ1aWxkLXdpdGgtZm10LTkuMC5w
YXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM3ICswLDAgQEAKLUZyb20gZDdiOGZhZmJjOTQ0MDVj
MjA3NTNmZWQ1NjlhYmQ4ODc4Y2NjZGU4OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206
IEZlbGl4IFlhbiA8ZmVsaXhvbm1hcnNAYXJjaGxpbnV4Lm9yZz4KLURhdGU6IEZyaSwgMTkgQXVn
IDIwMjIgMTU6MjI6MTAgKzAzMDAKLVN1YmplY3Q6IFtQQVRDSF0gRml4IGJ1aWxkIHdpdGggZm10
IDkuMAotCi1GaXhlcyAjMjY4MQotVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCi1TaWduZWQtb2Zm
LWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gc3JjL2RhdGFiYXNlL3Nx
bF9mb3JtYXQuaCB8IDQgKystLQotIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9zcmMvZGF0YWJhc2Uvc3FsX2Zvcm1hdC5oIGIv
c3JjL2RhdGFiYXNlL3NxbF9mb3JtYXQuaAotaW5kZXggMzJkYzAwZWYuLmU0ZTE5MDlhIDEwMDY0
NAotLS0tIGEvc3JjL2RhdGFiYXNlL3NxbF9mb3JtYXQuaAotKysrIGIvc3JjL2RhdGFiYXNlL3Nx
bF9mb3JtYXQuaAotQEAgLTQyLDcgKzQyLDcgQEAgc3RydWN0IFNRTElkZW50aWZpZXIgewotIHRl
bXBsYXRlIDw+Ci0gc3RydWN0IGZtdDo6Zm9ybWF0dGVyPFNRTElkZW50aWZpZXI+IDogZm9ybWF0
dGVyPHN0ZDo6c3RyaW5nX3ZpZXc+IHsKLSAgICAgdGVtcGxhdGUgPHR5cGVuYW1lIEZvcm1hdENv
bnRleHQ+Ci0tICAgIGF1dG8gZm9ybWF0KGNvbnN0IFNRTElkZW50aWZpZXImIHRuLCBGb3JtYXRD
b250ZXh0JiBjdHgpIC0+IGRlY2x0eXBlKGN0eC5vdXQoKSkKLSsgICAgYXV0byBmb3JtYXQoY29u
c3QgU1FMSWRlbnRpZmllciYgdG4sIEZvcm1hdENvbnRleHQmIGN0eCkgY29uc3QgLT4gZGVjbHR5
cGUoY3R4Lm91dCgpKQotICAgICB7Ci0gICAgICAgICByZXR1cm4gZm9ybWF0X3RvKGN0eC5vdXQo
KSwgInt9e317fSIsIHRuLnF1b3RlX2JlZ2luLCB0bi5uYW1lLCB0bi5xdW90ZV9lbmQpOwotICAg
ICB9Ci1AQCAtNjEsNyArNjEsNyBAQCBzdHJ1Y3QgQ29sdW1uVXBkYXRlIHsKLSB0ZW1wbGF0ZSA8
PgotIHN0cnVjdCBmbXQ6OmZvcm1hdHRlcjxDb2x1bW5VcGRhdGU+IDogZm9ybWF0dGVyPHN0ZDo6
c3RyaW5nX3ZpZXc+IHsKLSAgICAgdGVtcGxhdGUgPHR5cGVuYW1lIEZvcm1hdENvbnRleHQ+Ci0t
ICAgIGF1dG8gZm9ybWF0KGNvbnN0IENvbHVtblVwZGF0ZSYgYSwgRm9ybWF0Q29udGV4dCYgY3R4
KSAtPiBkZWNsdHlwZShjdHgub3V0KCkpCi0rICAgIGF1dG8gZm9ybWF0KGNvbnN0IENvbHVtblVw
ZGF0ZSYgYSwgRm9ybWF0Q29udGV4dCYgY3R4KSBjb25zdCAtPiBkZWNsdHlwZShjdHgub3V0KCkp
Ci0gICAgIHsKLSAgICAgICAgIHJldHVybiBmb3JtYXRfdG8oY3R4Lm91dCgpLCAie30gPSB7fSIs
IGEuY29sdW1uLCBhLnZhbHVlKTsKLSAgICAgfQotLS0gCi0yLjM4LjAucmMxLjM2Mi5nZWQwZDQx
OWQzYy1nb29nCi0KZGlmZiAtLWdpdCBhL21ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVk
aWEvZ2VyYmVyYS9nZXJiZXJhXzEuMTEuMC5iYiBiL21ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11
bHRpbWVkaWEvZ2VyYmVyYS9nZXJiZXJhXzEuMTIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpy
ZW5hbWUgZnJvbSBtZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL2dlcmJlcmEvZ2Vy
YmVyYV8xLjExLjAuYmIKcmVuYW1lIHRvIG1ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVk
aWEvZ2VyYmVyYS9nZXJiZXJhXzEuMTIuMS5iYgppbmRleCAyYTZkMzI4NzEuLjg5Y2M1MWUwZSAx
MDA2NDQKLS0tIGEvbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9nZXJiZXJhL2dl
cmJlcmFfMS4xMS4wLmJiCisrKyBiL21ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVkaWEv
Z2VyYmVyYS9nZXJiZXJhXzEuMTIuMS5iYgpAQCAtNCwxMSArNCwxMCBAQCBMSUNFTlNFID0gIkdQ
TC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PTI1
Y2RlYzlhZmUzZjFmMjYyMTJlYWQ2YmQyZjdmYWM4IgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1
Yi5jb20vZ2VyYmVyYS9nZXJiZXJhLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIFwK
LSAgICAgICAgICAgZmlsZTovLzAwMDEtRml4LWJ1aWxkLXdpdGgtZm10LTkuMC5wYXRjaCBcCiAg
ICAgICAgICAgIGZpbGU6Ly8wMDAxLUZpeC1idWlsZC1hZ2FpbnN0LWZtdC0xMC5wYXRjaCBcCiAg
ICAgICAgICAgICIKIAotU1JDUkVWID0gImQ3M2Q4YzEzNDYyMTNkNzg0NzUzYzAyZWE3NzE5NzA1
MDBlMGRmMmEiCitTUkNSRVYgPSAiNTU5ZTFkMWE5MmY1OTc3Y2U4Y2ZmNzM5M2FhODUzMzBkYmYy
ZDFkNiIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zOS4yCgo=

--===============6796660456198287086==--


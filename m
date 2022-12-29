Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A699CC5479D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 03:29:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.55580.1672716544767499714
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jan 2023 19:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Su4dZTuy;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672716542; i=@fujitsu.com;
	bh=1Z/EkcpcJrCN49qmYcBvDm2Ldlo11L8ZBvSZoO8TpmQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Su4dZTuywVbQ82EC35QWGHYu/tgGPfNRYajCEIBF8TI67rwDVcylJej+f5lFMmF7/
	 ISkI54ohUdhdg8jIn5PLekJ/JIXWHK3CFgO+lPB1lU+oIJKDW+ZOpreHz4dyi1UjOL
	 xIsGbWejiXqkJpolzuwUo26DEnVuPe1al69qDBl1XnX/5QcM5z5uzw5u4foSGMPNNb
	 xwurOFAe9SgHCAX4XntErfcCMCxW1lyu/cA6y1NSBWxdvPnVIN91wNYxahJ2qDQYYT
	 knqrPznfuqsPKu5Dxb2YNc8xD95eGuY7k4vlHCVIVfVk76efV1MjHy2dlu2IPGEhTO
	 IuclP3SjmBKeA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8ORpPt3weZ
  kgy17tSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozTK6YyFXwUrXi9cjNjA2OvcBcjF4eQwENG
  iceTdjBCOJeZJLZdP88O4exmlLj4tBsow8nBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi989Q
  A0cHMICzhKXpnKBhFkEVCUuH13PCmLzCjhJLFnQxAJiSwgoSEx5+J4ZIi4ocXLmExaIMRISB1
  +8YIaoUZSYfbkZqr5CYtasNiYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRvPi1KKy1CJdQ2O9pKL
  M9IyS3MTMHL3EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3iytzknBS9vNSSTYzAcEwpTpXYwdiw
  /I/eIUZJDiYlUd7yvZuShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnw8szfnCwkWJSanlqRlpkDj
  A2YtAQHj5II76F5QGne4oLE3OLMdIjUKUZdjrsL9+5lFmLJy89LlRLnFZkLVCQAUpRRmgc3Ah
  anlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ884HuYQnM68EbtMroCOYgI5IWrMR5IiSRIS
  UVAOTUELvozerSm68rlTdenRZ4+yLc30Csrlun2pX2sB2qz33U1XrSx1hx2ltLAfStga+ddy+
  60CAqtLu9PxlM3MCj4VonVtSeP3cmcQ6i9MOTXprZyTKTDqrn5A+denScoly7yqXwj01il88n
  nrOk/ZQPWsWbOvM+5ndnf/u+0ptm+3Z344X996v3zTnnuqyCyEyQi3b39jMmfnw6b3vke8Ov9
  G2sVU22/dP+IqKvfnLqtVt13+2TPpzWuZW4zblVa3GredOaLFJOFkd9Ureq5/wKWeV+C4NpvQ
  78ZlPrd9UJV8WenwnwKCt6/xXngefvuUwqi9r6pxmJXXC6TGD96qUSXd77d02tEb/3//hyOor
  SizFGYmGWsxFxYkA+TyGqU4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-745.messagelabs.com!1672716541!277873!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16567 invoked from network); 3 Jan 2023 03:29:01 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jan 2023 03:29:01 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 1BBFA1AE
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 03:29:01 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 100517B
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 03:29:01 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 3 Jan 2023 03:28:59 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] appstream: upgrade 0.15.5 -> 0.15.6
Date: Thu, 29 Dec 2022 12:45:28 +0800
Message-ID: <1672289132-16078-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 03:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100345

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Features:
 * qt: Add API for ContentRating descriptions and ratingIds
 * Add some coccinelle semantic patches for common style issues
 * compose: Allow building without SVG support (for bootstrap only)
 * validator: Check for nodes that are text nodes even though they shouldn't be
 * validator: Extend validation for custom tag
 * validator: Improve Screenshot validation

Specification:
 * docs: Fix typos in <extends> documentation

Bugfixes:
 * validator: internat: Don't allow bandwidth_mbitps when value is offline-only
 * validator: Fix timestamp validation
 * validator: Allow release descriptions to start with punctuation
 * compose: Only add no-metainfo tag if component isn't already ignored
 * compose: Show better error in AscImage if compose was build without rsvg
 * Add a hack to clarify proper PtrArray element ownership for language bindings
 * qt: Port away from deprecated QDateTime API
 * qt: Deprecate Component::requires
 * qt: Fix warning
 * qt: Fix stringListToCharArray and Pool::componentsByCategories
 * qt: Port away from deprecated foreach
 * as-review: Add a typedef for property enums
 * as-review: Install properties at once rather than individually
 * as-review: Specify G_PARAM_STATIC_STRINGS for properties
 * as-review: Emit GObject::notify on property value changes
 * as-review: Add missing property for as_review_{get,set}_priority()
 * ascli: fix NULL pointer dereference

Miscellaneous:
 * docs: Split releases specification into its own section
 * style: Make code easier to read by using helper macros in all places
 * Make some compiler warnings fatal unconditionally

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../appstream/{appstream_0.15.5.bb => appstream_0.15.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/appstream/{appstream_0.15.5.bb => appstream_0.15.6.bb} (92%)

diff --git a/meta-oe/recipes-support/appstream/appstream_0.15.5.bb b/meta-oe/recipes-support/appstream/appstream_0.15.6.bb
similarity index 92%
rename from meta-oe/recipes-support/appstream/appstream_0.15.5.bb
rename to meta-oe/recipes-support/appstream/appstream_0.15.6.bb
index e8637b5ee..d91253bea 100644
--- a/meta-oe/recipes-support/appstream/appstream_0.15.5.bb
+++ b/meta-oe/recipes-support/appstream/appstream_0.15.6.bb
@@ -26,7 +26,7 @@ GIR_MESON_OPTION = ""
 
 SRC_URI = "https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz"
 SRC_URI:append:class-target = " file://0001-fix-crosscompile.patch"
-SRC_URI[sha256sum] = "cb15ed62cc2729683879a2dbf98c0a3267ea2b4d57bba6bc55e70a25500e04c2"
+SRC_URI[sha256sum] = "23d6c940368b5a6cedf622df3707c0dd8679cf4b0739f7aba13f925c58cdf10e"
 
 S = "${WORKDIR}/AppStream-${PV}"
 
-- 
2.25.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876A1C10F1B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:38:55 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.153515.1672123134639873908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cB3DgSkJ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123132; i=@fujitsu.com;
	bh=U3JzWiQGTzuJFCzQDyCngkZFNepd0xqiywx4WqqoLZI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cB3DgSkJkg+SBrmODq8HOq0nOGt2NzGsq+39hTi7WdkgE9ISMWsDCpX8MLB7SmHye
	 pWaaVCazWvl/i3UtT9k6csKmusYX2SfAOktt7HVaMJxSqJbfuGdAPE42oeKNOY4kwF
	 DnbRoFALI+WE6Mbk8KC0RFKMfuEh88TmUcJFfhLMvdXHAxDj9lHYmrPpy5TxWtIDD9
	 ya03Ze4vQA4BSbq85kTmbrxbaahPA5SNaBYxiJi+02dTPJpOyRnSFC8Bx/SJUr2ZYL
	 Cdd4G1+bYtAy8AT0rOie/LzDTGluE3P2arXMryiE4HvtqegTpWhjoi0JazlwmxiMMc
	 bVdRlpfpM2qTg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8MxSffPpFX
  JBqf+cFpcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBkNn86zF0znrrh8SqmBcTJXFyMXh5DAE0aJ
  Hcsb2SCc60wSe07fYupi5ARy9jBKTH5rAGKzCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPe
  xcjB4ewgKvEqlOlIGEWAVWJtguzGEHCvAJOEscbU0DCEgIKElMevgfr5BUQlDg58wkLxBQJiY
  MvXjBD1ChKzL7czAJhV0jMmtXGBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVoXpxaVJZapGtorpd
  UlJmeUZKbmJmjl1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZm5yTopeXWrKJERiIKcWpr3cw
  Hlv2R+8QoyQHk5Ior1T3qmQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryXQXKCRanpqRVpmTnAq
  IBJS3DwKIlAtPIWFyTmFmemQ6ROMSpKifN2TgRKCIAkMkrz4NpgkXiJUVZKmJeRgYFBiKcgtS
  g3swRV/hWjOAejkjCvOsh4nsy8Erjpr4AWMwEt/nBoJcjikkSElFQD06mjqocei8+bOHvtilq
  l42k7VGVmZ6vfmOL20Cf9sr6qscbZPXYvPjOHc9bZpFgvzyw7OdWle925/f+ZX1uEP72h+P2G
  TrXsnu8vlqovEnok32QTu+VT9jbjar5Vmtc/74/kZz7wT9RVqvMsk/nWR6kH3rIdPXAybeu67
  2/anRsPPuF/2V3FctHv1ur7IT/yHs7duEXlnOvG549/ewSWOPqKi+ewycz9aXVhuQ6Tr0eavd
  vhtpRXfQwTfxiY3Nt5LqyX63ZCxSoD/bbN/x7JVs7gV9/scF1d+qe1ZtaxIJc+03Wzl4u/+bz
  QcIfU7weqR9t3OT8xk2Y4sbqNYz/L53thr1Vi173jLo6LMWYRnKPEUpyRaKjFXFScCABqA/7C
  PwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-728.messagelabs.com!1672123131!306928!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 389 invoked from network); 27 Dec 2022 06:38:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:38:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 994671000D5
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:38:51 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8D0621000D2
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:38:51 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:38:49 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] metacity: upgrade 3.46.0 -> 3.46.1
Date: Tue, 27 Dec 2022 14:38:14 +0800
Message-ID: <1672123098-31844-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100260

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Improve switching between windows of same application. (#26)
- Fix crash when background pixmap has non-default depth. (#34)
- Unminimaze child window together with main window. (#31)
- Updated translations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../metacity/{metacity_3.46.0.bb => metacity_3.46.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/metacity/{metacity_3.46.0.bb => metacity_3.46.1.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.46.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.46.1.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/metacity/metacity_3.46.0.bb
rename to meta-gnome/recipes-gnome/metacity/metacity_3.46.1.bb
index 2760d73df..3ada6515f 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.46.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.46.1.bb
@@ -23,7 +23,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 inherit gnomebase gsettings gettext upstream-version-is-even features_check
 
-SRC_URI[archive.sha256sum] = "4ba777e938547bfccbf9acca0967574c46643022e054c93a033419cb3cc7c1ec"
+SRC_URI[archive.sha256sum] = "00ba49f7612088f2b3baeca79c45eb2a30423c2e4a7bea4015872beae25dd6c5"
 SRC_URI += "file://0001-drop-zenity-detection.patch"
 
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
-- 
2.25.1



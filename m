Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864ADC7EE2D
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 09:59:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.103508.1683539972068876318
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 02:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lT8epAey;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683539969; i=@fujitsu.com;
	bh=rUd1VEav2l6je5D5p5/n88pe+qw0L05Ly/8VZ00tsRM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=lT8epAeylh/gR8fG6qm9a8sTNvG/gtCJVq49SsVX5QMDKDHgGO/1N4QJxIQ2UxNCx
	 ImrXgHY3TH9T1DU4HxmziGXPWsxAxqr+7Z2f8LXB0JDDFcW2BZyQwBTRo5+El8vJIM
	 hwpoMrQYqHQ5mrlqKHWH7uxC96L4rRyHau8inwfktIXh/3T7PNvD98udN32pZsk9nH
	 cDDDavjd1Ytmepp+wCR3j8eNTr/XMNZMELHHznANalInifs/6OsWCtDehhwFAlZpKo
	 XD2pargHopedJlwahliorQbo3/iTKfApNzIA8uRG1YaFsR5D6lXyI+0cu4c/MhVnCJ
	 WCa+WKXtGEJNA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRWlGSWpSXmKPExsViZ8ORpMt4IiL
  F4H6roMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHy51G2gi6hij/np7M3MN7n72Lk4hAS2Mgo
  0XDqHROEM41J4u69lWxdjJwcbAJqEtNv3WAFsUUEdCU+fpjLCGIzC6hIzJh8hAnEFhZwlti27
  Qw7iM0ioCqxbt5OsHpeASeJXzO6mEFsCQEFiSkP34PZnED1qy6fBpsvBFSz6c9HdogaNYmr5z
  YxT2DkWcDIsIrRtDi1qCy1SNdCL6koMz2jJDcxM0cvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+
  4Mjc5J0UvL7VkEyMwJFKKlbp2MPbt+qt3iFGSg0lJlNf0YFiKEF9SfkplRmJxRnxRaU5q8SFG
  GQ4OJQnetm0RKUKCRanpqRVpmTnA8IRJS3DwKInwyh4BSvMWFyTmFmemQ6ROMSpKifMuPQaUE
  ABJZJTmwbXBYuISo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeapDxPJl5JXDTXwEtZgJa7H
  85HGRxSSJCSqqBifUjV+O2VW+XMPp9l0tvkdg5VeZ0+RX5rpTrCwvTpJX6zu9Ycnaq3JyIS0c
  jaqruJJQfq1y1+5014xwb50MX/plkmU+tf8CQM/3IK4E9nCJHJ52137Or+DdT40pWGb1Fzq/3
  qLLxHOTXfVr5bleNx5Zz8xbvNt3wSSAyoG3ObI2Y3Nqbv/89+tfkrbXjYHtdfMQ9ExEJg7krb
  ll0eZWtsbcXb3CxZHqWk9FWfF6ofM0ssf1tSjPqWT8vEt4eZh7bvWJypUbOPJ79a1TViw7sZP
  P3WJD5akVvzfomh9/a6mfkNR9yKM7tYE92zpykKbHs7eb5iw7Kb+nz2qyY/fXk/X0/5kxw49o
  SGnX7kXvUeyWW4oxEQy3mouJEAKBusb0EAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-565.messagelabs.com!1683539969!180093!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8863 invoked from network); 8 May 2023 09:59:29 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 09:59:29 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 062E01D2;
	Mon,  8 May 2023 10:59:29 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0F5041C2;
	Mon,  8 May 2023 10:59:27 +0100 (BST)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] appstream: upgrade 0.16.1 -> 0.16.2
Date: Mon,  8 May 2023 17:59:14 +0800
Message-Id: <1683539957-25094-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683539957-25094-1-git-send-email-wangmy@fujitsu.com>
References: <1683539957-25094-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 09:59:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102381

Changelog:
=========
Notes:
 * Due to a past mistake, AppStream until now assumed xml:lang was
   using POSIX locale, while in fact XML locale need to be in BCP47 format.
   Most of the translation tools do this correctly, but notably msgfmt
   when used in batch mode doesn't (which affects anything using Meson's
   i18n module). AppStream is now behaving according to spec, with some
   fallback code in place, but please check your XML is translated
   correctly to ensure all translations are visible.

Features:
 * Add API for asking whether the pool is empty
 * Add DDE to known desktop-environment list
 * validator: Check if Release Description is inside description tag
 * Make AppStream use BCP47 for locale in XML data

Bugfixes:
 * Add missing standard::is-hidden attribute to file search enumerator
 * spdx: Accept brackets in spdx license expression check
 * introspection: Bring back AS_FORMAT_STYLE_COLLECTION into its enum
 * compose: Fix crash in asc_l10n_search_translations_qt()
 * compose: Set lower-cased CID for synthesized components again
 * Don't crash when non-YAML documents are read as YAML

Miscellaneous:
 * sanitizers: Allow null-dereference check again

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../appstream/{appstream_0.16.1.bb => appstream_0.16.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/appstream/{appstream_0.16.1.bb => appstream_0.16.2.bb} (93%)

diff --git a/meta-oe/recipes-support/appstream/appstream_0.16.1.bb b/meta-oe/recipes-support/appstream/appstream_0.16.2.bb
similarity index 93%
rename from meta-oe/recipes-support/appstream/appstream_0.16.1.bb
rename to meta-oe/recipes-support/appstream/appstream_0.16.2.bb
index 50d8cdb4c2..1c117e99c6 100644
--- a/meta-oe/recipes-support/appstream/appstream_0.16.1.bb
+++ b/meta-oe/recipes-support/appstream/appstream_0.16.2.bb
@@ -25,7 +25,7 @@ GIR_MESON_OPTION = ""
 
 SRC_URI = "https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz"
 SRC_URI:append:class-target = " file://0001-fix-crosscompile.patch"
-SRC_URI[sha256sum] = "77e274e163db1f0a1bec8f4134b1d0f31e9c0a8c54cd37f724a7d30a71cf41d2"
+SRC_URI[sha256sum] = "f9cb80bd388fbf06be268afa7f2d65863c85d605ad874b905094f3982d03f232"
 
 S = "${WORKDIR}/AppStream-${PV}"
 
-- 
2.34.1



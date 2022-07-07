Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 075F3CCA479
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 06:59:33 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.2731.1657177169485969076
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 23:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=mwM/mEig;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657177169; i=@fujitsu.com;
	bh=BC8vClcDA9MwZuyjNXVvsRTcAkyVuF1WuUoQyF1Dcig=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=mwM/mEigFsBti6E6ruYKGPmXU/qXLUmP5s9MuIbVMGNPGwtIj6YRiDGJRHy5jqJ36
	 jhROFc0ZQgoDQzZdqfmTxd3K45F987t+on1h3J4xZUIF73qMO+8UIbfkixU23Ib2VJ
	 KkNUR7b/tYQjM/7TSnTIZV1+J7pK2jswKNoz3fjgdRW3z8krSfNVjseRoRZYnyNjOA
	 B51jOa1dx9tm6lj7MWOv4HvafdKE8rqNlM7cMaBJQRAfD890QnOiSsIg8/QGVEvq/v
	 Y7x2okI9SI63SXiu9+WZnjo/O08wi229iEb4bEcnceGeW1yUg9ZR2ojG/w+t2/3016
	 N4odfuTFgR0DA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCIsWRWlGSWpSXmKPExsViZ8ORqBvQciz
  J4MZLNYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaP3Vy9TwQGuipXzVzI3MG7n7GLk4hASeMIo
  cWfWPjYI5zqTxKqvHxghnN2MEg/mv2fvYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  rAaYQFniXO7HgLFOThYgOLbz9SBhHkFnCT6v5xgA7ElBBQkpjx8D9bKCVR+8NRdFhBbCKjm9d
  J/7BD1ghInZz5hgRivKdG6/Tc7hC0v0bx1NjPEHEWJ2ZebWSDsCokZM7ZBzVeTuHpuE/MERqF
  ZSEbNQjJqFpJRCxiZVzFaJRVlpmeU5CZm5ugaGhjoGhqa6prqGhmZ6iVW6SbqpZbqlqcWl+ga
  6iWWF+ulFhfrFVfmJuek6OWllmxiBAZ9SjHrwx2Mi/t+6h1ilORgUhLl9ao/liTEl5SfUpmRW
  JwRX1Sak1p8iFGGg0NJgpe/CSgnWJSanlqRlpkDjECYtAQHj5IIL2MzUJq3uCAxtzgzHSJ1it
  GY48OhK3uZOWZ+bTvALMSSl5+XKiXOew+kVACkNKM0D24QLDFcYpSVEuZlZGBgEOIpSC3KzSx
  BlX/FKM7BqCTM2wkyhSczrwRu3yugU5iATlmWfwTklJJEhJRUA1M1S9/+p1lzNB+2J76/6Mp+
  ZX3wAnUl3UmCrgekrHpFk95t55/n2cJtZ17v+17zkWDRuw3scvGSwkysK2LvvViUcnJbU8/a9
  FZPixWOyev/8gTs8jwsW+bvfvWRRZXoEunl0p/62hMTzI7PvPJ444GVAhJ/c9uLXL/KfZ70yu
  RdWMt8i31tB5aYpax48cPjvzdn9YHukOsGIczLDjsem3IoPnenyLkFyldksrb+k/6z9LPRXqk
  727j/bpSYWCp9X2Kf7bsvIoHfl72cdureMRnLFjaF/SsMJzLd94nKyq1eF3Qg7tKeFWYBxu//
  LPhcPbfspEMJl+wsf+fdex0KVxmJ2fUc/ug2JV713OxbS22UWIozEg21mIuKEwEJGr+RhwMAA
  A==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-591.messagelabs.com!1657177168!65759!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11525 invoked from network); 7 Jul 2022 06:59:28 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 06:59:28 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4169C100192
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 07:59:28 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 358C1100043
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 07:59:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 07:59:26 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] nautilus: upgrade 42.1.1 -> 42.2
Date: Thu, 7 Jul 2022 14:58:57 +0800
Message-ID: <1657177137-28347-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657177137-28347-1-git-send-email-wangmy@fujitsu.com>
References: <1657177137-28347-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 06:59:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97741

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Close broken link message dialog on response (Ant=C3=B3nio Fernandes)
* Fix crash when opening new window from pathbar (Corey Berla)
* Fix remote filesystem check (Corey Berla)
* Translation updates (GNOME Translation Project contributors)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nautilus/{nautilus_42.1.1.bb =3D> nautilus_42.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_42.1.1.bb =3D> nautilus_42.2.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_42.1.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_42.2.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_42.1.1.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_42.2.bb
index 6d942204f..f9c2ed020 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_42.1.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_42.2.bb
@@ -21,7 +21,7 @@ inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] =3D "8519d4565e842aa3d31d0fe39b21d48ac54edc0f0658fe1d8ea2da4e704c1b66"
+SRC_URI[archive.sha256sum] =3D "99212d2eb75996f181728ad04a2e2d86f2577b064e68a34c8b81a7037df4ccb2"
 
 REQUIRED_DISTRO_FEATURES =3D "x11"
 
-- 
2.25.1



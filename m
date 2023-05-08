Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFCCC77B7F
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:02:58 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.103565.1683540176095916713
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fKnu68bi;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540174; i=@fujitsu.com;
	bh=VyaP748kItZEfOGjwj6TfG8i8zp2JmRD47yXfrQ//iA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=fKnu68biDZ5wMtLmqdJbs+TE+heHN5HYg7GRFM87gkawDx4SyRZHT33poUWRAb+cA
	 M+qkm8alpdaxZNodR/D2lCSV/gKgvlyvOgzGGsGrf5ycBJTlbGLJXW0PcMmZbnef/S
	 HSgK00T7nuJNAYUO12PpaMdp15CI1kd2ndZP+uG5Jbz8aM7qwGHwtofgQ6+JlYJq8N
	 AjF4w39fIeGP+cmTase9FkdQmcFI/+JEEj0W/QVAJZalLuGLwaedo6UkbZ5O7z/M7m
	 fTiTICULGp/zh9xbQ1fo9JU8VF12x0deXi1khmsQS5TYni0kduYwsTK5ZCtVL7bnjA
	 Pgf5+/5FEiTEA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNLMWRWlGSWpSXmKPExsViZ8ORpHvuRES
  KwcblLBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aZ154FlzgrfsxZwNTAeJ2ji5GLQ0hgI6PE
  5oZ17BDONCaJe1d+snQxcnKwCUhITN97kh3EFhHQlfj4YS4jiM0soCIxY/IRJhBbWMBG4v21F
  WD1LAKqEuunTmDuYuTg4BVwkni9LhckLCGgIDHl4XtmEJtTwFni7I0HYGOEgEoe/T7DBlGjJn
  H13CbmCYw8CxgZVjGaFqcWlaUW6ZrrJRVlpmeU5CZm5uglVukm6qWW6panFpfoGuollhfrpRY
  X6xVX5ibnpOjlpZZsYgSGQ0ox+8YdjI27/uodYpTkYFIS5TU9GJYixJeUn1KZkVicEV9UmpNa
  fIhRhoNDSYK3bVtEipBgUWp6akVaZg4wNGHSEhw8SiK8skeA0rzFBYm5xZnpEKlTjLocHw5d2
  cssxJKXn5cqJc5behyoSACkKKM0D24ELE4uMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmrQ
  ZZxZOZVwK36RXQEUxAR/hfDgc5oiQRISXVwJST8Oy88tEC/3fFJlJhV3dudg9hNLybninH1+7
  dV3Vz5aHve1L9Zbfu95LujCy2X/Jr7grxSyxNMi4VTIxsB//dfSK7tl3r/P4LFSfF++q7P1ou
  Fpse9oDDNkRt0suGz+tKl2cVpYk+6NSo3KKpxaYyhf1WTAbXxtYHJyQ+Nb4Q/mM/w0Xiv0nzt
  5NNa8yebF80edPZftGfny84b717tPhQ8WabCvePBxpte/dN7EmKcQ4yEK35ekpadGJvc2n1h+
  XlHuFOkdvfKfLV8c6+7S6Wbde18lDY92s3TXLLZ/94LRe02fO99ptPe+OcN733X/FJ3zRi18J
  U4a18c9cr/XHMnp9555zXRstvVz2NPiqxFGckGmoxFxUnAgDtBarmDgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-591.messagelabs.com!1683540173!498015!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31954 invoked from network); 8 May 2023 10:02:54 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:02:54 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id AF78F1D2;
	Mon,  8 May 2023 11:02:53 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D6A571C2;
	Mon,  8 May 2023 11:02:52 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] eog: upgrade 44.0 -> 44.1
Date: Mon,  8 May 2023 18:02:39 +0800
Message-Id: <1683540162-25172-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683540162-25172-1-git-send-email-wangmy@fujitsu.com>
References: <1683540162-25172-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102386

From: Wang Mingyu <wangmy@fujitsu.com>

Bug fixes and improvements:
===========================
 !150, EogImage: ref priv->anim to avoid double free issues
 !152, EogImage: Do not leak animation iter
 #288, segfault when switching between animated webp images

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/eog/{eog_44.0.bb => eog_44.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/eog/{eog_44.0.bb => eog_44.1.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_44.0.bb b/meta-gnome/recipes-gnome/eog/eog_44.1.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/eog/eog_44.0.bb
rename to meta-gnome/recipes-gnome/eog/eog_44.1.bb
index c95d0e6533..fad7de6b28 100644
--- a/meta-gnome/recipes-gnome/eog/eog_44.0.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_44.1.bb
@@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspection gettext mime-xdg fea
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[archive.sha256sum] = "41d85fab05c430898dbfd847e48e1f5b4935dc3cbcee546e759a907eda671054"
+SRC_URI[archive.sha256sum] = "e2c963f232fe5a1091dcc18bec25a730e91b02af6e466601efa55e500cd74cab"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.34.1



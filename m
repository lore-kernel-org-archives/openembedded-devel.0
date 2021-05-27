Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web09.3528.1622097729106456700
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 23:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uvj/Jgrs;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622097726; i=@fujitsu.com;
	bh=dTzC3haC9zVmj2DSOJn/aFmJjIHJIcMw2dQohJWn+0s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uvj/JgrsVkE22X+/YKiOzIWq8ikuBL4Gu+QgCfz1EKSztTrPtUILALFV9SLt8GywS
	 uzWQJLm4h7stkFYYtt35ZE8LhDPAjgZMevjTw+61DWj9OATz54C8pB9WzS6fL0jHIs
	 MZ3lkHlSw1xPQhRDWexTtO60+eTWHhRDP6c5yY9/JIHVvZp2JewupTkxfHKjIDSAbQ
	 iY4R6KJeqBpEHtj4ANjKy2x5n9rU2HolZJ0Sm6fGJrPT+vDvB0EtpZ9cvS+5l4vZvI
	 kL2dj/yi7AvlrAPmjH2wJ546mADp0/T5UXvtu0iZuUbn/FLHhqxM+M9eVrad2UxpFs
	 XttaRhrsrlJeA==
Received: from [100.113.4.24] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 52/50-38619-E3F3FA06; Thu, 27 May 2021 06:42:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+EI0bW1X59
  g8PWlocXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrF+4y3GgoecFXvmnGFrYPzN0cXIxSEkMJtJ
  4v7rw2wQzglGiXNrNrN3MXJysAnoSHS86GYBsUUE9CWWzt7DDGILC7hLrOraClbDIqAqMauzH
  SzOCxSf9aoBLC4hoCAx5eF7qLigxMmZT8DmMAtISBx88YIZokZRYvvOMywQdoXEjBnb2CYw8s
  xC0jILScsCRqZVjJZJRZnpGSW5iZk5uoYGBrqGhsa6JrpGBqZ6iVW6SXqppbrJqXklRYlAWb3
  E8mK94src5JwUvbzUkk2MwFBKKWQ5u4Pxy+sPeocYJTmYlER5J+isTxDiS8pPqcxILM6ILyrN
  SS0+xCjDwaEkwVtnB5QTLEpNT61Iy8wBhjVMWoKDR0mEd6I1UJq3uCAxtzgzHSJ1ilFRSpz3h
  i1QQgAkkVGaB9cGi6VLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR51UCm8GTmlcBNfwW0mA
  losVDiOpDFJYkIKakGpjlS7sc0PsxeVvB25ezcq/8WZz5wKOXdkCu2Z9LNfYpRAm2vz7T+nT5
  1S3xVLXdXhu4C3dvMxc/f1u98FdCnxyrNLir12/fjxM5zgU+iOwQe3n/94+GSWfH5VXJ/ZzAY
  26le6wsO/rs/a+Ox4HtNi+0erLG+LxJf2LzufGPxvNc/J9iJungUrV6d+vWbk7xk48wDwgXrI
  /lZH13fUsa+0ajsm90Wv79bt6+x4V1oFD+59FKSLdduOY5p6nPmqTazxUyaVGrPPH96nZF5aq
  730hzBRT8iCvJr9xgKZnPY851R5pvv1CPM/T49YFad9+aQh3mtLRcuN3nMvsL14++/8zm5qhs
  zFrSEnKleN9/umBJLcUaioRZzUXEiAIogT+kgAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-245.messagelabs.com!1622097725!127291!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6774 invoked from network); 27 May 2021 06:42:05 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-14.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 May 2021 06:42:05 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14R6g5ce001100
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 May 2021 07:42:05 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 27 May 2021 07:42:03 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-gnome] [PATCH] gnome-autoar: upgrade 0.3.1 -> 0.3.2
Date: Thu, 27 May 2021 14:41:57 +0800
Message-ID: <1622097717-10416-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{gnome-autoar_0.3.1.bb => gnome-autoar_0.3.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-autoar/{gnome-autoar_0.3.1.bb => gnome-autoar_0.3.2.bb} (66%)

diff --git a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.3.1.bb b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.3.2.bb
similarity index 66%
rename from meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.3.1.bb
rename to meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.3.2.bb
index 5e833a91ac..8eba859419 100644
--- a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.3.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.3.2.bb
@@ -9,8 +9,8 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gtk-doc vala
 
-SRC_URI[archive.md5sum] = "3149496d0189623a8e1289bbab4d8385"
-SRC_URI[archive.sha256sum] = "0e78713e6f0de339fdee16bab82753ae290fe80fa7b4ba6e3db8c1465b81d0f8"
+SRC_URI[archive.md5sum] = "3c8da1a8489255f2aaa5fdb690308e5d"
+SRC_URI[archive.sha256sum] = "a48c4d5ce9a9ed05ba8bc8fdeb9af2d1a7bd8091c2911d6c37223c4f488f7c72"
 
 do_compile_prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/gnome-autoar/.libs"
-- 
2.25.1


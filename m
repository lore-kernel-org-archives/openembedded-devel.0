Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05836C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:31:43 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.29533.1652085101026693655
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NIsrQ8c+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652085099; i=@fujitsu.com;
	bh=5ydHzR97FBVkChvVlO4aqOh9oKeQlCRYObaIJOZ4Z/I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NIsrQ8c+hxCMWNrXHJjuA1qB6zO4+Yme9toERjJyPHge97Hp7heC9L+Aqy+eo+nYI
	 dxLXp3naIPNjxnsSz3BAe9jUK6IOZdMkOT5RWOhjoPGAJ2ObcMJxTliTYhBOKA6eBK
	 JkK+jZPeq986DV1Me4cs/uE6AOQh+I4uJdFRyohSNVjFkhVCaP1E+jQ6OWasLm75YQ
	 vTUGQ20txASIk7UDaNegqnrMH1uaNGcivpzUosD1Q9YTlxjcMcb1ynE25klbwY1ReF
	 WiJ6bdgRJEWzC+TQcaogH/q9/LNjVE9JwpGseI+lA9PgMXQSrihbRYvJY9Gn4130dS
	 D1a6IyUb6BmiQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRWlGSWpSXmKPExsViZ8MxSTfrYkW
  SwasPxhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a2y0dZCs7yVjyY3M/SwPiHq4uRi0NI4Amj
  xIU5X1kgnAtMErcedLNBOLsZJdZ03gByODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFnCWuLV7MVMXIwcHi4CqxLzObJAwr4CTxKP3m1hAbAkBBYkpD9+DtXIClS9u7gVrFQKq6W
  9pYoaoF5Q4OfMJC8R4CYmDL14wQ/QqSsy+3Aw1p0Ji1qw2JghbTeLquU3MExgFZyFpn4WkfQE
  j0ypGu6SizPSMktzEzBxdQwMDXUNDU10zE10jE1O9xCrdRL3UUt3k1LySokSgtF5iebFeanGx
  XnFlbnJOil5easkmRmAwpxQ7fN3BeLzvp94hRkkOJiVR3sqmiiQhvqT8lMqMxOKM+KLSnNTiQ
  4wyHBxKErwh54BygkWp6akVaZk5wMiCSUtw8CiJ8N49AZTmLS5IzC3OTIdInWLU5bi7cO9eZi
  GWvPy8VClx3lvngYoEQIoySvPgRsCi/BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV7fC0B
  TeDLzSuA2vQI6ggnoiI8BpSBHlCQipKQamGqXC7Ms/ZuZ/iqqvK33C2P1u2+MRw1vdl69/EZK
  ZMayu2Zn1iy+IF/nc21JsPDuex4iHTOneTndVHh1qJvX9s7DtNu1C/Ylpsfc+/xGcta9mu6Zh
  Q4CW2Kfch5dFqL814Cj1rXvSkZWBG9a81TFrhchwU0Jcac2hc39br3+uDCH6smZIuccBOfulL
  2+JHr648CepSufz21i3nfhsnOrkVZ6qsZJSY0OtbQdCot+zS02vP2my7CQbWXeQ5YJJzfbhBT
  o1V6KKjh41kf3zqvWF+lL9v9mjPM/+rVy9unly1lE/5/4U/j8gPo7hpPzl2cL3vt0M1PrPNfc
  Dc4XZ8/81d4bULh8/vEzJtG7RQ1ZOkOVWIozEg21mIuKEwHMYI9BbQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-545.messagelabs.com!1652085098!461387!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24485 invoked from network); 9 May 2022 08:31:38 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:31:38 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5CBB3100446
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:31:38 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4FF9710032A
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:31:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:31:16 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 22.04.0 -> 22.05.0
Date: Fri, 29 Apr 2022 16:13:12 +0800
Message-ID: <1651219993-27514-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651219993-27514-1-git-send-email-wangmy@fujitsu.com>
References: <1651219993-27514-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:31:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97005

Release 22.05.0:
        core:
         * Annotations: Make sure we embed fonts for the FreeText annots
         * Forms: Make sure we embedd fonts as needed
         * Signatures: Make sure we embed the needed fonts
         * CairoOutputDev: color type 3 fonts
         * fix two bugs in multiline find_text()
         * code improvements

        utils:
         * pdftotext: added TSV mode
         * HtmlOutputDev: don't use png.h

        cpp:
         * Use time_t for time
         * Add page_transition::durationReal

        qt:
         * Pass leftFontSize down to 'FormWidgetSignature::signDocumentWithAppearence'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poppler/{poppler_22.04.0.bb => poppler_22.05.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_22.04.0.bb => poppler_22.05.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb b/meta-oe/recipes-support/poppler/poppler_22.05.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_22.04.0.bb
rename to meta-oe/recipes-support/poppler/poppler_22.05.0.bb
index b7cdb4f1b..9a7d9ef00 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.05.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "813fb4b90e7bda63df53205c548602bae728887a60f4048aae4dbd9b1927deff"
+SRC_URI[sha256sum] = "a969ced458e050d6202367bd7427054e2bd19bae39e8f969910d3b9151abf958"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.25.1



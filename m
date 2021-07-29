Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.6326.1627542673075756919
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 00:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=c3Q5KDv6;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627542670; i=@fujitsu.com;
	bh=fMLB0GciPE7NYE6WMHLBEH/T4Ab9nDYiuTkfjlyX3Jw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=c3Q5KDv6YqkiiAJmlEMAG0tj7YzktRcbSVQoxSzaxYCgEOkVN5GjARJ798DsyRHwi
	 P0HNNbOjxFb21hGFacATuL+todNRFjTtQKDJ72g6yNNeK/3Z+LYiUuIkuAVsqUhfoF
	 4ocFMj+iPRV+H2SsKe0rXmxbOe1OXheq7gejCFuWc7OoU0hgbnCboGPTLZLRQhp3Gh
	 MBs3ZQBfOdAQlL/AxJtR3R5wRNkGQnPDVFXdYQaNUMeBcB0+PaPZyyDWvTYnEDWznG
	 dUFj5Q6dEKLlkXfc/FIhwxkUZEFZBPBFV7qV72uEqD2vnCBiqsyOSxE4J9LBzpLU+9
	 4O4XTDyBFdUEA==
Received: from [100.113.6.138] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id FC/D5-25437-E8452016; Thu, 29 Jul 2021 07:11:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxRbcvhCn
  RYONiVouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePXkf3MBac5Ku5uncnSwPiJvYuRi0NIYDaT
  xMrl+5ggnBOMEpO/9LB2MXJysAmoSUy/dQPMFhHQl1g6ew8ziM0soCLx4ncPO4gtLOAoce98I
  1icRUBVYv6dH2wgNq+Ak8Ty84/BbAkBBYkpD9+D1XAKOEs0dj0HWsYBtMxJouW5HES5oMTJmU
  9YIMZLSBx88YIZolVRYvblZhYIu0Ji1qw2pgmM/LOQtMxC0rKAkWkVo2VSUWZ6RkluYmaOrqG
  Bga6hobGuqa6hqbFeYpVukl5qqW5yal5JUSJQVi+xvFivuDI3OSdFLy+1ZBMjMCBTClln7mD8
  9PqD3iFGSQ4mJVHeX3ZMiUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeM8EA+UEi1LTUyvSMnOA0
  QGTluDgURLhFQoASvMWFyTmFmemQ6ROMSpKifOKgvQJgCQySvPg2mAReYlRVkqYl5GBgUGIpy
  C1KDezBFX+FaM4B6OSMO+jIKApPJl5JXDTXwEtZgJaXFvCCLK4JBEhJdXA1BjSoxxxbd6hed4
  Ps/8LNrNbcOY2bN/Va3xQI3q74f+tenufTJ6fXhJ3Sf/s573mzFF/c6wlu+PnBU8xFmJVmJl6
  tO631hMZ/aSai+JNZ9p/PtXsmfCzcrPTN9aFe1vOK608+H7FwamHxe7VTXm0dcqVep+mjR33F
  LX0rEJFJJaayVlPyhLKiLw480XuobQ3nC5i7d9We5nf4Qu6ZNYob5TrqewbqjFTYOfd6dxP9N
  +ZP9f9xMNaYvRQS0NsyZqDxtJ2jHNMH3tVPtc7WBnmuOJjo+FGMQUXg1l3pvD8kfn0eprL+tg
  nM6W+/V+zkU9u4l8bB8nDaXcF1I84fPpZJybEExRmUTkzTZGpWOaFEktxRqKhFnNRcSIAy/CQ
  tUMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-245.messagelabs.com!1627542669!141163!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17510 invoked from network); 29 Jul 2021 07:11:10 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-8.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Jul 2021 07:11:09 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16T7B9qH031620
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 08:11:09 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 29 Jul 2021 08:11:07 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libmbim: upgrade 1.24.8 -> 1.26.0
Date: Thu, 29 Jul 2021 15:10:49 +0800
Message-ID: <1627542649-24816-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1627542649-24816-1-git-send-email-wangmy@fujitsu.com>
References: <1627542649-24816-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libmbim/{libmbim_1.24.8.bb => libmbim_1.26.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.24.8.bb => libmbim_1.26.0.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.24.8.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.26.0.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.24.8.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.26.0.bb
index 6a8d2405e0..d6b812c2ab 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.24.8.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.26.0.bb
@@ -12,4 +12,4 @@ DEPENDS = "glib-2.0 glib-2.0-native libgudev"
 inherit autotools pkgconfig bash-completion gobject-introspection
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "02590736163fff10e5732191fccc1b9920969616ddc59613a003052a116a3c25"
+SRC_URI[sha256sum] = "1e1f0926b22c77210442129eca689722ecf324ab9c9abf421a5c989f46e813cf"
-- 
2.25.1


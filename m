Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web12.8566.1619071155168821256
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 22:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YR4w+Efu;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619071152; i=@fujitsu.com;
	bh=0AuvRUvCYjtevUSKrZNZawvNrPvLSkO0J0SHOAgka10=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YR4w+EfujoB0osjweFojW1Poyl28dsqbG8GnJv7Q9PfCcloZKN+DSQT9G0Kwbn51w
	 fvQg8v4Iu6Hh7wkWWP3KpZISCqNZ1fD65ZWylRR+oVdcEUPgnOUiV8PyCRTAlRuvOt
	 9K853AMAXeL2kcgZLvEsQcGWyLy9hLYpXPhg1bwMrcqQnIvMoU4xLZ7mYbDMPKjAn9
	 cXQYciMZbk0x2yRmOak7BNbcKHaiI2hJHJXCFG3AHMxnONYvQEXw3TIevmHcItmHat
	 tauA7cTMq0gysi9czCRh9b0CYrRm2FvPq2CcQwOidPMylfL2sH4mf218992kxzRor4
	 NFsjPSzyuCzvQ==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 22/97-23163-0B011806; Thu, 22 Apr 2021 05:59:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRqrtBoDH
  BYEefusXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrGzNbxgNXvFnld9LA2MR9i6GLk4hARmM0k8
  f/gCyjnOKLHn6memLkZODjYBHYmOF90sILaIgL7E0tl7mEFsYQEHia6u+2A1LAKqEi1TvjB2M
  XJw8Aq4STx9yQ0SlhBQkJjy8D1YOa+AoMTJmU/AxjALSEgcfPGCGaJGUWL7zjMsEHalxPZpZx
  knMPLMQtIyC0nLAkamVYyWSUWZ6RkluYmZObqGBga6hobGuua6RqZGeolVukl6qaW6yal5JUW
  JQFm9xPJiveLK3OScFL281JJNjMAwSilk/7OD8frrD3qHGCU5mJREeRfyNSYI8SXlp1RmJBZn
  xBeV5qQWH2KU4eBQkuA9ApITLEpNT61Iy8wBhjRMWoKDR0mE9zcvUJq3uCAxtzgzHSJ1ilGX4
  8qqJYuYhVjy8vNSpcR5d4LMEAApyijNgxsBi69LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlY
  R5z4JM4cnMK4Hb9AroCCagI7Sn1IIcUZKIkJJqYDqyrCQ8iuXut9vh2+cJyNs/eSl4Mu36ere
  6wxJH3u8tTGCt9Dxzd/LSc7Zi5de0N2/RdJ3n9nHJ7mmnNnkcujHxBtfuWbGyrj5HH8cdOKn7
  wdLK+/Wbn/Epk2fpzFJ9EXTjLF/U/IMtBXaxs+brH89ObtV6c6n8x8l3FdfqXO4mru17ffrx4
  eNJd6XLT594wlK/XnTKys7YwH8Zvzat4+I7HlFwqEfKbEvdc48sCUPpXwfstTpW3dQ9oX08fz
  lLk/6GeYr+0xQXCM7d2r5NXUFjmsivuXbdx5evvR5avHgTn2X7qdzPmvoLNfKdFNj+8znPCW1
  UfpG7NbBjInNX8f+qWlYm5xe/RbMlKrZGTU9WYinOSDTUYi4qTgQAHYu1pioDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-245.messagelabs.com!1619071152!1931515!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29207 invoked from network); 22 Apr 2021 05:59:12 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-17.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 05:59:12 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M5xB99021117
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 06:59:11 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 06:59:08 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ostree: upgrade 2021.1 -> 2021.2
Date: Fri, 23 Apr 2021 01:59:02 +0800
Message-ID: <1619114342-5057-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../ostree/{ostree_2021.1.bb => ostree_2021.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2021.1.bb => ostree_2021.2.bb} (99%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2021.1.bb b/meta-oe/recipes-extended/ostree/ostree_2021.2.bb
similarity index 99%
rename from meta-oe/recipes-extended/ostree/ostree_2021.1.bb
rename to meta-oe/recipes-extended/ostree/ostree_2021.2.bb
index c382ad87f2..3a9574da11 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2021.1.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2021.2.bb
@@ -25,7 +25,7 @@ SRC_URI = " \
     gitsm://github.com/ostreedev/ostree \
     file://run-ptest \
 "
-SRCREV = "e9e4b9112083228b8c385ad26924b6c4623f4179"
+SRCREV = "6a72674ec621a2282043c3a083fe1e45cd6a8761"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-- 
2.25.1


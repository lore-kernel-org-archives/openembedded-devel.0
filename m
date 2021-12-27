Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBFDC433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 14:34:23 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.26910.1640615662058298164
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 06:34:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=h9W+ziWT;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640615654; i=@fujitsu.com;
	bh=+Rh5KlIMKBq1IXvbFsxtX991ssVNpE/XpgupXZe7pXk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=h9W+ziWTu0vrcs42Thxiln1zsvK7bkkuoVEHyA6rBC8dlSVXeADrYSrUO/k0+xcrc
	 9KtUu6nnDU4XhhK7IVG8SLn46fIjKgNmO2uxet6fB5v7Olk98++Y3j5soJrcLi8GS6
	 TUjOY+yOKJ8gGbGKysnpFEId/sgfPvt6rKuXOvC2+PHJc4kK4iuWksL08ue/S5Ajo1
	 7wkI14nQWo6JFRy/kbTkO8hwGYsE+UEWhHzk/p+0DUwmpdpkAqA4lznHcd+2yBS/ic
	 P+B5X9oFiWmJ7gkBEY0fNeNRI+cyEWF3ShXpITnMyra6P6uHEohn1LK7pD+uZsILs7
	 tnZq9G4IuP7mg==
Received: from [100.115.35.72] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 62/9E-09428-5EEC9C16;
 Mon, 27 Dec 2021 14:34:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqPv03Ml
  Eg1e/VC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oy2e5+YCr5zVuxsm8vUwPiHo4uRi0NI4Amj
  xK3jq5kgnAtMEusOt7BBOCcYJfa+PMvexcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  WA1wgL+Es9uHmACsVkEVCUWrZrEBmLzCjhJLHt2GKxGQkBBYsrD92C9nALOEg2H9gDVcwAtc5
  KYeNkZolxQ4uTMJywQ4yUkDr54wQzRqigx+3IzC4RdITFrVhsThK0mcfXcJuYJjIKzkLTPQtK
  +gJFpFaN1UlFmekZJbmJmjq6hgYGuoaGprrGRrqGRmV5ilW6iXmqpbnlqcYmukV5iebFeanGx
  XnFlbnJOil5easkmRmAYpxQr1O1gvLbyp94hRkkOJiVR3u8TTiYK8SXlp1RmJBZnxBeV5qQWH
  2KU4eBQkuBdfxYoJ1iUmp5akZaZA4wpmLQEB4+SCO8dkDRvcUFibnFmOkTqFKOilDjvQZCEAE
  giozQPrg0Wx5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfM2gUzhycwrgZv+CmgxE9DimQ7
  HQRaXJCKkpBqYWDq/rXW5I/fsqvWOrgWv3+5mKhFaP/HShqxMS8NisX0h6UWWe/cam5dm7ytY
  fFdH/dWzqffDBXsSyi8+WXHnvd43hV/vHxs4zu6RDSz7dP4fU+6S3Cl3pk+YuvL9Oo0Fu32a3
  aMDvpkm8l2sOv5SPnnZB8MXJpWzP55mrd/yYr6//o4yg7B3VT+SjcW+PnDfty9t660f9tVd53
  +kZaVpfJmmWRY6+0SIpvaGdeuWXb+02GZD6mSNW1ERukolK7W/G7R5FDLEbyh6UD4nQrT04dP
  b/Ufu5PM+3/XF46uW4CyVh7dr3jns6nvrq/ptru9fiUvpc2MKHPMeTBbtPzVhXl/Tqpv+L1eu
  UOWcF7ahbaYSS3FGoqEWc1FxIgACqXj0XgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1640615653!230002!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25963 invoked from network); 27 Dec 2021 14:34:13 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Dec 2021 14:34:13 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3FFCF1001A4
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 14:34:13 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 33B7110018B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 14:34:13 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 27 Dec 2021 14:33:56 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libio-socket-ssl-perl: upgrade 2.072 ->
 2.073
Date: Mon, 27 Dec 2021 22:33:24 +0800
Message-ID: <1640615604-22927-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640615604-22927-1-git-send-email-wangmy@fujitsu.com>
References: <1640615604-22927-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 14:34:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94512

Changelog:
=========
fix behavior and tests for openssl 3.0.1
fix #110 - prevent internal error warning in some cases

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-socket-ssl-perl_2.072.bb => libio-socket-ssl-perl_2.073.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.072.bb => libio-socket-ssl-perl_2.073.bb} (94%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.072.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.073.bb
similarity index 94%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.072.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.073.bb
index d49b2cd5e..ef7fd08bf 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.072.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.073.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} += "\
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "b5bee81db3905a9069340a450a48e1e1b32dec4ede0064f5703bafb9a707b89d"
+SRC_URI[sha256sum] = "b2c0b34df97cb1aa816221cee2454a1efd89b86ccbda810389a30e0d08cf57c8"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.25.1



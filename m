Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAC6C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:14:28 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.3030.1663064058336304883
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KMKI9OMp;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064056; i=@fujitsu.com;
	bh=EwiGkLWDevUPriXhuLqwt8EsaUz2zHg8Py44qJ81IC8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KMKI9OMpAqFZLOhHQwiwLT1ktwerG0uZseqtnCOBA/ikBe/q5Qx2Xw4vP7TnIJFBN
	 nZoaO4RjKWuPRngmvjk016ttu8NCQtIuDTTz5OhqcLwwwFUpvunskbM1Oscy6iIinh
	 nM6oOEZ2HnvsO9ghxrvxYOwNolYZRHuXSFw3vJEtqf26xgjHlZmX9kfNWDPdak5BFE
	 yHFKgtsc7LkktaKslyM/bqSCRdDYCLriG3DZsB3WvwYnY79WPCMU0+GHiW5IDXPy0y
	 iR1LVjylAPXgdaAeWLy0HScGisw/xzveQtKy5gVpOgJvEpzP+2oSnzNCn3ryOLD2ip
	 rUEu18YBMf+zA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRWlGSWpSXmKPExsViZ8OxWfdHuEK
  ywclXHBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bR3jnsBU2cFV8W/GJuYJzN0cXIxSEk8IBR
  4srhdhYI5zKTxOlb35khnD2MEssPn2bqYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAX+LmylOMIDaLgKrEtdPdLCA2r4CjxOuFL8DmSAgoSEx5+B6sl1PASWLHlE1gM4WAav
  Y8XcwEUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukGicfghqpprE1XObmCcwCs5C0j4LSfs
  CRqZVjDZJRZnpGSW5iZk5uoYGBrqGhqa6lpZAylIvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFiv
  uDI3OSdFLy+1ZBMjMJRTipPLdzBu3/dL7xCjJAeTkihvpJdCshBfUn5KZUZicUZ8UWlOavEhR
  hkODiUJ3vgQoJxgUWp6akVaZg4wrmDSEhw8SiK8PMFAad7igsTc4sx0iNQpRkuOqbP/7WfmWA
  4mZ35tO8AsxJKXn5cqJc470xuoQQCkIaM0D24cLPYvMcpKCfMyMjAwCPEUpBblZpagyr9iFOd
  gVBLmlQgDmsKTmVcCt/UV0EFMQAcZWcuDHFSSiJCSamDS8JvCvVHW7rd84KmlPwy2+xsXhJk1
  X5Ax4JyzwFV4/brDgpmZ841DpPUOPFqjPuWyycH5Fwr2TWRcpbBbn7XyRKPZnLqna0O/eEe07
  +L6/L/R+7S+d/uRmh7FmJK45cfrWV+4/7Hq3i5eKBlZbz/TYt2i7RYKVTKHrzctPtUX52LDEn
  jmtAbbUYsDtw5fyen/Zaz+s2vrgeI1sXfVZnMwPt1xj/Pt6Tj/X7LGavs2XWn7Pyd+m/Oy6yu
  485bEqAhzG883vLonsGlZ/8KFCo82btbKvsl95YLR48gdZx/t/PjE9gbjSkH9MP/t80uuZ077
  KCLX/edFBU/1lpXVMjo7hPXFf1sbWfztFrfSeSerxFKckWioxVxUnAgAbg96IXgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-745.messagelabs.com!1663064055!89248!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29398 invoked from network); 13 Sep 2022 10:14:16 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-11.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:14:16 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 882457B
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:14:15 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7A69073
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:14:15 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:14:14 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libio-socket-ssl-perl: upgrade 2.074 ->
 2.075
Date: Tue, 13 Sep 2022 18:13:54 +0800
Message-ID: <1663064034-3136-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1663064034-3136-1-git-send-email-wangmy@fujitsu.com>
References: <1663064034-3136-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:14:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98761

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-socket-ssl-perl_2.074.bb => libio-socket-ssl-perl_2.075.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.074.bb => libio-socket-ssl-perl_2.075.bb} (94%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.075.bb
similarity index 94%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.075.bb
index 6249fd1d78..0a88d93056 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.075.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} += "\
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "36486b6be49da4d029819cf7069a7b41ed48af0c87e23be0f8e6aba23d08a832"
+SRC_URI[sha256sum] = "c30ee2220b1e181a968ebbc81861d0cadf334b001377a44105ae5a8637ddae8c"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.25.1



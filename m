Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA92AC433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:19:22 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web09.29486.1652084352778368600
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wOEJ6epm;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652084350; i=@fujitsu.com;
	bh=hp553uob/n1xhuSAkQUwjbT2Rkqj5Iz//Ljrd8AU/Ug=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wOEJ6epmEIw7aymcFYrHKlzC3o5wE3tOOpKd0BjE7g+tflpI8E7+1+AuXENo4wdQ3
	 ETM1dJ2wc/Z8XteCL0QULTuHpb+zGmAmLYYyWlKrtu7+CnqsOryxZzuietLtb3jrad
	 qfKBdlqK9qdQ81n63PKuus+a3tjxK0fexVrjktjLRSarxLtAoH5Q4V5X8yDn+CvpmJ
	 cDVaPPbtVkU9wxKBWsBpJ9ITiPSaTEMPvhNxsQ170s3R8aX+vTrUMAAm/DeOciRsYu
	 vMVOWzGlZEKoKJ1LBabS3kdeMAs6tPr4TmyqcVU4ZUBfjNzMBuX7IWLcA2o46wxc0s
	 tjF5U6tN9ajZQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MxRbfuXEW
  SwdI3khYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bmiQtZCl5yVKyaeZO1gbGHo4uRi0NIYBaT
  xMWetYwQzm5GiVuv2pm6GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7hx3EFhbwl9hw+
  whQPQcHi4CqxJFvsiBhXgEniRmX+1lAbAkBBYkpD9+DtXIKOEtcvreZEcQWAqp5PvkkE0S9oM
  TJmU9YIMZLSBx88YIZoldRYvblZqg5FRKzZrUxTWDkn4WkZRaSlgWMTKsYLZOKMtMzSnITM3N
  0DQ0MdA0NTXVNdC2N9RKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS9PJSSzYxAgMypZgl
  dgfj1r6feocYJTmYlER5K5sqkoT4kvJTKjMSizPii0pzUosPMcpwcChJ8DqcAsoJFqWmp1akZ
  eYAowMmLcHBoyTCe/cEUJq3uCAxtzgzHSJ1ilGX4+7CvXuZhVjy8vNSpcR5uc8CFQmAFGWU5s
  GNgEXqJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvI4gU3gy80rgNr0COoIJ6IiPAaUgR5Q
  kIqSkGpicnr7RlHGIfeX+x2d7eOfh6PVKKckVC6eviXv24rXs2t3Xv3HW/lR/67639cHKXXud
  dcIWzFrptN8vM+Be3p6PxYl83msunr2qe6EoP2gbf8NG4Qm8YScvCMfOdTLZdka7QnOSv/ZMi
  wzWfSsfnHnQySywUfOwV3R7xjVXz5dXfWq+GRRqruv4rS1fcfFD+9rEnLjyLQ/5YnZsnC1w9U
  ma1D6TPqvH8evM0m2ZuNu6Q24eOhmgb7b43Oz7R/ht718zyOgINrJZc+v/Hcd7RXvYj0w/vop
  jY+OfhDStebPWP5tpFXmpR3JJ4ZMQTc6w8js5S5rtAnofMHAXP1dgXPhJgvOTlUM588pN5ofs
  rvkosRRnJBpqMRcVJwIAzCwLOE8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-585.messagelabs.com!1652084350!222467!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8646 invoked from network); 9 May 2022 08:19:10 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-13.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:19:10 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2498J4Sk032126
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 9 May 2022 09:19:10 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:19:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20220417.0 ->
 5.9.20220501.0
Date: Fri, 29 Apr 2022 16:01:11 +0800
Message-ID: <1651219273-27341-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651219273-27341-1-git-send-email-wangmy@fujitsu.com>
References: <1651219273-27341-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:19:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96990

Changelog:
=========
perl6: Add more file name extensions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20220417.0.bb => ctags_5.9.20220501.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20220417.0.bb => ctags_5.9.20220501.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220417.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220501.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20220417.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20220501.0.bb
index 0d32861c8..dd8a163b0 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220417.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220501.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "0d63a383b7b21a94d849ed01116cde0a628e95a9"
+SRCREV = "364032bec335e92ccb25b8b2bfee25012609688f"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4634C433F5
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 07:52:50 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.1939.1665215556150434281
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 00:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qSRf0C/9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665215554; i=@fujitsu.com;
	bh=Z0E+HZEgKYVyNDk0/obAyAnL6IQb6thl6xyZJK61cNA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qSRf0C/94tQ/+sp3/XX5cnKcqSk2DDrknmSIf3ZdWQjE9EjRCIj+13Kx0vrQ9crma
	 qC+lRxrUlsLqrt57rBOP8q0aEhRWk2CmXAaKGchugXpP2V+ukTr0rSpWXpOYj4H8gj
	 3BQ3uIXgRKPOA5+ADG8JgTeY6/fs/ctZThYtTeNUpkq/zHr2McTkI30Uv76rMJRUMA
	 ApINpBrPKNbCDom5taICSSCSPGSH2BLz9sHksypta4CHdVx3pfgzHRtsNuNttQ4olg
	 AAz1i6CL1zhqmv9IMZXS3I0zoGmYRphPR/ETUHfPjzHPnxR07X932uPcJ9wWp/lohY
	 DZJrZr9t0DbVg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8OxWddRxzH
  Z4NhiZouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePz/gvsBft5Kibtv8bcwPifq4uRk0NI4CGj
  xK7jaV2MXED2ZSaJ9smtTBDObkaJv4tXsoNUsQmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  1iNsICTxPxDu8BqWIDiqz9uZgGxeYHik54dZQKxJQQUJKY8fA/WyyngLPHj7XpmiCucJHZv+c
  0EUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukJg1qw1qpprE1XObmCcwCs5C0j4LSfsCRqZ
  VjJZJRZnpGSW5iZk5uoYGBrqGhqa6hrqmlnqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIEhnFLMaL2DsaPvp94hRkkOJiVR3qdbHZKF+JLyUyozEosz4otKc1KLDzHKcHAoS
  fB2qDomCwkWpaanVqRl5gDjCSYtwcGjJMIboA2U5i0uSMwtzkyHSJ1i1OWY+bXtALMQS15+Xq
  qUOO82kCIBkKKM0jy4EbDYvsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmFdCHWgKT2ZeCdy
  mV0BHMAEdYfXQDuSIkkSElFQDE5dTX5J59IT257PnNq4LltxdETfNfNXrnXY3Fhms+Ml2LtX1
  xfY1ho9+SrCv7Jc5t+60yYwDs+tZU0QfX16Z1uZhafb4yr5r9X0e7s/2/mF9mKw251L0kcMiE
  pXbr4nqpDcXH4ywfzCh89FahqNXrt3dF8pX4Tk9TyVj4rz02Vcs3X72hnxmLX5zcu38c6q6H0
  30hbqqvT3vvldamS0vcKRJPu8rd/NbRqv3T8MPrVhk9faQiGaZX8rJJ6eKLt7j4HR5oMDqtbF
  m9+l45tqLjvPWf7OVTHr66q1e3SWdxZ/X1C7KO7T01h+OpVvaj06bM6dtXqwUy36un59aKmbU
  hQa9Lf6wI3BBwvw/M2q/am5UYinOSDTUYi4qTgQAm0zoFmgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-587.messagelabs.com!1665215552!66622!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25405 invoked from network); 8 Oct 2022 07:52:33 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-12.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Oct 2022 07:52:33 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 7B28E142
	for <openembedded-devel@lists.openembedded.org>;
 Sat,  8 Oct 2022 08:52:32 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 6E8947C
	for <openembedded-devel@lists.openembedded.org>;
 Sat,  8 Oct 2022 08:52:32 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 8 Oct 2022 08:52:31 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dnfdragora: upgrade 2.1.2 -> 2.1.3
Date: Sat, 8 Oct 2022 15:52:12 +0800
Message-ID: <1665215534-23236-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665215534-23236-1-git-send-email-wangmy@fujitsu.com>
References: <1665215534-23236-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Oct 2022 07:52:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99093

Changelog:
===========
This is a bug fixing release that contains the following changes

Changed widget weight to avoid wrong behavior and resizing limitations (see issue #206, issue #207 and libyui/libyui-gtk#83)
Added logging info if metadata have to be downloaded (expiration time).
Note that MetaData update_interval <= 0 means that tha check is disabled as well as if dnf-makecache.timer is enabled
Fixed clicking to the right of checkboxes wrong behaviour (issue #203)
Performed an "escape" on description text before showing it as package information (issue #191)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dnfdragora/{dnfdragora_2.1.2.bb => dnfdragora_2.1.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/dnfdragora/{dnfdragora_2.1.2.bb => dnfdragora_2.1.3.bb} (95%)

diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.3.bb
similarity index 95%
rename from meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb
rename to meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.3.bb
index 671b8ca933..3a306ad951 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.3.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/manatools/dnfdragora.git;branch=master;protocol=http
            file://0001-To-fix-error-when-do_package.patch \
            "
 
-SRCREV = "5cbbc07c9d015af284a424a172a379b385f05b6f"
+SRCREV = "5b0f4c38efb92c9dac1d39fade5b9a3c30f20ec4"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1746C433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 11:23:25 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.42953.1635765805025091978
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 04:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=k8AIXokp;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635765803; i=@fujitsu.com;
	bh=KhofMP7OYxJBEAhiJaUro9de460FeImM/bOOij3AxpM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=k8AIXokpdYdgCmEcUfakylMEOP9ymQ2SeJ1DMxqxg27ZGkPRxNzU9gsV6vknRV7fE
	 kk5AFASLdws8+W62t+uNvcu1+zLMLzzemxlDPgGrJe/guIdab3tgbAgLYR6tttpPAV
	 1f4GPFpsQZPVmTLt6e1diTxQkIjcs4XJFhgX8UqHbl1wO48SJDhPCF7RgLCgeHoDxV
	 GcjYHekm9qJaxLj18xeQh/fJgI6nndzv85ETbw/MD+ok2pmQxFzSNcwqn32tAUwP5/
	 CjiHykiAoWKRsk88OP+LnvNRVrs+Cv82OO+rLJvxm4axdUpyXXDsokJhep9Ppdnbuy
	 3Se2Nm3CuJ+IA==
Received: from [100.112.192.69] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id B3/9E-02128-B2ECF716;
 Mon, 01 Nov 2021 11:23:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRoqt1rj7
  RYMJTG4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeN4zzrmgk1cFSuPtjE2MF7g7GLk4hAS2Mwk
  8eHYKmYI5wSjxJ9J81i6GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7hx3EFhYIllh8/
  yhYDQtQfN/ah2A2r4CTxNYff8FsCQEFiSkP3zNDxAUlTs58wgIxR0Li4IsXzBA1ihKzLzezQN
  iVEqtW9zFPYOSdhaRlFpKWBYxMqxgtkooy0zNKchMzc3QNDQx0DQ2NdA0tTXWNDE31Eqt0E/V
  SS3XLU4tLdA31EsuL9Yorc5NzUvTyUks2MQIDLKXg8PUdjLdef9A7xCjJwaQkyhu1tD5RiC8p
  P6UyI7E4I76oNCe1+BCjDAeHkgRvyhmgnGBRanpqRVpmDjDYYdISHDxKIrzLTwKleYsLEnOLM
  9MhUqcYFaXEea+A9AmAJDJK8+DaYBF2iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwL/NZoC
  k8mXklcNNfAS1mAlq8T6wGZHFJIkJKqoFpvkLnleW1z7LbV7cvN2ixWaRybv2sdsFbyVpB4s9
  Lvv/bOp33x/Wlbi5p9tJPj/XtlIlauzDu7AuhWdbOnD/rppZs69Oy0mnqXn6sO/ZJTYaWp6EI
  GwNraMO/7kzvR9yNW+IUf/L0Fj0WlucOqopYZfxq8QK7Nv0GiQ2Ki94X7wkILXBaurJUtW1Ck
  dLePUu541vWr4tRbEu/d9fz2ZeGY/Gc8ZM02NJqrQW9fuheS6i4tj6IxWSa1EbnIzqak/l7pA
  smdLxe5+X8zb9hlVSGt+gzh50tXFnaKrsM19xguHVeZ+ckrSADh5/vew79zFbwUDA5Uc4x5UX
  77wblOGaHr0/8dssU/1CenOQqqcRSnJFoqMVcVJwIAKLc1YQrAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-265.messagelabs.com!1635765802!249785!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32705 invoked from network); 1 Nov 2021 11:23:22 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-14.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Nov 2021 11:23:22 -0000
Received: from R01UKEXCASM224.r01.fujitsu.local (ex2k13_224.fs.fujitsu.com
 [10.182.185.122])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1A1BNMQv009968
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Nov 2021 11:23:22 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM224.r01.fujitsu.local (10.182.185.122) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 1 Nov 2021 11:23:21 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libcrypt-openssl-guess-perl: upgrade 0.13 ->
 0.14
Date: Mon, 1 Nov 2021 19:23:01 +0800
Message-ID: <1635765782-37775-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM224.r01.fujitsu.local (10.182.185.122)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 11:23:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93699

0.14 2021-10-28T15:35:02Z

macOS: check dylib exists in library paths (PR#11)
backport from Net::SSLeay 1.91_01 (PR#10)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...l-guess-perl_0.13.bb => libcrypt-openssl-guess-perl_0.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-guess-perl_0.13.bb => libcrypt-openssl-guess-perl_0.14.bb} (90%)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.13.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.14.bb
similarity index 90%
rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.13.bb
rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.14.bb
index 7bce621bc4..1bf5b207c1 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.13.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.14.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea914cc2718e8d53bd7744d96e66c03c"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-Guess-${PV}.tar.gz "
 
-SRC_URI[sha256sum] = "87c1dd7f0f80fcd3d1396bce9fd9962e7791e748dc0584802f8d10cc9585e743"
+SRC_URI[sha256sum] = "e4331977e1512a3ba51d7fa2d642d3e79d479dc23483246ebfaaef80ea8573df"
 
 DEPENDS += "openssl"
 
-- 
2.25.1



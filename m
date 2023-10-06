Return-Path: <dzagorui@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C8CE92FFB
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 10:05:38 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.web10.9266.1696586737161020176
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Oct 2023 03:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=f9CEnX9l;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=913; q=dns/txt; s=iport;
  t=1696586737; x=1697796337;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=36CPcJgf1T93uiiXuitzJkLK0k7SYsbLi10raYT3AGI=;
  b=f9CEnX9lnYzBIk7d9zh1ZvVXLBqzMtIHCIL477GijgsuMNIGe+PiXZ0n
   rqmbLurt2yWJ0Rn97yVd+U5zm4Hu7vI6XTvFDYgWwSOoA9/LNQw+Z/6qE
   5kij9Gs8sDCYVFml+gVVBVhwE6MK0MZ7VcT0JLnokSi9mMfaQnTSOjRlq
   Y=;
X-CSE-ConnectionGUID: 3EslMw6PSB6I3ieOm5TgFQ==
X-CSE-MsgGUID: fHK8EANPRn65v+sajqs5RQ==
X-IPAS-Result: =?us-ascii?q?A0BMAQCK2x9lmJxdJa1agliDMVVASJQOoCGBJQNWDwEBA?=
 =?us-ascii?q?Q0BATETBAEBjBYCJjQJDgECBAEBAQEDAgMBAQEBAQEBAgEBBQEBAQIBBwQUA?=
 =?us-ascii?q?QEBAQEBAQEeGQUOECeFaA2HBQEYAYE6RIJ+AYJeA7I2giyBAYMkAYFRrjGBa?=
 =?us-ascii?q?IFIjD+FUicbgUlEglGCLYJhAoEngQaFdgSDfoU7B4JWg1iKSXITR1oWGwMHA?=
 =?us-ascii?q?1kqECsHBDIiBgkWLSUGUQQXFiQJExI+BIM4CoEDPw8OEYJDIgI9NhlLglsJF?=
 =?us-ascii?q?UFNdhArBBQXgRRuHxUeNxESFw0DCHYdAhEjPAMFAwQ0ChUNCyEFFEMDRwZMC?=
 =?us-ascii?q?wMCHAUDAwSBOAUPHgIQLikDAxlNAhAUAzsDAwYDCzEDMFdLDFkEbSgDCQMHB?=
 =?us-ascii?q?UlAAwsYDUgRLDUUGwY/cwecLYJogQ4sIschhBaMAZUHGjOFV6QOLpgJixaYW?=
 =?us-ascii?q?4QxAgQGBQIWgWM6gVszGggbFYMiCUkZD445g1+PeUQyAjkCBwsBAQMJiG6CW?=
 =?us-ascii?q?wEB?=
IronPort-Data: A9a23:2J3NZ6x+X+uaXLPCCTN6t+ctxirEfRIJ4+MujC+fZmUNrF6WrkUAx
 mVKXmqEOf7ZMGD9KoslbIy38xgPsMSEm4NjHAQ5rlhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlpCCea/lH0auSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 YiaT/H3Ygf/gGcsaj9MscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE88jmSH
 rurIBmRpws1zj91Yj+Xuu+Tnn4iHtY+CTOzZk9+AMBOtPTtShsaic7XPNJEAateZq7gc9pZk
 L2hvrToIesl0zGldOk1C3Fl/y9C0aJuo5LcJV2g7/So5RPnKHrh5PAzME4YBNhNkgp3KTkmG
 f0wMjsBaFWIgPi7he/9Qeh3jcNlJ87uVG8dkig/lneCUrB3GtaaHvuiCdxwhF/cguhCD//RY
 NAEaBJkbQ/LZFtEPVJ/5JcWxb3y2CmjK2IEwL6TjaQXwDj+5SpJ6r6zbcSWYdWIXN4IpH/N8
 woq+EygUk1Fa7Rz0wGt9WqhgOLKly73VI8eUbG16PNuqFmS3XAIThoOWF22pPO0hkKzV5RYM
 UN8x8Y1hbI5+EruRd7nUljl5nWFpRUbHdFXFoXW9T1h1IKPzh2dI3dadgVrNv19tcIRQGEW2
 XGwyoaB6SNUjJWZTneU97GxpDy0ODQIIWJqWcPiZVZVizUEiNxj5i8jXuqPA4bu0YKoQWCYL
 ySi6Xlh1+9K3Kbnwo3ipQif6w9AsKQlWeLc2+k6dniu4gU8b4m/asn1r1Pa9v1Hao2eSzFtX
 UToeeDAtIji7rnUxERhpdnh+pnyuZ5p1xWH0TZS82EJrWjFxpJaVdk4DMtCDEloKN0YXjTif
 VXevwhcjLcKYir0MPQvPd7pVZxzpUQFKTgDfq6MBjapSsYpHDJrAAk1DaJt9zm3yRN1wf1X1
 WmzKJn3VB729piLPBLvF7tCjtfHNwg1xHjYQtjg3g+73L+FDEN5up9bWGZimtsRtfveyC2Mq
 o43H5LTl313DrakCgGJqtF7ELz/BSVhbXwAg5YJJrfrz8sPMDxJNsI9Npt6K9A/w/kLy7uQl
 px/M2cBoGfCabT8AV3iQhhehHnHBP6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:zMQne6xo3uOKt3LtF7T+KrPwOb1zdoMgy1knxilNoHtuA66lfq
 +V8sjzuSWYtN9zYgBCpTn/Asi9qBrnnPYfi7X5Vo3MYOCJggeVxflZjbcLB1bbaknDHik379
 YET5RD
X-Talos-CUID: =?us-ascii?q?9a23=3AddfPD2izNZJwp9fxQYWqXjURcjJuKVDGyFLPfXe?=
 =?us-ascii?q?DIzhIE7yYblrNxKxKqp87?=
X-Talos-MUID: 9a23:YIwpKQp0ht5ZtaPftagezz9CF5dFyoKWMkZTzItFoMCGLDctAQ7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.03,203,1694736000"; 
   d="scan'208";a="122684074"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 10:05:36 +0000
Received: from sjc-ads-6980.cisco.com (sjc-ads-6980.cisco.com [10.30.218.100])
	by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 396A5ZDi028281
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Oct 2023 10:05:36 GMT
Received: by sjc-ads-6980.cisco.com (Postfix, from userid 487941)
	id 6F7B4CC1280; Fri,  6 Oct 2023 03:05:35 -0700 (PDT)
From: Denys Zagorui <dzagorui@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libbpf: add arm, powerpc and mips64 to COMPATIBLE_HOST
Date: Fri,  6 Oct 2023 10:05:35 +0000
Message-Id: <20231006100535.1812417-1-dzagorui@cisco.com>
X-Mailer: git-send-email 2.23.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.218.100, sjc-ads-6980.cisco.com
X-Outbound-Node: rcdn-core-5.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Oct 2023 10:05:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105367

There is is no build time issues with libbpf for these
architectures so we can add them to COMPATIBLE_HOST

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
---
 meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb
index 71ca10e5a..a8e1e5c0c 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
 SRCREV = "fbd60dbff51c870f5e80a17c4f2fd639eb80af90"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_HOST = "(x86_64|i.86|aarch64|riscv64|powerpc64).*-linux"
+COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
 
 S = "${WORKDIR}/git/src"
 
-- 
2.23.1



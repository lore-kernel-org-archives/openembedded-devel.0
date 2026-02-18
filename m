Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08284E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 16:41:03 +0000 (UTC)
Received: from siberian.tulip.relay.mailchannels.net (siberian.tulip.relay.mailchannels.net [23.83.218.246])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16228.1771432853080342933
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 08:40:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=ioxM5J2P;
 spf=pass (domain: rootcommit.com, ip: 23.83.218.246, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1A3191815BC
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 16:40:52 +0000 (UTC)
Received: from fr-int-smtpout23.hostinger.io (100-97-23-78.trex-nlb.outbound.svc.cluster.local [100.97.23.78])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 52B671824C7
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 16:40:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1771432851;
	b=mpAeIZJ3pCDKc3N+DV0OqqFyNdgGFPCyLSk5iJQsInvLHKLdeXUp7gle9WbM7Eo48adnjN
	GJ0TXvMUtPPw5Z7HbGirsPS+4QrwgwjCoS1wY4R8iEUILEPq4gD7TgViIgeTvGpTRQyHRz
	JdJ+sI0CbYusbfvDUc7Pi1gRtYaXo1Tf3zHwTEosoFJbejv7Qk7uoBjpPNSFGGaVNpgryx
	EO2dOnQ+Jk/ZhhuI59LZ/Y3mWOlSCJbKemmYFVn+hUzbwgrO8jIu3lZbdqg8Q+BTyOzYH2
	LdEWMWBxcNAv03Ri/vigWIY2XuXhHDBS/Sun+HmM7nQ4b7Ty2b39ZeD+Nil3lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1771432851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=2dLpt1Wr8Cq9wbixgtrfhFe2FDcqg1wAIu1WBlIGwBc=;
	b=6aSdtTRA/mDyDUp9i0CNDPv8pkBpNYP23ntSqu18npkgjS4CAqHi1MPEFmDWw+q5lKAE9m
	8Uh0G56N13b5KapVGlp+fPBFOl9GuT9YKaHFhJZ6t+JdYZBkBGeJ2tqjKxHBzCEXKxwfdh
	ZM0U4ea8ztHimTpwAjVDoBwCmrj67qiNvY12tpmVb0vczv3HZqWsc2Sb0nS3x2xKA2x3Mx
	Fz26zz4D8eBq95TkF43RDjd3txauFkgUKn9AL8qIzuZx9s325Xj1/RC8qvYpZEF8AbUVLB
	qxZyj7YpgEdAypaoSAQ8v07ailz+0RwHaebM6mWRje91yM3qXP6miunis4mAsQ==
ARC-Authentication-Results: i=1;
	rspamd-659f7bc6cc-g44tl;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Lyrical-Vacuous: 5ccd7ef4473e9bdf_1771432851861_3085035001
X-MC-Loop-Signature: 1771432851861:2104603315
X-MC-Ingress-Time: 1771432851861
Received: from fr-int-smtpout23.hostinger.io (fr-int-smtpout23.hostinger.io
 [148.222.54.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.97.23.78 (trex/7.1.3);
	Wed, 18 Feb 2026 16:40:51 +0000
Received: from a8.lan (unknown [IPv6:2001:861:4450:d360:3af7:cdff:fec8:2ad4])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fGMhK3l02z1xrj;
	Wed, 18 Feb 2026 16:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1771432849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2dLpt1Wr8Cq9wbixgtrfhFe2FDcqg1wAIu1WBlIGwBc=;
	b=ioxM5J2PDdtsHzxm17e4RRafyXxAViY64204FNYLaJipID2gDq+zm4J33l79S19aUuDZt/
	KhmTm97OnFpAzjcaSoGy0slCSfeBwZ7+m1HRwM59vb/9BxLmN6JOt7nVpHDzEuhCv68YG7
	nlnr0UMAY9TYsd+xLQHCv7rUTfxx9/UeQcFhdh9lsHcxZaBhmi9OxoTp3ir9MlNgOo6HFf
	97I5mWJI9vwjnYHEUAHp9bma976vMK0vQlZOmQTcsSukEzZ8hyX8uAJgfNVwxHy+qaNYBp
	SX2teplxRcxS7awGkx3FqyeXxl2CFjiFbA88DgY+l+macqBDhV+AXI/vKxjl6w==
From: michael.opdenacker@rootcommit.com
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [meta-oe][PATCH] fitimage.bbclass: fix comment/doc typos
Message-ID: <20260218164042.355512-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Date: Wed, 18 Feb 2026 16:40:49 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Gq4Q+V1C c=1 sm=1 tr=0 ts=6995eb91 a=JYV5NeMFUfSyZF90Ja6P+Q==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=c6OYVUsFa3wy8XKJwTQA:9 a=5LIPcT19wsuqQd5tlo63:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfEdkpym/A9Kq43ZgAZQlP6em5cd1IfVLjLeeAPA7YvhL2No5b9JT0bBhzUXZzstRLVsNanKi0NcpxSo0EdO7sifFjkcSXsceSOg1lzLMb4wVUetXSBrl 0wnTkZbAzyRcoVdCuTTYEOWe/lyKGxPL5D+CI1FhR8QCrSu9nW5sZ8WtzM5HwtXGnupaI5A/HvpsRhcywt60XLdW/Dmua9ZZN1gzostRrI8VYD3SReXrjSJF SxIIEkVWUr5LXwpu/+tP2WdrsquKdqPtmkottAQlKKnLsm3vHfQpttgmzfpagYQiMSrBPo4B/G/1BCrHqHs1hgmSbvKeLUMveMrqZcb47Ow=
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 16:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124493

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 meta-oe/classes/fitimage.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/fitimage.bbclass b/meta-oe/classes/fitimage.=
bbclass
index 03fa2fcd57..3a5a780248 100644
--- a/meta-oe/classes/fitimage.bbclass
+++ b/meta-oe/classes/fitimage.bbclass
@@ -22,7 +22,7 @@
 #    FITIMAGE_IMAGE_fdto[type] ?=3D "fdto"
 #    FITIMAGE_IMAGE_fdto[file] ?=3D <list of all dtbo files from KERNEL_=
DEVICETREE>
 #
-#    Add a devicetree created on-thy-fly of a base dtb and serveral dtbo=
's
+#    Add a devicetree created on-the-fly of a base dtb and several dtbo'=
s
 #    FITIMAGE_IMAGE_fdtapply ?=3D "virtual/kernel"
 #    FITIMAGE_IMAGE_fdtapply[type] ?=3D "fdtapply"
 #    FITIMAGE_IMAGE_fdtapply[file] ?=3D "base.dtb overlay-1.dtbo overlay=
-2.dtbo"
@@ -78,7 +78,7 @@ FITIMAGE_SIGN ?=3D "0"
 FITIMAGE_SIGN[doc] =3D "Enable FIT image signing"
 FITIMAGE_SIGN_KEYDIR ?=3D ""
 FITIMAGE_SIGN_KEYDIR[doc] =3D "Key directory or pkcs#11 URI to use for s=
igning configuration"
-FITIMAGE_MKIMAGE_EXTRA_ARGS[doc] =3D "Extra arguemnts to pass to uboot-m=
kimage call"
+FITIMAGE_MKIMAGE_EXTRA_ARGS[doc] =3D "Extra arguments to pass to uboot-m=
kimage call"
 FITIMAGE_HASH_ALGO ?=3D "sha256"
 FITIMAGE_HASH_ALGO[doc] =3D "Hash algorithm to use"
 FITIMAGE_ENCRYPT_ALGO ?=3D "rsa2048"


Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820FCC3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 11:41:34 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.15706.1704282082529505332
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jan 2024 03:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=L4NNXZSA;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 403BfIRg144344
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Jan 2024 12:41:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1704282079;
	bh=pD+YJ1bdWs234XNEdQkuAEsCo38E51S+PKIgcMot5U8=; l=1840;
	h=From:To:Cc:Subject:Date;
	b=L4NNXZSAhqUTvXmdrH1Yx0otJi1ojhEgqNiXBf3bKqi1QHryg5eyJ6B4wGXm7XAlk
	 9iavVzoCJmq2xWN2z92RNRf6etq8rOjd+o3geZOj5/rcaIfM27vPCuhYnzDHU7fsYQ
	 oXOs+c6jC5PgTj65DGDPqOCUXq7VgzbC55JwMgh3b0AMsueQS2s5D8hvLxpbZ5Pui4
	 c6qCAk9wD7kllILHqnaKTcmHXIW6iWJEQTI57yYwyC8dEXronhTWiZRGI+fL1r+mb3
	 RboW3b1XXZDdp4zWTGg4Nj3gyTRAS9+fAdoqxrGn80Z93iBSHttYimSczvsMWdKIts
	 Rl1YJ0PRzuvJQ==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 403BfF1f492813
	for <openembedded-devel@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Wed, 3 Jan 2024 12:41:15 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id Q66J5LQCKX; Wed, 03 Jan 2024 12:41:13 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 403BfEa9382524
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 3 Jan 2024 12:41:15 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.96.2)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rKzcY-001rtQ-2N;
	Wed, 03 Jan 2024 12:41:14 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [meta-oe][PATCH] krb5: use PACKAGE_BEFORE_PN
Date: Wed,  3 Jan 2024 12:41:12 +0100
Message-ID: <20240103114112.445488-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 659547d9a867f08c5db38233
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jan 2024 11:41:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108031

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

The 'krb5-config' tool should be in ${PN}-dev (as intented by
binconfig class).

Use PACKAGE_BEFORE_PN for extra packages so that -dev is handled
before -user.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 .../recipes-connectivity/krb5/krb5_1.20.2.bb  | 42 +++++++++----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.20.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.20.2.bb
index 54e6b778b0c2..e1fe5e567178 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.20.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.20.2.bb
@@ -103,26 +103,26 @@ do_install:append() {
         -i ${D}${bindir}/krb5-config
 }
 
-PACKAGES =+ "${PN}-admin-server \
-             ${PN}-gss-samples \
-             ${PN}-k5tls \
-             ${PN}-kdc \
-             ${PN}-kdc-ldap \
-             ${PN}-kpropd \
-             ${PN}-otp \
-             ${PN}-pkinit \
-             ${PN}-spake \
-             ${PN}-user \
-             libgssapi-krb5 \
-             libgssrpc \
-             libk5crypto \
-             libkadm5clnt-mit \
-             libkadm5srv-mit \
-             libkdb5 \
-             libkrad \
-             libkrb5 \
-             libkrb5support \
-             libverto"
+PACKAGE_BEFORE_PN =+ "${PN}-admin-server \
+                      ${PN}-gss-samples \
+                      ${PN}-k5tls \
+                      ${PN}-kdc \
+                      ${PN}-kdc-ldap \
+                      ${PN}-kpropd \
+                      ${PN}-otp \
+                      ${PN}-pkinit \
+                      ${PN}-spake \
+                      ${PN}-user \
+                      libgssapi-krb5 \
+                      libgssrpc \
+                      libk5crypto \
+                      libkadm5clnt-mit \
+                      libkadm5srv-mit \
+                      libkdb5 \
+                      libkrad \
+                      libkrb5 \
+                      libkrb5support \
+                      libverto"
 
 FILES:${PN} = "${libdir}/krb5/plugins/preauth/test.so"
 FILES:${PN}-doc += "${datadir}/examples"
@@ -198,4 +198,4 @@ pkg_postinst:${PN}-kdc () {
 BBCLASSEXTEND = "native nativesdk"
 
 inherit multilib_script
-MULTILIB_SCRIPTS = "${PN}-user:${bindir}/krb5-config"
+MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/krb5-config"
-- 
2.43.0



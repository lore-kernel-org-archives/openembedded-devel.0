Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id DF70E78862
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:50 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id e11so5427574pgq.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Uv7NNZPwoMRw2IwQTy/HANSwdW1qvpz4uQm9S8NozqI=;
	b=YreW8Roq3q/BNLRyY0B1nUOMT1j81ImD84eK7J0Elwg9B3dwNGIaofiY/MbvsVH1+x
	MZqfhE4H+seWa7pM9GhjJzntVhkmXuI2gSWTrhPNBZr2Kk0SHZt4TyGHgC8DgXx4WG5h
	/i/4GhvmOD5zoPbrMfu4IO8zQOimBPbBuFi6hjODR3WTN4oBGX3JQVB6w2Unilf/UPzH
	R8QmJYSddXJg2ChAz9Wx5/UWs6eJ3wfMWpF+3HGiHgzYeaWodakjDqn2qE98nhe0J9ig
	PUuB5k65HxsN8hmBXaeuTTTUnXR7BwpJuCExgknlCL18+Vy1iFRlEESfQN6ERluS/XDL
	QedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Uv7NNZPwoMRw2IwQTy/HANSwdW1qvpz4uQm9S8NozqI=;
	b=aaR7edv05mMu1mtzo7Y05uiLsgPCzIGVZb9hxlWwoo4kBuyx2kpT7zvrWR7EDkwLpR
	I4gUBAEgZcnnQpi+p17nTyhlRmQAYEuo/mmWWerTRecOrBXy27gh0DmbEnty93ce3Mks
	A+pPLuJvn+uSOsBcoFCsevjnjOp6VEdtk7moTB1g3yTYM873igpD1a6dogZjs1/ys6hd
	mpDkBzgTmxp5rCFdQeuNDSXfhb2lca35qZBNwyuXQ2d5uPX8Ae1hTBBRvY9nHPoLFMSQ
	/8nbwqidnHBzjc2BJ1A0xZd8/gkjKm4lWWXUah2qLQ6Jp1mdBHIonjRxsVPOfzDvFxwp
	yKhw==
X-Gm-Message-State: APf1xPB1VwZNsfmsujeK8Q0PQ3pYaxC0RVz3d6EMHhmveuasQRylY6xs
	JNoo39k8zILgyJJJArjTC6z+Pw==
X-Google-Smtp-Source: AH8x227oTebFQkJWlclu0bu5L+9IN+3XcaoUJ+3rSjXcFB3qvEM9FKbWuedgGcvP9ZR0yj8U9ReIgg==
X-Received: by 10.98.153.86 with SMTP id d83mr7368709pfe.46.1519594431710;
	Sun, 25 Feb 2018 13:33:51 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:13 -0800
Message-Id: <1519594406-24490-23-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 23/36] pkcs11-helper: move to recipes-crypto
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Feb 2018 21:33:51 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../pkcs11-helper/pkcs11-helper_1.11.bb                                   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-crypto}/pkcs11-helper/pkcs11-helper_1.11.bb (100%)

diff --git a/meta-oe/recipes-support/pkcs11-helper/pkcs11-helper_1.11.bb b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.11.bb
similarity index 100%
rename from meta-oe/recipes-support/pkcs11-helper/pkcs11-helper_1.11.bb
rename to meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.11.bb
-- 
2.7.4



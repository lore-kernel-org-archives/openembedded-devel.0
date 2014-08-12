Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9BEBE70C47
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 12:24:47 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so5760653wiv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 05:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=jLqoFIFXNOuw8AfcPS6Cp+Wb+lDzsfq8rQyCOtmfIVA=;
	b=P2x7oyFpeyHHVQ7M2vggIQACqxBR9kN40WIhaaS7pzRTC1vW9EQpbN1kLvVVePZyR4
	sHR53ibqhXSCW+gGfaNAi5fYKn2CzHQJyzMXN2JvY3jTnh8S7qYHRkZwhu9DaVeMtRQi
	WlLgxekjPM+cbHpKvI6dqwXuBgQmSwCcMSmAqj7+kiMXSuoep8dykUnAdOeVHHOG5bcX
	hetdvxmYj+2OMk47F3lcJPHz0Va8wKpj/f2yhNulQ08xnseZe3t8PbrL39HEceFhATXj
	4n4NRtcHHAR4tPx7AHiFzPdBmH85FDKXhVSRRPoaMxXLLr+J63gPm2FDlEp8sNYf6JAi
	V8fg==
X-Received: by 10.180.72.146 with SMTP id d18mr26652906wiv.53.1407846288740;
	Tue, 12 Aug 2014 05:24:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h3sm8980513wjn.10.2014.08.12.05.24.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 05:24:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Aug 2014 14:25:12 +0200
Message-Id: <62ff3d8c12d8114416dd1b21b7575a2dd8903f00.1407846175.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <cover.1407846175.git.Martin.Jansa@gmail.com>
References: <cover.1407846175.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1407846175.git.Martin.Jansa@gmail.com>
References: <cover.1407846175.git.Martin.Jansa@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [daisy][PATCH 2/5] ktap: Set MACHINE_ARCH because of ktap-module runtime dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Aug 2014 12:24:49 -0000

* it's possible to exclude ktap-module dependency from siggen, but
  then we would need to exclude virtual/kernel and that doesn't work
  we would need to list all posisble providers as
  ktap->linux-yocto
  ktap->linux-foo
  ....

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-kernel/ktap/ktap_0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/ktap/ktap_0.4.bb b/meta-oe/recipes-kernel/ktap/ktap_0.4.bb
index 20f94d5..cbdabf8 100644
--- a/meta-oe/recipes-kernel/ktap/ktap_0.4.bb
+++ b/meta-oe/recipes-kernel/ktap/ktap_0.4.bb
@@ -22,5 +22,5 @@ do_install() {
     install -m 0755 ${S}/ktap ${D}${bindir}/
 }
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 RDEPENDS_${PN} = "kernel-module-ktapvm"
-
-- 
2.0.4



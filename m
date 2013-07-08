Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 668516B0A7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2013 08:41:34 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so2636810eek.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jul 2013 01:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=87YJf68sOLNpk3Wmcr8L05sEpq6cppXJj3Dzsh3G4v0=;
	b=RyHdE1vIvG8C9s7U4AZxdE9AtdT3N2fwNVJfquVZ8sAeW3mWksoFLJKRtnShFVyC7m
	bY296jl/croetl2GGjL1uV4Bc7yxSqSmVVFXprtAidrdD2MFXXMnHuqJpHzgm7jo7Lcx
	DPX/ZxZcGHUfwsESHLiah77Kli+ysOsvFWYCnSZMXGK5kweL+gnmSL0igvMpT2z/RPFG
	ZXv1KVPu5Lju77ew5f5MP5opVFdt9t+mzlYZyRQqLPMPJh19AxhLa4GX5Oqt6rhud2JC
	Fv623chUMIBsPycwN5u3W3omsBsPOewyzk1JN62XoCbWYOXUGlZpGFa9LgwVV03XqLpq
	WLYQ==
X-Received: by 10.14.176.68 with SMTP id a44mr24035184eem.31.1373272895129;
	Mon, 08 Jul 2013 01:41:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm40339972eeh.11.2013.07.08.01.41.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 01:41:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jul 2013 10:41:32 +0200
Message-Id: <1373272893-26013-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1373272893-26013-1-git-send-email-Martin.Jansa@gmail.com>
References: <1373272893-26013-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/6] rsyslog: inherit pkgconfig
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
X-List-Received-Date: Mon, 08 Jul 2013 08:41:34 -0000

* without pkgconfig it's failing to expand PKG_CHECK_MODULES macro:
  | rsyslog-5.8.0/configure: line 16111: syntax error near unexpected token `GNUTLS,'
  | rsyslog-5.8.0/configure: line 16111: `    PKG_CHECK_MODULES(GNUTLS, gnutls >= 1.4.0)'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog.inc b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
index 5cfd236..4b2935f 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog.inc
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
@@ -10,7 +10,7 @@ INC_PR = "r8"
 SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${PN}-${PV}.tar.gz \
            file://rsyslog.conf"
            
-inherit autotools systemd
+inherit autotools pkgconfig systemd
 
 EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-- 
1.8.2.1



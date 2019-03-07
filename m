Return-Path: <damien.riegel@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id C49B37C7D6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 21:11:22 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id v83so18177666itf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2019 13:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5gC5+5MGQXUH7dO9l1NHnmCm3rC2TGLOrD2WOTYHpic=;
	b=ipJ6fZm6RxrqfAj2FNMmQMuzYpNP+xv7iURBXidPVhDQ+XTK+jA+ZmdGnvHmdjQyIe
	qaxyqeFI8PU9nHfpdMKGSyh+Xyi3pU3AvwVVckLfKxHN2qii4RiLlBUuAyFeKMR9A8f5
	76xIB+FWosmUa1p57y/N5dJjhft5fIgoWOO2ff2HxtwNcR+H0f/mKuNGP1sdge5Y1FUF
	edQSjOeGW7dI51qdP8DVflRwnuYl8OkT5DZnEgIvy+edVnUvXSVQlGyysx9t9FvcKRb7
	QGoLJD9dcx4aBC12pmJQrOYtwHMzeM25+UC4UXr7RmmKz9EZeAw9WXPr8SLFTBn/ubSl
	PWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5gC5+5MGQXUH7dO9l1NHnmCm3rC2TGLOrD2WOTYHpic=;
	b=KIDlslE3Al+uJFbKaJr2gfMgGm1z/At0g6RRdqV0sCdJhsOzH69dbP+L4pPsSKGuOL
	GJchfGSMrf+/lbrNUTaZkSykJh2aAeCEtKfKi0tqPzfE6ipXpEcGz7/vHKA6NdNaW1wW
	tLSlwtGOer+vBRFxjDwAibcZ4XiZeMf+eRhSNWRbkCWe23jAemYeu1JqzvR6QOXNiAdz
	OLlAigW4tHKPesLPzhCrjyR/FWkvQvdyhsjG2d2SKW/cV9yjMBrPW8BXiAJMAOvpAr5N
	uCq24V6aG8PRuwFheJe3l09KBGVkfSWrVG8+LQDvceS8vt6Usu2FfkQYptYKQGJu0mbB
	0epg==
X-Gm-Message-State: APjAAAXGYtlh06Q/YL5oPHkxI6i4ZOEBzdrWG3F8PaYnu9/U9qzX+erQ
	g6pT9b1rOVQiGEw1Cs5rQS++YeGZ25M=
X-Google-Smtp-Source: APXvYqw73CfdqhBNuC9p9Tg1SiJJ+qG/Q8bmGTeDmD1E9X3Aw/hMwh+MdzUrN/w5G+CdXp1OIxu9Uw==
X-Received: by 2002:a24:6581:: with SMTP id u123mr6764965itb.42.1551993083750; 
	Thu, 07 Mar 2019 13:11:23 -0800 (PST)
Received: from workotop.localdomain ([67.218.223.154])
	by smtp.gmail.com with ESMTPSA id
	p141sm3036343itb.39.2019.03.07.13.11.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Mar 2019 13:11:23 -0800 (PST)
From: Damien Riegel <damien.riegel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2019 16:11:12 -0500
Message-Id: <20190307211112.30386-2-damien.riegel@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190307211112.30386-1-damien.riegel@gmail.com>
References: <20190307211112.30386-1-damien.riegel@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
Subject: [meta-networking][thud][PATCH 2/2] mosquitto: fully switch over to using PACKAGECONFIG_CONFARGS
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
X-List-Received-Date: Thu, 07 Mar 2019 21:11:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Convert all other instances of explicit PACKAGECONFIG uses
to the PACKAGECONFIG_CONFARGS infrastructure.

Signed-off-by: André Draszik <andre.draszik@jci.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Damien Riegel <damien.riegel@gmail.com>
[Damien Riegel: backport from master]
---
 .../mosquitto/mosquitto_1.5.1.bb                     | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb
index 52252787d..06c1d67da 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb
@@ -24,20 +24,16 @@ PACKAGECONFIG ??= "ssl uuid \
                   ${@bb.utils.filter('DISTRO_FEATURES','systemd', d)} \
                   "
 
-PACKAGECONFIG[dns-srv] = ",,c-ares"
-PACKAGECONFIG[ssl] = ",,openssl"
-PACKAGECONFIG[uuid] = ",,util-linux"
+PACKAGECONFIG[dns-srv] = "WITH_SRV=yes,WITH_SRV=no,c-ares"
+PACKAGECONFIG[ssl] = "WITH_TLS=yes WITH_TLS_PSK=yes,WITH_TLS=no WITH_TLS_PSK=no,openssl"
+PACKAGECONFIG[uuid] = "WITH_UUID=yes,WITH_UUID=no,util-linux"
 PACKAGECONFIG[systemd] = "WITH_SYSTEMD=yes,WITH_SYSTEMD=no,systemd"
-PACKAGECONFIG[websockets] = ",,libwebsockets"
+PACKAGECONFIG[websockets] = "WITH_WEBSOCKETS=yes,WITH_WEBSOCKETS=no,libwebsockets"
 
 EXTRA_OEMAKE = " \
     prefix=${prefix} \
     mandir=${mandir} \
     localedir=${localedir} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'dns-srv', 'WITH_SRV=yes', 'WITH_SRV=no', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'ssl', 'WITH_TLS=yes WITH_TLS_PSK=yes', 'WITH_TLS=no WITH_TLS_PSK=no', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'uuid', 'WITH_UUID=yes', 'WITH_UUID=no', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'websockets', 'WITH_WEBSOCKETS=yes', 'WITH_WEBSOCKETS=no', d)} \
     ${PACKAGECONFIG_CONFARGS} \
     STRIP=/bin/true \
     WITH_DOCS=no \
-- 
2.21.0



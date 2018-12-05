Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id B1A2E60939
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 11:08:56 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id y194so8351820ywg.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2018 03:08:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5ePYIh+Aapav/O/UPcEAYLSNNvirI9Ba+gGmQ0nuUEs=;
	b=OVL00rBZpDXmibT73Yi7ubX+UyNvZouCNrkj/CmAenm9bnggT/kiqoRvl71UJMZ9EO
	w1u/fhEezPuL/zuSCzVDo58aUZoD+/rCLOoXiMhEQ+WohGw4OS5gXJRnknPFbU6Fdghu
	/oS90fJw1A9r9oJepH9PWrRvBcvBL9Ay+Pg6rGEv4obNeFX9KTqVg/NCzQgE97UPgVu6
	CeMomMQQogw1sOPa2kjp4TC22FNxmR7QJi8dcZ5QHmp3svEOVs0roPksDPHFTQMU69N0
	9Zw+u3yLohRsnur1VmxA2T1d5HJsmkfWXIppHknpXuLAH/mHZsEWpcqvb1ISGTjM/0xl
	bdEg==
X-Gm-Message-State: AA+aEWZKHsbD9ywRHyME0U4arU1zsY7DlLpFjdqf9C2IIzqHHuRPqJyk
	apXngA+6oAIsYyODH80OVAtOG1c3
X-Google-Smtp-Source: AFSGD/Vf5w2opREPgvz2JaKGIZByzNjMlPStpxVeQKhQRGoZbZb9ugiYFTdxthQ+R/izFKhAOm9zMA==
X-Received: by 2002:a81:4cd2:: with SMTP id
	z201mr24545939ywa.161.1544008137405; 
	Wed, 05 Dec 2018 03:08:57 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id u4sm7548444ywl.29.2018.12.05.03.08.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Dec 2018 03:08:56 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2018 11:08:54 +0000
Message-Id: <20181205110854.32521-1-git@andred.net>
X-Mailer: git-send-email 2.20.0.rc2
MIME-Version: 1.0
Subject: [meta-networking][PATCH] mosquitto: fully switch over to using PACKAGECONFIG_CONFARGS
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
X-List-Received-Date: Wed, 05 Dec 2018 11:08:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Convert all other instances of explicit PACKAGECONFIG uses
to the PACKAGECONFIG_CONFARGS infrastructure.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .../mosquitto/mosquitto_1.5.4.bb                     | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.4.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.4.bb
index e32f30d6e..01562aad1 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.4.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.4.bb
@@ -23,20 +23,16 @@ PACKAGECONFIG ??= "ssl uuid \
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
2.20.0.rc2



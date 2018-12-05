Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id DAB4A60939
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 11:02:34 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id h32so8339465ywk.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2018 03:02:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=A6vVwZpKDuCpPoeBrGH35ZSyNu6/T11eZ9PDfhy8HGc=;
	b=M5M8dIn7Ze8XVGoano/vxPnxpFNIkTQiAwH/8JlXVgC/HXI5Cq5uS22vLn77xQ6u1N
	e4Ker4P2kSOFbkenAjyKws0BPff45JhAjRsyX4rn8f8dVqdjGJTUAb2osl9qbqMMbUDQ
	i3OneY7qEoXSykyxx0VYVcLAEiPJ9J8I+RG747PIeZ8FhWYq/RBUa23SD80uu3y5EJx5
	ghOyVsdA6+Q6Ci6fozCmm8CJLWldxpe+/dayKvU0JhikMKWJoptHf9XkW+BQDPJway46
	sAjg8tZFCmSCmBkcch/cPRJF5OTHB83/iEAmH6Dpl6CuruthX1qB5xErAqIegXdokIkh
	abFA==
X-Gm-Message-State: AA+aEWZlnsbL/Um98pH5fnYleosui1INxLHu/VyQdoJqOlehNTq8fz1i
	66hfZGs4P4yX1Yis1rU6Tgypp2j/
X-Google-Smtp-Source: AFSGD/XnJ+QIGOGfDOBklCwrGDiI1v36s0DEsQtaPZpPF/EkxSTchPGPW191HyvkyT3U1bqyX9nPkQ==
X-Received: by 2002:a81:4412:: with SMTP id r18mr23445289ywa.204.1544007755704;
	Wed, 05 Dec 2018 03:02:35 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	n16sm7880109ywn.31.2018.12.05.03.02.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Dec 2018 03:02:35 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2018 11:02:32 +0000
Message-Id: <20181205110232.30393-1-git@andred.net>
X-Mailer: git-send-email 2.20.0.rc2
MIME-Version: 1.0
Subject: [meta-networking][PATCH] mosquitto: fix build in systemd environments
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
X-List-Received-Date: Wed, 05 Dec 2018 11:02:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The mosquitto systemd service file instructs systemd to wait
for mosquitto to notify systemd that mosquitto has started
correctly. This isn't working as mosquitto is not *compiled*
with systemd support enabled. As such, systemd restarts
mosquitto every few seconds.

For reference, this was introduced in commit a483d344d9fb
("mosquitto: Make enabling systemd also enable build dep on systemd")

Because we build mosquitto using the provided Makefile
infrastructure, the solution is to add PACKAGECONFIG_CONFARGS
to EXTRA_OEMAKE, so that the required make flags are added
to the make command line.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .../recipes-connectivity/mosquitto/mosquitto_1.5.4.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.4.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.4.bb
index ee4cab728..e32f30d6e 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.4.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.4.bb
@@ -37,6 +37,7 @@ EXTRA_OEMAKE = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'ssl', 'WITH_TLS=yes WITH_TLS_PSK=yes', 'WITH_TLS=no WITH_TLS_PSK=no', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'uuid', 'WITH_UUID=yes', 'WITH_UUID=no', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'websockets', 'WITH_WEBSOCKETS=yes', 'WITH_WEBSOCKETS=no', d)} \
+    ${PACKAGECONFIG_CONFARGS} \
     STRIP=/bin/true \
     WITH_DOCS=no \
     WITH_BUNDLED_DEPS=no \
-- 
2.20.0.rc2



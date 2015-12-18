Return-Path: <cjp256@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 373C16FF77
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 20:49:48 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id p62so12535880qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yOLwwPazAkSl/nwdQunq5TaOpflv7tTxibI3/hXirmA=;
	b=RKiHH6SHlYUAx6XTyLwvjfyVpg4eYGWyXcCb0bqzfp0rUoQdexP3Doije50tUIu38l
	9TnMoAb9MUBaNUT6qJD2NzZ3RpxzbxpaqzRDDE3BBWB1CaEQTEepIf0LR1OrxHGwPGrp
	gA2nePc/myjg2+yB4C6i3yjgGvHPUk27zEDINeZBMcaHedKDB2jhJuFtdB4Yuwe8w6WP
	BFBiPbC4ieibxFI7cy2VDKJS5/pPH7wpDQtHG8unbTJ/WlVJiprWWJcaz6xW5RCHHU/1
	/OXN/fFHVFIfk2IT8TxXLbiqv7G1WuHBpVxE+aalC3KF6BBGC0H64TKAK8M/hr6UHWmK
	zfPA==
X-Received: by 10.140.18.199 with SMTP id 65mr8028394qgf.10.1450471788758;
	Fri, 18 Dec 2015 12:49:48 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	p101sm3032415qkp.36.2015.12.18.12.49.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 12:49:48 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Dec 2015 15:49:42 -0500
Message-Id: <1450471782-25731-3-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1450471782-25731-1-git-send-email-cjp256@gmail.com>
References: <1450471782-25731-1-git-send-email-cjp256@gmail.com>
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: [meta-networking][PATCH 3/3] strongswan: install strongswan-swanctl systemd service by default.
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
X-List-Received-Date: Fri, 18 Dec 2015 20:49:51 -0000

From: Chris Patterson <pattersonc@ainfosec.com>

Matches start-on-boot behaviour of current strongswan.service.

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
---
 .../files/install-strongswan-swanctl-service.patch |   22 ++++++++++++++++++++
 .../recipes-support/strongswan/strongswan_5.3.2.bb |    1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/files/install-strongswan-swanctl-service.patch

diff --git a/meta-networking/recipes-support/strongswan/files/install-strongswan-swanctl-service.patch b/meta-networking/recipes-support/strongswan/files/install-strongswan-swanctl-service.patch
new file mode 100644
index 0000000..86baccf
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/install-strongswan-swanctl-service.patch
@@ -0,0 +1,22 @@
+commit 44cbabd8a42bc2a436562ed33fb8c89fa6b75b6e
+Author: Chris Patterson <pattersonc@ainfosec.com>
+Date:   Fri Dec 18 08:31:48 2015 -0500
+
+    strongswan-swanctl.service.in: match install used by strongswan.service
+    
+    Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
+
+Upstream-Status: Submitted
+https://github.com/strongswan/strongswan/pull/25
+
+diff --git a/init/systemd-swanctl/strongswan-swanctl.service.in b/init/systemd-swanctl/strongswan-swanctl.service.in
+index 818d352..944101f 100644
+--- a/init/systemd-swanctl/strongswan-swanctl.service.in
++++ b/init/systemd-swanctl/strongswan-swanctl.service.in
+@@ -7,3 +7,6 @@ Type=notify
+ ExecStart=@SBINDIR@/charon-systemd
+ ExecStartPost=@SBINDIR@/swanctl --load-all --noprompt
+ ExecReload=@SBINDIR@/swanctl --reload
++
++[Install]
++WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb b/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
index aa32383..7ec1a8e 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
@@ -10,6 +10,7 @@ DEPENDS = "gmp openssl flex-native flex bison-native"
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
         file://fix-funtion-parameter.patch \
         file://support-newer-systemd.patch \
+        file://install-strongswan-swanctl-service.patch \
 "
 
 SRC_URI[md5sum] = "fab014be1477ef4ebf9a765e10f8802c"
-- 
1.7.10.4



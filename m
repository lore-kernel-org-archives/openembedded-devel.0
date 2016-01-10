Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 64A73731DB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:59:59 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e65so2225983pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 17:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=BYxB/1RpBQ8RSAJPl2wydih+ZsAPJ8FNXQ4I1c2Aeac=;
	b=Yr0QYz4+q0TB+ziRNk9Ly6QLuNUOV1bAjSlZLNLqxs5KRBSLkaKLXpuxHd+LmvdSfp
	tOzWgxY7q3Jf/psSwqicCoJCZ03EaT6CJGIzZAGPVDD/JxOHYDNl86dbmLOXLLnOGikO
	cjxVtU3+Y8ff9lhu9YTMhszig50AMeg2E6XE6MrfmXIWRoBXvdSgVwK+ekeRTbu39osW
	D0qQ1l9Ty/+RZ8w8WfHVTIYLc+W5bUsuvBkp9jFqUO+7G6EjhWZsqtq2fTNKzVo6F9Z9
	vXyvHM93sDD7HtRAqlttGYVBszdtYKCxfQcLsAmpvg6pqdByHc0aVSRzpiKRUpPhSO7I
	UaVQ==
X-Received: by 10.98.31.84 with SMTP id f81mr15790004pff.98.1452387600483;
	Sat, 09 Jan 2016 17:00:00 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	tv6sm121906163pab.4.2016.01.09.16.59.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:59:57 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id B19CBFCC83F; Sat,  9 Jan 2016 16:59:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:30 -0800
Message-Id: <b43e443b09ca89e307c7c4ed5d968eecac935414.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
Subject: [PATCH 07/22] strongswan: install strongswan-swanctl systemd service by default.
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
X-List-Received-Date: Sun, 10 Jan 2016 00:59:59 -0000

From: Chris Patterson <pattersonc@ainfosec.com>

Matches start-on-boot behaviour of current strongswan.service.

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../files/install-strongswan-swanctl-service.patch | 22 ++++++++++++++++++++++
 .../recipes-support/strongswan/strongswan_5.3.2.bb |  1 +
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
1.9.1



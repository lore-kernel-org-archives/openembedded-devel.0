Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5203C77510
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 19:46:49 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n127so4158200qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 11:46:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+vFynI3SpRMh1iwlqpQ4nnSzdmWWHVDdzPWVtUiIU90=;
	b=XGCklHpxwDT+LtInrz4LxGRoIbxUqCR+X+Dw5ZemOiuD2QVbGIhQMBvpwrAAP2uED4
	DhiTIUo+tW4Q6DBa8XRyuC1ZfOCLlIUcooYOfKF0Pglya30BQi7lanfW9kSdJIdfMd3w
	8WBgywYrpicD0oOWxBA1zyP+DrrFl2/IoCOi+/9+sRxYGtk4gKgGEeZCyeOHI1kTAPpf
	f70CBh14pz/YDZLNua8Glwm/QTiod9rDEWNNfF/xyCqRyUiLEo6464xSUigmexUpIo7p
	QS+1NRwD0Us7JxLnnj2qaVOTGTmBr2DsjL0AM+thVk4KFLPvnjQyKO4Fqb2Pyo+ZNUNU
	uWBw==
X-Gm-Message-State: AMke39lZzFKD/6a/UbsmOtVzwhcAHX5ldmgo3w9z+F5C8cfWIpy5NL+Mf+gZ2BQTWLmyRQ==
X-Received: by 10.55.100.11 with SMTP id y11mr5126187qkb.62.1487965610984;
	Fri, 24 Feb 2017 11:46:50 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	c144sm5424340qkg.3.2017.02.24.11.46.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 11:46:50 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2017 14:46:41 -0500
Message-Id: <1487965601-27694-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] netdata: update DEPENDS to fix RSS build error
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
X-List-Received-Date: Fri, 24 Feb 2017 19:46:51 -0000

Resolves build issue exposed by RSS
See http://errors.yoctoproject.org/Errors/Details/130636/

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-webadmin/netdata/netdata_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
index ec74320..de14064 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
@@ -19,6 +19,8 @@ SRC_URI += "file://netdata.service"
 
 S = "${WORKDIR}/git"
 
+DEPENDS += "zlib"
+
 inherit pkgconfig autotools useradd systemd
 
 #systemd
@@ -51,5 +53,3 @@ do_install_append() {
 
 FILES_${PN}-dbg += "${libexecdir}/netdata/plugins.d/.debug"
 RDEPENDS_${PN} = "bash zlib"
-
-PNBLACKLIST[netdata] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130636/"
-- 
2.7.4



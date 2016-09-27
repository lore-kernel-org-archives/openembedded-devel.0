Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2E907600B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 13:53:50 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b4so1291677wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 06:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=65Vx6+08IuFAvbfyAwLAcFh1Kj4aeakLOabtVZlSBvU=;
	b=D5qPmmCBx7ATewJQT9gJ3L2idaT9Omiv0UUAqp15C16STYldE9BCokK4EMo6GfVmBD
	MVtq/OyYkDXalO3bnVdLLugtmNJpiqdOMvLFpJHyo2rJZZ3lY3Y6qpvOZJFiHvSra0HO
	HzGUdY5x+HQJBmOLye5UEDCREo0vmb+o5w2GjZ3g/saCk7sP/HJNw8QgXRDn4NgmJL/7
	k58SE1GtjnIBwkoKphzj6/9FRlaqtBYYtNMc/ZbUO8EcHmelPmZfa46G5vaUI1KXbp/E
	PS5zqss0v9gyOHTicv02mWpk912+fao9FzN9Sz4x0I5RZgRF9KG/qRHEPvX4yczjXawe
	XXxA==
X-Gm-Message-State: AA6/9Rm7CJhlxDn7dcKUctTx7dXX3reNFGDlnx8bEbTGF7IuboKZOJtT6bLf5ghoT2B85A==
X-Received: by 10.28.170.197 with SMTP id t188mr3253151wme.42.1474984431640;
	Tue, 27 Sep 2016 06:53:51 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id pj2sm2897986wjb.8.2016.09.27.06.53.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Sep 2016 06:53:50 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Sep 2016 14:53:50 +0100
Message-Id: <20160927135350.24598-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [OE-core][PATCH] haveged: don't compile in mips16e mode
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
X-List-Received-Date: Tue, 27 Sep 2016 13:53:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While a gcc was filed here
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77757
disable mips16e compilation in the mean time.

Signed-off-by: André Draszik <git@andred.net>
---
 meta-oe/recipes-extended/haveged/haveged_1.9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb
index 92776fd..bb44c41 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb
@@ -28,3 +28,5 @@ do_install_append() {
     mkdir -p ${D}${systemd_unitdir}/system
     install -p -m644 ${B}/init.d/haveged.service ${D}${systemd_unitdir}/system
 }
+
+MIPS_INSTRUCTION_SET = "mips"
-- 
2.9.3



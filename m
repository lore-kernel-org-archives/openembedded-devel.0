Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4F59860938
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 14:28:51 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b4so1449707wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 07:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=65Vx6+08IuFAvbfyAwLAcFh1Kj4aeakLOabtVZlSBvU=;
	b=G5vXMKV7T9AfT1dksKsu/QZmFXsPPw8hPiBembhYw7S69i0E42rDYARZasB1TYmMWY
	VkPl47uMI4RI5KPfZO0s3IFRhjpHh0KJ6QjzU4dX8grF8SadGupgNM1AVcRHX313EXMo
	HqMAC4WDWVmYxyfu1HJCcOHJyrR4ORZwLm5f/0298UaQkljRTAAoJKZFdMgAMawZChci
	5p/l6nCbp9K04v1G1r3zzU8JfPujy4Y3MeR7kRKFEuEjNrw3WSiQLfJ9GlC22rqPf9md
	OBQDzdt0MtqLn8b6ALY9M5bqadR6IJ5nwa9Fy7HSzxFYTyODx30bQ9TQIA6t4hZ27A14
	DEmg==
X-Gm-Message-State: AA6/9RmcNIn8ibXjPla7GCudCJVJbIvzoXYZrBCde2A2f6dloae+DjU0faBYpib6CNyjIQ==
X-Received: by 10.28.191.14 with SMTP id p14mr3500871wmf.39.1474986532713;
	Tue, 27 Sep 2016 07:28:52 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id g7sm3014235wjc.43.2016.09.27.07.28.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Sep 2016 07:28:51 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Sep 2016 15:28:50 +0100
Message-Id: <20160927142850.19928-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160927135350.24598-1-git@andred.net>
References: <20160927135350.24598-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] haveged: don't compile in mips16e mode
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
X-List-Received-Date: Tue, 27 Sep 2016 14:28:52 -0000
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



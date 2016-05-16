Return-Path: <net147@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id AEB556FF3D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2016 00:52:44 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id qo8so16471996pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2016 17:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iaH5snuEZNq0f51B/+x3Zdr9aAk0U1fi/M/JY4amlY8=;
	b=HvJfTZW/lbjNe57ibEijpxAkFI0VRNsFsqNL0JxF17mR4urhHjPfDUMBF7L/uas++G
	Pb6EsRIdxf4W/nyitCMd0FPvUtIH6XEZU7spX877253S6ut5tL/7akjPyJ0CtdgdbtIm
	v9aq8UvzRpyIT8XeLIFNrPzqtC+BOA2gNuYJ9vfvrHyYYpqmT/kvoOtebWQrdLODOjjO
	iEdRRXwP7ywNxF9xVNWkl0McYO67XGxBPq1KFwLU8K98dkZj34ApCOzvhVvaEnhK0SU4
	Cli3HKTkywyvtnJrdDhbP30Qss520/FoiRXfV1UtN5meOxatHd+txh6X/OTYm0D45arQ
	XjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iaH5snuEZNq0f51B/+x3Zdr9aAk0U1fi/M/JY4amlY8=;
	b=hZ4zW/35hd7LEbzy34lfplf147++cEHyfg9JmN3qKOz1db3zPCuspWdlzlTRv3pVsv
	OmRV1cJ0fo7O7N6h0KnGPPDiY7MvbDtZZvN81yqSY5hwJjaTkJP46PPWoL8XPquCEtvt
	IlytgZQssMNefCOi9+qrROKT+c7JlH7KsCm4Ij1hZuaRaA8ZhQ/M4Tp542+LHcuod13j
	L9QgxkDcGXvbvdbXow9T/g7Q74SlKZ2p2RU+lqkAWpMpMGyQc6aqc3k1cjEQ1+BtP1xG
	slc2/U0aK0Av/rLZp1RFM2oc5T9mhRTgsB1jpUmbh0jyE7APciPbCpX5io9i4AYk9lk7
	EMgA==
X-Gm-Message-State: AOPr4FWMB4wwUSdHNqY8Fbwm6tl3ie7wDtMNHHNMrv0cBh9FpsTg+VkLr0C7DFTg8NkBxQ==
X-Received: by 10.66.235.66 with SMTP id uk2mr1458823pac.83.1463359965191;
	Sun, 15 May 2016 17:52:45 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	qm10sm42798901pac.33.2016.05.15.17.52.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 May 2016 17:52:44 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2016 10:52:38 +1000
Message-Id: <1463359958-29325-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.8.0
Subject: [meta-qt5][PATCH] qtcharts: add recipe
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
X-List-Received-Date: Mon, 16 May 2016 00:52:44 -0000

Qt Charts module was added in Qt 5.7.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtcharts_git.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 recipes-qt/qt5/qtcharts_git.bb

diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
new file mode 100644
index 0000000..5aaddc9
--- /dev/null
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -0,0 +1,11 @@
+require qt5.inc
+require qt5-git.inc
+
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
+"
+
+DEPENDS += "qtbase qtdeclarative"
+
+SRCREV = "8a781841812a42ed728a76c0dcdcaa6196eac44e"
-- 
2.8.0



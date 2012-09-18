Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TE3mE-0000pb-LN
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 21:48:10 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so639231pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 12:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=1vUbADm3Q3mTMmfXZkBfDhmSOJB1hLlucZqbc6JecjU=;
	b=B/L3x/Y/Fxt9pJcdrpLwm0zfn8m2V/3Ni3QKFNXZM8g25wDowO9qTj3KkOMT4lBlAM
	/RnCXnPdYyjEm4KLgpEQce0AayGoSnUSIH0T9pqwtpDFbjPtRV8joV3AJsygjD+rDIKS
	d51sgJp4jzewKUON17jYR6doMgR7vTHggh+f3oBoMiqBOBFV8j6zsZDbRT34t9VZqHsK
	7LDXYd4pcjgkzZuR0iGoniydIeBc9zJv0VedhlkUw7bpI7dJ9oPUNqoUxVQlw+hiHAZz
	CAwSMFDupGnfJdWHv4fiCjlSMzszxN0XYAh36fuwfBRviT5VSgWXRwwU3iEJqYVTUKyk
	gURg==
Received: by 10.66.82.3 with SMTP id e3mr1235448pay.56.1347996932119;
	Tue, 18 Sep 2012 12:35:32 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id to6sm443409pbc.12.2012.09.18.12.35.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 12:35:31 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 22:35:24 +0300
Message-Id: <1347996924-23109-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkqGwrOSvLabjIvlUXG58E1LrhZ5+Su2ge2TTlEwLJ2YGQG+8E5ErOe1lfMGAG+1Fs2RQaT
Subject: [meta-oe][meta-systemd][PATCH] zram: Add systemd service for zram
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 19:48:10 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../recipes-extended/zram/zram/zram.service        |   12 ++++++++++++
 .../recipes-extended/zram/zram_0.1.bbappend        |   12 ++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta-systemd/meta-oe/recipes-extended/zram/zram/zram.service
 create mode 100644 meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend

diff --git a/meta-systemd/meta-oe/recipes-extended/zram/zram/zram.service b/meta-systemd/meta-oe/recipes-extended/zram/zram/zram.service
new file mode 100644
index 0000000..4a19367
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-extended/zram/zram/zram.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Enable zram compressed in-memory swap.
+After=multi-user.target
+
+[Service]
+RemainAfterExit=yes
+ExecStart=/usr/bin/zram-load.sh --load
+ExecStop=/usr/bin/zram-load.sh --unload
+Type=oneshot
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend b/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
new file mode 100644
index 0000000..cc98fe1
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
@@ -0,0 +1,12 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SRC_URI += " \
+        file://zram.service \
+"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "zram.service"
-- 
1.7.9.5




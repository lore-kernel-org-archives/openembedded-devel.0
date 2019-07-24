Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 970D27F162
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 08:53:12 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y4so46050423wrm.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 01:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+X+KlbywmxNyaDmub0wPTzIXfvLnVd7ekmy6+Q+IEjI=;
	b=VJDSHX9Z7yO2KUuWZ1yWfJh3bZBsvnoH97ZnTliTjFoqiElz+jikTKTJDw268angJd
	rFutqb/6/CkykL21RgHy7BaPvINoEpBpKStxiGAmqBh06FY1VEgSlXsunyHfKw6tbpc2
	aTg4YwQQn6iAqYjv1qzlTiy28kyxmPfqqzc+jUUedM4ly9IW6pfXDMgLZDZRaEMQ+tDk
	srUwxYpTBmBPRSnMYcuQoMO6kpNNi56dCDPJTJ+yTwcBhFgS+RFaGhYir9LDvhXCFCmB
	js8YAeiBROEl6GI6OT+ZY/ZtKtJxJM3tzlZn8pAGtv4nd8PVCxigI5iFLbjIPG+CTpBE
	UJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+X+KlbywmxNyaDmub0wPTzIXfvLnVd7ekmy6+Q+IEjI=;
	b=UdSnCGUyOD1q1asgwJ7O8VF9/b5kJ3jViQuk5vjvbYsaG6Sdh/efPDthbeX8LE3JoN
	bOBe1Yh4B4cbOiW4JKXgObUaFkJEi0wbgN4sTwKE92EcqGisup3GAH2ExDeg2E/r157S
	c4Scw8D59q6TWl1PqkQkNwInBEb62Rzr0Ha2DNAly4APuiDR1PMGgOHYRBxw4lie0XTl
	pJldUz2+zCf8TzRuVfpE39uvAmiYM1fbbmVJBI8jJtnlSczRPvMy3f9V5tht+TdWqsur
	8Z+rL8rQTwNxRhK5igf+1OQjLmTWrqGSHtBHs3BedeDuaXu5VFKB/xArqH8JQpe0ijD+
	X9Fg==
X-Gm-Message-State: APjAAAV5AyVDpnJgGq44W6ZBC4fO1Zmg+UV4lK6NOqDY1IfT9JK27ii5
	yfd1fUAwNQnVA2Rd011dS7c=
X-Google-Smtp-Source: APXvYqxUd7nFuh69Yz8kedHQnZGyJa0VGPKBJhEkC4a9CdxGqq4PIstNWu+Es3FsW1QCOrhZXl4JlA==
X-Received: by 2002:adf:e504:: with SMTP id j4mr84146629wrm.222.1563958393263; 
	Wed, 24 Jul 2019 01:53:13 -0700 (PDT)
Received: from localhost.localdomain
	(amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
	by smtp.gmail.com with ESMTPSA id
	c7sm38847266wro.70.2019.07.24.01.53.12
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 24 Jul 2019 01:53:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2019 10:53:06 +0200
Message-Id: <20190724085306.27277-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] bats: new package
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
X-List-Received-Date: Wed, 24 Jul 2019 08:53:12 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds a recipe for the bats package. Bats is a TAP-compliant
testing framework for Bash. The recipe is very simple - it just
installs a bunch of bash scripts.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta-oe/recipes-test/bats/bats_1.1.0.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-test/bats/bats_1.1.0.bb

diff --git a/meta-oe/recipes-test/bats/bats_1.1.0.bb b/meta-oe/recipes-test/bats/bats_1.1.0.bb
new file mode 100644
index 000000000..a8179744a
--- /dev/null
+++ b/meta-oe/recipes-test/bats/bats_1.1.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Bash Automated Testing System"
+DESCRIPTION = "Bats is a TAP-compliant testing framework for Bash. It \
+provides a simple way to verify that the UNIX programs you write behave as expected."
+AUTHOR = "Sam Stephenson & bats-core organization"
+HOMEPAGE = "https://github.com/bats-core/bats-core"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2970203aedf9e829edb96a137a4fe81b"
+
+SRC_URI = "git://github.com/bats-core/bats-core.git \
+          "
+# v1.1.0
+SRCREV = "c706d1470dd1376687776bbe985ac22d09780327"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+	# Just a bunch of bash scripts to install
+	${S}/install.sh ${D}${prefix}
+}
+
+RDEPENDS_bats = "bash"
-- 
2.21.0



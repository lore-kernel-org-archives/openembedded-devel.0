Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 41F507F323
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 10:39:56 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id p17so1082704wrf.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 03:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2xf9k+e18kycHKeJGWlwzblpWig9KKae1AN/mVgPrVk=;
	b=IhOPCbdg3mIlTcNSW2hfokYxsfQwRnEyWKSentxag5LvRikt2QsT/yqX75/apvzj0i
	Jai958eiWOW9gZomDIIqr+ySIKvcMmH3LCKRB/aLBXtU5DK1NUnduVv6r1DGzuB5hBkP
	s+7NeTTzTP17fpzvTQqxfoy/b8DaiJpMu/yfV+/gTzGlTSSMJjERfwrhlsyakOkQuDcH
	9bHsPqtoTt0T+sYWnutCNul2HPiZHmg0mpfNgvlO92/NMY3TvDb9qb6wtZXy/GPgMK/6
	WLdomEtqYwso9MW+3BkHmrF9JnSGB34xJ0y8Iu7hjESGrfQhJt+V4qJhsOdsIzXehNm7
	Guqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2xf9k+e18kycHKeJGWlwzblpWig9KKae1AN/mVgPrVk=;
	b=J+r/ymQuW60d93GWGd9UpZF90jU9FkjWd6I0S0qVGUek9F1gk39ujFfAo+Mtn9YXZs
	rKTcxk+m3ciTNcbCC/tTdMLR5BXLAOhWKvotwB2gF1LrZsVFQh1q2bxiQnv6vFkpbzTd
	rhHX+nsvbx1kJ+9OKdaMaGAabM3wYPrVhoTWjG5lL7aC9Zgjd86fHptF6uwa/KwvhV6w
	S5YFecN6+golbcyfWMuI5UUDIWGJzfwjHvJMIc5NCbhiKE91ej6LHibmtTFPSYEqJpRv
	DUYtTYevUlHSkoqvVO80Mc7iadZv+GvVKViKC43b0XuoR9yB7f5ahn7uJENem9CgBhNp
	VvHQ==
X-Gm-Message-State: APjAAAVPx3BPSujA9pHT2ZRFLYxiJHxlLW10Vui0Sdcw1xqXT9LUfXAZ
	M5IvsTHF1Gdx4Q7RsHpbaeehLACXCHA=
X-Google-Smtp-Source: APXvYqy7Qfsf8Bn3QvRP1WVNcgRamDhP+gfXOp4O03TbsBw88yOXJBso4w1xDVW7EaQpRaXc+9AZ9Q==
X-Received: by 2002:adf:e801:: with SMTP id o1mr10462838wrm.45.1565951996633; 
	Fri, 16 Aug 2019 03:39:56 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id o5sm4488036wrv.20.2019.08.16.03.39.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 03:39:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Aug 2019 10:39:55 +0000
Message-Id: <20190816103958.2701581-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190816103958.2701581-1-Martin.Jansa@gmail.com>
References: <20190816103958.2701581-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/7] dnf-plugin-tui: add runtime dependency on bash
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
X-List-Received-Date: Fri, 16 Aug 2019 10:39:56 -0000

* fixes:
  ERROR: QA Issue: /usr/lib/python3.7/site-packages/dnf-plugins/dnf-host contained in package dnf-plugin-tui requires /bin/bash, but no providers found in RDEPENDS_dnf-plugin-tui? [file-rdeps]
* fix the indentation as well

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../dnf-plugin-tui/dnf-plugin-tui_git.bb      | 25 ++++++++++---------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index e891868cda..a8367b5d91 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -14,25 +14,26 @@ inherit distutils3-base
 S = "${WORKDIR}/git"
 
 do_install_append() {
-        install -d ${D}${datadir}/dnf
-        install -m 0755 ${S}/samples/* ${D}${datadir}/dnf
-        install -d ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins/mkimg
-        install -m 0755 ${S}/dnf-plugins/mkimg/* ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins/mkimg
-        for file in $(ls ${S}/dnf-plugins/ | grep -v mkimg); do
-            install -m 0755 ${S}/dnf-plugins/$file ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins
-        done
+    install -d ${D}${datadir}/dnf
+    install -m 0755 ${S}/samples/* ${D}${datadir}/dnf
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins/mkimg
+    install -m 0755 ${S}/dnf-plugins/mkimg/* ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins/mkimg
+    for file in $(ls ${S}/dnf-plugins/ | grep -v mkimg); do
+        install -m 0755 ${S}/dnf-plugins/$file ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins
+    done
 }
 
 do_install_append_class-target() {
-        install -d ${D}${sysconfdir}/yum.repos.d
-        install -m 0644 ${WORKDIR}/oe-remote.repo.sample ${D}${sysconfdir}/yum.repos.d
+    install -d ${D}${sysconfdir}/yum.repos.d
+    install -m 0644 ${WORKDIR}/oe-remote.repo.sample ${D}${sysconfdir}/yum.repos.d
 }
 
 FILES_${PN} += "${datadir}/dnf"
 
 RDEPENDS_${PN} += " \
-  dnf \
-  libnewt-python \
-  "
+    bash \
+    dnf \
+    libnewt-python \
+"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.17.1



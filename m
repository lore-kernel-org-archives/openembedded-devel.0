Return-Path: <brendank310@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 58C5D79A6A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:41:51 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l41-v6so9979793qtl.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FVuhaqFKDN8ivNHhVGTBnmMTCDYKz29R2oyhaiQ4VpQ=;
	b=aPUkZVQziUgQXsxfmRAgpwVJSw5EDoFDjYC+xWgTjOyJamR2sr7UB/jgta64c9/GtH
	563shI/N4DnwATLPAAaEmMl9J9gCFZzauzvBLPQYXTcRbTVVObazO908e8taq0QUxazq
	OOmY1OoQrYsHrMpvR9SeYpOknz62SJ9KX+ENJvBOybLG3Mb/s2zK40PF6qe6Yc+zUFsL
	xGMj+reZApw1RobsRLdiL0QT1bfbh7JbwdQeFAVYYoLTTWskLD8t+uLRM0q6Dh1YuLeF
	DCLdfZsVK4ZjvqmlqaOUUVviqyvPRPAZOGSBoHaDeqnwTJYWjGpt3E7jEEtCmNnn1xuv
	GVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FVuhaqFKDN8ivNHhVGTBnmMTCDYKz29R2oyhaiQ4VpQ=;
	b=EP1TMtijL6FG58PtpXQpfTioTCrhMbM4KTzi0yhpSJuPJBvsmK28wWYGLt2pJcj8hb
	VVyUepFGnH6KA2Cz7mSCapZLV2FbbTLcOeeQqkP2wEFFaKTNlChSLWIM3KrKFiY/3l8S
	M81bsTKGXWXqT/hTeFdaSBGXIQkT2RIEmfmktfKglmG7p4uZdpaUGJvvNhZGMWqEUIzY
	d15EULow5viU3nZsUsHnw1A485cffGPWQDtoj0QtGF+Z44gjJEn1BGw4zFhUvCFASL6h
	bgXey9f2fbsyRui/hF77hBFhFklVqIGtfYo19m3FXk3h8jqw2EqeTKFzZLBHUrnOjLrY
	8cVg==
X-Gm-Message-State: AGRZ1gJ4srMsxPY7YhONyTq+9gJJFrCUXQTkD6K2OId8/aoJtsM0lW2O
	7A5YmfPWeaAuSXYO4imTZplqGG10
X-Google-Smtp-Source: AJdET5czqQvmKe5ctA8SJU35rdi8eciUcc2cwgyeuej/bhfr6Vkp8RaDH4I4RIvPoCy2O9kEpAhk/A==
X-Received: by 2002:ac8:318a:: with SMTP id
	h10-v6mr13907744qte.14.1540831312138; 
	Mon, 29 Oct 2018 09:41:52 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	i2-v6sm13471476qkf.42.2018.10.29.09.41.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 09:41:51 -0700 (PDT)
From: brendank310 <brendank310@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:41:06 -0400
Message-Id: <245bf6e59b04956ad91357d74a93c4ecd5326faf.1540830650.git.brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1540830650.git.brendank310@gmail.com>
References: <cover.1540830650.git.brendank310@gmail.com>
Cc: schnitzeltony@googlemail.com
Subject: [RFC meta-gnome][PATCH 09/16] gdm: add recipe for gdm (Gnome Desktop Manager)
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
X-List-Received-Date: Mon, 29 Oct 2018 16:41:52 -0000

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 meta-gnome/recipes-gnome/gnome3/gdm_git.bb | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome3/gdm_git.bb

diff --git a/meta-gnome/recipes-gnome/gnome3/gdm_git.bb b/meta-gnome/recipes-gnome/gnome3/gdm_git.bb
new file mode 100644
index 000000000..752aad13e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/gdm_git.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "GNOME Desktop Manager"
+LICENSE = "GPLv2"
+DEPENDS = " \
+           libcanberra \
+           glib-2.0 \
+           gtk+3 \
+           accountsservice \
+           plymouth \
+           gconf-native \
+           dconf-native \
+          "
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://gitlab.gnome.org/GNOME/gdm.git;protocol=http;branch=master;tag=3.30.1 \
+           "
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig distro_features_check gobject-introspection gettext
+
+FILES_${PN} += "${systemd_system_unitdir}"
+FILES_${PN} += "${libdir}"
+FILES_${PN} += "${datadir}"
+
+do_configure_prepend() {
+	install -d ${S}/build-aux
+	sed -i '/AC_CHECK_FILE/d' ${S}/configure.ac
+}
+
+do_install_append() {
+	rm -rf ${D}/var/run
+}
-- 
2.17.1



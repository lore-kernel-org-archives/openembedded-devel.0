Return-Path: <brgl@bgdev.pl>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 14DD07965B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 12:37:56 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id y139-v6so11174012wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 05:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=8rdBenxEDqS7U2oUXGYuFMoYHwKlI3xPesHWX67x4f0=;
	b=YN4YxouNYHLzH3e8SYYn9XJgmVy3Fe/3lKjL9aYKzXYwpu4zJfUTsHzhSQhnsy1XF0
	gIM9DlmvE+dOw6wegYZ72Wzu6mgxa7kyqFaWwlTQNhAPmLuMjLv1ls7o3gW/QQLzQXGL
	YNss+Ho2wkUsUmnkpHPpVSMijjJJZR6ArTBroWR4XVOi8GyeIybgcYpgulGZe2Ln2hP5
	asekT7jT/M/SUQ7ziQ/Y5xDRnW1kCKMf5AiomxazELaOF+1XMGzrOPPNNzu1EQ0WbuQu
	FRVFOV1pPMGCV7pwJz7YyuUtlfdfS0ck8yAtgJF5xZPI5rn6s+JYMFkDb4dF9uiokBNi
	2zaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8rdBenxEDqS7U2oUXGYuFMoYHwKlI3xPesHWX67x4f0=;
	b=GWgSns7pMUvmSycnBmK6OL312lO1a8Uc0wjeG1+vsLYkI1AfdJNqY3lrvhWsJd3xS/
	dBismzYlfHwoBylDPiovXeIuRgu3dOaAQcrvpfnnvYD76W68J3i9pRLKT1FgCOwiq+g6
	12T8fb0VmCofXIaSPdwrAjZGQ66FtJZIclrYR1Mrs5aghkPXBMcDuMyXFwieTKaeNA7Y
	Rcfv7QI5oyATmEmciBNOay1p0CZSyEiKQkIsH8gymKHgOtp25NxNE/G8tzXuD7QtYgMq
	JeEa/zpJC0OeuMb+DEWs0iZgWYlm4CcMtt39UCdZ15Zc5/YKO3YHB7qn41XLiw8qPJS8
	Mokg==
X-Gm-Message-State: APzg51AxYJTbcfFfH96+0lwzuRPgL8qOJxVYuVlGskvawG8K3e/E93jS
	qjJqGzNkrQaOJS7ZjF9cOVWs2iHa7/o=
X-Google-Smtp-Source: ANB0VdZQV4oNlK621DnySWDykd5XmUgbFpf3vb25RGi39Tcu2IGeTCRoV2Tk7VfQaGs+iJz/SKnXtg==
X-Received: by 2002:a1c:b286:: with SMTP id
	b128-v6mr1844951wmf.121.1536237477493; 
	Thu, 06 Sep 2018 05:37:57 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
	by smtp.gmail.com with ESMTPSA id
	k13-v6sm3997489wrq.7.2018.09.06.05.37.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 05:37:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Joe MacDonald <joe_macdonald@mentor.com>,
	Armin Kuster <akuster808@gmail.com>
Date: Thu,  6 Sep 2018 14:37:45 +0200
Message-Id: <20180906123745.26192-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-networking][PATCH] networkd-dispatcher: new package
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
X-List-Received-Date: Thu, 06 Sep 2018 12:37:58 -0000

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds a recipe for networkd-dispatcher.

It's a simple package containing a python script that needs to be
installed together with a systemd service and an example config
file. There's nothing to build.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../networkd-dispatcher_1.7.bb                | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb

diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb
new file mode 100644
index 000000000..1887c4c7a
--- /dev/null
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Dispatcher service for systemd-networkd connection status changes"
+DESCRIPTION = "This daemon is similar to NetworkManager-dispatcher, but is much \
+more limited in the types of events it supports due to the limited nature of \
+systemd-networkd(8)."
+AUTHOR = "Clayton Craft and others"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
+
+RDEPENDS_${PN} = "systemd python3 python3-pygobject python3-dbus"
+
+SRC_URI = "git://gitlab.com/craftyguy/networkd-dispatcher.git;protocol=https"
+SRCREV = "c7e25623a161b64618ea778541c064d2a1df086b"
+
+S = "${WORKDIR}/git"
+
+# Nothing to build, just a python script to install.
+do_compile() {
+}
+
+do_install() {
+    mkdir -p ${D}/${sbindir}
+    install -m 0755 ${S}/networkd-dispatcher ${D}${sbindir}/networkd-dispatcher
+    mkdir -p ${D}/${systemd_unitdir}/system
+    install -m 0644 ${S}/networkd-dispatcher.service ${D}/${systemd_unitdir}/system/networkd-dispatcher.service
+    mkdir -p ${D}/${sysconfdir}/conf.d
+    install -m 0644 ${S}/networkd-dispatcher.conf ${D}/${sysconfdir}/conf.d/networkd-dispatcher.conf
+}
+
+FILES_${PN} += "${systemd_unitdir}/system/networkd-dispatcher.service"
-- 
2.18.0



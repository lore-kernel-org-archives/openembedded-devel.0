Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 96DFF60843
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2020 06:18:00 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id e9so5909699pjr.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Feb 2020 22:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=chMF4/qc5FuCWdTEC5OUnDNhkma9Fo4u+bfXQKv/tHE=;
	b=iIn4XkDdpeYV2XMvYWL5s6j8UKk/GoVrDOD4DK/9wZ0CuUp+rNPUyGnehvLblbOhgr
	nhJQ/jmIRwf+XBAAD2zeVcTBoFM2Eyd4aVbnIBjhPdlQ06qtqCqWZSTZqJTxI44ZIKUm
	wKK3eGhsJMKsqMwe0ScL86kkba9MPHyqlBGmz+mj34EGRTMt+E13QX1bznSFg7cw2ypi
	JvUpePS7YkbkKtLZKEjnb2wMV+xfLHEbKW5UgqhcQNJxuUl/OCne4cVQYiRSjNDVwfhU
	iYY8UrW4cUbBGRpM5gNACn6lwp5PSyqfHrc5AtutXfgAICaML5mKf4oyyWa6MQDkqmVz
	OC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=chMF4/qc5FuCWdTEC5OUnDNhkma9Fo4u+bfXQKv/tHE=;
	b=LSNQcuLGQ/NJDiVkyhAIJOzCxVWBkGUCv4ncUEAfnNKggZMqAzLj71AuMxXg5DBPDH
	ECmpr+wXdFu2agEGA7MuPs3Z9uFWZrPFBvl5u4tTO+BhNjo+ldyw+xhwCHT926QJbCl2
	imc778x9pli9wVdDaVzZ33dmlmqRrVzCzIwxuENXc61Knp9A+HkiAdlvHJCFHi5AX1iu
	pokwklHOjC6RPAbluoreAw8rKQicY3nbeyQBSRmElGtoVlmvEMgDyibOBhDbttRJeb2/
	eF7/uTdrH+7cGAT4GPTm8njjrWwtc8FbFk7Igs3WH22Oq9GuzeEg6/cylBzRNTA4cIW1
	K4Xw==
X-Gm-Message-State: APjAAAUwIYJUkt383+eGeBTPXA0Utp4W337jJ9+yH5Zvbmuqux3tDNaq
	RhHTTRgkZu2ZuGyI10pzFE7pUOM6XyE=
X-Google-Smtp-Source: APXvYqwhBXqtnXAJRzoFCEB0U7xDB9/u6bpf2DL6wvTcVccuSmEXXfoUfhI4n318f6UoefLJd5zOFw==
X-Received: by 2002:a17:90b:1110:: with SMTP id
	gi16mr26273170pjb.110.1580710681071; 
	Sun, 02 Feb 2020 22:18:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5683])
	by smtp.gmail.com with ESMTPSA id
	133sm18695840pfy.14.2020.02.02.22.18.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 02 Feb 2020 22:18:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Feb 2020 22:17:55 -0800
Message-Id: <20200203061756.2643196-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] recipes: Inherit perlnative for pod2man
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
X-List-Received-Date: Mon, 03 Feb 2020 06:18:00 -0000
Content-Transfer-Encoding: 8bit

replace host version of pod2man perl-native provides, helps in
improving reproducability

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb   | 2 +-
 meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb   | 2 +-
 meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb | 2 +-
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb       | 2 +-
 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb          | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
index 41b4d0d309..7871801b6b 100644
--- a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
+++ b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
@@ -27,7 +27,7 @@ RDEPENDS_${PN} += "openssh-misc"
 #
 S = "${WORKDIR}/pam_ssh_agent_auth-${PV}"
 
-inherit autotools-brokensep
+inherit autotools-brokensep perlnative
 
 # Avoid autoreconf.  Override the --libexec oe_runconf specifies so that
 # the module is put with the other pam modules.  Because it cannot, in general,
diff --git a/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
index 24df750e01..38ce4f5571 100644
--- a/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
+++ b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/wertarbyte/${BPN}.git;branch=debian"
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep pkgconfig update-rc.d systemd
+inherit autotools-brokensep pkgconfig perlnative update-rc.d systemd
 
 PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
 PACKAGECONFIG[systemd] = ",,systemd"
diff --git a/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb b/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
index aeae071dcb..259c640523 100644
--- a/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
+++ b/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
@@ -7,7 +7,7 @@ DEPENDS = "virtual/libx11 libxtst"
 
 PR = "r1"
 
-inherit features_check pkgconfig
+inherit features_check pkgconfig perlnative
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
index fb8c4a202f..91d77ac938 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
@@ -17,7 +17,7 @@ SRC_URI = "\
 SRC_URI[md5sum] = "9d36882998449daceec267c68a21ff0d"
 SRC_URI[sha256sum] = "3eb7be7d6ef618c0a444316cf5c1f2f9d7227aedba7a192f389fe3e7c0dfbbd9"
 
-inherit autotools systemd pkgconfig
+inherit autotools systemd pkgconfig perlnative
 
 EXTRA_OECONF = " \
     --disable-libusb \
diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
index aefe3627eb..efe95b1019 100644
--- a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
+++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
@@ -29,7 +29,7 @@ SRC_URI = "git://github.com/DrHyde/${BPN};branch=master;protocol=git \
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools perlnative
 
 # Fix rsnapshot.conf.default:
 # don't inject the host path into target configs.
-- 
2.25.0



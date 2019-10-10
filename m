Return-Path: <brgl@bgdev.pl>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id DB81B6BA11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 22:34:38 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id q24so3472103plr.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 15:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+Mnjk2XbYXRVQ4h0IKL52cB1rLd7L3Q5y4mMVIV8dj8=;
	b=aQxvwExeGXDxotg5Jl40or/TavlBx58rAIXcazZlPSNyOxvcgtPjJPleVyKsTmAzhU
	stIMcuA3uTLzawePItpSLLOY0qy6hkyPd20BNgNsB+ogAsHAlz7c3y8vZj82JAqyaMSM
	Gxt/HKOHCstUMp2JDqMhHS46orSw4efzw88bI2+qBP8nQV6K2m7x8lwh8csygY7NIgzy
	IYgTWC8M2Iw25gCbXKqtQviVdIw02Oj4a+LI1QpE8/46lX2cSsgKswDKyeUwoD6I9ZOB
	YMgYJAUNBNGPA36flujWMjdSjyY/Ie96MHKjQXafh/5BBdumTir0wpSl+R9mkzjKkghY
	5lNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+Mnjk2XbYXRVQ4h0IKL52cB1rLd7L3Q5y4mMVIV8dj8=;
	b=Fc/xUct9FxeeGgtGzw82IKhrBAoMe84V+T4Rzbq8hVMT3sy2ufRJAtE4tuyvhL5XMm
	K8cAymwUUYI8hRw4O42RufuBhoY7uyQRTksYZO+ZpN1ISid1vQvMy8HhzWpCet8AqeGu
	0QOKX6wXjrtPwl1BffynoWamXXKarW9NnhSbWDccEJ0jXDJ1RXEyjpx4PCAkxnttLTJu
	KkJza84CgK2pV8GRvK/pFIOmfDUWNX+ZBLxh7EmsNKRZvJh8Disv0dPH1zdwC5kcG6b9
	ZqdrRIJtXt1TNdgvn8fWBNcerI/6yXNraTteWBxa9w9Fniw2cljxCC7n2hixbmaAFeb3
	LcHQ==
X-Gm-Message-State: APjAAAXYRFBB9nBTRTRcw2548eYywXGIvYGJSdSH5CtuAr9A3X3qY05E
	4EJkQpySbAUiwtysDIgRMaJt4g==
X-Google-Smtp-Source: APXvYqzbDaTsgp3GsY0BFnf3qXEFD1eLYQV9qaYsppK++8kNeFPcik7rf8mkgOm9/liu7OBPXiVUlg==
X-Received: by 2002:a17:902:6944:: with SMTP id
	k4mr11830236plt.175.1570746879987; 
	Thu, 10 Oct 2019 15:34:39 -0700 (PDT)
Received: from debian-brgl.local ([204.153.194.98])
	by smtp.gmail.com with ESMTPSA id 6sm5797121pgl.40.2019.10.10.15.34.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 15:34:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 11 Oct 2019 00:34:29 +0200
Message-Id: <20191010223429.31337-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010223429.31337-1-brgl@bgdev.pl>
References: <20191010223429.31337-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-networking][PATCH 3/3] networkd-dispatcher: inherit systemd class
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
X-List-Received-Date: Thu, 10 Oct 2019 22:34:39 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the systemd class to correctly plug the package into the systemd
infrastructure.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../networkd-dispatcher/networkd-dispatcher_2.0.1.bb      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
index 06c83e9d8..8523ae8c0 100644
--- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
@@ -7,7 +7,7 @@ AUTHOR = "Clayton Craft and others"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
 
-inherit distro_features_check
+inherit distro_features_check systemd
 
 RDEPENDS_${PN} = "python3-pygobject python3-dbus"
 REQUIRED_DISTRO_FEATURES = "systemd"
@@ -16,6 +16,10 @@ SRC_URI = "https://gitlab.com/craftyguy/networkd-dispatcher/-/archive/${PV}/netw
 SRC_URI[md5sum] = "304d7dcc21331ea295e207f8493cb8d8"
 SRC_URI[sha256sum] = "21f84c3646a043329dc64787e4e58dfce592b2559b0e3069af82c469805660c2"
 
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "networkd-dispatcher.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
 # Nothing to build, just a python script to install
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
@@ -25,5 +29,3 @@ do_install() {
     install -D -m 0644 ${S}/networkd-dispatcher.service ${D}/${systemd_system_unitdir}/networkd-dispatcher.service
     install -D -m 0644 ${S}/networkd-dispatcher.conf ${D}/${sysconfdir}/conf.d/networkd-dispatcher.conf
 }
-
-FILES_${PN} += "${systemd_system_unitdir}/networkd-dispatcher.service"
-- 
2.23.0



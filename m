Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3B9D36CA92
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 15:39:46 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id u13-v6so12404623wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 07:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=83AV1SZA16C6cOxubrI4ANiOHI8iB53LT3fL3iGtDOc=;
	b=xtUsoNiCAlfN1zBMIGRTFRpoRgeMbiWzVek8Um+/ZOUqCS87lCWfsa9Cz1QcZ0Lt/+
	2R+U65cx8gLWskyb3O4OQPbuQiEtvUMUEa8KgtOluG+xI1A1yRtYD4IjU5XTRqurLSlB
	NAQUpzITd0u611UO45glmlG8Pa5nx9ZOsw2p1wk/5SLdMu/KDnCmMONdS3kDD4J9MC+A
	R8zaQnU+h2HUCkBy/jlnzFjfczGtafM6CQD3FsauQd4vho5w5DOTrvZSkH5duI8iykaV
	xgCWusIURRhU0fww7chWiYPCpXq2nedgAnG0oMBeEnraXSBwiYH2mnkBpgfsWjNQ65L2
	Y31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=83AV1SZA16C6cOxubrI4ANiOHI8iB53LT3fL3iGtDOc=;
	b=mwjvczygKDSlTzhXpoOrX6chsBRgn8XaZ/Kx7/Irgyj+GqSNAd8mpFz36glfvu/ZbY
	v5OErPTr0C/Cyppo4ddrEl06VDKVqb/JVSnDSDKSm8esaelLteyBHn/aqJ6eWlXQ1gdk
	+ayRKGIS/uuQItnTeDHfEX8b9yDuLvglhH6y2ZifVVgy7BCP0R/eryS9oZftaxGFDQQu
	Zf/fCyRhHvTOBzWqHrG0PbTKZlB1MZT8/gZhLg+9kO+TYa0i5y2yJL4OiG58P6nCQ4d2
	Zp/npYija8A+1yJt2UeK3tJlEIZfjP9MRB1NlF3qmNcT56Cv4Nu+IMq31rPwYHmPgPHQ
	R3YA==
X-Gm-Message-State: AA+aEWbdwyH8w6H19CJAPrGeaYYFK3g4wJcfDgT+EgRWpogT9DIiBi8M
	qgf2gIgsPxXHiJN7+F4AgH4vKuSlWVI=
X-Google-Smtp-Source: AFSGD/WDUSQr2QLDUeD2iB9rM5go8CZ8rZiPmOWiFsP6WAI4+ygJv46V8qkn1Lvb3v+IMJIFtZE3SA==
X-Received: by 2002:a1c:b47:: with SMTP id 68mr2312192wml.148.1542987586498;
	Fri, 23 Nov 2018 07:39:46 -0800 (PST)
Received: from debian-brgl.home (lfbn-mar-1-609-89.w90-118.abo.wanadoo.fr.
	[90.118.185.89]) by smtp.gmail.com with ESMTPSA id
	u10sm9983953wrr.33.2018.11.23.07.39.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 07:39:45 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Nov 2018 16:39:35 +0100
Message-Id: <20181123153941.10186-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/6] sigrok: set of new packages
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
X-List-Received-Date: Fri, 23 Nov 2018 15:39:46 -0000
Content-Transfer-Encoding: 8bit

This series adds recipes for libsigrok and accompanying libraries and
tools. The eventual goal is to add pulseview - the graphical interface
for sigrok - to meta-qt5-extra.

First two patches add external packages used by libsigrok. The third
patch adds a recipe for native doxygen, which is needed to generate
libsigrok C++ bindings which will in turn be necessary to build
pulseview.

Last three patches add recipes for the sigrok suite including the
command-line utility - sigrok-cli.

Bartosz Golaszewski (6):
  libzip: new package
  libserialport: new package
  doxygen: new native package
  libsigrok: new package
  libsigrokdecode: new package
  sigrok-cli: new package

 .../doxygen/doxygen-native_1.8.14.bb          | 15 ++++++++
 .../0001-build-don-t-look-for-Iconv.patch     | 36 +++++++++++++++++++
 .../libserialport/libserialport_0.1.1.bb      | 12 +++++++
 .../recipes-extended/libzip/libzip_1.5.1.bb   | 18 ++++++++++
 .../sigrok/libsigrok_0.5.1.bb                 | 23 ++++++++++++
 .../sigrok/libsigrokdecode_0.5.2.bb           | 14 ++++++++
 .../sigrok/sigrok-cli_0.7.0.bb                | 18 ++++++++++
 7 files changed, 136 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen-native_1.8.14.bb
 create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
 create mode 100644 meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb
 create mode 100644 meta-oe/recipes-extended/libzip/libzip_1.5.1.bb
 create mode 100644 meta-oe/recipes-extended/sigrok/libsigrok_0.5.1.bb
 create mode 100644 meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.2.bb
 create mode 100644 meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.0.bb

-- 
2.19.1



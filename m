Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 47F556B07F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 10:01:03 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 3so8561834wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 03:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pwidGbXnBXH/u+VpLZdeYPWzBQCgRHhA+tYRfvRTMTQ=;
	b=vvfg7lcIXz1lz4peTH79Do0r67WaHXMfII9f8GRa/wcYM8rivQ1WMUYn0dcmR54Yrj
	AWg7fDHm9tjCMKKTmWz4pOpVZIvA95bV8IcnbPzL+LyTPt8o5B4vkEsBWs0OIImdw9Pn
	IdG2FwGiv+9MXaXZmJHrtdazOi5qqZWz8XNkxPZg0/y6ZeWKlE0YucyucWgiS5/dvZ/W
	zP0FiqDfHZ9ieduDaRNBe4BdnmgsBsgyRVHgNGeFbqAaZeBYQ/6uVPXXAi8ieeuNgmbK
	eoWL5gL4cGIEypEAQLoDIWEyLsNZGI97SjBFo0261Z/1ScenOxE17OxXN/E+ZONHE3Ui
	kz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pwidGbXnBXH/u+VpLZdeYPWzBQCgRHhA+tYRfvRTMTQ=;
	b=eUVeM3jNrjJJilW2YWWMfa2ovzRSCZiOJh5L4Oe/x1N4mwWQKv9YXmCcA+EgUUus0h
	XgPOGJfyweS9LrWYwBAb4Qbg+/8bMIJpobySRVDASSrDnIqKODg2pmKV7lNy++9gxP2l
	OOnKB0lrtZiCT51pKAg21Y58FPC3t1WFOTiRY+uKCsvfeAbqBpnI6RpHdZA5YZVyijGn
	wQ0s0PnCQr+q2+KoJS6FQxg/6cXZ2kcvA5YjfNN5jqIuiG88kSX6paCSsLHNv27jBW8Q
	Jqo1a+La4jc0Q4fPYL2YAjKhIXCmcRbY1motFIxZGXa8RxEivUvmqCykkcmMVn4iWf/e
	j64Q==
X-Gm-Message-State: APjAAAWt6U4/MLYPmd6US5SLf1P5sPazm7/V99xPksUcLwQfrZBzfiOu
	pPYKCdNusEWrO+7s7EQ7iK80cg==
X-Google-Smtp-Source: APXvYqysPgGPFM5o9cmt6BYvaCDPue6Cn2lJSzdjnw8zPiLvY2/i5TFvXdO5ULtcoBFNyoXrzdjYyw==
X-Received: by 2002:a1c:1b0b:: with SMTP id b11mr12920809wmb.82.1569232863832; 
	Mon, 23 Sep 2019 03:01:03 -0700 (PDT)
Received: from localhost.localdomain
	(amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
	by smtp.gmail.com with ESMTPSA id t14sm9412032wrs.6.2019.09.23.03.01.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Sep 2019 03:01:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Tim Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>
Date: Mon, 23 Sep 2019 12:00:56 +0200
Message-Id: <20190923100058.30454-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 0/2] dtschema: new python package
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
X-List-Received-Date: Mon, 23 Sep 2019 10:01:03 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The following series adds support for the dtschema package to meta-python.
It's a set of python tools allowing to verify the validity of YAML
device-tree binding documents in the linux kernel. The first patch adds
a dependency of dtschema - the ruamel YAML parser. The recipe for an older
version exists in meta-homeassistant, but IMO it's generic enough to be
added to meta-openembedded.

Bartosz Golaszewski (2):
  python3-ruamel-yaml: new package
  python3-dtschema: new package

 .../python/python3-dt-schema_git.bb              | 14 ++++++++++++++
 .../python/python3-ruamel-yaml_0.16.5.bb         | 16 ++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dt-schema_git.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.5.bb

-- 
2.23.0



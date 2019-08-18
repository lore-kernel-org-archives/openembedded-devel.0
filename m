Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5F25F7CF98
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 22:33:35 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id b16so6703603wrq.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 15:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Du+PiHx4fJUwYbE12zmcHej3MKdxa3nR06c4qBl9HdU=;
	b=hF2O1JtRpoeo3W9Kc+J3L8V9tf26hn45Okm0WO5nKzaQgo16JGWmUx5Bvi/HzDOefH
	yO/uGsG1wZ37x6YFgEmf581vv6KYieP0JlBgVwGmmwOYmVRNqYNFXE8yFUjaXSu1qhvD
	k11z/+QdVfKRVvjd4f8A3QTSF2bSIgvhxSYVm4MmPUH62VejVWq3eFWE0TERaTwJXnGq
	tMD5zVw4MxOXK6aBPiMQefTYATuJ6F0IdlD4sIRqgBsbTWbZCD4cs1XflniINmMlPcuZ
	KXOh9aHFJkIxC+pKista7LcI+u464v6/JDv27PBFng1mnuMdK2/+S9n+Yr0Hw8YETB3S
	xQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Du+PiHx4fJUwYbE12zmcHej3MKdxa3nR06c4qBl9HdU=;
	b=Pt7e4FEliUgUfJ041Lodgx4+wXke/BK6jPTpjFxoGFsXqA4epbRVuaEbQuCojQ5Uip
	0skG1PL6sXIfvizFWW5NySp5T9Py5ZfA7kWmY0tXil8WvvO8YTzoVafdyoyP0ZdPsKA5
	lRrmUyMLcCqc5kz273412k7RYduVJokYN3rBneuaCYxvNYpKRzjZnJ/KB753rXsMqhff
	nKCf6Yk+Xzy6cbuGoHanUFZ8ibD6zOJKcGnmlYd55U7RiYDY/ZXGPxsDECJ1ru+IFEBp
	gBsZwq9jhbKaYgzpSEkjQDQ+8elfLLIWam5NRamVYyLD4pnyhPPiMTUWctCCR8ThfuH2
	8P7Q==
X-Gm-Message-State: APjAAAWZ+ZI5hDdTPLGi8ByL1fPREwXJP0FbCkbZEgPOfjEIvVI2nbDZ
	Mjp50w5VeYz1pI3lOAogP614eXYJ
X-Google-Smtp-Source: APXvYqzfLm90twcW9sSHK9iFSnSoDpU9omacYkqZH+izhopgAxv5r46bE75uir+8usDgkuQ4xBL7bw==
X-Received: by 2002:a5d:628d:: with SMTP id k13mr23402672wru.69.1566167615723; 
	Sun, 18 Aug 2019 15:33:35 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F2D8718C84C5511B02F056F.dip0.t-ipconnect.de.
	[2003:f0:7f2d:8718:c84c:5511:b02f:56f])
	by smtp.gmail.com with ESMTPSA id
	k124sm30390814wmk.47.2019.08.18.15.33.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 18 Aug 2019 15:33:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Mon, 19 Aug 2019 00:33:06 +0200
Message-Id: <20190818223316.19772-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 00/10] further xfce updates
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
X-List-Received-Date: Sun, 18 Aug 2019 22:33:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Not exactly exciting updates 

Andreas Müller (10):
  xfce4-time-out-plugin: upgrade 1.0.2 -> 1.0.3
  xfce4-battery-plugin: 1.1.2 -> 1.1.3
  xfce4-smartbookmark-plugin: upgrade 0.5.0 -> 0.5.1
  xfce4-wavelan-plugin: upgrade 0.6.0 -> 0.6.1
  xfce4-netload-plugin: upgrade 1.3.1 -> 1.3.2
  xfce4-systemload-plugin: upgrade 1.2.2 -> 1.2.3
  xfce4-mpc-plugin: upgrade 0.5.1 -> 0.5.2
  xfce4-fsguard-plugin: upgrade 1.1.0 -> 1.1.1
  xfce4-diskperf-plugin: upgrade 2.6.1 -> 2.6.2
  gigolo: upgrade 0.4.2 -> 0.5.0

 .../{gigolo_0.4.2.bb => gigolo_0.5.0.bb}      |  6 ++--
 ...gin_0.5.1.bb => xfce4-mpc-plugin_0.5.2.bb} |  6 ++--
 .../battery/xfce4-battery-plugin_1.1.2.bb     |  9 ------
 .../battery/xfce4-battery-plugin_1.1.3.bb     |  9 ++++++
 ...lude-sys-sysmacros.h-for-major-minor.patch | 30 -------------------
 .../diskperf/xfce4-diskperf-plugin_2.6.1.bb   | 12 --------
 .../diskperf/xfce4-diskperf-plugin_2.6.2.bb   | 10 +++++++
 .../fsguard/xfce4-fsguard-plugin_1.1.0.bb     |  9 ------
 .../fsguard/xfce4-fsguard-plugin_1.1.1.bb     |  9 ++++++
 ...ys-sysctl.h-its-unused-on-linux-port.patch | 25 ----------------
 .../netload/xfce4-netload-plugin_1.3.1.bb     | 12 --------
 .../netload/xfce4-netload-plugin_1.3.2.bb     | 10 +++++++
 .../xfce4-smartbookmark-plugin_0.5.0.bb       |  9 ------
 .../xfce4-smartbookmark-plugin_0.5.1.bb       |  9 ++++++
 ....2.bb => xfce4-systemload-plugin_1.2.3.bb} |  6 ++--
 .../time-out/xfce4-time-out-plugin_1.0.2.bb   | 10 -------
 .../time-out/xfce4-time-out-plugin_1.0.3.bb   | 10 +++++++
 .../wavelan/xfce4-wavelan-plugin_0.6.0.bb     |  9 ------
 .../wavelan/xfce4-wavelan-plugin_0.6.1.bb     |  9 ++++++
 19 files changed, 75 insertions(+), 134 deletions(-)
 rename meta-xfce/recipes-apps/gigolo/{gigolo_0.4.2.bb => gigolo_0.5.0.bb} (54%)
 rename meta-xfce/recipes-multimedia/xfce4-mpc-plugin/{xfce4-mpc-plugin_0.5.1.bb => xfce4-mpc-plugin_0.5.2.bb} (64%)
 delete mode 100644 meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.2.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.3.bb
 delete mode 100644 meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin/0001-panel-plugin-Include-sys-sysmacros.h-for-major-minor.patch
 delete mode 100644 meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.1.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.2.bb
 delete mode 100644 meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.0.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.1.bb
 delete mode 100644 meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin/0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch
 delete mode 100644 meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.1.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.2.bb
 delete mode 100644 meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.0.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.1.bb
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.2.2.bb => xfce4-systemload-plugin_1.2.3.bb} (53%)
 delete mode 100644 meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.2.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.3.bb
 delete mode 100644 meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.0.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.1.bb

-- 
2.21.0



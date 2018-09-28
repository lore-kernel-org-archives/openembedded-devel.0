Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7D35D607AD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2018 15:18:12 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id t70-v6so4681288pgd.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2018 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:from:date:subject:to;
	bh=KlDEI2xf8p2aGUW+MfMqQnCsenSOFFvLtzu3ZN1cC0c=;
	b=VICThWIhTJ21078Tyv1wuTKfKUSc+G48lJ3QJGIR42bEok8dk1ppRybk+NGm3c0jqV
	HA8Y+2cWuULgn6tM0e75vDfydJVjUbRuGnu+ItnbMT2VFd8qTebh91YDr3nOfhcShbpv
	hsBRrs6HhbqOPPjOvX0VB+vkRInWaDoPHA2LnyAstXu19HIrqQ1I5pUac1stFUznzU4N
	YRvKdjbJNoNZKfY6JaeF/4mxfuFaqPOxn0aqduIIA9pK+ojIdeMXh9AD81hTD4lGeo+K
	wefqc32xBVWi3OduU6mrXEHik4fiYw/iuad0DZFIkx6kZYFiLHa7SgWPB0gnQaDitxw6
	K3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:from:date:subject:to;
	bh=KlDEI2xf8p2aGUW+MfMqQnCsenSOFFvLtzu3ZN1cC0c=;
	b=D8XMw39IcP6c3frwZuz3YHIEGCuEndX3mnzoa45Qv818Len5bc2I+0XN3wCw7CC7Fr
	ppN0L9k08r2vFwJx89tMtiYubQyD4fdUcq/AOnHuGMZvOUSbEsuUTqDYUdX7lchZgWfP
	qAQtgy1YJCPGHcC1yjhQKIXGD08mbhgrYupcLDvEEP9xSWaw19RVKHK/uoSBVM9EN5Wl
	r8Ezb3MIqIewlYReOxFmweINoQq8uy9wzt2uNvFDm2suu19DIe5p0v1OincrsX9n/NUK
	Qt18MBF8RLO1h9HKsOZtM6FTB3S6N0zo70RJTJ0fRQKjH7XNk+67zdONpxUOtvZq3DfJ
	iI/Q==
X-Gm-Message-State: ABuFfoi65rNysRyp5dErIahGWgfIo/02ebQevQQR2ojxPHCiKTnedhlj
	zPPmbiyIKpRW+GwrYx0geXk=
X-Google-Smtp-Source: ACcGV61I0XgqFNAxzMuUPEgUv65W6QMwUaJr3S3W/jLR5GqDVCA5kHPlbEyCqxFGFtI0ND1Bh8ZBwQ==
X-Received: by 2002:a63:170b:: with SMTP id
	x11-v6mr15119755pgl.364.1538147893514; 
	Fri, 28 Sep 2018 08:18:13 -0700 (PDT)
Received: from akuster-ThinkPad-T460s ([2601:202:4180:c33:e960:91d2:2331:2d71])
	by smtp.gmail.com with ESMTPSA id
	t123-v6sm7808874pfd.51.2018.09.28.08.18.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Sep 2018 08:18:12 -0700 (PDT)
Message-ID: <5bae4634.1c69fb81.9e934.4f05@mx.google.com>
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: "Armin Kuster" <akuster@akuster-ThinkPad-T460s>
Received: by akuster-ThinkPad-T460s (sSMTP sendmail emulation);
	Fri, 28 Sep 2018 08:18:10 -0700
Date: Fri, 28 Sep 2018 08:18:10 -0700
To: <akuster808@gmail.com>,<openembedded-devel@lists.openembedded.org>
X-Mailer: mail (GNU Mailutils 2.99.99)
Subject: meta-oe sumo-next pull reatest
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
X-List-Received-Date: Fri, 28 Sep 2018 15:18:12 -0000

The following changes since commit be79b8b111a968efdbe5e1482d0c246d0b24763e:

  fuse: CVE-2018-10906 (2018-08-26 11:03:11 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded sumo-next

for you to fetch changes up to 2bb21ef27c4b0c9d52d30b3b2c5a0160fd02b966:

  poppler: Update to 0.64 (2018-09-27 08:49:10 -0700)

----------------------------------------------------------------
Armin Kuster (1):
      grpc: move it from oe to networking layer

Khem Raj (2):
      gedit: Add dep on python-six-native
      poppler: Update to 0.64

Martin Jansa (2):
      libqb: Fix build with gold
      openocd: prevent fetching git submodules during do_configure

Nicolas Dechesne (1):
      meta-multimedia: fixup LAYERDEPENDS

Paul Eggleton (1):
      protobuf: make python-protobuf dependency optional and default to off

Sinan Kaya (1):
      dnsmasq: CVE-2017-15107

Takuro Ashie (1):
      uim: Fix SRC_URI

 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb     |   6 +-
 meta-multimedia/conf/layer.conf                    |   2 +-
 ...txt-Fix-grpc_cpp_plugin-path-during-cross.patch |   0
 ....txt-Fix-libraries-installation-for-Linux.patch |   0
 ...s.txt-Find-c-ares-in-target-sysroot-alone.patch |   0
 .../recipes-devtools/grpc/grpc_1.8.5.bb            |   0
 .../recipes-support/dnsmasq/dnsmasq_2.78.bb        |   1 +
 .../dnsmasq/files/CVE-2017-15107.patch             | 263 +++++++++++++++++++++
 meta-oe/recipes-devtools/openocd/openocd_git.bb    |  26 +-
 .../recipes-devtools/protobuf/protobuf_3.5.1.bb    |   7 +-
 meta-oe/recipes-extended/libqb/libqb_1.0.3.bb      |   8 +
 ...ists.txt-Add-libpoppler-to-link-along-wit.patch |  29 +++
 .../{poppler_0.63.0.bb => poppler_0.64.0.bb}       |  18 +-
 meta-oe/recipes-support/uim/uim_1.8.6.bb           |   2 +-
 14 files changed, 339 insertions(+), 23 deletions(-)
 rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch (100%)
 rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch (100%)
 rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch (100%)
 rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc_1.8.5.bb (100%)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2017-15107.patch
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch
 rename meta-oe/recipes-support/poppler/{poppler_0.63.0.bb => poppler_0.64.0.bb} (76%)


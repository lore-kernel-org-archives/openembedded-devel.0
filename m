Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 657A9606A8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 19:08:45 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id f14so16417853wre.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 12:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=27QUCj0+XnDT0dhFlsEocYzfNWnwRWcsez1+hoD5u+M=;
	b=lvJCpMryWOemImmt1D+heJgsaj6xDU2V76khpnGfOnEcadHRD0uiNmNKg/ZPHLVdty
	k8pq6c07EGdKBi91X4zMbnIFoVu9S7szWWQ1Ws7Wj93E/OwidmEQ5OjLlPFVrEaJV6Q2
	YJrxKUrFtjr0OFf41dzduoGKmNSiSXK+cLSktMZzhGdJ7p/b24mzDFYRAbPv3rnEYIoo
	X5FpGLcLeFbe8yYvrBpk+AXd3UOgIZvKFyHVP1UOyQqm0W2dUADJZl+B+OpVJ1xYH41g
	rCjg2cAA0WAjpLWUFncFCQOp31SqwPFJfX3p5zq8FGQGQ+XkNHWbPKD6tdOX+n38d3DZ
	AORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=27QUCj0+XnDT0dhFlsEocYzfNWnwRWcsez1+hoD5u+M=;
	b=ifRVa+AGrUhHOM6w86frjNzZmI2s//f4o+Jd/1IwwQt9uJNz6FnVYRSJSZnXGrfiRq
	WeDw+EBV1l58AppN+TQgmq2Bu3n9qzJZghj+n6RyHOoXi0AfR1+jSyewQPvlF+GavC4r
	qkqrjN1kfZhxZB6v3U5fePo3a1k7GVj6TgajtY9Pi01imbjcn+i+iccN8ZyGrhnrYLGj
	6FmlybSxiAZMRqfhm+x4UGuiPudKVlaSteoGUdhSKKlC8t+G1DfyykOUvmNesY5kdI39
	7jGA5o6Qap7NFueAdgriMus5xDr+kQiwzS0xH8V05ePfX0XOusoe6+Yf5EYtdIwptSR1
	aHug==
X-Gm-Message-State: AElRT7G3X3kCMgg1clrRPpTq7VJsL9JPM9kXRY83YYv8TTN8VLAQ34BO
	JoTZU+wlgqNXIbgepGnPy2bPew==
X-Google-Smtp-Source: AG47ELsYVndsfIR59SdQjBtaJ4lnWpoMHIaGnItmi6Sir4vCmQgMBcJbrrFyiFaR0tQBc3BFnSWBvQ==
X-Received: by 10.223.164.26 with SMTP id d26mr7119820wra.199.1521400125589;
	Sun, 18 Mar 2018 12:08:45 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b78:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	b8sm11614531wrf.29.2018.03.18.12.08.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 18 Mar 2018 12:08:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 20:08:25 +0100
Message-Id: <20180318190833.1393-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH 0/8] Updates and minor fixes
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
X-List-Received-Date: Sun, 18 Mar 2018 19:08:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* 0001 (glm update): Is a resend and patchwork says it is under test [1]. Added
      it again because 0002.. requires it.
* 0002 (glm fix): Unbreaks packages using glm/glx headers
* 0003 (abiword/libglade): Can' say goodbye yet...
* 0004-0008 misc updates

[1] https://patchwork.openembedded.org/patch/149250/

The following changes since commit 4598769a96980b756b3489ac71ed46a075cfabd7:

  openbox: Improve handling of openbox-session / gnome-openbox-session (2018-03-16 19:27:54 -0700)

are available in the Git repository at:

  https://github.com/schnitzeltony/meta-openembedded.git patches

for you to fetch changes up to 8cbabfa65784e69d00819afa019b6f32cd02a5e8:

  poppler: update 0.57.0 -> 0.62.0 (2018-03-18 20:04:19 +0100)

----------------------------------------------------------------
Andreas Müller (8):
      glm: update 0.9.8.5 -> 0.9.9-a2 to fix x86_64 (sse-simd) build
      glm: fix build breaks when using glx headers / fix install
      abiword: remove unneeded libglade from dependencies
      fluidsynth: update 1.1.9 -> 1.1.10
      xfce4-terminal: update 0.8.7.1 -> 0.8.7.2
      xfce4-settings: update 4.12.1 -> 4.12.2
      gnuplot: update 5.0.5 -> 5.2.2 and rework
      poppler: update 0.57.0 -> 0.62.0

 meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb                                                     |   1 -
 meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_1.1.9.bb => fluidsynth_1.1.10.bb}           |   2 +-
 meta-oe/recipes-extended/gnuplot/gnuplot.inc                                                          |  42 -----
 meta-oe/recipes-extended/gnuplot/gnuplot/0001-reduce-build-to-conversion-tools-for-native-build.patch |  31 ++++
 meta-oe/recipes-extended/gnuplot/gnuplot/0002-do-not-build-demos.patch                                |  31 ++++
 meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch                    | 111 +++++++++++++
 meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-native-tools.patch     |  42 +++++
 meta-oe/recipes-extended/gnuplot/gnuplot/gnuplot.desktop                                              |   4 +-
 meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-configure-in-fix.patch                          |  16 --
 meta-oe/recipes-extended/gnuplot/gnuplot/qtopia.trm                                                   | 483 ---------------------------------------------------------
 meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch                                                |  11 --
 meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb                                                     |  14 --
 meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb                                                     |  69 +++++++++
 meta-oe/recipes-graphics/glm/files/0001-Make-GLM_ENABLE_EXPERIMENTAL-a-configurable-option.patch      | 860 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta-oe/recipes-graphics/glm/files/0002-glm-install-headers-only.patch                                |  46 ++++++
 meta-oe/recipes-graphics/glm/{glm_0.9.8.5.bb => glm_0.9.9-a2.bb}                                      |  12 +-
 meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch               |  36 +++++
 meta-oe/recipes-support/poppler/poppler/0001-add-manadatory-options-to-find-qt4-qt5-moc.patch         |  91 -----------
 meta-oe/recipes-support/poppler/poppler/0002-fix-gcc-6-math-ambiguous-errors.patch                    |  11 --
 meta-oe/recipes-support/poppler/poppler_0.57.0.bb                                                     |  55 -------
 meta-oe/recipes-support/poppler/poppler_0.62.0.bb                                                     |  55 +++++++
 meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.7.1.bb => xfce4-terminal_0.8.7.2.bb}        |   4 +-
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb                                           |   6 +-
 23 files changed, 1298 insertions(+), 735 deletions(-)
 rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_1.1.9.bb => fluidsynth_1.1.10.bb} (95%)
 delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot.inc
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/0001-reduce-build-to-conversion-tools-for-native-build.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/0002-do-not-build-demos.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-native-tools.patch
 delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-configure-in-fix.patch
 delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/qtopia.trm
 delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
 delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb
 create mode 100644 meta-oe/recipes-graphics/glm/files/0001-Make-GLM_ENABLE_EXPERIMENTAL-a-configurable-option.patch
 create mode 100644 meta-oe/recipes-graphics/glm/files/0002-glm-install-headers-only.patch
 rename meta-oe/recipes-graphics/glm/{glm_0.9.8.5.bb => glm_0.9.9-a2.bb} (54%)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
 delete mode 100644 meta-oe/recipes-support/poppler/poppler/0001-add-manadatory-options-to-find-qt4-qt5-moc.patch
 delete mode 100644 meta-oe/recipes-support/poppler/poppler/0002-fix-gcc-6-math-ambiguous-errors.patch
 delete mode 100644 meta-oe/recipes-support/poppler/poppler_0.57.0.bb
 create mode 100644 meta-oe/recipes-support/poppler/poppler_0.62.0.bb
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.7.1.bb => xfce4-terminal_0.8.7.2.bb} (68%)

-- 
2.14.3



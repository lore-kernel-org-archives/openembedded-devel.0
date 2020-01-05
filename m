Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6406A7F266
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Jan 2020 22:57:06 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id x184so26085271pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Jan 2020 14:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=uGa7A8UYn4usUTxjhMIcYzm/JIHxiGB0BU3VrDjOFe0=;
	b=PMYAo7bP8OiT0MPLTDOXUzx0q3F17Tj131ok1NAeRpNp5G+j0R52zUP4S9NzMMWjNe
	/i36oldGOs4Fjfp86kPqJl0CaCZiJK6Or4PAcSmIMHHKgihkqIEf+QrPp4QrN/LFIRae
	blOqHuW4gDa3KUi5sXS6xa6+uwFI64t4T0sincwUvcOvePhyBkpUdycIAzRTfm11THUW
	EWsx/Z08VzlxRX8Rhxh5b3V9ukxu//t7+RXSizXKldUjTQ0sPM8YWNqSUprWS4qk200I
	hqdFlXpE6tvb75jUUAhE3o6Xvhv7XlgRiEqEGWKNztCYRkLLlHtv64oA3w3oaNgmwq7p
	Z1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
	:user-agent:mime-version:content-transfer-encoding:content-language;
	bh=uGa7A8UYn4usUTxjhMIcYzm/JIHxiGB0BU3VrDjOFe0=;
	b=ha9aigNVBww4KdFA1TLC1tzo5ycyG968cfrcVu7kwgAmAIe0d6Qmq+MC2QtpYGytND
	IU4Nm01IFy7Z1OlWHnMGg+BwP+W1SYEb5GuTEpUmz9Rlp6sqbMsF0Ly1ofHfRqr+Vam8
	7VCwkwBarE+VlvUdNFZulCrWGrCYt8IvtWQqcycCkoJpU+O6jLLxIwDiR+Gc475q+Juo
	8vvDNIElOIi/TNIaEa+RApRL3E3uuW1pfp5db8jVO470hV2xjkLmT04EuMUH208l/jXv
	sk7dM6I15Xs65IIU6p7ly+vUm5BX1EJtGCOibH3OWg/mWn8MWodhF1xZ5Ak4VGKhBuK3
	rOzg==
X-Gm-Message-State: APjAAAWJG+QNUuD1PX5oGLzKTcmUsliM8BmGgbS5dWzTnhpdwuX1F/Gg
	dnhxDpr+zmoUGibOot/ND/xr+x9r
X-Google-Smtp-Source: APXvYqwOD0RuQYTEvNtnTjquvNrMfK9EG3CALV7ss4x9oeTtZbXyZaCyzbsf/XSXKdJ+4clMYDlNGg==
X-Received: by 2002:a63:480f:: with SMTP id
	v15mr106763225pga.201.1578265027203; 
	Sun, 05 Jan 2020 14:57:07 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:24ce:b2a3:bac9:47a9?
	([2601:202:4180:a5c0:24ce:b2a3:bac9:47a9])
	by smtp.gmail.com with ESMTPSA id
	g26sm66543996pfo.130.2020.01.05.14.57.06
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 05 Jan 2020 14:57:06 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <4636590d-e783-32d6-2ca1-0cdb25ed1fad@gmail.com>
Date: Sun, 5 Jan 2020 14:57:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
Subject: zeus pull request
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
X-List-Received-Date: Sun, 05 Jan 2020 22:57:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 0d16b31c3d96e0797d3335d44545412996c48c9a:

  mbedtls: upgrade 2.16.2 -> 2.16.3 (2019-12-08 08:12:43 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded zeus-next

for you to fetch changes up to e855ecc6d35677e79780adc57b2552213c995731:

  ruli: Fix install step and build samples too (2020-01-05 14:44:11 -0800)

----------------------------------------------------------------
Adrian Bunk (3):
      networkmanager: Upgrade 1.18.2 -> 1.18.4
      gpsd: Backport a memory leak fix
      libqmi: Upgrade 1.24.0 -> 1.24.2

Changqing Li (1):
      xfce-dusk-gtk3: correct invalid SRC_URI

Hongxu Jia (1):
      python-more-itertools: downgrade 7.2.0 -> 5.0.0

Kai Kang (1):
      fltk: fix build error when enable package config examples

Khem Raj (4):
      grpc: Define libdir and cmakedir in terms of multilib
      tinyalsa: fix installation libdir path to match multilibs
      libqb: Add --enable-nosection-fallback with mips64/clang
      ruli: Fix install step and build samples too

Stefan Agner (1):
      networkmanager: do not deploy unnecessary udev rule file

Zhixiong Chi (1):
      gtkwave: add the libtirpc dependence and config

zhangxiao (1):
      syslog-ng: Fix multilib header conflict - syslog-ng-config.h

 .../recipes-multimedia/tinyalsa/tinyalsa.bb        |   4 +-
 ...NSTALL_-path-instead-of-hardcoding-bin-li.patch |  46 ++++++
 ...kmanager_1.18.2.bb => networkmanager_1.18.4.bb} |   9 +-
 .../recipes-devtools/grpc/grpc_1.24.1.bb           |   4 +-
 .../0001-Fix-build-with-format-string-checks.patch |  29 +++-
 ...001-Make-space-for-flags-from-environment.patch |  95 +++++++++++
 ...li_srv-Mark-prev_addr_list_size-as-unused.patch |  35 ++++
 .../recipes-support/ruli/files/Makefile.patch      | 122 --------------
 meta-networking/recipes-support/ruli/ruli_0.36.bb  |  23 ++-
 .../libqmi/{libqmi_1.24.0.bb => libqmi_1.24.2.bb}  |   4 +-
 meta-oe/recipes-extended/libqb/libqb_1.0.5.bb      |   6 +-
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb |   2 +-
 .../gpsd/0001-gps_shm_close-Free-privdata.patch    |  37 +++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb       |   1 +
 meta-oe/recipes-support/fltk/fltk.bb               |   7 +-
 ...error-when-enable-package-config-examples.patch | 182
+++++++++++++++++++++
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   4 +-
 .../python/python-more-itertools.inc               |   3 -
 .../python/python-more-itertools_5.0.0.bb          |   7 +
 .../python/python-more-itertools_7.2.0.bb          |   2 -
 .../python/python3-more-itertools_7.2.0.bb         |   3 +
 .../xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb           |   2 +-
 22 files changed, 474 insertions(+), 153 deletions(-)
 create mode 100644
meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch
 rename
meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.18.2.bb
=> networkmanager_1.18.4.bb} (94%)
 create mode 100644
meta-networking/recipes-support/ruli/files/0001-Make-space-for-flags-from-environment.patch
 create mode 100644
meta-networking/recipes-support/ruli/files/0001-ruli_srv-Mark-prev_addr_list_size-as-unused.patch
 delete mode 100644
meta-networking/recipes-support/ruli/files/Makefile.patch
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.24.0.bb =>
libqmi_1.24.2.bb} (85%)
 create mode 100644
meta-oe/recipes-navigation/gpsd/gpsd/0001-gps_shm_close-Free-privdata.patch
 create mode 100644
meta-oe/recipes-support/fltk/fltk/0004-Fix-build-error-when-enable-package-config-examples.patch
 create mode 100644
meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
 delete mode 100644
meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb



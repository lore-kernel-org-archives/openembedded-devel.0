Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id EB6006C5D7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 07:35:24 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id j207so9989364wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2018 23:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8dG+O0v4uMjIfkKexDingT2QIYfIirXhrSQgNmD+QoI=;
	b=emvIImng8TueFhawqIMMEXMRL3VnYDARkR2vz6qfpXenUv68/e+sL9dDcRcxiqaVLz
	XiQYuf57s6r2UTqv0ysvSTYbfKrUEzwNCS77feDqGhB2ItOfrll7i1euX02pT7NrOyon
	wpKEZk3K7PsZ1sJI2ArPmFWtlc9VHhqRl+BAln343I2syRKeyeGwUlcVZB2fA0S3ECpk
	BgE5kAi6rnrPhsWAXD2OOfgKunDnjcY0mS7CjeSAQaVQhi2x78EvwnLlj7IwSJw25otj
	25zwbtV5Njn4YL1+AcCAzDCV0SRr3/kK8+8TA1mXHkhYJfOWMqhV6UaZrMaSH9aNtsjA
	qHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8dG+O0v4uMjIfkKexDingT2QIYfIirXhrSQgNmD+QoI=;
	b=DLZrw/Ta1DIbbsBOo48djLHStGtIKq+JDC4B7HFQu5WnLzVi3wE2aZG+sXlEG5Jvx2
	NdBNqVc5SmxZ8lM79bQkN9H64+hKcJquZh12h15pASJwzjrzGv4kMpEydYjCHODD5Q4s
	E3Ya6TBoyjuUiSptC770erGF2aZKzSLanXPKSwq9g0zICSMwu3/P3WYoaDBLOOMRrrcE
	MZGxfZcjPwuVF5QsUw5cH3SCCVlcdNpKmCa3bzFY+hC0BejALluOgpK+JdhUDdtuKcaH
	uPMtDbpCnfAzaRRpHgrelwhdJMxBWR5sfqi5ilnui9L9gVLFjLRgycFCrE8MZ9beLl56
	NdSA==
X-Gm-Message-State: AA+aEWYrXWvniO12M9DOo80h4JKgGQqmd+i2itWqi44w6XjG1Ga/UE9z
	g0WWDnolOZM7IwjjRie75LnGyLYgIJQ=
X-Google-Smtp-Source: AFSGD/UCAcvv4cxzh0XDDARruKwzfX8IX0fPTye3DVcdqz/nVGznX9JdRLtgl9SP7Gthd404Phz5Ww==
X-Received: by 2002:a1c:51:: with SMTP id 78mr6089409wma.140.1543217725171;
	Sun, 25 Nov 2018 23:35:25 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id g2sm9479986wrw.78.2018.11.25.23.35.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Nov 2018 23:35:24 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Nov 2018 08:35:14 +0100
Message-Id: <20181126073520.18859-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 0/6] sigrok: set of new packages
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
X-List-Received-Date: Mon, 26 Nov 2018 07:35:25 -0000
Content-Transfer-Encoding: 8bit

This series adds recipes for libsigrok and accompanying libraries and
tools. The eventual goal is to add pulseview - the graphical interface
for sigrok - to meta-qt5-extra.

First two patches add external packages used by libsigrok. The third
patch adds a recipe for doxygen, which is needed to generate libsigrok
C++ bindings which will in turn be necessary to build pulseview.

Last three patches add recipes for the sigrok suite including the
command-line utility - sigrok-cli.

v1 -> v2:
- make doxygen recipe buildable for target as well (BBCLASSEXTEND instead
  of a native recipe)
- use ${datadir} instead of hardcoding /usr/share

Bartosz Golaszewski (6):
  libzip: new package
  libserialport: new package
  doxygen: new package
  libsigrok: new package
  libsigrokdecode: new package
  sigrok-cli: new package

 .../0001-build-don-t-look-for-Iconv.patch     | 36 +++++++++++++++++++
 .../doxygen/doxygen_1.8.14.bb                 | 17 +++++++++
 .../libserialport/libserialport_0.1.1.bb      | 12 +++++++
 .../recipes-extended/libzip/libzip_1.5.1.bb   | 18 ++++++++++
 .../sigrok/libsigrok_0.5.1.bb                 | 23 ++++++++++++
 .../sigrok/libsigrokdecode_0.5.2.bb           | 14 ++++++++
 .../sigrok/sigrok-cli_0.7.0.bb                | 18 ++++++++++
 7 files changed, 138 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
 create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb
 create mode 100644 meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb
 create mode 100644 meta-oe/recipes-extended/libzip/libzip_1.5.1.bb
 create mode 100644 meta-oe/recipes-extended/sigrok/libsigrok_0.5.1.bb
 create mode 100644 meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.2.bb
 create mode 100644 meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.0.bb

-- 
2.19.1



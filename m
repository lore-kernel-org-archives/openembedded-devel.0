Return-Path: <brgl@bgdev.pl>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id B752974547
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 14:20:25 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u4so4653097wrg.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 07:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=03S7H4fkjI4+eGd7oxgJCuDgJdTyRHINsWgJihe2W5A=;
	b=KZ4aLPYqfXqkx9oMaQQfabgtBsombWeP0EnVE0QRgpCZSH9r88ab8yAnmBOWOMv2K+
	JUF7Jp9uvApF+VWTPXanBaMXHBZ6ykXmcklg/jLqgzk7bBrUuFwGBr2oN/OGd0sjLMbv
	GKCqLbNIyLXylzY1acEjqXDoLuble/ljAwVjc1ssfQP+v+Wp86UwUAThh5xofaIgCn5K
	dANbLrdCy0Fd2c4R9WbI6sm2FToPKaNpbRY4STeTafeX1aWxRrM3BjVkO+4RN6Ed7U5J
	XjXUswLn3feG8URUDsNX4Rgo42M5+ocijVTSJXBwDlZ2Gh/rI4ypNhsXApA6/gnSOSTD
	DSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=03S7H4fkjI4+eGd7oxgJCuDgJdTyRHINsWgJihe2W5A=;
	b=idyfvlKeJKBUnlnc6rwCTAkxmjlWTd7F3s1w6cRWz8loj2H/z6lLZM9V8QfUoerJOL
	5XAIHEylLNb/Obb8nRA0wYnLsreJzCCt7I/kKYFuaihsfYsBgDKlWGRRcWGiZpDz6K0o
	j3lE6nfklt+nJ6F4StioknnxDolsfMFnsSqZAIr7MDH7KX18k+xOnreyrqU1JpsjsXkT
	mbQfwF4CmPOP+P2qQIr7r2wc0yFi+Ja/J2dMl2WsVqmQ36yOvhyHo16Itud3JQ/KpLew
	6s20vfjSt4Yx7mYEd1jlpiBfsJicS3uQ+gJriZc6r/B5BDqyRl0OtjyIqUbBbG/aHUuX
	D8Kw==
X-Gm-Message-State: ALQs6tCEB8+IJGIQ6tKzj8OMz76bKE17s5W1jNBwfgPsPKNxKuwc1/cQ
	BVA6Rz1juztNXcNGrrwzWPifeA==
X-Google-Smtp-Source: AIpwx49dZgIuQIP6GJifhlHa6QGlaTztLY0VYDM1HzfBuWJmcnADGAGDOz00fkECFLBRdytZ58R3uQ==
X-Received: by 10.28.236.19 with SMTP id k19mr1213050wmh.11.1523974825965;
	Tue, 17 Apr 2018 07:20:25 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-1-7086-217.w90-116.abo.wanadoo.fr.
	[90.116.254.217]) by smtp.gmail.com with ESMTPSA id
	f132sm6455563wmf.13.2018.04.17.07.20.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Apr 2018 07:20:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue, 17 Apr 2018 16:20:16 +0200
Message-Id: <20180417142020.30100-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.17.0
Subject: [meta-oe][PATCH v2 0/4] libgpiod: support for v1.0 series
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
X-List-Received-Date: Tue, 17 Apr 2018 14:20:25 -0000

I recently released a new major version of libgpiod in which the
initial API was heavily reworked. Since it's no longer compatible
with v0.3.3 but I know there are users of the latter and I also
intend on supporting it for some time, I thought we should have both
versions in recipes-support.

This series adds a new recipe for libgpiod v1.0.1 that can live next to
v0.3.3.

v1 -> v2:
- there was no reply to the previous series, and new v0.3.x and v1.0.x
  versions have been released during that time, so v2 bumps the versions

Bartosz Golaszewski (4):
  libgpiod: include the version in the recipe filename
  libgpiod: split recipe into .inc and .bb files
  libgpiod: bump version to v0.3.3
  libgpiod: add support for v1.x series

 .../recipes-support/libgpiod/{libgpiod.bb => libgpiod.inc}   | 5 -----
 meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb           | 4 ++++
 meta-oe/recipes-support/libgpiod/libgpiod_1.0.1.bb           | 4 ++++
 3 files changed, 8 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod.bb => libgpiod.inc} (80%)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_1.0.1.bb

-- 
2.17.0



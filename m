Return-Path: <brgl@bgdev.pl>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1D118745DE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 13:55:11 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id x31-v6so5005308edd.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 06:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=P1P4TL6nwVrlEPtg7aT5pCKY4lGgIdZJsObtp8TTObo=;
	b=eEuH7oRxLHvsDee8oa9c/VTNWQ4ZWH3XKFwQx6e4NVChIq8JAxai2129QpdGVbna+R
	9QJf6BZrC/fQ3JrkscMf5asHqOrInN+TzLE77yKGe//1zVscHXgQBrQCEToSC5n4EB7w
	BHR0AHPS5UsRgQc1HqpF+yaNgSstNZvSx0EkMEWNM+kBvyzvittLAiofTDiG5PdZUvdq
	qTfS1TfXBtrFseFUTYMbMlUBO7VVlGq5zLPcMb+WjJh6WYC+/SGnIgkX53VUMA5Fr4sB
	cTktt8+8x9kFe5/daBkxzZ87DKhU3VpuLnrLrrpCmacpIeVS7ZWDRCBc9d8EPGfIc7FP
	rJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=P1P4TL6nwVrlEPtg7aT5pCKY4lGgIdZJsObtp8TTObo=;
	b=CsTVuisi6Lq5wcSA5taTbJoV7iR2QqY4Z1bHk/nuBJLYjP1uR5We+IY9Jx8/5Y5muq
	pzW0+DNHb9SKmjBBMmL2o15Hc9UGkUxxOYGjCid9cp48Uczh/V8aQPspY9K4vuRNk2kz
	UEE1q4yNfYSkQk38XM5WvDJoBwkOZtQs0c5zuFF/AWBJu23eCjv4Hzjw8L9ndu7BtWrY
	TteSivFFtPJoYtCCwsdjjqKw3mjEZaXSLg735E0R2+HzUysoMUAke4JCpJd79c7hsVpb
	E3iVv/ywZIBk6ucTe4CekinOfoD799Y85DoPehkL659G22BcrEILa2NUAD5US2wWFNdI
	E3RQ==
X-Gm-Message-State: ABuFfoijoS00B4JajhlQqPa2j0p0zKQR15hL25WqKDknXGLBy479Hmnb
	CnLns/t51bfUnBtJhgb6f6SnbUtM/Bfrmg==
X-Google-Smtp-Source: ACcGV636DzJN1fm2+wIWEs6pAy2pclZtaEqrAY3EPoZC4TBAvRq8FH5Pi1V0NZOeiHJD/Nvk9lmIhA==
X-Received: by 2002:a17:906:6a09:: with SMTP id
	o9-v6mr32383474ejr.99.1539179712274; 
	Wed, 10 Oct 2018 06:55:12 -0700 (PDT)
Received: from debian-brgl.guest.int.avast.com ([91.213.143.211])
	by smtp.gmail.com with ESMTPSA id
	l34-v6sm7650277eda.54.2018.10.10.06.55.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 06:55:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>, Hiram Lew <lew@avast.com>,
	Jan Kaisrlik <jan.kaisrlik@avast.com>, Lukas Karas <karas@avast.com>
Date: Wed, 10 Oct 2018 15:54:54 +0200
Message-Id: <20181010135457.22007-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/3] fix grpc nativesdk build
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
X-List-Received-Date: Wed, 10 Oct 2018 13:55:12 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The grpc nativesdk build is broken. The project tries to execute the
grpc_cpp_plugin during build when it's not correctly linked yet.

Fix it by applying the existing patch fixing cross-compilation and
satisfying the native sdk dependencies in other packages (c-ares and
gflags).

Hiram Lew (2):
  gflags: add nativesdk to BBCLASSEXTEND
  c-ares: add nativesdk to BBCLASSEXTEND

Jan Kaisrlik (1):
  grpc: fix grpc_cpp_plugin interpfor nativesdk

 ...txt-Fix-grpc_cpp_plugin-path-during-cross.patch | 27 ++++++++++++----------
 .../recipes-devtools/grpc/grpc_1.14.1.bb           |  2 ++
 .../recipes-support/c-ares/c-ares_1.14.0.bb        |  2 +-
 meta-oe/recipes-support/gflags/gflags_2.2.0.bb     |  2 +-
 4 files changed, 19 insertions(+), 14 deletions(-)

-- 
2.7.4



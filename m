Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7AC7B7499B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:39:05 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id y189-v6so2657628itb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=0N79RX85XbEf0znmcTiGWWjZXEegegR2NfgmXIB0EpU=;
	b=Hr3WDOyYdRu7c+q1Bl6E1mldFLSU09jAveBeHlPU/eBb30KnyC8rSDj0m4p/9nBowq
	jxgLeGmMcwtWSPTRsVeS00qAzO/nI8T245u4vTgOvNReY7LdRBIMZvpxzmBpN36saoiD
	Cw2WWMq4Kqa5ixNkZRHcVV2ObXeAk+EXqz29s2GXFmz0y0wNWwdEFCYFbe6XyyrsTXgp
	HbVzZNN047+TxR5IonbB/QD9wTiZov3rC2/rNNW/HVNwtu56p6UFmIeZn14D+IsQ6a4d
	jK+P1FWVJA+K+SizpiNncJvKvbXV45cDFJk46aY5qVBCaA9vP7/WbADMV3UV0QvSnl+A
	fN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0N79RX85XbEf0znmcTiGWWjZXEegegR2NfgmXIB0EpU=;
	b=KJ5WSVmlysZS3ewUZtsXrzD7SK0UiHvq9swcv6sE5n0RHd7izZJ7gauDu//UPbdOWU
	cGzD6NbH3iOGRX+V9HT1tS0JRPQ5EzNBWI2V/pxVgX8k7j6lXw9utb0+tiPbufyOETNU
	RytZtg+1DgIAszTTI+RvPXVshzEuT12y/br+S/0HrSlHhdtYkQlakf7nmWDC87lR6GJp
	A+1OM27bpHBl0etSS07xbM9PzUXN0VWbaydaCOXRNMe9MbNFYjPotJOk4dtnjejcc9f9
	qp6I6POV8rCWI/FrzjdxEMpLAXbE69WYjoyoSOrv6tddiFn6XBwVDg1wlXuqMyIuwnSw
	S5Zg==
X-Gm-Message-State: ALKqPwfQRZG6/2ypxB6W17KlPYVP/T3ntcPphjLohNQw8M8h0v8/spUs
	MYc/qF8mVREz1fj0xYug57AfgiFO
X-Google-Smtp-Source: AB8JxZq/oxHnHQml2a4zcnzX+QiHG0shm8PwOKCb4uzGd+DG1o9XPp7Byx4u3h7YW2jdx8qwhcBjZA==
X-Received: by 2002:a24:3254:: with SMTP id
	j81-v6mr10318686ita.117.1527172745825; 
	Thu, 24 May 2018 07:39:05 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	a43-v6sm2435261itj.11.2018.05.24.07.39.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 07:39:04 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:38:37 -0400
Message-Id: <20180524143854.24096-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
Subject: [meta-oe][master-next][PATCH v3 00/17] rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 14:39:05 -0000

v3:
- break patches back up into individual patches for each recipe
- avoid including fftw
- find a couple extra recipes to patch:
	libwebsockets
	opencv
	libeigen

v2:
- re-spin Andre's patches to only include this change
  (i.e. rely on cmake.bbclass) without any formatting changes
- re-base on top of master-next (changes location of grpc)
- combine all such patches together into 2 patches
  (one for meta-oe, one for meta-networking)

v1:
- Andre's original patchset

Trevor Woerner (17):
  openobex: rely on cmake.bbclass to put cmake package files in dev package
  rocksdb: rely on cmake.bbclass to put cmake package files in dev package
  capnproto: rely on cmake.bbclass to put cmake package files in dev package
  json-spirit: rely on cmake.bbclass to put cmake package files in dev package
  librcf: rely on cmake.bbclass to put cmake package files in dev package
  msgpack_c: rely on cmake.bbclass to put cmake package files in dev package
  rapidjson: rely on cmake.bbclass to put cmake package files in dev package
  glm: rely on cmake.bbclass to put cmake package files in dev package
  openjpeg: rely on cmake.bbclass to put cmake package files in dev package
  ceres-solver: rely on cmake.bbclass to put cmake package files in dev package
  gflags: rely on cmake.bbclass to put cmake package files in dev package
  libftdi: rely on cmake.bbclass to put cmake package files in dev package
  libssh: rely on cmake.bbclass to put cmake package files in dev package
  libtinyxml2: rely on cmake.bbclass to put cmake package files in dev package
  libwebsockets: rely on cmake.bbclass to put cmake package files in dev package
  opencv: rely on cmake.bbclass to put cmake package files in dev package
  libeigen: rely on cmake.bbclass to put cmake package files in dev package

 .../recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb   | 1 -
 meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb             | 2 +-
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb                      | 2 --
 meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb           | 1 -
 meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb        | 2 --
 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb               | 1 -
 meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb             | 2 --
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb             | 1 -
 meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb                    | 1 -
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb             | 2 --
 meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb       | 2 --
 meta-oe/recipes-support/gflags/gflags_2.2.0.bb                  | 2 --
 meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb              | 2 +-
 meta-oe/recipes-support/libftdi/libftdi_1.4.bb                  | 2 --
 meta-oe/recipes-support/libssh/libssh_0.7.3.bb                  | 1 -
 meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb        | 2 --
 meta-oe/recipes-support/opencv/opencv_3.3.bb                    | 2 +-
 17 files changed, 3 insertions(+), 25 deletions(-)

-- 
2.17.0.582.gccdcbd54c



Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B061A78672
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 13:19:18 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g130so2163841wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2018 05:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZH30jschYWnNNwINJuMknALItsV+/PHbWi3/oHAC2bM=;
	b=O3BcSO76U+hpjh6JTFesmgP3BJjLHzuCal4FLy2rFoVyAt7x/S4g+p03KnqAxAS0aY
	2okFBdW0eGawPonuS//sTPqsKxtgQ2UX/Zpa9zPWNzaVgrP2kb7REGE0nqCBVDF8O2gs
	Z2GXycR+nr5gcsiyviwGsBDZHX/r1zgQbWzxlxbNBpY4ILjqwfn8pvRz9Dhkq7PbtPMg
	pCNr6IE0cz4WB8JKYy1ieDN06Ax89JQLAAJKgrAjRFdJZ/TCe51zSHGyWpqLSjNmwXV0
	wHQgSQsnQnoYjO/RYY9PMXM2e0Q9iW8fiJvBhFit+9ZErWTRLwoTmIJ9XP6XoJHO0eCm
	oo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZH30jschYWnNNwINJuMknALItsV+/PHbWi3/oHAC2bM=;
	b=p2x/znKF9VKeLZiRAPQPcjTCKjD/w//cmyTz+X81UHfbfhr4ohi2tiQXpnf6S1R76v
	JvxPlGCrea6ACMWlEzIEvp94NiEGAcUljHfYfbLnLbhMvUlndBpqgFGppbTGwwmRZTPw
	I8e9CnpNoG9td3TsRh0hblvQU49kSNFw0DFQTwY8Up8z/sQW20T/vBNQzDAsU/T0dyNG
	s8L1ghhbEF/Biw+6KYWtqgp8btAkIpweWFqm48KdHwP4UGn20G0AZHEKdwv8IaYyqcUk
	NXo8y9hALVs7ztODAknljZa2rG9tJk5AvxMBY0CX+j+Qm+KFdhbYOtAwp+WyhUKP9+/I
	E8xQ==
X-Gm-Message-State: AKGB3mJPCL5KI184dMr1E4u5zFz+X7+YSGVlj9vpogROQlpGHZakVqyk
	BcoqRVD7lZ6NSO00PA+Or9jT/g==
X-Google-Smtp-Source: ACJfBovdkwJPxNonOpZjMf13NXl+YCAGUluAr2U3M7FqFNUXLGUQu1iylzqJS7tJtFeuwb38EK/GOA==
X-Received: by 10.80.230.3 with SMTP id y3mr7473028edm.211.1515071959226;
	Thu, 04 Jan 2018 05:19:19 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58]) by smtp.gmail.com with ESMTPSA id
	m23sm2107083edc.27.2018.01.04.05.19.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jan 2018 05:19:18 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jan 2018 14:19:03 +0100
Message-Id: <1515071950-15401-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-java][PATCH V2 0/7] Several fixes for java/ant recipes
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
X-List-Received-Date: Thu, 04 Jan 2018 13:19:19 -0000

From: Ming Liu <liu.ming50@gmail.com>

Ming Liu (7):
  meta: drop redundant DEPENDS_virtcalss-native definitions
  meta: drop deprecated virtclass-native
  commons-cli: extend native bbclass
  commons-codec: extend native bbclass
  commons-httpclient: extend native bbclass
  jamvm: avoid checking x11 distro feature for native build
  ant-contrib-native: add recipe

 .../ant-contrib/ant-contrib-native_1.0b3.bb        | 37 ++++++++++++++++++++++
 recipes-core/bcel/bcel_5.2.bb                      |  2 --
 recipes-core/cup/cup_0.10k.bb                      |  2 +-
 recipes-core/jakarta-commons/commons-cli_1.1.bb    |  4 +--
 recipes-core/jakarta-commons/commons-codec_1.3.bb  |  2 ++
 .../jakarta-commons/commons-httpclient_3.1.bb      |  4 ++-
 .../jakarta-commons/commons-logging_1.1.1.bb       |  1 -
 recipes-core/jakarta-commons/commons-net_1.4.1.bb  |  3 +-
 recipes-core/jakarta-libs/bsf_2.4.0.bb             |  1 -
 recipes-core/jakarta-libs/log4j1.2_1.2.17.bb       |  1 -
 recipes-core/jakarta-libs/logkit_1.2.2.bb          |  1 -
 recipes-core/jamvm/jamvm.inc                       | 17 +++++-----
 recipes-core/jamvm/jamvm_git.bb                    |  4 ---
 recipes-core/jcraft/jsch_0.1.40.bb                 |  3 +-
 recipes-core/jikes/jikes_1.22.bb                   |  4 +--
 recipes-core/jlex/jlex_1.2.6.bb                    |  2 +-
 recipes-core/rhino/rhino_1.7r4.bb                  |  2 +-
 recipes-core/xalan-j/xalan-j_2.7.1.bb              |  3 --
 recipes-core/xerces-j/xerces-j_2.11.0.bb           |  3 +-
 .../xml-commons/xml-commons-resolver1.1_1.2.bb     |  1 -
 20 files changed, 61 insertions(+), 36 deletions(-)
 create mode 100644 recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb

-- 
2.7.4



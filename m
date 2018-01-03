Return-Path: <liu.ming50@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id DCB5777DB5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 01:47:43 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id f201so93210ybg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jan 2018 17:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZH30jschYWnNNwINJuMknALItsV+/PHbWi3/oHAC2bM=;
	b=sL5Xj2X8xYTGhQQhJrgJ6UTTKE/OZX0UajtdfGKLnaa5VqX29WH2yvTWCpNDeF1CYf
	dMWr6d/6D/V1CK3h+8ZgS8SmKOQvgfByCVRptqQ5VkivZXTyTzLhesOX9LRY8ebAsKct
	4qM5UWXhwsAwus3m64Fi0bzoUtM966z2FJGh0NGw7N3tFZX92WO2b6RqSTtXiuId9p1d
	W1uKLbI3xxYbhda3m69RJFvhOYFQICgshvbqipMEssZi6kQvaVZEqvO62s3QvnFa0g6t
	W6SamfciuJJGxjA2LtlGKXOxItdK/peVBO4e7Dh1ASLm0Ov0MgbO7n2i/8X17EpRqSZf
	2qzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZH30jschYWnNNwINJuMknALItsV+/PHbWi3/oHAC2bM=;
	b=AUs14+2C1ik45kSXXH93soAzBUQlph4rqzigAVkgRkLsMJk0GxwnmcHFLwUshF4Dnc
	rO99Mk32bpejv10NS2U+IhBrFUutBHXkxCztEcAFoi47w9G3Wh855YzO8ucLZVljnYMd
	xS3mEGD88GEC7XDDzTvVnU3yDGzfvkzD/K43MpoLdm5UfH/GxV3Cf1nvH7BT3JFvD5Vg
	9d0bCokGURWSBhk5Os2ZO/k5s0lEcQiUeQIsM/kIM7Ea2/gtpzf1NhNOl7fEG2w4HHBg
	rUcBCeSh3ria/2f/PqsPbghz+2M9ix9Q+j4wpF8/QI4vU59sJWv2bRXUB89MldjpcGmB
	+YbA==
X-Gm-Message-State: AKGB3mKiboktIpLXEP6gVwyT4n0NUGM4ux0Hu/ctx5beV6Ss1flpi1uU
	OY7sBN9kUUSw/GLmaMu4Wcmzc345
X-Google-Smtp-Source: ACJfBotscsDHaruZuSnpMA/1ACDKxEATl3x96GmbnEjQYMzSutR+gv2CWCxFMm4ze92aSY9J+/J+dw==
X-Received: by 10.37.175.141 with SMTP id g13mr35199713ybh.35.1514944064661;
	Tue, 02 Jan 2018 17:47:44 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([45.77.34.21]) by smtp.gmail.com with ESMTPSA id
	h133sm20457657ywb.52.2018.01.02.17.47.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Jan 2018 17:47:43 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 02:47:23 +0100
Message-Id: <1514944050-12039-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-java][PATCH 0/7] Several fixes for java/ant recipes
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
X-List-Received-Date: Wed, 03 Jan 2018 01:47:44 -0000

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



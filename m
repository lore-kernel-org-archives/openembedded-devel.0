Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 558507F971
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jan 2020 20:50:09 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id y8so12229211pll.13
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jan 2020 12:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mNV3TAgZXOt2afiVxxwoVMA20bX08AgXerV4+QwAjcU=;
	b=Ng93ph4kJnZP8CipNr+zlM1VdGmvysJlqrfDLR5qi86lY/LHVV+gQakyvU1t1vAfa0
	9u5/o36c/XO3ohrCH+wMdvo3lzewqK+t0I8LUZahr5l0ccGbaOx3B5r+HOSuI6EVoslk
	FBw+/DqsbjbNbE8SQhsrBjjCAweZRzXbMMoGIdno6lSnT7KDiJQS/5WRYGCwljTtd7lW
	f69OoPvrJndX/9EY8FBun+gE468OXY4TjNOKjxUNdYIndjMscDeMCJTpVKtMZmaKYRhe
	EDvrRIMnEo3f8/CwNpP6faeeV59cegUONN9uQrkF/MF7QBKuQDRFOrByLBR2etqd/TYH
	+91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mNV3TAgZXOt2afiVxxwoVMA20bX08AgXerV4+QwAjcU=;
	b=WoA3ZdOR0RhHdFtyIpJU1hs6PyUfsSRW5UtPM75bF/+fkdj3rDXLmeDuX3XvztK1Lv
	QwHQv27BPaQvRLNrhgnr/NhoTFsJTUul+J4ZnLkxLM/S2FD3ORt7wZebysctTMW6OihZ
	sp4kGIxGEe0rJ73Qb4ajQa3eA7OqHkir/v3Epskzdi0bZl8HO7PVFN+Zsvk3xOs0JQyt
	oOcVmLnvqm7050x3+ZGKu9qiVRgY4mrZ7g2OcafaGJce1ScOUYKNpm/F50Td9LmCuGU/
	VhZvIn34A1oTN8B8cfRtH0L2nWGYEXuYgwGyW2muX2pAAbQJiB4caPVDxxba+IcuLe0j
	HCiQ==
X-Gm-Message-State: APjAAAVsgQGcuIVS9a8Sx9FeuuOUYip20vCTo3z32c/cqnD5LLmb5zWY
	/Z2CFpX4GBE8e1SzRUC4cAd1WosV
X-Google-Smtp-Source: APXvYqzb6NoA+RofyBDWoubGEJLsgX0CPYyRDuaJ3tmjwG5m6xwpkbZKOcBzgwSLdJ5QHOepkbCmtg==
X-Received: by 2002:a17:902:a702:: with SMTP id
	w2mr11273562plq.289.1579467010020; 
	Sun, 19 Jan 2020 12:50:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:450d:e003:9142:f492])
	by smtp.gmail.com with ESMTPSA id
	k9sm14701403pjo.19.2020.01.19.12.50.08
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 12:50:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun, 19 Jan 2020 12:49:58 -0800
Message-Id: <cover.1579466920.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [zeus 0/8] Patch review
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
X-List-Received-Date: Sun, 19 Jan 2020 20:50:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review and provide feedback by Tuesday.

The following changes since commit e855ecc6d35677e79780adc57b2552213c995731:

  ruli: Fix install step and build samples too (2020-01-05 14:44:11 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/zeus-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/zeus-nut

Gianfranco Costamagna (3):
  cpprest: fix cmake installation directory
  websocketpp: add various upstream accepted and proposed patches to fix
    various issues, including:
  websocketpp: refresh clang patch

Kai Kang (1):
  adduser: set default shell with /sbin/nologin

Khem Raj (3):
  nodejs: libatomic patch should be target specific
  websocketapp: Fix multilib build
  websocketpp: Fix clang specific flags in cmake files

Zhixiong Chi (1):
  dnsmasq: CVE-2019-14834

 ...-dnsmasq-fix-memory-leak-in-helper-c.patch |  49 +++++++
 .../recipes-support/dnsmasq/dnsmasq_2.80.bb   |   1 +
 .../recipes-devtools/nodejs/nodejs_10.16.3.bb |   2 +-
 .../cpprest/cpprest_2.10.14.bb                |   2 +-
 .../0001-Correct-clang-compiler-flags.patch   |  32 +++++
 .../0001-cmake-Use-GNUInstallDirs.patch       |  35 +++++
 .../websocketpp/websocketpp-0.8.1/771.patch   |  22 +++
 .../websocketpp/websocketpp-0.8.1/842.patch   |  30 ++++
 .../websocketpp/websocketpp-0.8.1/855.patch   |  23 +++
 .../websocketpp/websocketpp-0.8.1/857.patch   | 132 ++++++++++++++++++
 .../websocketpp/websocketpp_0.8.1.bb          |  17 ++-
 .../recipes-perl/adduser/adduser_3.118.bb     |   1 +
 ...-set-default-shell-with-sbin-nologin.patch |  34 +++++
 13 files changed, 377 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-cmake-Use-GNUInstallDirs.patch
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/857.patch
 create mode 100644 meta-perl/recipes-perl/adduser/files/0001-adduser-set-default-shell-with-sbin-nologin.patch

-- 
2.17.1



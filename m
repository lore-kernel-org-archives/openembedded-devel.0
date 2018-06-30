Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 58525600B3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 12:03:26 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id k6-v6so11161096wrp.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 05:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=92qBRSfRQgAg3aXmBMt4t18n9s4hgkciI6A17VlQmG0=;
	b=LocyOq8zS+H9StXMCY3NoQsW+iJkwFtKaWsmZ3Azt7+b9NdoJU1YuqxooNmI31yvlE
	Nit/3gHnelH/XthT8saFtdZrIzC9NyqlgtoUHafFlFtqSujRD+NLGG7QBCmq31SiDU9H
	DVOTnC0IVpjFjwQUDWBpC9XQMQ9M7CuZ+JmkQ7qZrvEdoK3nywWnFNdPVBVkauwa9V7V
	eSRolG0UW/m0zH36M9iNrqecXGnzwFBf008HALqcpJ27FGVIegNLy3XgkbhLH7cVHZdG
	tjk3AqBLJjo68lMRjvC9s+JvLnTVTfgwdVCcWoLO5v7s7Iq6HhMz1VmUFsm/9cr0bIki
	cfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=92qBRSfRQgAg3aXmBMt4t18n9s4hgkciI6A17VlQmG0=;
	b=X5BE5PMvyN+4/qeZ4/2VmMm+sWqI9OKtIRmhwM9nhPPUVKFt+e/zNtabyP8igm1SLz
	4cknXEA/nrLcAch3UvQH+R4QL5msD81O638L3i57iNO8bn5qAYp3gid7dGwSIp9FsgJ7
	hK9fF12kg1iFCJxV1JPmeuXsrOHLtoCXf24AB/R03kVgHKeIUZ07YaW617P14WncVXkT
	qAVkBbvmh1N9a+U/sf3i2Cvs80aWJVafYmr/Mk8rAnOYa4oEooTf3t3TEBt7GZgf15oc
	iaMhNqRKk03Vp5/5btwLL5o/D38n4I8g9tPgJb2a0Aeyxw91NG5G31ZI7+CzhQ81+dMZ
	9jjA==
X-Gm-Message-State: APt69E2OAq2sAm1Fs7bxHuLVZNDQ7yPfcDMRv3JSdv/aRhT9EhH+6FQO
	fNEdaPR4jXtlDabvYJk5+Xa7EA==
X-Google-Smtp-Source: AAOMgpe3S7aiRV68EYog1SbZ5mox7kNXgjNdwyPNpLs3+1Rh6mtOEoPL1rvkg0IUCx8kP+eiLxr4RQ==
X-Received: by 2002:adf:a045:: with SMTP id
	l5-v6mr13647640wrl.153.1530360206471; 
	Sat, 30 Jun 2018 05:03:26 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BD2A250E47512CF7CAE17AC.dip0.t-ipconnect.de.
	[2003:f0:7bd2:a250:e475:12cf:7cae:17ac])
	by smtp.gmail.com with ESMTPSA id
	p12-v6sm2096602wrn.31.2018.06.30.05.03.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 30 Jun 2018 05:03:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Jun 2018 14:03:04 +0200
Message-Id: <20180630120315.29414-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH 00/11] Updates and cleanup
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
X-List-Received-Date: Sat, 30 Jun 2018 12:03:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Build & run tested on RaspberryPi 3+ / build tested qemux86-64

The following changes since commit 4517d1c695efd0b175f4e7242e1a7bb4361527d9:

  metacity: allow for warnings during compilation (2018-06-25 10:23:33 -0700)

are available in the Git repository at:

  https://github.com/schnitzeltony/meta-openembedded.git patches

for you to fetch changes up to 4a8d7762fad535bfa2ec98a6e67a8807bd656c9e:

  ristretto: upgrade 0.8.2 -> 0.8.3 (2018-06-29 16:34:05 +0200)

----------------------------------------------------------------
Andreas Müller (11):
      thunar: upgrade 1.8.0 -> 1.8.1
      exo: upgrade 0.12.0 -> 0.12.1
      libxfce4util: upgrade 4.13.1 -> 4.13.1
      xfdesktop: upgrade 4.12.4 -> 4.13.2
      thunar-shares-plugin: initial add 0.3.0
      poppler: upgrade 0.64.0 -> 0.66.0
      blueman: initial add 2.0.5+
      blueman: add an append in meta-xfce to enable thunar sendto extension
      obexd: remove
      packagegroup-xfce-extended: add blueman if bluetooth is in distro features
      ristretto: upgrade 0.8.2 -> 0.8.3

 meta-gnome/recipes-connectivity/obex/obexd/ssize_t_definition.patch                    | 40 ----------------------------------------
 meta-gnome/recipes-connectivity/obex/obexd_0.48.bb                                     | 23 -----------------------
 meta-oe/recipes-connectivity/blueman/blueman/0001-Search-for-cython3.patch             | 31 +++++++++++++++++++++++++++++++
 meta-oe/recipes-connectivity/blueman/blueman_git.bb                                    | 40 ++++++++++++++++++++++++++++++++++++++++
 meta-oe/recipes-support/poppler/{poppler_0.64.0.bb => poppler_0.66.0.bb}               |  4 ++--
 meta-xfce/recipes-apps/ristretto/{ristretto_0.8.2.bb => ristretto_0.8.3.bb}            |  4 ++--
 meta-xfce/recipes-connectivity/blueman/blueman_%.bbappend                              |  1 +
 meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.0.bb                  | 10 ++++++++++
 meta-xfce/recipes-xfce/exo/{exo_0.12.0.bb => exo_0.12.1.bb}                            |  4 ++--
 meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.13.1.bb => libxfce4util_4.13.2.bb} |  4 ++--
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb                     |  1 +
 meta-xfce/recipes-xfce/thunar/{thunar_1.8.0.bb => thunar_1.8.1.bb}                     |  4 ++--
 meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.12.4.bb => xfdesktop_4.13.2.bb}          |  6 +++---
 13 files changed, 96 insertions(+), 76 deletions(-)
 delete mode 100644 meta-gnome/recipes-connectivity/obex/obexd/ssize_t_definition.patch
 delete mode 100644 meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
 create mode 100644 meta-oe/recipes-connectivity/blueman/blueman/0001-Search-for-cython3.patch
 create mode 100644 meta-oe/recipes-connectivity/blueman/blueman_git.bb
 rename meta-oe/recipes-support/poppler/{poppler_0.64.0.bb => poppler_0.66.0.bb} (94%)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.8.2.bb => ristretto_0.8.3.bb} (76%)
 create mode 100644 meta-xfce/recipes-connectivity/blueman/blueman_%.bbappend
 create mode 100644 meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.0.bb
 rename meta-xfce/recipes-xfce/exo/{exo_0.12.0.bb => exo_0.12.1.bb} (87%)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.13.1.bb => libxfce4util_4.13.2.bb} (64%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.0.bb => thunar_1.8.1.bb} (86%)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.12.4.bb => xfdesktop_4.13.2.bb} (59%)

-- 
2.14.4



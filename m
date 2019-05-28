Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id EED866D6F5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 15:25:30 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id c5so8482904pll.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 08:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EjlPGq4lEZkhpwQwnO9vMD9IgISpfSg3bplyJR2u+SM=;
	b=UWjw1BEm/b/O/KPBwf1cNluacA/bZHqpnNhlrd60PYcz+9ZbanOcNi0WdyO0NG4gu1
	JHdQcagKHOm+g6lzhMyCUjaqpNP7XFbPOcyNqzzK7lrctyAST/VupD2mA047ZLIVXgW1
	ZxBz2LI5LQqFJyyzgoX1AgzchvW16G3GLuyoVHArgqHcCU06DoHH40jt1h2isLeo1/F2
	wNvfstBuK3vJRRBfggQmsG9J4kYjk4kSwm0W4AWQZhI4IJwkc/ARLZbc/5MgprHcPLtV
	0/JmYDRAMHjIZ82iW5BQzjPNfW8XngI36nyHRbuObxHJhKLpmG4HwopJcmhbdlQNZceQ
	iRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EjlPGq4lEZkhpwQwnO9vMD9IgISpfSg3bplyJR2u+SM=;
	b=DDaCA3n6FHx54/8LvxLr0lgrtSCkHsh5dZjInMP6Ca6X+HThVNJNjhCfzwBqUNRfGv
	WV647clX+o10z+73lE6Y0UXKlKHZUAtoxXb23WqW+UXeaIrnZxd7ZNq67PrZqrINrD+Q
	cmOhm3lSxahIeXcxHd6v3ckNJdMqNKxN20obaPeizbvegHpbtZjaF59lkutWc+bsnvUh
	N7Mmuu5LkjuGZECJksCAIhjcuCtBXLaDLRv0mfgvnb6wvPlSZo1QXDob0ijnGnauad5M
	0XwELIX+ia8ZJPwQ8gq4hnLqXUI4lTfKHCGBM+NJ9vYwJ0E2d68egecs3Y0bwTNl/ZYu
	/EJg==
X-Gm-Message-State: APjAAAVtXQ2GKXX6Jt4N4EuApzRMzkoNmSFyw70qoSMA1u/3IV4G7RtU
	9bE8JM4Id3hkhwAJwgtefub+YUrd
X-Google-Smtp-Source: APXvYqyteJ+WTq1veFX0YIPaZcNkJJz0bcF7oY9qwnW5SM4D9RjCWwIoawy2n1wIw4pE0Xn5W5bhaQ==
X-Received: by 2002:a17:902:ba8c:: with SMTP id
	k12mr34664576pls.229.1559057131717; 
	Tue, 28 May 2019 08:25:31 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:88b0:7832:d929:cf73])
	by smtp.gmail.com with ESMTPSA id
	124sm15927295pfe.124.2019.05.28.08.25.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 May 2019 08:25:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 May 2019 08:25:21 -0700
Message-Id: <cover.1559056652.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/7] Thud pull request
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
X-List-Received-Date: Tue, 28 May 2019 15:25:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These are good to go for thud.

The following changes since commit 4cd3a39f22a2712bfa8fc657d09fe2c7765a4005:

  rtmpdump: Switch to using GNU TLS instead of openssl10 (2019-03-24 18:44:58 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded thud-next
  http://cgit.openembedded.org/meta-openembedded/log/?h=thud-next

Andrej Valek (1):
  ntp: upgrade 4.2.8p12 -> 4.2.8p13

Armin Kuster (1):
  mariadb: update to 5.5.64

Martin Jansa (1):
  ccid: fix SRC_URI

Nicolas Dechesne (1):
  cpupower: remove LIC_FILES_CHKSUM

Qi.Chen@windriver.com (1):
  netkit-rsh: add tag to CVE patch

Tom Rini (1):
  netkit-rsh: don't build under musl

Yi Zhao (1):
  netkit-rsh: security fixes

 .../CVE-2019-7282-and-CVE-2019-7283.patch          | 35 ++++++++++++++++++++++
 .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   |  3 ++
 .../ntp/{ntp_4.2.8p12.bb => ntp_4.2.8p13.bb}       |  6 ++--
 ...b-native_5.5.62.bb => mariadb-native_5.5.64.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc              |  4 +--
 .../mysql/{mariadb_5.5.62.bb => mariadb_5.5.64.bb} |  0
 meta-oe/recipes-kernel/cpupower/cpupower.bb        |  1 -
 meta-oe/recipes-support/ccid/ccid_1.4.24.bb        |  4 +--
 8 files changed, 45 insertions(+), 8 deletions(-)
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p12.bb => ntp_4.2.8p13.bb} (96%)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_5.5.62.bb => mariadb-native_5.5.64.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_5.5.62.bb => mariadb_5.5.64.bb} (100%)

-- 
2.7.4



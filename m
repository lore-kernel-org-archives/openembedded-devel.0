Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 70FA07865F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 10:09:59 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id g75so10276773wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 02:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BbQsaB/6WcZIkUNH1shwC3bJvrLYAalD2eGWgTKf/0M=;
	b=RCm+Kn/E6Q3oTkSCkckilexToWjmGJLKHLzmYTDh4A+gK3RILnG0o0hbu0X5yNhfUn
	RepuFBrE1ev3Dh/CWwYNTPoyYZR49Oor236iZ5taE0gK28HgiCuVo4ds13sxeuaLSfuE
	fz7bS6CyyI/i7++yKewbB8r7tDH53yOMXkerDqJGhbfZO+zG9i4H8mpQCqGNg+vb12el
	E2wXr7/8iyT1UVMPuv2xBLPK5TaWpKed4oNoPBgK3euU2V/7N2JbSRww6NaZIx8BQF9V
	v0hs53rz/bxW9seR6Y3eKzudb39mBKw8zOJOyKtOjMEm0Yew8vFOZvArL702hd6inJ4W
	Gwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BbQsaB/6WcZIkUNH1shwC3bJvrLYAalD2eGWgTKf/0M=;
	b=D3I/H13iozAUp8KxcqlPShNik+5npHuNA3Vgx+qQHbm2hTRB9JDZ8//f6qROTC/1od
	Tj2RSisfq5Oz0+HMDStmTvUJUVI/4NP7qF8vl74Wcp1SwUP6Oc13bCfBmYqIIeORmDHL
	7zQPF3aF/TcuKxHPma3DmyoJzivhMsGnB5QUVdQsFCCfn9kWqrTA+8T0zjSorHxLP/bj
	opGbuDYS50yb0YQI3Be+EVcg9imfgtlMqxKOB49iKL490FxEpDH/Xf1mCkvVZHJuXvXs
	rSwi277QkL3AgHfu2KqK7DyPVTnZ4c3kxtl7blr0lmoHr4O4/b7a5+wGJ0ipbrDRXpOd
	8LLA==
X-Gm-Message-State: AKGB3mL7GA6Wxv4GRucNnT6wQx14fJXOuBh+YG0CFwteR1SXE65mJump
	T+ddGTys3AI+CqKivRFyuH8mCA==
X-Google-Smtp-Source: ACJfBotHNSWuuM5GQzqm4VYzFJGkT92iuEIhBCoiOlnORcnN3vuYDnFk98TuMMT98M5qyy3A4MFrHw==
X-Received: by 10.28.8.67 with SMTP id 64mr1647315wmi.34.1513246200509;
	Thu, 14 Dec 2017 02:10:00 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.gmail.com with ESMTPSA id c3sm1840174wrf.21.2017.12.14.02.09.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 02:09:59 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Dec 2017 11:09:24 +0100
Message-Id: <20171214100929.11094-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
MIME-Version: 1.0
Subject: [PATCH 0/5] few fixes
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
X-List-Received-Date: Thu, 14 Dec 2017 10:10:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit acfb8417e370d017e7307872e61564deeda76a13:

  python3-dominate: new recipe (2017-12-11 07:58:58 -0800)

are available in the git repository at:

  https://github.com/schnitzeltony/meta-openembedded.git patches

for you to fetch changes up to 77a0b0909e81f350e7c00d0e3b613a49656a0ed7:

  plymouth: fix path to systemd-tty-ask-password-agent (2017-12-14 11:02:54 +0100)

----------------------------------------------------------------
Andreas Müller (5):
      fltk: add -fPIC to compile flags
      gvfs: update 1.32.1 -> 1.34.1
      plymouth: do not install systemd units manually
      plymouth: packageconfig gtk needs gtk+3 as depends
      plymouth: fix path to systemd-tty-ask-password-agent

 meta-gnome/recipes-gnome/gvfs/{gvfs_1.32.1.bb => gvfs_1.34.1.bb}                                    |  7 ++-----
 meta-oe/recipes-core/plymouth/files/0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch | 34 ++++++++++++++++++++++++++++++++++
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb                                                     | 12 ++++++------
 meta-oe/recipes-support/fltk/fltk.bb                                                                |  4 ++++
 4 files changed, 46 insertions(+), 11 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.32.1.bb => gvfs_1.34.1.bb} (88%)
 create mode 100644 meta-oe/recipes-core/plymouth/files/0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch

-- 
2.9.5



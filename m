Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6716C71974
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jan 2017 09:21:53 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c85so69526119wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jan 2017 01:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=edC2nfTcQb+Gg/g4bs003UzSUs4H2ukJ1UVuJ8f1NY8=;
	b=eyj8HemkzFJSJN9r7p5AlsKGNm6BV8NFykgAO5kmzvr6p6bI6O6Jpc0FPNfRyiBwkA
	A312RhEZZL+42Unxv5WMQliCnNYkRGkfWs20GNvx3CqmM+gQLm9S6JXXAUT1hi7pqagl
	WUz6DnleGaRqo0RnZhB0qjTIfBsnmA9pQIOuRFMu3AIOZDoyWazjgxujwYJICVGun+ar
	+lRnO6Yttkkc9bYSeQahmhDhmTbmKeCMKKSwlNxNdD+7ZnOZCgUrvV9pzYb/JIZpgS6d
	OPIwjKmtF9eahvnSPkiuFw2BAGEHL3OjJyl/UIZP6ufiRW1Kt1AXtL07ExGf59ae0RFD
	GMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=edC2nfTcQb+Gg/g4bs003UzSUs4H2ukJ1UVuJ8f1NY8=;
	b=h56W7udXhpOW9/VCgSUZYeTRKJUjibNa6odeIQrIZS8Tuk1LWFUFWuRWw26VJXcr1I
	UYZuUCm1T0Hh8wntm5CsHGkBfaeIB8iv3mq2dl9xNc6Rr25tcGLcWsbDrk6HtgTAkF3s
	wg436Oxfh3qft1cAM7Kxo6t1NJggP7dUFifixnIq1H/+2xLEX4Ohhs5C85UI08VM803o
	O3XUpAJpcKcrMTdj2N3bV7NEwU3AtfMyiaQHODLLhWU7wf7pfbcN+5WvYAFGJXChZPMC
	Mj2J3/O2+xJG3xoQIuNJMTupaE7krBiGs6hxQ8MXvkUl4vwwNUcAI1LCrAM3fzDO1GAC
	udcA==
X-Gm-Message-State: AIkVDXKK6N7bahRHv33IqO2Pb1a+seQYFKj0KnaEj9XxcFMZclqkXsjzD9WsBzJjRqqc5Q==
X-Received: by 10.28.175.138 with SMTP id y132mr10400044wme.86.1485681713782; 
	Sun, 29 Jan 2017 01:21:53 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host49-62-dynamic.24-79-r.retail.telecomitalia.it. [79.24.62.49])
	by smtp.gmail.com with ESMTPSA id
	a13sm9471896wma.13.2017.01.29.01.21.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Jan 2017 01:21:53 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Jan 2017 10:21:44 +0100
Message-Id: <1485681704-4762-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-handheld] Pull Request 20160129
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
X-List-Received-Date: Sun, 29 Jan 2017 09:21:58 -0000

The following changes since commit 3bf35a8a1da5b1ef63acd70988fcb89128297d97:

  linux-handheld_4.4: update from 4.4.8 to 4.4.10 (2016-05-11 22:33:22 +0200)

are available in the git repository at:

  git://github.com/LinuxPDA/meta-handheld 

for you to fetch changes up to ab58a164d0638b98f221641135a619a602c7de6c:

  meta-handheld: remove unneeded noexec tasks (2017-01-29 10:18:29 +0100)

----------------------------------------------------------------
Andrea Adami (8):
      linux-kexecboot_4.4: fix KERNEL_IMAGE_BASE_NAME
      linux-gcw0-kexecboot_4.0: fix KERNEL_IMAGE_BASE_NAME
      gcw0.conf: catch up with renaming of KERNEL_OUTPUT in oe-core
      linux-gcw0: provide recipe for the 4.7 kernel.
      linux-gcw0-kexecboot: update to 4.17
      linux-gcw0_4.0: remove old recipe
      linux-gcw0-kexecboot_4.0: remove old recipe
      meta-handheld: remove unneeded noexec tasks

 conf/machine/gcw0.conf                             |  2 +-
 recipes-bsp/zaurus-utils/zaurus-legacy-tar.bb      |  4 +-
 .../gcw0/defconfig                                 | 54 +++++++++++++++-------
 .../gcw0/defconfig                                 | 52 +++++++++++++++------
 recipes-kernel/linux/linux-gcw0-kexecboot_4.0.bb   | 30 ------------
 recipes-kernel/linux/linux-gcw0-kexecboot_4.7.bb   | 30 ++++++++++++
 .../linux/{linux-gcw0_4.0.bb => linux-gcw0_4.7.bb} |  5 +-
 recipes-kernel/linux/linux-kexecboot_4.4.bb        | 32 ++++++-------
 8 files changed, 126 insertions(+), 83 deletions(-)
 rename recipes-kernel/linux/{linux-gcw0-4.0 => linux-gcw0-4.7}/gcw0/defconfig (82%)
 rename recipes-kernel/linux/{linux-gcw0-kexecboot-4.0 => linux-gcw0-kexecboot-4.7}/gcw0/defconfig (83%)
 delete mode 100644 recipes-kernel/linux/linux-gcw0-kexecboot_4.0.bb
 create mode 100644 recipes-kernel/linux/linux-gcw0-kexecboot_4.7.bb
 rename recipes-kernel/linux/{linux-gcw0_4.0.bb => linux-gcw0_4.7.bb} (60%)

-- 
2.7.4



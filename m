Received: from mail-da0-f53.google.com ([209.85.210.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0AZI-0005zv-QT
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jan 2013 13:45:41 +0100
Received: by mail-da0-f53.google.com with SMTP id x6so202988dac.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2013 04:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=O0IQ2AkxYZtRzCFPp2Fps+fRPaq2H7VoMuYdq0VstNs=;
	b=Q5zjuf8iUC6s3+CvPJNkDkXiNwZkN2Xk9gh6pd0Fe06fsjEtmYNlaEPhdBOZBzweYg
	hv5dTLyYO/rVR+2h6byBQWe61Hnz7J+/M/555M6rN88AEKMNwn2ihbUQW5+WRRURIh7d
	x4CC8RFrjmxIdUdRRDv2AZZ6ZPTsEbbFJt6gYC7VqyUmIbjvZF2P+1l4TTrWjZkTc/TO
	GOUBNCehzchbk7YNpu0y6HTomBG++zr6cDzcFo6QUChx2C6HieLCCoZpMYQZ14X9bCr4
	JgMLMy9NkhsP0beoFuxUNAjms1ptk9Sp1SB2F8q9zTcPqRZ8LLsUrSsJYUwY8dT6Y7+O
	nbvQ==
X-Received: by 10.68.252.69 with SMTP id zq5mr1901960pbc.104.1359462600406;
	Tue, 29 Jan 2013 04:30:00 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f9sm8857271paz.12.2013.01.29.04.29.57
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 04:29:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2013 13:29:49 +0100
Message-Id: <cover.1359462547.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/5] world-image fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 12:45:41 -0000

The following changes since commit ce25b8d24c1843d42f74f147c63d998d05ab5362:

  meta-systemd: openssh: rename bbappend to match oe-core version 6.1p1 (2013-01-28 18:01:59 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/world
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/world

Martin Jansa (5):
  packagegroup-qte-toolchain-target: exclude from world
  vim: implement gvim, vim-tiny as PACKAGECONFIG
  move broken recipes to nonworking directories
  gnome-panel3: exclude from world
  vim: use new u-a syntax

 .../gnome-panel/gnome-panel3_3.0.2.bb              |  3 ++
 .../30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch |  0
 .../gnome/gnome-terminal_2.26.3.bb                 |  0
 .../add-angstrom-distro.patch                      |  0
 .../system-tools-backends                          |  0
 .../system-tools/system-tools-backends_2.10.2.bb   |  0
 ...e-as-interpreter-for-sketches-instead-of-.patch |  0
 .../cloud9/cloud9/cloud9-avahi.service             |  0
 .../{ => nonworking}/cloud9/cloud9/index.js        |  0
 .../{ => nonworking}/cloud9/cloud9_0.6.bb          |  0
 .../nodejs/nodejs/fix-hardfloat-detection.patch    |  0
 .../{ => nonworking}/nodejs/nodejs_0.6.20.bb       |  0
 .../{ => nonworking}/fbida/fbida_2.08.bb           |  0
 ...0002-Fix-image-handling-integer-overflows.patch |  0
 .../0003-Fix-build-failure-with-ld-as-needed.patch |  0
 .../slim/slim/0004-Add-support-libpng15.patch      |  0
 ...Remove-path-of-gcc-amd-g-and-version-of-g.patch |  0
 ...emove-localhost-from-Authenticator-of-pam.patch |  0
 .../slim/slim/0007-Fix-tty-slowness.patch          |  0
 .../slim/slim/0008-restart-Xserver-if-killed.patch |  0
 .../{ => nonworking}/slim/slim/Makefile.oe         |  0
 .../{ => nonworking}/slim/slim/slim-dynwm          |  0
 .../{ => nonworking}/slim/slim/slim.pamd           |  0
 .../{ => nonworking}/slim/slim/slim.service        |  0
 .../{ => nonworking}/slim/slim/update_slim_wmlist  |  0
 .../{ => nonworking}/slim/slim_1.3.2.bb            |  0
 .../packagegroup-qte-toolchain-target.bbappend     |  3 ++
 meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb              |  2 +
 .../{ => nonworking}/fftw/benchfft_3.1.bb          |  0
 .../{ => nonworking}/syslog-ng/files/initscript    |  0
 .../syslog-ng/files/syslog-ng.conf                 |  0
 .../{ => nonworking}/syslog-ng/syslog-ng.inc       |  0
 .../{ => nonworking}/syslog-ng/syslog-ng_3.2.5.bb  |  0
 meta-oe/recipes-support/vim/gvim_7.2.446.bb        | 14 ------
 meta-oe/recipes-support/vim/vim-tiny_7.2.446.bb    | 11 -----
 meta-oe/recipes-support/vim/vim.inc                | 53 ++++++++++------------
 meta-oe/recipes-support/vim/vim_7.2.446.bb         | 31 ++++---------
 .../{ => nonworking}/cloud9/cloud9/cloud9.service  |  0
 .../{ => nonworking}/cloud9/cloud9_0.6.bbappend    |  0
 .../syslog-ng/syslog-ng_3.2.5.bbappend             |  0
 40 files changed, 41 insertions(+), 76 deletions(-)
 rename meta-gnome/recipes-gnome/{ => nonworking}/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch (100%)
 rename meta-gnome/recipes-gnome/{ => nonworking}/gnome/gnome-terminal_2.26.3.bb (100%)
 rename meta-gnome/recipes-gnome/{ => nonworking}/system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch (100%)
 rename meta-gnome/recipes-gnome/{ => nonworking}/system-tools/system-tools-backends-2.10.2/system-tools-backends (100%)
 rename meta-gnome/recipes-gnome/{ => nonworking}/system-tools/system-tools-backends_2.10.2.bb (100%)
 rename meta-oe/recipes-devtools/{ => nonworking}/cloud9/cloud9/0001-ide-use-node-as-interpreter-for-sketches-instead-of-.patch (100%)
 rename meta-oe/recipes-devtools/{ => nonworking}/cloud9/cloud9/cloud9-avahi.service (100%)
 rename meta-oe/recipes-devtools/{ => nonworking}/cloud9/cloud9/index.js (100%)
 rename meta-oe/recipes-devtools/{ => nonworking}/cloud9/cloud9_0.6.bb (100%)
 rename meta-oe/recipes-devtools/{ => nonworking}/nodejs/nodejs/fix-hardfloat-detection.patch (100%)
 rename meta-oe/recipes-devtools/{ => nonworking}/nodejs/nodejs_0.6.20.bb (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/fbida/fbida_2.08.bb (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/0002-Fix-image-handling-integer-overflows.patch (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/0003-Fix-build-failure-with-ld-as-needed.patch (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/0004-Add-support-libpng15.patch (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/0006-Remove-localhost-from-Authenticator-of-pam.patch (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/0007-Fix-tty-slowness.patch (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/0008-restart-Xserver-if-killed.patch (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/Makefile.oe (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/slim-dynwm (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/slim.pamd (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/slim.service (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/update_slim_wmlist (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim_1.3.2.bb (100%)
 rename meta-oe/recipes-support/{ => nonworking}/fftw/benchfft_3.1.bb (100%)
 rename meta-oe/recipes-support/{ => nonworking}/syslog-ng/files/initscript (100%)
 rename meta-oe/recipes-support/{ => nonworking}/syslog-ng/files/syslog-ng.conf (100%)
 rename meta-oe/recipes-support/{ => nonworking}/syslog-ng/syslog-ng.inc (100%)
 rename meta-oe/recipes-support/{ => nonworking}/syslog-ng/syslog-ng_3.2.5.bb (100%)
 delete mode 100644 meta-oe/recipes-support/vim/gvim_7.2.446.bb
 delete mode 100644 meta-oe/recipes-support/vim/vim-tiny_7.2.446.bb
 rename meta-systemd/meta-oe/recipes-devtools/{ => nonworking}/cloud9/cloud9/cloud9.service (100%)
 rename meta-systemd/meta-oe/recipes-devtools/{ => nonworking}/cloud9/cloud9_0.6.bbappend (100%)
 rename meta-systemd/meta-oe/recipes-support/{ => nonworking}/syslog-ng/syslog-ng_3.2.5.bbappend (100%)

-- 
1.8.1.2




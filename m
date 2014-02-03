Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9D75D6D491
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2014 06:50:30 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id p10so6542072pdj.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Feb 2014 22:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=DH+AKvpPINzkqv1ghij/MMBr+typ8kBJyswe1YOgfV4=;
	b=a281JlfgJeUhvZsGEsObY2nL703gx301W2zzZ3AjNzabB5KDX87YCr8l597Qksdw3E
	k4yCwqT37sm/hmbBpezRNeEaBXveU8usS9Id3jCl2D1AU04cULpm/cfu8fjzH9+tWhc5
	HDETSvJVm3f5owCW00PyQFOV/YG3egcCDKAz8amFciVSEeW45ZCI/as48VydCtRugsUZ
	n/pGLexNVztjX2Ujzfc1z81VolY+snMnMJVHE+p8w1kZ+OJ21KTw/yz+S4qxxwpCv7Ui
	PtYh79O9Hyy5wKnB/8tXeWswggM4T8F+WjWkB8A/BwTrtf5wOyBXa8cwMs/vvTec9q8I
	uSQg==
X-Received: by 10.68.196.226 with SMTP id ip2mr35171898pbc.106.1391410231766; 
	Sun, 02 Feb 2014 22:50:31 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	i10sm137068968pat.11.2014.02.02.22.50.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 02 Feb 2014 22:50:30 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Feb 2014 22:51:05 -0800
Message-Id: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-perl][PATCH v2 00/10]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Feb 2014 06:50:30 -0000

This series of recipes is the first step towards the ultimate
goal of getting Slic3r to build in OE.

Original submission was missing Algorithm::Diff which Text::Diff depends on.

Resubmitted to follow Debian Perl Policy.
See 4.2 Module Package Names [http://www.debian.org/doc/packaging-manuals/perl-policy/ch-module_packages.html]

Tim Orling (10):
  libmodule-metadata-perl: add 1.000019
  libtext-diff-perl: add 1.41
  libcapture-tiny-perl: add 0.23
  libmodule-runtime-perl: add 0.013
  libextutils-config-perl: add 0.007
  libextutils-helpers-perl: add 0.021
  libextutils-installpaths-perl: add 0.010
  libmodule-build-tiny-perl: add 0.030
  libextutils-cppguess-perl: add 0.07
  libalgorithm-diff-perl: add 1.15

 .../libalgorithm/libalgorithm-diff-perl_1.15.bb    |   23 +++++++++
 .../libcapture/libcapture-tiny-perl_0.23.bb        |   36 +++++++++++++
 .../libextutils/libextutils-config-perl_0.007.bb   |   24 +++++++++
 .../libextutils/libextutils-cppguess-perl_0.07.bb  |   38 ++++++++++++++
 .../libextutils/libextutils-helpers-perl_0.021.bb  |   29 +++++++++++
 .../libextutils-installpaths-perl_0.010.bb         |   25 +++++++++
 .../libmodule/libmodule-build-tiny-perl_0.030.bb   |   54 ++++++++++++++++++++
 .../libmodule/libmodule-metadata-perl_1.000019.bb  |   33 ++++++++++++
 .../libmodule/libmodule-runtime-perl_0.013.bb      |   35 +++++++++++++
 .../recipes-perl/libtext/libtext-diff-perl_1.41.bb |   27 ++++++++++
 10 files changed, 324 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
 create mode 100644 meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.23.bb
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.07.bb
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.021.bb
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb
 create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.030.bb
 create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-metadata-perl_1.000019.bb
 create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.013.bb
 create mode 100644 meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb

-- 
1.7.9.5



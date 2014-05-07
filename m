Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id F11D760167
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 02:07:57 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id ey11so374729pad.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 19:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8f/Onaovq+sGmDu4uFDgQTp/qFcc95j3qBPDrPkcmAg=;
	b=q5Wurmp+mGtxFgQCjcFAGcNEZs9/50PDw6uLDYHA0YOaI8Dgn3XS8NnrtStWbBwhlI
	92QESg8MnraXkQKLDkvQHgZXR2sZLtTvwhwNm8vviXK5F+QfVELE2wVGa7NQN7M/F+1H
	HwiLaGWnBCPNUXgzBsijpOVfuDyo3B//g6ilI7SM/Q1EZBmqCcCEMazfMH+fJhVjR3Q9
	pTHOQeAH817S+iJlypwlxCnn+I90syR202P0emj/1uKYJlYvYLKby7/2krdmIpH7Mpsh
	+a462vLl2PyriW4JwbC0RurLeIy8UQ56h3So9XGE5O7zT+9HezaXriVTahLm6CnyImAG
	g2iA==
X-Received: by 10.66.65.204 with SMTP id z12mr13038470pas.60.1399428478724;
	Tue, 06 May 2014 19:07:58 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id ec2sm142236pbc.63.2014.05.06.19.07.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 19:07:57 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 May 2014 19:09:16 -0700
Message-Id: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-perl][PATCH v3 0/9] perl modules
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
X-List-Received-Date: Wed, 07 May 2014 02:08:03 -0000

From: Tim Orling <TicoTimo@gmail.com>

This series of recipes is the first step towards the
ultimate goal of getting Slic3r to build in OE.

Changes since v2:
  * dropped libmodule-metadata as a patch for oe-core/meta/perl provides
      ** http://patches.openembedded.org/patch/71565/
  * correct DEPENDS for libmodule-build-tiny-perl ('*-perl-*' missing)

Tim Orling (9):
  libtext-diff-perl: add 1.41
  libcapture-tiny-perl: add 0.23
  libmodule-runtime-perl: add 0.013
  libextutils-config-perl: add 0.007
  libextutils-helpers-perl: add 0.021
  libextutils-installpaths-perl: add 0.010
  libmodule-build-tiny-perl: add 0.030
  libextutils-cppguess-perl: add 0.07
  libalgorithm-diff-perl: add 1.15

 .../libalgorithm/libalgorithm-diff-perl_1.15.bb    | 23 +++++++++
 .../libcapture/libcapture-tiny-perl_0.23.bb        | 36 +++++++++++++++
 .../libextutils/libextutils-config-perl_0.007.bb   | 24 ++++++++++
 .../libextutils/libextutils-cppguess-perl_0.07.bb  | 38 +++++++++++++++
 .../libextutils/libextutils-helpers-perl_0.021.bb  | 29 ++++++++++++
 .../libextutils-installpaths-perl_0.010.bb         | 25 ++++++++++
 .../libmodule/libmodule-build-tiny-perl_0.030.bb   | 54 ++++++++++++++++++++++
 .../libmodule/libmodule-runtime-perl_0.013.bb      | 35 ++++++++++++++
 .../recipes-perl/libtext/libtext-diff-perl_1.41.bb | 27 +++++++++++
 9 files changed, 291 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
 create mode 100644 meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.23.bb
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.07.bb
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.021.bb
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb
 create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.030.bb
 create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.013.bb
 create mode 100644 meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb

-- 
1.8.3.2



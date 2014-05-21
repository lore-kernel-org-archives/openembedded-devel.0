Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f47.google.com (unknown [209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5CC65D1A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 07:49:08 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id lf10so1154916pab.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 00:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pW6TY7WggEFGNohN+gpzglsIvWnPVCWgRuSsb+yX+W4=;
	b=uOEht44Qz4EYbD1oOwy2EWzUawrg0lvz9zJYfg6fCAAi4e0D8bZESUcoz4PM9FOXDY
	2K5JX1jtNDhR6UqNKPskfYd/Y13XI+DhLx5zGYWVrBOTZUV3spSJJ8u1X6GqqCiTa9ua
	Vp6cczn0FhK8/M2KuIh2ye0/myyNfCyjshGuuucl2I1e9xhu8xmIHjCj8EfcXjhoMamw
	KylIswvRaL3UoxsdVtAPqnVdzGpOhrK41DP6VVSZh40ubUB0vfS9IlXPbzBGqUWueHom
	zvwbjjX4gv4z+gRkP/AlXNOfiuXqJ77kgBtbrKGz5aEAfDvnY7hXmDC4E9fcpHhayHQp
	2QOg==
X-Received: by 10.66.232.138 with SMTP id to10mr5336192pac.7.1400658101625;
	Wed, 21 May 2014 00:41:41 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id it4sm6669337pbc.39.2014.05.21.00.41.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 21 May 2014 00:41:40 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 May 2014 00:43:33 -0700
Message-Id: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-perl][PATCH v4 00/10] add perl modules
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
X-List-Received-Date: Wed, 21 May 2014 07:49:09 -0000

From: Tim Orling <TicoTimo@gmail.com>

Changes since v3:
  * Use ${CPAN_MIRROR} for all recipes
      * See patches for oe-core:
          http://patches.openembedded.org/patch/72457/
          http://patches.openembedded.org/patch/72459/
  * Upstream has continued to move forward
  * Update the following:
      libcapture-tiny-perl from 0.23 -> 0.24
      libmodule-runtime-perl from 0.013 -> 0.014
      libextutils-helpers-perl from 0.021 -> 0.022
      libmodule-build-tiny-perl from 0.030 -> 0.036
  * Add libtest-harness-perl which RPROVIDES libtap-harness-env-perl
    now required by libmodule-build-tiny-perl

Tim Orling (10):
  libtext-diff-perl: add 1.41
  libcapture-tiny-perl: add 0.24
  libmodule-runtime-perl: add 0.014
  libextutils-config-perl: add 0.007
  libextutils-helper-perl: add 0.022
  libextutils-installpaths-perl: add 0.010
  libmodule-build-tiny-perl: add 0.036
  libextutils-cppguess-perl: add 0.07
  libalgorithm-diff-perl: add 1.15
  libtest-harness-perl: add 3.30

 .../libalgorithm/libalgorithm-diff-perl_1.15.bb    | 23 +++++++
 .../libcapture/libcapture-tiny-perl_0.24.bb        | 36 ++++++++++
 .../libextutils/libextutils-config-perl_0.007.bb   | 24 +++++++
 .../libextutils/libextutils-cppguess-perl_0.07.bb  | 38 +++++++++++
 .../libextutils/libextutils-helpers-perl_0.022.bb  | 29 ++++++++
 .../libextutils-installpaths-perl_0.010.bb         | 25 +++++++
 .../libmodule/libmodule-build-tiny-perl_0.036.bb   | 55 +++++++++++++++
 .../libmodule/libmodule-runtime-perl_0.014.bb      | 35 ++++++++++
 .../libtest/libtest-harness-perl_3.30.bb           | 79 ++++++++++++++++++++++
 .../recipes-perl/libtext/libtext-diff-perl_1.41.bb | 27 ++++++++
 10 files changed, 371 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
 create mode 100644 meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.24.bb
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.07.bb
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.022.bb
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb
 create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb
 create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.014.bb
 create mode 100644 meta-perl/recipes-perl/libtest/libtest-harness-perl_3.30.bb
 create mode 100644 meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb

-- 
1.8.3.2



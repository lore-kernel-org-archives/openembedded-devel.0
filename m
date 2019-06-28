Return-Path: <timothy.t.orling@linux.intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 28 Jun 2019 04:59:47 UTC
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id CD9107E4FE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 04:59:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2019 21:52:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,426,1557212400"; d="scan'208";a="246055415"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga001.jf.intel.com with ESMTP; 27 Jun 2019 21:52:41 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jun 2019 21:52:16 -0700
Message-Id: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][meta-perl][PATCH 0/9] Perl module recipe upgrades
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
X-List-Received-Date: Fri, 28 Jun 2019 04:59:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade multiple perl module recipes in meta-oe and meta-perl.

Tested, each in isolation in a core-image-minimal, on qemux86-64.

This is a non-trivial amount of work to get all the dependencies
working and make the tests pass. You are welcome.

An effort has been made to make all ptests pass, but there a few
exceptions:

* libdbi-perl skips some tests because it needs Test::Pod, which
  is not yet available (it is available in meta-cgl)
* libtest-nowarnings-perl skips some tests because it needs
  Devel::StackTrace, which is not yet available
* libdbd-sqlite-perl has some failures looking for
  lib/DBD/SQLite/VirtualTable and it is not clear what the fix is
* libnet-ldap-perl skips some tests because Text::Soundex is not
  yet available

Three recipes are known to need upgrades and are WIP, but not ready to
submit:
* libauthen-radius-perl: 0.22 -> 0.30
* libxml-libxml-perl: 2.0134 -> 2.0201
* libextutils-cppguess-perl: 0.12 -> 0.19

These are available for the curious or helpful in
timo/perl-upgrades-06262019 branch on meta-openembedded-contrib

The following changes since commit 64974b8779291419486338f75f229a732e450d78:

  xfce4-screensaver: 0.1.4 -> 0.1.5 (2019-06-21 06:22:19 -0700)

are available in the Git repository at:

  git://push.openembedded.org/meta-openembedded-contrib timo/perl-upgrades-06272019

Tim Orling (9):
  libencode-perl: upgrade 2.94 -> 3.01; enable ptest
  libdbi-perl: fix dependencies
  libtest-nowarnings-perl: add recipe for 1.04
  libdbd-sqlite-perl: upgrade 1.54 -> 1.62; enable ptest
  libsub-uplevel-perl: add recipe for 0.36
  libtest-warn-perl: add recipe for 0.36
  libcgi-perl: upgrade 4.43 -> 4.44
  libnet-ldap-perl: upgrade 0.65 -> 0.66; enable ptest
  libunicode-linebreak-perl: upgrade 2017.004 -> 2019.001; enable ptest

 .../perl/libdbi-perl_1.642.bb                 |  38 +++++--
 ...ibcgi-perl_4.43.bb => libcgi-perl_4.44.bb} |   5 +-
 ...erl_1.54.bb => libdbd-sqlite-perl_1.62.bb} |  43 ++++---
 .../libencode/libencode-perl_2.94.bb          |  68 -----------
 .../libencode/libencode-perl_3.01.bb          | 106 ++++++++++++++++++
 ...-perl_0.65.bb => libnet-ldap-perl_0.66.bb} |  26 ++++-
 .../libsub/libsub-uplevel-perl_0.2800.bb      |  43 +++++++
 .../libtest/libtest-nowarnings-perl_1.04.bb   |  37 ++++++
 .../libtest/libtest-warn-perl_0.36.bb         |  46 ++++++++
 .../libunicode-linebreak-perl_2017.004.bb     |  26 -----
 .../libunicode-linebreak-perl_2019.001.bb     |  55 +++++++++
 11 files changed, 371 insertions(+), 122 deletions(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.43.bb => libcgi-perl_4.44.bb} (88%)
 rename meta-perl/recipes-perl/libdb/{libdbd-sqlite-perl_1.54.bb => libdbd-sqlite-perl_1.62.bb} (53%)
 delete mode 100644 meta-perl/recipes-perl/libencode/libencode-perl_2.94.bb
 create mode 100644 meta-perl/recipes-perl/libencode/libencode-perl_3.01.bb
 rename meta-perl/recipes-perl/libnet/{libnet-ldap-perl_0.65.bb => libnet-ldap-perl_0.66.bb} (51%)
 create mode 100644 meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
 create mode 100644 meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
 create mode 100644 meta-perl/recipes-perl/libtest/libtest-warn-perl_0.36.bb
 delete mode 100644 meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2017.004.bb
 create mode 100644 meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb

-- 
2.20.1



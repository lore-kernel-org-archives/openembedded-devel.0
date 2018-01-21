Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id B36E671B2A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 22:44:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2018 14:44:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,393,1511856000"; d="scan'208";a="25171734"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga001.jf.intel.com with ESMTP; 21 Jan 2018 14:44:11 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 14:44:00 -0800
Message-Id: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Subject: [meta-perl][PATCH 00/12] Upgrade perl recipes
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
X-List-Received-Date: Sun, 21 Jan 2018 22:44:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade recipes using upgradehelper.py from auto-upgrade-helper.

Runtime dependencies fixed by sequentially running 'perl -m<module>' on
each recipe (in qemux86) until there were no errors.

The following changes since commit 8cef6b38e62e6c79ec857510df454cefc868b0df:

  meson: remove recipe and class (2018-01-16 21:41:26 -0800)

are available in the git repository at:

  git://push.openembedded.org/meta-openembedded-contrib timo/meta-perl-upgrades

Tim Orling (12):
  libdbd-sqlite-perl: add UPSTREAM_CHECK_REGEX
  libencode-perl: add UPSTREAM_CHECK_REGEX
  libcgi-perl: upgrade 4.36 -> 4.38
  libextutils-cppguess-perl: upgrade 0.09 -> 0.12
  libio-socket-ssl-perl: upgrade 1.997 -> 2.052
  libmime-types-perl: upgrade 2.13 -> 2.14
  libmoo-perl: upgrade 2.003002 -> 2.003004
  libnet-dns-perl: upgrade 1.13 -> 1.14
  libnet-ssleay-perl: upgrade 1.81 -> 1.84
  librole-tiny-perl: upgrade 2.000005 -> 2.000006
  libtest-harness-perl: upgrade 3.36 -> 3.39
  libxml-libxml-perl: upgrade 2.0131 -> 2.0132

 .../{libcgi-perl_4.36.bb => libcgi-perl_4.38.bb}   |  9 ++++++--
 .../recipes-perl/libdb/libdbd-sqlite-perl_1.54.bb  |  2 ++
 .../recipes-perl/libencode/libencode-perl_2.83.bb  |  7 ++++++
 ...l_0.09.bb => libextutils-cppguess-perl_0.12.bb} |  4 ++--
 ...erl_1.997.bb => libio-socket-ssl-perl_2.052.bb} | 12 ++++++----
 ...pes-perl_2.13.bb => libmime-types-perl_2.14.bb} |  4 ++--
 ...oo-perl_2.003002.bb => libmoo-perl_2.003004.bb} |  4 ++--
 ...et-dns-perl_1.13.bb => libnet-dns-perl_1.14.bb} |  6 +++--
 ...eay-perl_1.81.bb => libnet-ssleay-perl_1.84.bb} | 27 ++++++++++++----------
 ...l_2.000005.bb => librole-tiny-perl_2.000006.bb} |  4 ++--
 ...s-perl_3.36.bb => libtest-harness-perl_3.39.bb} | 15 ++++++++++--
 ...perl_2.0131.bb => libxml-libxml-perl_2.0132.bb} | 15 +++++++-----
 12 files changed, 73 insertions(+), 36 deletions(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.36.bb => libcgi-perl_4.38.bb} (75%)
 rename meta-perl/recipes-perl/libextutils/{libextutils-cppguess-perl_0.09.bb => libextutils-cppguess-perl_0.12.bb} (89%)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_1.997.bb => libio-socket-ssl-perl_2.052.bb} (82%)
 rename meta-perl/recipes-perl/libmime/{libmime-types-perl_2.13.bb => libmime-types-perl_2.14.bb} (85%)
 rename meta-perl/recipes-perl/libmoo/{libmoo-perl_2.003002.bb => libmoo-perl_2.003004.bb} (91%)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.13.bb => libnet-dns-perl_1.14.bb} (77%)
 rename meta-perl/recipes-perl/libnet/{libnet-ssleay-perl_1.81.bb => libnet-ssleay-perl_1.84.bb} (65%)
 rename meta-perl/recipes-perl/librole/{librole-tiny-perl_2.000005.bb => librole-tiny-perl_2.000006.bb} (84%)
 rename meta-perl/recipes-perl/libtest/{libtest-harness-perl_3.36.bb => libtest-harness-perl_3.39.bb} (88%)
 rename meta-perl/recipes-perl/libxml/{libxml-libxml-perl_2.0131.bb => libxml-libxml-perl_2.0132.bb} (80%)

-- 
2.13.6



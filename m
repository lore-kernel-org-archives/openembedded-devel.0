Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id B8DE46079F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Aug 2017 15:37:54 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 123so4586513pga.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Aug 2017 08:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=I3KKZrLL3mn4ZrDY3tHyQs8wpplLZpc2U+9hbW1PN20=;
	b=JUmA4Qv1TL1jHDHo/t7BjqbJJNwNYpMSvKqlSMbY4mjOMsHsedMrJeaVuUhOkt47Qc
	ClE6eyFxhrTwGyKgysZA/hknPa5SlytPH7RVAL+N2T8l5wy5ozwX55rivYpAjpUzH+oB
	bdnILpqwshYFthCljdKeJGOg7AIiTCJNzyamo9f3JTRYiX0p3OH4OBfPpzJ16vggA1oo
	t9Qb6a9AA/8onBG2YXWHGAyH0lAqGUqq8OXClEhBoUZl1KfUibeyV7XNZXCO1BxLST2B
	dSmcpCYFWDXQUtKPGgCWtdznXSYp9j1SnlDrNM5E0MMEMsPcP5p9w8xX/e13jHS7VRMn
	l8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=I3KKZrLL3mn4ZrDY3tHyQs8wpplLZpc2U+9hbW1PN20=;
	b=tbsw9aRJsyEcbHlm/P1idwcdLmR95fLbT7a0HYIXsAJBZyYyuLO6tyaZul3kyrzToT
	I6GlPdvqXPbnsmmrsyfNcnSCiQ0padtMefySzuxzZfL00shd+WadPPfvPTx5BUvhz3S4
	3T3A9h9sNAil4GJj1rGHAgYkbGS0vE3tpcARWPf5Tldd6dsLy5qMtZGYGj8aItnQJ2zQ
	+x+I7KOy6KoQRbXJE8akCHDiaoyGLvRNI9iS7R6EeVaUVWoqGqnsH+DQz2w9VrmePw+c
	Y1UXi9vO1fC4hH5O91RqeJTGtiHG9fhw9MklsFWjqKfA6K88doG3J8GZVpRH5EWqLFFr
	3b3Q==
X-Gm-Message-State: AIVw111j0rIIy48CkH948Byc3aJd/5X7LFlKUOgVELwYjzuGjPZsz8u6
	YahRNnZLSl/abCQ0
X-Received: by 10.84.211.136 with SMTP id c8mr7338725pli.273.1501947475527;
	Sat, 05 Aug 2017 08:37:55 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:a184:9868:f119:54ba])
	by smtp.gmail.com with ESMTPSA id
	s87sm8841560pfa.86.2017.08.05.08.37.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Aug 2017 08:37:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sat,  5 Aug 2017 08:36:53 -0700
Message-Id: <cover.1501946978.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/29] pull request Morty-next #2
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
X-List-Received-Date: Sat, 05 Aug 2017 15:37:54 -0000

Cover letter only.

Found more changes. Includes previous request.

This changes are for morty-next.

The following changes since commit fe5c83312de11e80b85680ef237f8acb04b4b26e:

  libdnet: Update SRC_URI to fix checksum errors (2017-02-28 11:37:51 -0500)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib akuster/morty-next
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=akuster/morty-next

Alejandro Mery (4):
  gitver: fix try/except syntax for python3 support
  gitver: extend class to use EXTERNALSRC if set
  gitver: fix broken ${GITSHA} and recursion in S when PV="${GITVER}"
  gitver: skip packages instead of panic()ing if ${GITVER} fails to
    expand

Denys Dmytriyenko (1):
  devmem2: use different filename to avoid checksum conflicts

Derek Straka (1):
  apache2: always use the archive.apache.org to ensure older releases
    are always available

Joe Slater (1):
  chrony: fix build failure for arma9

Khem Raj (12):
  alsa-equal: Update SRC_URI to something valid
  gradm: Fix GNU_HASH QA errors
  smstools3: Fix GNU_HASH errors
  logfsprogs: Pass LDFLAGS to link steps
  lio-utils: Fix GNU_HASH QA errors
  libmatroska: Fix missing GNU_HASH errors
  iptraf: Fix build with clang
  procmail: Fix GNU_HASH errors, pass LDFLAGS
  sgio: Fix missing GNU_HASH errors
  zile: Fix build with musl
  memstat: Fix build with musl
  uml-utilities: Fix problem founds during musl build

Marek Vasut (1):
  picocom: Fix build

Martin Jansa (8):
  mailcap: use pagure.org instead of retired fedorahosted.org
  libqb: use github.com instead of retired fedorahosted.org
  libqb: inherit autotools-brokensep
  ttf-liberation-sans-narrow: use pagure.org instead of retired
    fedorahosted.org
  hwdata: use github instead of fedorahosted.org
  pngcheck: respect LDFLAGS
  uml-utilities: respect LDFLAGS not only for mconsole but for other
    binaries as well
  zile: fix do_install

Nicolas Ferre (1):
  devmem2: Change source URL to regain access to it

 .../0001-Add-LDFLAGS-to-linker-cmdline.patch       | 46 +++++++++++
 .../logfsprogs/logfsprogs_git.bb                   |  4 +-
 ...1-Makefile-Use-LINKFLAGS-during-link-step.patch | 28 +++++++
 .../recipes-mkv/libmatroska/libmatroska_1.4.1.bb   |  4 +-
 .../alsa-equal/alsa-equal_0.6.bb                   |  4 +-
 .../recipes-support/chrony/chrony/arm_eabi.patch   | 57 ++++++++++++++
 .../recipes-support/chrony/chrony_2.4.bb           |  5 +-
 meta-oe/classes/gitver.bbclass                     | 49 +++++++-----
 .../smstools3/smstools3_3.1.15.bb                  |  2 +
 .../iptraf/iptraf/format_string.patch              | 31 ++++++++
 .../recipes-devtools/iptraf/iptraf/ldopts.patch    | 35 +++++++++
 meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb    |  7 +-
 ...-Include-limits.h-for-PATH_MAX-definition.patch | 29 +++++++
 meta-oe/recipes-devtools/memstat/memstat_1.0.bb    |  3 +-
 meta-oe/recipes-extended/libqb/libqb_0.17.2.bb     | 15 ++--
 ...0001-makefile-Add-LDFLAGS-to-linking-rule.patch | 29 +++++++
 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb   |  8 +-
 ...uired-system-header-files-for-fd_set-and-.patch | 41 ++++++++++
 .../uml-utilities-20040406/fix-ldflags.patch       | 88 ++++++++++++++++++++++
 .../uml-utilities/uml-utilities_20040406.bb        |  5 +-
 .../ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb |  2 +-
 meta-oe/recipes-support/devmem2/devmem2.bb         | 12 ++-
 ...file-Append-instead-of-overriding-LDFLAGS.patch | 26 +++++++
 meta-oe/recipes-support/gradm/gradm_3.1.bb         |  4 +-
 .../hwdata/{hwdata_0.291.bb => hwdata_git.bb}      | 10 ++-
 ...espect-environment-variables-and-add-LDFL.patch | 61 +++++++++++++++
 meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb |  4 +-
 meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb  | 10 ++-
 meta-oe/recipes-support/picocom/picocom_1.7.bb     |  3 +-
 meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb |  2 +-
 meta-oe/recipes-support/procmail/procmail_3.22.bb  |  4 +-
 meta-oe/recipes-support/zile/zile_2.4.11.bb        |  5 ++
 .../recipes-httpd/apache2/apache2-native_2.4.23.bb |  2 +-
 .../recipes-httpd/apache2/apache2_2.4.23.bb        |  2 +-
 34 files changed, 573 insertions(+), 64 deletions(-)
 create mode 100644 meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-Add-LDFLAGS-to-linker-cmdline.patch
 create mode 100644 meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-Makefile-Use-LINKFLAGS-during-link-step.patch
 create mode 100644 meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
 create mode 100644 meta-oe/recipes-devtools/iptraf/iptraf/format_string.patch
 create mode 100644 meta-oe/recipes-devtools/iptraf/iptraf/ldopts.patch
 create mode 100644 meta-oe/recipes-devtools/memstat/memstat/0001-Include-limits.h-for-PATH_MAX-definition.patch
 create mode 100644 meta-oe/recipes-extended/sgpio/sgpio/0001-makefile-Add-LDFLAGS-to-linking-rule.patch
 create mode 100644 meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-include-required-system-header-files-for-fd_set-and-.patch
 create mode 100644 meta-oe/recipes-support/gradm/gradm/0001-Makefile-Append-instead-of-overriding-LDFLAGS.patch
 rename meta-oe/recipes-support/hwdata/{hwdata_0.291.bb => hwdata_git.bb} (57%)
 create mode 100644 meta-oe/recipes-support/lio-utils/lio-utils/0001-Makefiles-Respect-environment-variables-and-add-LDFL.patch

-- 
2.7.4



Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6018865E08
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:18:41 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u56so896342wes.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CBk50kZwJYGU8ji7FFpQolgkszjXxwTz2Q8rNIG0XP8=;
	b=Jf/gm154pML4l4RALO3PjlXQrBQ78uzhHEdVBHjJYhIdC8HVvLCv0U0n5yPA+h/WO7
	GTqZacl+QZXPc9Svh0hRd5MkgOMvo/zweD3KiI2OfHmmmGcjd3wwPztu4yCOAT3/QEs5
	kucZpwepUcDJM+o2PTY8LBZIFtbi29rsSHh/xJKElcL4DZEvbkyNBA9FLznwa1ZZPJIE
	0N2Pxb/3TsBi+zb8VhbxfovaAwbuDi6lOsSO7Jyw4HqL7e/KvHwrCEvt0qRQ5GldXytw
	ITmC6yM916Rojx5yPXA4ra7966OF9evmKaL+BEoLUCddX/FPwnDbpXGdldwub1pXPMdt
	jLgA==
X-Gm-Message-State: ALoCoQm4C6m7m9VqZyuVdHhwpe83iO8nIFXd6/Y6FxgjBPQe1decNHNDnx1Ppw9IoFkud0pK0v1E
X-Received: by 10.180.7.230 with SMTP id m6mr6685289wia.3.1405441122224;
	Tue, 15 Jul 2014 09:18:42 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	au7sm33554040wjc.41.2014.07.15.09.18.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 09:18:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 17:18:30 +0100
Message-Id: <cover.1405440532.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/7][RFC] Remove enforced --foreign in autoreconf
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
X-List-Received-Date: Tue, 15 Jul 2014 16:18:43 -0000

Hi,

Since 2004 we've been forcibly passing --foreign to automake in autoreconf.
This is a change from upstream behaviour and can actually break packages that
expect GNU behaviour (admittedly the failure case reported was "interesting"),
and I'm on a bit of a mission to remove patches that don't have a solid reason
behind them.

Forcing --foreign doesn't seem that important these days as the majority of
packages are telling automake they're foreign, There are a few packages that
need patches for this change, notably they're mostly packages that haven't seen
a release for ten years.

This series is build tested against a world build in oe-core for NUC, so I'd
call it a demonstration that the patch is viable and would appreciate others
running build tests against other machines or layers.

Ross

The following changes since commit 9e99bcffec594cb5b4c3533200e8eb56d32e6a77:

  insane: Ensure do_package_qa happens after do_packagedata (2014-07-11 23:20:04 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/automake

for you to fetch changes up to 406153008dc78f4e3198c012f2db98fcac09b5c1:

  autoconf: remove automake patch enforcing --foreign (2014-07-15 17:05:29 +0100)

----------------------------------------------------------------
Ross Burton (7):
      bzip2: use "foreign" automake strictness
      libid3tag: use "foreign" automake strictness
      which: use "foreign" automake strictness
      libmad: use "foreign" automake strictness
      oprofile: use "foreign" automake strictness
      ltp: use "foreign" automake strictness
      autoconf: remove automake patch enforcing --foreign

 .../autoconf/autoconf/autoreconf-foreign.patch     |   13 -------------
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    1 -
 .../bzip2/bzip2-1.0.6/configure.ac                 |    2 +-
 .../ltp/ltp/automake-foreign.patch                 |   20 ++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20140422.bb          |    1 +
 .../which/which-2.20/automake.patch                |   10 ++++++++++
 meta/recipes-extended/which/which_2.20.bb          |    1 +
 meta/recipes-kernel/oprofile/oprofile.inc          |    1 +
 .../oprofile/oprofile/automake-foreign.patch       |    7 +++++++
 .../libid3tag/obsolete_automake_macros.patch       |    3 ++-
 .../libmad/libmad/automake-foreign.patch           |   12 ++++++++++++
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |    1 +
 12 files changed, 56 insertions(+), 16 deletions(-)
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoreconf-foreign.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/automake-foreign.patch
 create mode 100644 meta/recipes-extended/which/which-2.20/automake.patch
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch
 create mode 100644 meta/recipes-multimedia/libmad/libmad/automake-foreign.patch

Ross Burton (7):
  bzip2: use "foreign" automake strictness
  libid3tag: use "foreign" automake strictness
  which: use "foreign" automake strictness
  libmad: use "foreign" automake strictness
  oprofile: use "foreign" automake strictness
  ltp: use "foreign" automake strictness
  autoconf: remove automake patch enforcing --foreign

 .../autoconf/autoconf/autoreconf-foreign.patch     |   13 -------------
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    1 -
 .../bzip2/bzip2-1.0.6/configure.ac                 |    2 +-
 .../ltp/ltp/automake-foreign.patch                 |   20 ++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20140422.bb          |    1 +
 .../which/which-2.20/automake.patch                |   10 ++++++++++
 meta/recipes-extended/which/which_2.20.bb          |    1 +
 meta/recipes-kernel/oprofile/oprofile.inc          |    1 +
 .../oprofile/oprofile/automake-foreign.patch       |    7 +++++++
 .../libid3tag/obsolete_automake_macros.patch       |    3 ++-
 .../libmad/libmad/automake-foreign.patch           |   12 ++++++++++++
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |    1 +
 12 files changed, 56 insertions(+), 16 deletions(-)
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoreconf-foreign.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/automake-foreign.patch
 create mode 100644 meta/recipes-extended/which/which-2.20/automake.patch
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch
 create mode 100644 meta/recipes-multimedia/libmad/libmad/automake-foreign.patch

-- 
1.7.10.4



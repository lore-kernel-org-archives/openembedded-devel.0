Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f177.google.com (unknown [74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 183416FBC3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 12:04:54 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id x48so11176230wes.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 05:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rArj+PAmalfGoQKCI8N+T/WRfvvVZJ9kKM0HPoJgg7A=;
	b=B7IztXFc/RnQSh4C0l1VI296OqFnYgqt2g3rqKjDAzmRvYzJLhaP1sX1Qc6kPhHyiE
	gIhob6RneTMtjmV1VNb61ShaT0/oKQXuEy65BDdbsulzQIgitlqBaS8tFEdyTpIcEzv6
	jbyZ/xRk6nhb+B2KY/JOpGoRFrNA/zlqG1+Icrf2ZgKIVGMlJb83IB5Wy9NwajwbDot2
	az60PKkcF3WKbZ37X7wNkXxUZQ5GTmyRsZ0wCh7V5qQZIafgmrlaih+uPuj0wqswh1VX
	pZ3DYAarDDXoC9maDyjRpW+7h1BtIbAupjFQ/G/PQ4Q+idwn73pIKZLEvjrc456Erzu9
	4rdA==
X-Gm-Message-State: ALoCoQnIO50KdAMpZHFrXU+J5/3I/pfzmo3gF6sRGLqZ3tCo5JGg90FA2VG/qcjP7S396qpMKq06
X-Received: by 10.194.60.114 with SMTP id g18mr50848741wjr.61.1401278205202;
	Wed, 28 May 2014 04:56:45 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id bj2sm16345631wib.3.2014.05.28.04.56.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 May 2014 04:56:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Wed, 28 May 2014 12:56:22 +0100
Message-Id: <cover.1401277810.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/4][RFT] Stop disabling autoheader warnings
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
X-List-Received-Date: Wed, 28 May 2014 12:04:57 -0000

Hi,

When autoheader emits a warning along the lines of "missing template for
variable HAVE_FOO", it's not moaning that you need to be more verbose for nice
comments in the config.h files.  In fact it's saying that it's not writing that
symbol at all to config.h.in, so even if that test succeeds this isn't reflected
in config.h.

I removed the patch and did a build of core-image-sato: readline was the only
recipe that failed.  I'll spare you the anger but readline is special...  the
short version is that if an upstream package hand-maintains config.h.in instead
of using autoheader then set EXTRA_AUTORECONF += "--exclude=autoheader" and
autoheader won't be executed.

This is also a call out for a request for testing: I've done a core-image-sato
build with this but haven't yet done world or any other layers.  If there's
breakage it's often due to the upstream being unconventional so feel free to
prod me for help.

Ross

The following changes since commit c42df8cb48ceb6081680ffb802e85dad557cf29c:

  i2c-tools: Add i2c-tools to the core (2014-05-28 09:42:14 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/autoconf

for you to fetch changes up to a12ceb971fefe2b2f412f46b82c0d5ea6043ad62:

  autoconf: don't disable the autoheader warnings (2014-05-28 12:47:58 +0100)

----------------------------------------------------------------
Ross Burton (4):
      readline: add missing STRUCT_DIRENT_D_* symbols to config.h.in
      readline: exclude autoheader from autoreconf
      readline: use upstream's aclocal.m4 as acinclude.m4
      autoconf: don't disable the autoheader warnings

 meta/recipes-core/readline/files/acinclude.m4      | 1871 --------------------
 .../readline-6.3/config-dirent-symbols.patch       |   34 +
 meta/recipes-core/readline/readline.inc            |   10 +-
 .../autoconf/autoheader-nonfatal-warnings.patch    |   15 -
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    1 -
 5 files changed, 41 insertions(+), 1890 deletions(-)
 delete mode 100644 meta/recipes-core/readline/files/acinclude.m4
 create mode 100644 meta/recipes-core/readline/readline-6.3/config-dirent-symbols.patch
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoheader-nonfatal-warnings.patch

Ross Burton (4):
  readline: add missing STRUCT_DIRENT_D_* symbols to config.h.in
  readline: exclude autoheader from autoreconf
  readline: use upstream's aclocal.m4 as acinclude.m4
  autoconf: don't disable the autoheader warnings

 meta/recipes-core/readline/files/acinclude.m4      | 1871 --------------------
 .../readline-6.3/config-dirent-symbols.patch       |   34 +
 meta/recipes-core/readline/readline.inc            |   10 +-
 .../autoconf/autoheader-nonfatal-warnings.patch    |   15 -
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    1 -
 5 files changed, 41 insertions(+), 1890 deletions(-)
 delete mode 100644 meta/recipes-core/readline/files/acinclude.m4
 create mode 100644 meta/recipes-core/readline/readline-6.3/config-dirent-symbols.patch
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoheader-nonfatal-warnings.patch

-- 
1.7.10.4



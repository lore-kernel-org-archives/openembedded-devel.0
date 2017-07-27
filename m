Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1B1A478049
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jul 2017 13:47:28 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y206so771816wmd.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jul 2017 06:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MRP2AV0ACMViXDp8LFDvuBte9ifBZ6zbQmMMS3s3tTU=;
	b=uZKWcHxGsWtm1x30yUK/08+wnV3h8WA1kXc6e1DUyC0wjcczAyBr1+pD4L2lpT8t6L
	76cE87z004XRTXLXeuqaR6MbfXhQjXac3RyslpSnF/rCLWo2VlcVezeQYPRaws8j1JvM
	JfAoFfk9iv3yAadMkqQriFvD/153rtPfC/AjlkAlPOncdZ5TDkIdkZpCQMnmjyStNyeC
	cT1byh4KRz2y6z+MK6NDFhZaVE2wn5VkplepFoLWRIE8ryOzVAFiNBLfjS5O18DS9hYR
	dNvqDSx8cSIdCCHTAXOy5FUylWwqLArrEbQsDyMN+7ZrnkATMi2mdQaCdnlMlodtuSid
	C/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MRP2AV0ACMViXDp8LFDvuBte9ifBZ6zbQmMMS3s3tTU=;
	b=YKW8PanKaHs5Fp1m5hg+SwiLK5FYIPlFsbkYxW4BDZ/+wHEre8ipmuiAvZu0ZjbmaM
	ndXo3dmxCNzOB9S8IuQz/X39gTvVg+A+MMbCA4SjyvLKNAHt6OYsdBUlXkamuPhBuZf1
	OoRXS2O3HPfyTi+zBn1qCyV+xdVn7fJhWolU/hMXZdmuEXuRew91Zg5kFfVg2vSuis+s
	Y44OdrhNvCoi8eNqgS/JcoFYTQDaxLNBqjo9xA+8e/ubfhOCjJxHvMxIyyDHQCGR92YZ
	XAqz5J/bO8ryoiXkWDlndZNwQ5j6jmMfXaq7nkdANpSt3YQ/4nqci1lgJzi2Ikmp0kBb
	j/bQ==
X-Gm-Message-State: AIVw111EYiAz5IcmHXkvca5jZKn2eJCENDFa0AoYe66WwYudPQGC1u+P
	Uc3Iv6s4Rc75vI2UYsqvK7q9l0F5jw==
X-Received: by 10.80.140.253 with SMTP id r58mr3887358edr.123.1501163249631;
	Thu, 27 Jul 2017 06:47:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Thu, 27 Jul 2017 06:46:59 -0700 (PDT)
In-Reply-To: <cover.1501142861.git.hongxu.jia@windriver.com>
References: <cover.1501142861.git.hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jul 2017 06:46:59 -0700
Message-ID: <CAMKF1sp8PP9sK5PTgeRLBJU7iWgKQtvvWWKiy0d-CjzvoR497w@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/6] add 5 recipes and 1 bug fix
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
X-List-Received-Date: Thu, 27 Jul 2017 13:47:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 27, 2017 at 1:44 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Changed in V2:
>
> - s/fix contamination on centos7/fix host contamination on centos7/
>
> //Hongxu
>
> The following changes since commit a3a1ff1d411bcee88ed56caf4c9a7148c4a6e54a:
>
>   usermode: add recipe 1.111 (2017-07-24 21:13:11 -0400)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib hongxu/add-recipe2
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/add-recipe2
>
> Hongxu Jia (6):
>   glade: fix host contamination on centos7
>   tigervnc: add recipe 1.8.0
>   libreport: add recipe 2.9.1
>   libblockdev: add recipe 2.10
>   python3-blivet: add recipe 2.2.0
>   python3-blivetgui: add recipe 2.1.5see if

can you see if they build with musl too?

>
>  meta-oe/recipes-devtools/glade/glade_3.20.0.bb     |   4 +-
>  .../0001-fix-configure-and-compile-failures.patch  |  79 ++++
>  .../files/0002-remove-python2-support.patch        |  30 ++
>  ...emove-dmraid-while-compiling-with-with-dm.patch | 470 +++++++++++++++++++++
>  ...ix-compile-failure-against-musl-C-library.patch |  50 +++
>  .../libblockdev/libblockdev_2.10.bb                |  50 +++
>  .../0001-Makefile.am-remove-doc-and-apidoc.patch   |  28 ++
>  ...ac-remove-prog-test-of-xmlto-and-asciidoc.patch |  48 +++
>  .../files/0003-without-build-plugins.patch         |  26 ++
>  ...configure.ac-remove-prog-test-of-augparse.patch |  36 ++
>  .../files/0005-remove-python2-support.patch        | 142 +++++++
>  .../recipes-extended/libreport/libreport_2.9.1.bb  |  43 ++
>  .../files/0001-tigervnc-remove-includedir.patch    |  50 +++
>  .../0002-do-not-build-tests-sub-directory.patch    |  29 ++
>  ...missing-dynamic-library-to-FLTK_LIBRARIES.patch |  28 ++
>  ...tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch |  62 +++
>  .../recipes-graphics/tigervnc/tigervnc_1.8.0.bb    | 131 ++++++
>  .../python3-blivet/0001-comment-out-selinux.patch  |  70 +++
>  .../0002-run_program-support-timeout.patch         | 102 +++++
>  .../0003-support-infinit-timeout.patch             |  66 +++
>  .../0004-Mount-var-volatile-during-install.patch   |  59 +++
>  .../0005-update-fstab-by-appending.patch           |  32 ++
>  ...0006-fix-new.roots-object-is-not-iterable.patch |  28 ++
>  ...correct-timeout-while-system-time-changed.patch |  48 +++
>  .../python3-blivet/0008-tweak-btrfs-packages.patch |  45 ++
>  ...0009-invoking-mount-with-infinite-timeout.patch |  31 ++
>  ...-use-oe-variable-to-replace-hardcoded-dir.patch |  34 ++
>  .../0011-invoking-fsck-with-infinite-timeout.patch |  31 ++
>  .../0012-invoking-mkfs-with-infinite-timeout.patch |  31 ++
>  ...evert-Adapt-to-logging-module-name-change.patch |  30 ++
>  .../python-blivet/python3-blivet_2.2.0.bb          |  46 ++
>  .../python-blivet/python3-blivetgui_2.1.5.bb       |  27 ++
>  32 files changed, 1983 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch
>  create mode 100644 meta-oe/recipes-extended/libblockdev/files/0002-remove-python2-support.patch
>  create mode 100644 meta-oe/recipes-extended/libblockdev/files/0003-remove-dmraid-while-compiling-with-with-dm.patch
>  create mode 100644 meta-oe/recipes-extended/libblockdev/files/0004-fix-compile-failure-against-musl-C-library.patch
>  create mode 100644 meta-oe/recipes-extended/libblockdev/libblockdev_2.10.bb
>  create mode 100644 meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch
>  create mode 100644 meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch
>  create mode 100644 meta-oe/recipes-extended/libreport/files/0003-without-build-plugins.patch
>  create mode 100644 meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-prog-test-of-augparse.patch
>  create mode 100644 meta-oe/recipes-extended/libreport/files/0005-remove-python2-support.patch
>  create mode 100644 meta-oe/recipes-extended/libreport/libreport_2.9.1.bb
>  create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-tigervnc-remove-includedir.patch
>  create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
>  create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch
>  create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
>  create mode 100644 meta-oe/recipes-graphics/tigervnc/tigervnc_1.8.0.bb
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0001-comment-out-selinux.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0004-Mount-var-volatile-during-install.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0005-update-fstab-by-appending.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0006-fix-new.roots-object-is-not-iterable.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0007-fix-incorrect-timeout-while-system-time-changed.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0008-tweak-btrfs-packages.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-mount-with-infinite-timeout.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0010-use-oe-variable-to-replace-hardcoded-dir.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-fsck-with-infinite-timeout.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0012-invoking-mkfs-with-infinite-timeout.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0013-Revert-Adapt-to-logging-module-name-change.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.5.bb
>
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


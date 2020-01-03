Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id B7F837F9B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 03:39:03 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id p2so15742421qvo.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 19:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SvF86g9JA7R58OQ3TYJqpf7gZQ87vo6F6QEbI2yj4zQ=;
	b=aNUaCvOuJkm9lrzIin53+biSNbktnBL3irXtz7oUbdupytM2llocg08L+/Wi+TfhTS
	4kLfi+YTdEI4DlrV5tdnZJuWYcFGsj9yLKYcNCgGwlpav5GMmkdcuPauL82/JC0QgeYI
	L0/lsW966iKdrtTbwV31SNHnDpVGhNXHbZmo0tPMsSDZ6+PY7wbFPnih7dUqC7L7kJ3+
	rzx8GBMA09w5poOgmm0ICMTpgh5rji6TWQgX4fo7JllFKyi8ncTK9qN1TYZtD8apBDLs
	nitsHijV5gvXCY9P8DML9jrROa1EwO6qXir71fjyIda98KYCXP7o9/riibOHB6p3sMNP
	76Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SvF86g9JA7R58OQ3TYJqpf7gZQ87vo6F6QEbI2yj4zQ=;
	b=kWl6fr3TUOBWmPGa/g9yUxaqRdh0HysM0I+f6qbc8exRPpnzrHVlgYrhvuh/N0f2Ah
	h7yizXqHI5KCCCSXvHDF5HNZjUC0IheGFuYj1EmAEQkqx6+Z5HFUVo6pBXQu6iOaoavy
	0EJIK/f5cKQOEESI7C8QaMzXcrwdh6Dq8ppPXf3RmaLU+2gD2+XYaAwE+gPBSzqGnV/i
	S9dIEIacyP3f9EtYV1DYWQKm7ed0pXJA2R5lVA0Knh2pAaXSeYZIzBqxLyH6l/rrupVQ
	TlthTf3rrA/LwpHbkHr2HVmMGo0In50HzFjrsCWtm1S4s3uck5VNmhH5qU7+WkKpmM/3
	+1kg==
X-Gm-Message-State: APjAAAVz+Q2ejMyi9wJUtDmNPIGdvuQlYSu/9zA5hog4skrNOYmPpDsS
	Y3i73b84lU8q7SgYqaqVohKpA8vYFcugzf+gqX4=
X-Google-Smtp-Source: APXvYqwJfzMHwlI4+0O+E6iNVwpKIDkozRV8hpUUftmYsdbdvzvPRKj8JTbVAwHWuRdnb0yvm640xqafH3jaVS5h0HE=
X-Received: by 2002:a0c:f513:: with SMTP id j19mr65721156qvm.206.1578022744378;
	Thu, 02 Jan 2020 19:39:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578019547.git.akuster808@gmail.com>
In-Reply-To: <cover.1578019547.git.akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Jan 2020 19:38:38 -0800
Message-ID: <CAMKF1spJeTLGUwerZNSjk3W821puo=-wsGaDCUd6B4q6PL5uvw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [zeus 00/17] Patch review
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
X-List-Received-Date: Fri, 03 Jan 2020 03:39:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 2, 2020 at 6:49 PM Armin Kuster <akuster808@gmail.com> wrote:
>
> Please have comments back by Saturday.
>
> The following changes since commit fbe4cf8d56eea586c096621e7c913b24bd99c9c6:
>
>   gtkwave: add the libtirpc dependence and config (2019-12-17 21:57:51 -0800)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib stable/zeus-nut
>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/zeus-nut
>
> Adrian Bunk (3):
>   networkmanager: Upgrade 1.18.2 -> 1.18.4
>   gpsd: Backport a memory leak fix
>   libqmi: Upgrade 1.24.0 -> 1.24.2
>
> Changqing Li (1):
>   xfce-dusk-gtk3: correct invalid SRC_URI
>
> Hongxu Jia (1):
>   python-more-itertools: downgrade 7.2.0 -> 5.0.0
>
> Kai Kang (1):
>   fltk: fix build error when enable package config examples
>
> Khem Raj (9):
>   grpc: Define libdir and cmakedir in terms of multilib
>   tinyalsa: fix installation libdir path to match multilibs
>   libqb: Add --enable-nosection-fallback with mips64/clang
>   x11vnc: Fix build for 32bit arches with 64bit time_t
>   evtest: Fix build for 32bit arches with 64bit time_t
>   lirc: Fix build for 32bit arches with 64bit time_t
>   utouch-evemu,utouch-frame: Fix build for 32bit arches with 64bit
>     time_t
>   directfb: Fix build for 32bit arches with 64bit time_t
>   ruli: Fix install step and build samples too
>

64bit time_t fixes are not necessary but are not hurtful either, since the
C libraries in zeus do not have the needed bits to enable 64bit time_t
so unless someone else has issues with it, I am fine to bring them to zeus

> Stefan Agner (1):
>   networkmanager: do not deploy unnecessary udev rule file
>
> zhangxiao (1):
>   syslog-ng: Fix multilib header conflict - syslog-ng-config.h
>
>  .../recipes-multimedia/tinyalsa/tinyalsa.bb   |   4 +-
>  ...L_-path-instead-of-hardcoding-bin-li.patch |  46 +++++
>  ...ger_1.18.2.bb => networkmanager_1.18.4.bb} |   9 +-
>  .../recipes-devtools/grpc/grpc_1.24.1.bb      |   4 +-
>  ...-Fix-build-with-format-string-checks.patch |  29 ++-
>  ...ake-space-for-flags-from-environment.patch |  95 +++++++++
>  ...v-Mark-prev_addr_list_size-as-unused.patch |  35 ++++
>  .../recipes-support/ruli/files/Makefile.patch | 122 ------------
>  .../recipes-support/ruli/ruli_0.36.bb         |  23 ++-
>  .../{libqmi_1.24.0.bb => libqmi_1.24.2.bb}    |   4 +-
>  ...ld-on-32bit-arches-with-64bit-time_t.patch |  40 ++++
>  .../recipes-connectivity/lirc/lirc_0.9.4d.bb  |   1 +
>  meta-oe/recipes-extended/libqb/libqb_1.0.5.bb |   6 +-
>  .../recipes-graphics/directfb/directfb.inc    |   3 +-
>  ...ld-on-32bit-arches-with-64bit-time_t.patch | 139 +++++++++++++
>  ...ld-on-32bit-arches-with-64bit-time_t.patch | 111 +++++++++++
>  .../recipes-graphics/x11vnc/x11vnc_0.9.16.bb  |   5 +-
>  .../0001-gps_shm_close-Free-privdata.patch    |  37 ++++
>  meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb  |   1 +
>  meta-oe/recipes-support/fltk/fltk.bb          |   7 +-
>  ...-when-enable-package-config-examples.patch | 182 ++++++++++++++++++
>  .../recipes-support/syslog-ng/syslog-ng.inc   |   4 +-
>  ...ld-on-32bit-arches-with-64bit-time_t.patch |  76 ++++++++
>  .../utouch/utouch-evemu_git.bb                |   4 +-
>  ...ld-on-32bit-arches-with-64bit-time_t.patch |  41 ++++
>  ...tat.h-for-fixing-build-issue-on-musl.patch |   0
>  .../remove-man-page-creation.patch            |   0
>  .../utouch/utouch-frame_git.bb                |   1 +
>  ...ld-on-32bit-arches-with-64bit-time_t.patch |  41 ++++
>  meta-oe/recipes-test/evtest/evtest_1.34.bb    |   6 +-
>  .../python/python-more-itertools.inc          |   3 -
>  .../python/python-more-itertools_5.0.0.bb     |   7 +
>  .../python/python-more-itertools_7.2.0.bb     |   2 -
>  .../python/python3-more-itertools_7.2.0.bb    |   3 +
>  .../xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb      |   2 +-
>  35 files changed, 935 insertions(+), 158 deletions(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch
>  rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.18.2.bb => networkmanager_1.18.4.bb} (94%)
>  create mode 100644 meta-networking/recipes-support/ruli/files/0001-Make-space-for-flags-from-environment.patch
>  create mode 100644 meta-networking/recipes-support/ruli/files/0001-ruli_srv-Mark-prev_addr_list_size-as-unused.patch
>  delete mode 100644 meta-networking/recipes-support/ruli/files/Makefile.patch
>  rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.24.0.bb => libqmi_1.24.2.bb} (85%)
>  create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
>  create mode 100644 meta-oe/recipes-graphics/directfb/directfb/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
>  create mode 100644 meta-oe/recipes-graphics/x11vnc/files/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
>  create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-gps_shm_close-Free-privdata.patch
>  create mode 100644 meta-oe/recipes-support/fltk/fltk/0004-Fix-build-error-when-enable-package-config-examples.patch
>  create mode 100644 meta-oe/recipes-support/utouch/utouch-evemu/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
>  create mode 100644 meta-oe/recipes-support/utouch/utouch-frame/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
>  rename meta-oe/recipes-support/utouch/{files => utouch-frame}/0001-include-sys-stat.h-for-fixing-build-issue-on-musl.patch (100%)
>  rename meta-oe/recipes-support/utouch/{files => utouch-frame}/remove-man-page-creation.patch (100%)
>  create mode 100644 meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
>  create mode 100644 meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


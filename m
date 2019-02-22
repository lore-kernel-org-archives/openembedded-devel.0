Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id EB5BA7CBDD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 17:29:44 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id j36so3363204qta.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 09:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+urSsZdGuz9KI6x7qv+c4Mgb8qS5EXBRi/SCZ4VhvwA=;
	b=uhPz1vUd4SKT4/BcmdiFJWIg8DEuXGZLuYcDzHuBVPyEG4Ig5/qmfUKHT1CsUX5i2v
	QI88bNmlE7AbQDrG09I5Xnwvk8Eyhvap883y7JM6s+SGBfcbafxXXmTpllm5n0CyMKT+
	xUQXqtTcxLfOQq/rw6ZFYnSs1vDvxxW9dvomTgbbklsPs0CFQJKTVis38q7r93muJfyk
	NqMJGEn8v4nX8p/NI5ZW3DS/cgFdTJBorZ9P7bsrRe8br0ZKou3NcFuMHtQbH9kFXgCx
	k35MqynzvnQiVc1ltAfXOCU57ahdoMwpPzLZZdlD8OzUewBQRUe+yBkHu2ziMDpKoXyr
	i1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+urSsZdGuz9KI6x7qv+c4Mgb8qS5EXBRi/SCZ4VhvwA=;
	b=jZF1+qYn8GazWpQEGqj7B0iUKU9c7AkJH5YQEZPA2/mbIQssF2VHhSDeFnhjbVu3vB
	t4YxNNCwXs+HV1e3E4nL1vePxECOJbfooO0doMxDWbOp4c1yMF8hAolCJ5pjyFFYOGmQ
	viXvU69kts2K8jtU6/w+ygk1agX257QirkJioMCO+huB0kU7fEXEBRJRxLJuIad8lQ4w
	L0K33/3TNtCDJNxjsgeuj/uTlgeYBZ3wS0AEnJMywHmJW2+keSLBtJk2ZI31Yq3wKJm/
	Js1VJyQTmBkU0EHAJNCpQVDZMi/xrCX3OkskE6SPNPSnfv6x4ub4IoSUqp98tbNg2845
	90Dw==
X-Gm-Message-State: AHQUAuZC49Wsq6DDeCp9Kyvpmn8TdzxEzMZgiw1T27PvlfDhrgUcM3WC
	ohL5dbY2M88Xcr9uLGLSkm/qPSCxUqcTzZ7O060=
X-Google-Smtp-Source: AHgI3Ibn+BcNz9+1YV0xjvwrxO+97w5IV1VGquXBeQSvsKESxZj4y/wVzy71XQiu00dg76hjEhq7TFadrXA9I2BJcPU=
X-Received: by 2002:ac8:300a:: with SMTP id f10mr3913329qte.236.1550856585569; 
	Fri, 22 Feb 2019 09:29:45 -0800 (PST)
MIME-Version: 1.0
References: <f47c3cb0-9b8a-61ec-12c4-385061887bd2@gmail.com>
In-Reply-To: <f47c3cb0-9b8a-61ec-12c4-385061887bd2@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Feb 2019 09:29:19 -0800
Message-ID: <CAMKF1sovM0Ov3LoafratCuFkXGu=tN5rtdmh6QeCCz3+7dnD_g@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	akuster808@mvista.com
Subject: Re: thud][Pull request
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
X-List-Received-Date: Fri, 22 Feb 2019 17:29:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 22, 2019 at 8:02 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit cca27b5ea7569d2730ee5da7ee7f47b39d775d=
89:
>
>   polkit: Fix CVE-2019-6133 (2019-01-23 08:17:23 -0800)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/meta-openembedded thud-next
>
> for you to fetch changes up to 6ef9657068492d4644079c88f2adee9c3cac9543:
>
>   vim: improve reproducibility (2019-02-04 22:09:31 -0800)
>
> ----------------------------------------------------------------
> Alexander Kanavin (2):
>       packagegroup-meta-oe: drop ptest packages that do not exist
>       packagegroup-meta-oe: rename the group that contains ptest packages
>
> Andrea Adami (4):
>       klibc: fix build for mipsel and mips64el with security flags enable=
d
>       waf-cross-answers: Add cross-answers-mips64el.txt
>       kexec-tools-klibc: fix build for mipsel and mips64el
>       samba: fix build on qemumips64 with musl
>
> Andreas M=C3=BCller (1):
>       libgit2: Fix install for multilib
>
> Armin Kuster (1):
>       wireshark: update to 2.6.6
>
> Craig McQueen (1):
>       python3-multidict: Workaround for broken make clean
>
> Eduardas Meile (1):
>       toybox: fix to use "usrmerge" distro feature properly
>
> Haiqing Bai (1):
>       ptpd: fixed the issue of ptpd2 daemon takes 100% CPU
>
> Hong Liu (1):
>       wireshark: upgrade to 2.6.5
>
> Hongxu Jia (1):
>       python-pyparted/python3-pyparted: drop incorrect and redundant PV
>
> Kai Kang (1):
>       net-snmp: inherit ptest
>
> Khem Raj (16):
>       xscreensaver: Define consistent app-defaults dir
>       a2jmidid: Define own do_configure
>       bpftool: don't build under musl
>       packagegroup-meta-oe: Remove arch specific packages as needed
>       packagegroup-meta-oe: Remove packages which don't build for musl
>       modemmanager: Fix build with clang
>       klibc: Fix build with clang
>       srecord: GPL-3.0 and LGPL-3.0 is correct license
>       packagegroup-meta-oe: Exclude unbuildable packages on mips64
>       packagegroup-meta-oe: Exclude android-tools breakpad on ppc
>       packagegroup-meta-oe: Remove unbuildable packages on risc-v from rd=
ep
>       mpv: Disable lua on mips/aarch64
>       luajit: Disable for mips n64/n32 hosts
>       licenses: Add Arphic-Public-License text
>       nmap: Fix build with clang8/musl/libc++
>       mozjs: Fix symbol visibility with clang/libc++
>
> Marc Ferland (1):
>       networkmanager: fix QA issue when using modemmanager and ppp in
> PACKAGECONFIG
>
> Martin Jansa (1):
>       open-vm-tools: fix indentation and drop FILES_${PN}-dbg
>
> Mingli Yu (1):
>       vim: improve reproducibility
>
> Niko Mauno (7):
>       python-pygobject: Fix invalid install path
>       python-pygobject: Drop redundant PYTHON* refs
>       python-pygobject: Drop redundant dependencies
>       python-pygobject: Only check for even upstream versions
>       python-pygobject: Remove duplication in inherit
>       python-pygobject: Fix style issue
>       python-pygobject: Tune remove operation
>
> Otavio Salvador (2):
>       mozjs: Avoid use of X11 from host when X11 is disabled
>       postgresql: Allow successful run of postgresql-setup
>
> Primoz Fiser (1):
>       sedutil: fix compile errors on big endian architectures
>
> Scott Ellis (2):
>       nmap: Fix typo in pcre PACKAGECONFIG
>       nmap: Include additional FILES path for certs
>
> leimaohui (2):
>       mraa: To file do_package error in multilib.
>       makedumpfile: Add aarch64 into COMPATIBLE_HOST.
>
> thc (1):
>       fix networkmanager apppend
>

Thanks looks good.

>  .../networkmanager/networkmanager_%.bbappend       |  2 +-
>  ...efine-ulocked_-fgets-fread-fwrite-aliases.patch | 49 ++++++++++++++
>  meta-initramfs/recipes-devtools/klibc/klibc.inc    |  4 ++
>  .../recipes-kernel/kexec/kexec-tools-klibc_git.bb  |  3 +
>  .../waf-cross-answers/cross-answers-mips64el.txt   | 39 +++++++++++
>  .../networkmanager/networkmanager_1.14.4.bb        |  1 +
>  .../samba/samba/cmocka-uintptr_t.patch             | 51 ++++++++++++++
>  .../recipes-connectivity/samba/samba_4.8.4.bb      |  1 +
>  ...PU-using-issue-by-adding-minimum-POSIX-ti.patch | 68 ++++++++++++++++=
+++
>  meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb |  1 +
>  .../recipes-protocols/net-snmp/net-snmp/run-ptest  |  3 +-
>  .../recipes-protocols/net-snmp/net-snmp_5.8.bb     |  2 +-
>  .../{wireshark_2.6.4.bb =3D> wireshark_2.6.6.bb}     |  4 +-
>  meta-oe/licenses/Arphic-Public-License             | 58 ++++++++++++++++
>  ...01-Do-not-set-Wno-unused-but-set-variable.patch | 30 +++++++++
>  .../modemmanager/modemmanager_1.8.2.bb             |  2 +
>  .../packagegroups/packagegroup-meta-oe.bb          | 58 +++++++++++++---
>  meta-oe/recipes-core/toybox/toybox_0.7.5.bb        |  2 +-
>  .../{postgresql-bashprofile =3D> postgresql-profile} |  0
>  meta-oe/recipes-dbs/postgresql/postgresql.inc      |  8 +--
>  meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb    |  6 +-
>  ...c-add-sysroot-path-to-GI_DATADIR-don-t-se.patch | 28 --------
>  .../python/python-pygobject_3.28.3.bb              | 14 ++--
>  .../mozjs/mozjs/JS_PUBLIC_API.patch                | 37 ++++++++++
>  meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb     |  3 +-
>  meta-oe/recipes-extended/mraa/mraa_git.bb          |  4 +-
>  ...001-Fix-build-on-big-endian-architectures.patch | 41 ++++++++++++
>  meta-oe/recipes-extended/sedutil/sedutil_git.bb    |  4 +-
>  .../xscreensaver/xscreensaver_5.39.bb              |  4 ++
>  meta-oe/recipes-kernel/bpftool/bpftool.bb          |  2 +
>  .../makedumpfile/makedumpfile_1.6.4.bb             |  4 +-
>  meta-oe/recipes-multimedia/jack/a2jmidid_8.bb      |  5 ++
>  meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb   |  5 +-
>  ...lude-time.h-for-time-structure-definition.patch | 78
> ++++++++++++++++++++++
>  .../nmap/files/0002-Fix-building-with-libc.patch   | 76
> +++++++++++++++++++++
>  meta-oe/recipes-security/nmap/nmap_7.70.bb         |  8 ++-
>  meta-oe/recipes-support/libgit2/libgit2_0.27.4.bb  | 11 +--
>  .../open-vm-tools/open-vm-tools_10.3.0.bb          | 47 ++++++-------
>  meta-oe/recipes-support/srecord/srecord_1.64.bb    |  2 +-
>  ...0001-src-Makefile-improve-reproducibility.patch | 46 +++++++++++++
>  meta-oe/recipes-support/vim/vim_8.1.0347.bb        |  1 +
>  .../python/python3-multidict_3.3.2.bb              |  4 ++
>  .../python-pyparted/python-pyparted_3.11.1.bb      |  2 -
>  .../python-pyparted/python3-pyparted_3.11.1.bb     |  2 -
>  44 files changed, 717 insertions(+), 103 deletions(-)
>  create mode 100644
> meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-ulocked_-fg=
ets-fread-fwrite-aliases.patch
>  create mode 100644
> meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/cmocka-uintptr_t.patch
>  create mode 100644
> meta-networking/recipes-daemons/ptpd/ptpd/Fixed-100-CPU-using-issue-by-ad=
ding-minimum-POSIX-ti.patch
>  rename meta-networking/recipes-support/wireshark/{wireshark_2.6.4.bb =3D=
>
> wireshark_2.6.6.bb} (96%)
>  create mode 100644 meta-oe/licenses/Arphic-Public-License
>  create mode 100644
> meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Do-not-set-Wn=
o-unused-but-set-variable.patch
>  rename meta-oe/recipes-dbs/postgresql/files/{postgresql-bashprofile =3D>
> postgresql-profile} (100%)
>  delete mode 100644
> meta-oe/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sy=
sroot-path-to-GI_DATADIR-don-t-se.patch
>  create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/JS_PUBLIC_API.pa=
tch
>  create mode 100644
> meta-oe/recipes-extended/sedutil/files/0001-Fix-build-on-big-endian-archi=
tectures.patch
>  create mode 100644
> meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structur=
e-definition.patch
>  create mode 100644
> meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch
>  create mode 100644
> meta-oe/recipes-support/vim/files/0001-src-Makefile-improve-reproducibili=
ty.patch
> ~
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4505C7CBE3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 16:02:02 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id s198so1331373pgs.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 08:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:cc:from:subject:openpgp:autocrypt:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=D6IP/LVzYRWlKhRNA/s2PKykAXrva+jrUlJ3NNYPFY8=;
	b=OssfciSyo2QruAShrrVXHznm3IYhmiajun2uwLEQeqdQP6tUceju8rk7fJr5+ntAYT
	pJL/Iv3LflyQWjOKtWVgF80fW0a/YYoYEY4cREHWbYbBy7FufqHB1MiXYqwEzW74XJU+
	/U5IqX0NCZ4Q9x0NU9uLkyUPWzragHiwYPxzg1EtMcA6mcSgEqEr5YZOMqolRvSbOelB
	X7FBApg64UZuKFcUL1UmZON2XnU+R5LD2OZpdEcvWtkvbsxWO4hBwwWSPR1UvyTmFbrh
	QyLeZZKiSDJ71nXrGEqyzoqzI5FdjeKzUkrUw7WvInyaDP7vP7wfVg3TOUJ4llEZ4wss
	odXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:from:subject:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:content-transfer-encoding
	:content-language;
	bh=D6IP/LVzYRWlKhRNA/s2PKykAXrva+jrUlJ3NNYPFY8=;
	b=ZP9WQzSTH2cHVHc+g2LHbxRlJEOhb7Xlsk92bHCKqYUpIQw0FIJCqxHBUCr49pikpG
	fSFF0CfmyakPs5XrzYbwCmk4lugfLy+45l7uARs2kDvbq3mUiqPLLoyjubon0exTi3s3
	JvRmOpT2H+vGE0YB9T0WF0FGFJ82YkICm6qZOTWEamcRN17UrakMMDeEfAiZWHc//ga2
	eB1wLfr7TxwtGvxm5wlyfoXIAyFthjZVNtKxPAkAhV7IdZ02NsR07tKUEl6ifH8rF2+W
	V2kY5RTzI3FbOaMr7fiNfVvpaxDPc7r6oWP+WOx0SEvJJbK4HTVH0MxwCQY2VntS46mf
	pY7w==
X-Gm-Message-State: AHQUAuZZPG2OfqgFzsgVBXT0KaKAaRl4sP7QiJnQQv3ZgIlBMbnEBqSz
	KErt+qjILymzyUBtTwZFp9I=
X-Google-Smtp-Source: AHgI3Ib7mFDzA1U7p44OaBHGhX1P+uT/BtQZJTe6ZvPKdIOKteHBY/BjI0TncsNamWg0RRBPDNfE2g==
X-Received: by 2002:a63:f84d:: with SMTP id v13mr4682477pgj.384.1550851323140; 
	Fri, 22 Feb 2019 08:02:03 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:70ef:357b:adf:5cc4?
	([2601:202:4180:c33:70ef:357b:adf:5cc4])
	by smtp.gmail.com with ESMTPSA id
	a19sm2412516pfo.52.2019.02.22.08.02.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 08:02:02 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	mQINBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABtCFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT6JAj0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxC5Ag0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAGJAiUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <f47c3cb0-9b8a-61ec-12c4-385061887bd2@gmail.com>
Date: Fri, 22 Feb 2019 08:02:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
Cc: akuster808@mvista.com
Subject: thud][Pull request
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
X-List-Received-Date: Fri, 22 Feb 2019 16:02:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit cca27b5ea7569d2730ee5da7ee7f47b39d775d89:

  polkit: Fix CVE-2019-6133 (2019-01-23 08:17:23 -0800)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded thud-next

for you to fetch changes up to 6ef9657068492d4644079c88f2adee9c3cac9543:

  vim: improve reproducibility (2019-02-04 22:09:31 -0800)

----------------------------------------------------------------
Alexander Kanavin (2):
      packagegroup-meta-oe: drop ptest packages that do not exist
      packagegroup-meta-oe: rename the group that contains ptest packages

Andrea Adami (4):
      klibc: fix build for mipsel and mips64el with security flags enabled
      waf-cross-answers: Add cross-answers-mips64el.txt
      kexec-tools-klibc: fix build for mipsel and mips64el
      samba: fix build on qemumips64 with musl

Andreas Müller (1):
      libgit2: Fix install for multilib

Armin Kuster (1):
      wireshark: update to 2.6.6

Craig McQueen (1):
      python3-multidict: Workaround for broken make clean

Eduardas Meile (1):
      toybox: fix to use "usrmerge" distro feature properly

Haiqing Bai (1):
      ptpd: fixed the issue of ptpd2 daemon takes 100% CPU

Hong Liu (1):
      wireshark: upgrade to 2.6.5

Hongxu Jia (1):
      python-pyparted/python3-pyparted: drop incorrect and redundant PV

Kai Kang (1):
      net-snmp: inherit ptest

Khem Raj (16):
      xscreensaver: Define consistent app-defaults dir
      a2jmidid: Define own do_configure
      bpftool: don't build under musl
      packagegroup-meta-oe: Remove arch specific packages as needed
      packagegroup-meta-oe: Remove packages which don't build for musl
      modemmanager: Fix build with clang
      klibc: Fix build with clang
      srecord: GPL-3.0 and LGPL-3.0 is correct license
      packagegroup-meta-oe: Exclude unbuildable packages on mips64
      packagegroup-meta-oe: Exclude android-tools breakpad on ppc
      packagegroup-meta-oe: Remove unbuildable packages on risc-v from rdep
      mpv: Disable lua on mips/aarch64
      luajit: Disable for mips n64/n32 hosts
      licenses: Add Arphic-Public-License text
      nmap: Fix build with clang8/musl/libc++
      mozjs: Fix symbol visibility with clang/libc++

Marc Ferland (1):
      networkmanager: fix QA issue when using modemmanager and ppp in
PACKAGECONFIG

Martin Jansa (1):
      open-vm-tools: fix indentation and drop FILES_${PN}-dbg

Mingli Yu (1):
      vim: improve reproducibility

Niko Mauno (7):
      python-pygobject: Fix invalid install path
      python-pygobject: Drop redundant PYTHON* refs
      python-pygobject: Drop redundant dependencies
      python-pygobject: Only check for even upstream versions
      python-pygobject: Remove duplication in inherit
      python-pygobject: Fix style issue
      python-pygobject: Tune remove operation

Otavio Salvador (2):
      mozjs: Avoid use of X11 from host when X11 is disabled
      postgresql: Allow successful run of postgresql-setup

Primoz Fiser (1):
      sedutil: fix compile errors on big endian architectures

Scott Ellis (2):
      nmap: Fix typo in pcre PACKAGECONFIG
      nmap: Include additional FILES path for certs

leimaohui (2):
      mraa: To file do_package error in multilib.
      makedumpfile: Add aarch64 into COMPATIBLE_HOST.

thc (1):
      fix networkmanager apppend

 .../networkmanager/networkmanager_%.bbappend       |  2 +-
 ...efine-ulocked_-fgets-fread-fwrite-aliases.patch | 49 ++++++++++++++
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |  4 ++
 .../recipes-kernel/kexec/kexec-tools-klibc_git.bb  |  3 +
 .../waf-cross-answers/cross-answers-mips64el.txt   | 39 +++++++++++
 .../networkmanager/networkmanager_1.14.4.bb        |  1 +
 .../samba/samba/cmocka-uintptr_t.patch             | 51 ++++++++++++++
 .../recipes-connectivity/samba/samba_4.8.4.bb      |  1 +
 ...PU-using-issue-by-adding-minimum-POSIX-ti.patch | 68 +++++++++++++++++++
 meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb |  1 +
 .../recipes-protocols/net-snmp/net-snmp/run-ptest  |  3 +-
 .../recipes-protocols/net-snmp/net-snmp_5.8.bb     |  2 +-
 .../{wireshark_2.6.4.bb => wireshark_2.6.6.bb}     |  4 +-
 meta-oe/licenses/Arphic-Public-License             | 58 ++++++++++++++++
 ...01-Do-not-set-Wno-unused-but-set-variable.patch | 30 +++++++++
 .../modemmanager/modemmanager_1.8.2.bb             |  2 +
 .../packagegroups/packagegroup-meta-oe.bb          | 58 +++++++++++++---
 meta-oe/recipes-core/toybox/toybox_0.7.5.bb        |  2 +-
 .../{postgresql-bashprofile => postgresql-profile} |  0
 meta-oe/recipes-dbs/postgresql/postgresql.inc      |  8 +--
 meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb    |  6 +-
 ...c-add-sysroot-path-to-GI_DATADIR-don-t-se.patch | 28 --------
 .../python/python-pygobject_3.28.3.bb              | 14 ++--
 .../mozjs/mozjs/JS_PUBLIC_API.patch                | 37 ++++++++++
 meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb     |  3 +-
 meta-oe/recipes-extended/mraa/mraa_git.bb          |  4 +-
 ...001-Fix-build-on-big-endian-architectures.patch | 41 ++++++++++++
 meta-oe/recipes-extended/sedutil/sedutil_git.bb    |  4 +-
 .../xscreensaver/xscreensaver_5.39.bb              |  4 ++
 meta-oe/recipes-kernel/bpftool/bpftool.bb          |  2 +
 .../makedumpfile/makedumpfile_1.6.4.bb             |  4 +-
 meta-oe/recipes-multimedia/jack/a2jmidid_8.bb      |  5 ++
 meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb   |  5 +-
 ...lude-time.h-for-time-structure-definition.patch | 78
++++++++++++++++++++++
 .../nmap/files/0002-Fix-building-with-libc.patch   | 76
+++++++++++++++++++++
 meta-oe/recipes-security/nmap/nmap_7.70.bb         |  8 ++-
 meta-oe/recipes-support/libgit2/libgit2_0.27.4.bb  | 11 +--
 .../open-vm-tools/open-vm-tools_10.3.0.bb          | 47 ++++++-------
 meta-oe/recipes-support/srecord/srecord_1.64.bb    |  2 +-
 ...0001-src-Makefile-improve-reproducibility.patch | 46 +++++++++++++
 meta-oe/recipes-support/vim/vim_8.1.0347.bb        |  1 +
 .../python/python3-multidict_3.3.2.bb              |  4 ++
 .../python-pyparted/python-pyparted_3.11.1.bb      |  2 -
 .../python-pyparted/python3-pyparted_3.11.1.bb     |  2 -
 44 files changed, 717 insertions(+), 103 deletions(-)
 create mode 100644
meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-ulocked_-fgets-fread-fwrite-aliases.patch
 create mode 100644
meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
 create mode 100644
meta-networking/recipes-connectivity/samba/samba/cmocka-uintptr_t.patch
 create mode 100644
meta-networking/recipes-daemons/ptpd/ptpd/Fixed-100-CPU-using-issue-by-adding-minimum-POSIX-ti.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_2.6.4.bb =>
wireshark_2.6.6.bb} (96%)
 create mode 100644 meta-oe/licenses/Arphic-Public-License
 create mode 100644
meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Do-not-set-Wno-unused-but-set-variable.patch
 rename meta-oe/recipes-dbs/postgresql/files/{postgresql-bashprofile =>
postgresql-profile} (100%)
 delete mode 100644
meta-oe/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/JS_PUBLIC_API.patch
 create mode 100644
meta-oe/recipes-extended/sedutil/files/0001-Fix-build-on-big-endian-architectures.patch
 create mode 100644
meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch
 create mode 100644
meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch
 create mode 100644
meta-oe/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
~                                                                           



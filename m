Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 14EF873232
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 20:12:51 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 128so10700976wmz.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 12:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=3WnHllKKhajXD/qivM1nMfiBx7P9q6bJ1NswF9eozoM=;
	b=DJBiB0cbFiIF8FePAE5NWvxDHg3S0TrKuZ+H9eWoTtEPP4rp2Yp6UoeE4AoSvjdneO
	xwiyKOdRBVNVfVWqnxTClWTEVvro+wMj9graAFtHuj8CzP8lP36guchEE01eVNc+rFVj
	w8qAmN0gOyTSWODNFGezQN77s/A/AhlsbGntrk6kKQaabE6dR5jpZ41q3PL1ov/CPO5w
	roZHARZDVtxNs61Q/vtlDxHjF9mM/c5WsxcHeHnJRjoBW341SqNzYeMGwkpm5zswax+v
	q137uAf+Rz94rY37G70jQCUaKBwYoY3xGz5T+1n5mSVUdXZuv5u02DUrQ3WLx06JNZIn
	2SRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=3WnHllKKhajXD/qivM1nMfiBx7P9q6bJ1NswF9eozoM=;
	b=lWNM+UopDmOMtdIG8r+Epm1n9jboWU3/EICyLbnxj2ze9lINMU7U7qYcXHJcFibgaG
	VC/OdzfK54COailRQPrF4nFOVuLh/ZaGmOBlXK/jSXj2GYq8OEsBhdu9xt9EjCrQvw07
	2SNgNMd0gCTccb3Biu1Z1xCOzy/jzKvjDazhyQwfiHYjVcrS1+MWoFNcnFpU/jO6XERF
	gBBbp49djywShmZ2j/MyA1f4JoHV1Vw2SYww8An4MBQaDUYgDRmGUpbj22RB4PN+lJQT
	dHDaYb8e8G/47wcNMOqx70BN+IWJitbdY+8MQLwlt3PxVoywt+Hc1mpzgeoOnXMsYRgw
	jw4Q==
X-Gm-Message-State: AG10YOT1SoxgBJu2KqtZrJMyiSq3GGVuq377iCHRVjWTmEsEUhSmvx/zyZ8NX6Zk4mDkXde0HZbgPINES7y62g==
MIME-Version: 1.0
X-Received: by 10.28.145.204 with SMTP id t195mr14106884wmd.91.1454357571682; 
	Mon, 01 Feb 2016 12:12:51 -0800 (PST)
Received: by 10.194.67.168 with HTTP; Mon, 1 Feb 2016 12:12:51 -0800 (PST)
In-Reply-To: <cover.1454356312.git.akuster808@gmail.com>
References: <cover.1454356312.git.akuster808@gmail.com>
Date: Mon, 1 Feb 2016 21:12:51 +0100
Message-ID: <CA+chaQcekCM8pEoA1v9EARQjuc1JUJ_i0GwnawRKVra=Rgcz6g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 00/29][jethro] Pull request Jethro-next
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
X-List-Received-Date: Mon, 01 Feb 2016 20:12:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

  waf-samba.bbclass: add cross-answers option and files

This one isn't in master yet.

  mariadb: -native also needs gold workaround

This one breaks build for older host systems like Ubuntu 12.04, I'm not
sure if it's worth taking to release branch (people who need this fix and
have new enough host systems can apply the change in their setup only).

Regards,

On Mon, Feb 1, 2016 at 8:59 PM, Armin Kuster <akuster808@gmail.com> wrote:

> Please consider these for the meta-openembedded jethro-next
>
> The following changes since commit
> 7bc138a365e20653ddfb9229561e3e9e50b89ee8:
>
>   cifs-utils: add PACKAGECONFIG for cifsidmap (2016-01-14 11:22:38 +0100)
>
> are available in the git repository at:
>
>   git://github.com/akuster/meta-openembedded akuster/jethro-next
>   https://github.com/akuster/meta-openembedded/tree/akuster/jethro-next
>
> Andreas M=C3=BCller (1):
>   thunar: remove udisks from RRECOMMENDS
>
> Armin Kuster (5):
>   networkmanager: fix QA warning
>   qwt:  Fix host-user-contaminated
>   php: Security fix CVE-2015-7803
>   php: Security fix CVE-2015-7804
>   php: Security fix CVE-2016-1903
>
> Christopher Larson (1):
>   lowpan-tools: add missing flex/bison deps
>
> Hongxu Jia (1):
>   postfix: fix clean broken issue
>
> Jackie Huang (4):
>   iscsitarget: split the kernel module into separate package
>   iscsitarget: skip the arch test for kernel modules
>   ncftp: fix build failures with ccdv
>   waf-samba.bbclass: add cross-answers option and files
>
> Jens Rehsack (1):
>   waf-samba: enable parallel builds
>
> Joe Slater (1):
>   geoip: add ptest functionality
>
> Kai Kang (1):
>   xl2tpd: fix warnings with gcc 5
>
> Koen Kooi (1):
>   mariadb: -native also needs gold workaround
>
> Maciej Borzecki (1):
>   mozjs: fix linking issues on i586
>
> Mark Asselstine (1):
>   ctdb: Fix rootfs creation errors
>
> Martin Jansa (2):
>   ctdb: add dependency on libldb
>   terminus-font: update perl-native-runtime dependency
>
> Qi.Chen@windriver.com (1):
>   quagga: fix segment fault when stopping ospf6d
>
> Robert Yang (4):
>   nbd: use BPN in Files
>   cim-schema-exper: fix host-user-contaminated
>   ctdb: add PACKAGECONFIG for libtdb
>   netkit-ftp: fixed invalid symlink
>
> Ruslan Bilovol (1):
>   wireshark: update SRC_URI link to sources
>
> Wenzong Fan (1):
>   samba: add PACKAGECONFIG for valgrind
>
> Yi Zhao (2):
>   logwatch: fix host-user-contaminated
>   orrery: fix host-user-contaminated
>
>  .../21-add-config-option-without-valgrind.patch    |  63 ++++++++++
>  .../recipes-connectivity/samba/samba_4.1.12.bb     |   2 +
>  .../ncftp-configure-use-BUILD_CC-for-ccdv.patch    |  32 +++++
>  .../recipes-daemons/ncftp/ncftp_3.2.5.bb           |   7 +-
>  .../recipes-daemons/postfix/postfix.inc            |   2 +
>  .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |  13 +-
>  .../recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb   |   2 +-
>  ...heck-ospf6-before-using-it-in-ospf6_clean.patch |  28 +++++
>  .../recipes-protocols/quagga/quagga_0.99.24.1.bb   |   1 +
>  .../recipes-protocols/xl2tpd/xl2tpd.inc            |   4 +-
>  .../fix-inline-functions-errors-with-gcc-5.x.patch | 134
> +++++++++++++++++++++
>  .../cim-schema/cim-schema-exper_2.39.0.bb          |   1 +
>  .../cim-schema/cim-schema-final_2.40.0.bb          |   1 +
>  ...rvice-ensure-the-PID-directory-is-created.patch |  25 ++++
>  meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb |  11 +-
>  .../recipes-support/geoip/files/run-ptest          |  11 ++
>  .../recipes-support/geoip/geoip_1.6.6.bb           |  38 ++++++
>  .../lowpan-tools/lowpan-tools_git.bb               |   2 +-
>  meta-networking/recipes-support/nbd/nbd_3.11.bb    |   6 +-
>  .../recipes-support/wireshark/wireshark_1.12.8.bb  |   2 +-
>  meta-oe/classes/waf-samba.bbclass                  |  47 +++++++-
>  meta-oe/conf/layer.conf                            |   1 +
>  meta-oe/files/waf-cross-answers/README             |   3 +
>  .../waf-cross-answers/cross-answers-aarch64.txt    |  38 ++++++
>  .../files/waf-cross-answers/cross-answers-arm.txt  |  39 ++++++
>  .../files/waf-cross-answers/cross-answers-i586.txt |  39 ++++++
>  .../files/waf-cross-answers/cross-answers-i686.txt |  39 ++++++
>  .../files/waf-cross-answers/cross-answers-mips.txt |  39 ++++++
>  .../waf-cross-answers/cross-answers-mips64.txt     |  38 ++++++
>  .../waf-cross-answers/cross-answers-powerpc.txt    |  39 ++++++
>  .../waf-cross-answers/cross-answers-powerpc64.txt  |  39 ++++++
>  .../waf-cross-answers/cross-answers-x86_64.txt     |  38 ++++++
>  .../networkmanager/networkmanager_1.0.4.bb         |   1 +
>  .../php/php-5.6.12/CVE-2015-7803.patch             |  85 +++++++++++++
>  .../php/php-5.6.12/CVE-2015-7804.patch             |  64 ++++++++++
>  .../php/php-5.6.12/CVE-2016-1903.patch             |  55 +++++++++
>  meta-oe/recipes-devtools/php/php_5.6.12.bb         |   6 +-
>  .../recipes-extended/logwatch/logwatch_7.4.1.bb    |   1 +
>  ...010-fix-cross-compilation-on-i586-targets.patch |  46 +++++++
>  meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |   1 +
>  .../terminus-font/terminus-font_4.38.bb            |   2 +-
>  meta-oe/recipes-navigation/orrery/orrery_2.7.bb    |   1 +
>  meta-oe/recipes-qt/qwt/qwt.inc                     |   1 +
>  meta-oe/recipes-support/mysql/mariadb.inc          |   3 +
>  meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb     |   2 +-
>  45 files changed, 1029 insertions(+), 23 deletions(-)
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba-4.1.12/21-add-config-opt=
ion-without-valgrind.patch
>  create mode 100644
> meta-networking/recipes-daemons/ncftp/ncftp/ncftp-configure-use-BUILD_CC-=
for-ccdv.patch
>  create mode 100644
> meta-networking/recipes-protocols/quagga/files/0001-ospf6d-check-ospf6-be=
fore-using-it-in-ospf6_clean.patch
>  create mode 100644
> meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-functions-erro=
rs-with-gcc-5.x.patch
>  create mode 100644
> meta-networking/recipes-support/ctdb/ctdb/service-ensure-the-PID-director=
y-is-created.patch
>  create mode 100644 meta-networking/recipes-support/geoip/files/run-ptest
>  create mode 100644 meta-oe/files/waf-cross-answers/README
>  create mode 100644
> meta-oe/files/waf-cross-answers/cross-answers-aarch64.txt
>  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-arm.txt
>  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-i586.tx=
t
>  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-i686.tx=
t
>  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-mips.tx=
t
>  create mode 100644
> meta-oe/files/waf-cross-answers/cross-answers-mips64.txt
>  create mode 100644
> meta-oe/files/waf-cross-answers/cross-answers-powerpc.txt
>  create mode 100644
> meta-oe/files/waf-cross-answers/cross-answers-powerpc64.txt
>  create mode 100644
> meta-oe/files/waf-cross-answers/cross-answers-x86_64.txt
>  create mode 100644
> meta-oe/recipes-devtools/php/php-5.6.12/CVE-2015-7803.patch
>  create mode 100644
> meta-oe/recipes-devtools/php/php-5.6.12/CVE-2015-7804.patch
>  create mode 100644
> meta-oe/recipes-devtools/php/php-5.6.12/CVE-2016-1903.patch
>  create mode 100644
> meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-t=
argets.patch
>
> --
> 2.3.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9BACC77162
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 20:00:20 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id x125so89561325pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 12:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=WWBFx3v/g7vX1DYONfHJkm5mu1R+xCqOd6tTlJBL660=;
	b=NGHnKRh7WS74AKIi+Mkoi3R67pWwIBS/p7RI0XSWp1SmF84L/UXJlmUyNoWNqWSbE+
	x82M+tFRPyUi+dpiTHUJVtpAA38AjoKqxP19sDavFH7tIXk1Rcml8IUE2PUWLemVJ+ni
	Jt3notfH27XZE85Vic4rlXIjJElmLRLh/8y8ADMD2rL78Y/WIY/CMwUuN3ew7H25XKA6
	njXT+3dBIc9YkIiywO5KaIzpn8q6+TSTJn0exPmvaNdbZy+Qt1n8GJhS34JxT293acHC
	NsWioNfZcihHgpW/E3Kq3mh0GrsQBSmCpXWWfhoFCxQsL+e7N3JUBAeKBXgt7nbpBIg+
	Hm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=WWBFx3v/g7vX1DYONfHJkm5mu1R+xCqOd6tTlJBL660=;
	b=NQ01bpxw3LvJSz/r+OufMXfx/Mrtbo2fJGTwt8T1unORTW6bwapr4Mc+yke5SJM94w
	GmJUs5e36ka5dm489uVIfH4PQJEMC/m2m5xOvjT9uKlwykjpHjs11kXqcRl933xR5fPE
	pM5qO2AS6T5q2ukkR1d5gh5bhndiDzRCtXvGMTtp5TnRYyA3n67bljc3TNW3RldjBvSq
	pFPC6RfGzjNyh/7dhc6CopybQlKmMsBmpl+TJe8XFHc6Ioh/K0VBvnUJe6CVM6uXhzL5
	POxqI6arEoY/fLOwNRv4TzQxUOW5Q1utZ3LHq0Hf6/ixx6idHbaf+YrUXn4HZmaRiT7e
	j7Fw==
X-Gm-Message-State: AG10YOQI97+Hg+DFiGQ0bKUPbZrSfe7R3G75gvzFSkeeo2IWMv/g3CjCsldlxSnBRhdzmg==
X-Received: by 10.98.42.88 with SMTP id q85mr41166520pfq.1.1454356821275;
	Mon, 01 Feb 2016 12:00:21 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	v29sm21705217pfa.31.2016.02.01.12.00.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Feb 2016 12:00:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Feb 2016 11:59:42 -0800
Message-Id: <cover.1454356312.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
Subject: [PATCH 00/29][jethro] Pull request Jethro-next
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
X-List-Received-Date: Mon, 01 Feb 2016 20:00:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these for the meta-openembedded jethro-next

The following changes since commit 7bc138a365e20653ddfb9229561e3e9e50b89ee8:

  cifs-utils: add PACKAGECONFIG for cifsidmap (2016-01-14 11:22:38 +0100)

are available in the git repository at:

  git://github.com/akuster/meta-openembedded akuster/jethro-next
  https://github.com/akuster/meta-openembedded/tree/akuster/jethro-next

Andreas Müller (1):
  thunar: remove udisks from RRECOMMENDS

Armin Kuster (5):
  networkmanager: fix QA warning
  qwt:  Fix host-user-contaminated
  php: Security fix CVE-2015-7803
  php: Security fix CVE-2015-7804
  php: Security fix CVE-2016-1903

Christopher Larson (1):
  lowpan-tools: add missing flex/bison deps

Hongxu Jia (1):
  postfix: fix clean broken issue

Jackie Huang (4):
  iscsitarget: split the kernel module into separate package
  iscsitarget: skip the arch test for kernel modules
  ncftp: fix build failures with ccdv
  waf-samba.bbclass: add cross-answers option and files

Jens Rehsack (1):
  waf-samba: enable parallel builds

Joe Slater (1):
  geoip: add ptest functionality

Kai Kang (1):
  xl2tpd: fix warnings with gcc 5

Koen Kooi (1):
  mariadb: -native also needs gold workaround

Maciej Borzecki (1):
  mozjs: fix linking issues on i586

Mark Asselstine (1):
  ctdb: Fix rootfs creation errors

Martin Jansa (2):
  ctdb: add dependency on libldb
  terminus-font: update perl-native-runtime dependency

Qi.Chen@windriver.com (1):
  quagga: fix segment fault when stopping ospf6d

Robert Yang (4):
  nbd: use BPN in Files
  cim-schema-exper: fix host-user-contaminated
  ctdb: add PACKAGECONFIG for libtdb
  netkit-ftp: fixed invalid symlink

Ruslan Bilovol (1):
  wireshark: update SRC_URI link to sources

Wenzong Fan (1):
  samba: add PACKAGECONFIG for valgrind

Yi Zhao (2):
  logwatch: fix host-user-contaminated
  orrery: fix host-user-contaminated

 .../21-add-config-option-without-valgrind.patch    |  63 ++++++++++
 .../recipes-connectivity/samba/samba_4.1.12.bb     |   2 +
 .../ncftp-configure-use-BUILD_CC-for-ccdv.patch    |  32 +++++
 .../recipes-daemons/ncftp/ncftp_3.2.5.bb           |   7 +-
 .../recipes-daemons/postfix/postfix.inc            |   2 +
 .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |  13 +-
 .../recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb   |   2 +-
 ...heck-ospf6-before-using-it-in-ospf6_clean.patch |  28 +++++
 .../recipes-protocols/quagga/quagga_0.99.24.1.bb   |   1 +
 .../recipes-protocols/xl2tpd/xl2tpd.inc            |   4 +-
 .../fix-inline-functions-errors-with-gcc-5.x.patch | 134 +++++++++++++++++++++
 .../cim-schema/cim-schema-exper_2.39.0.bb          |   1 +
 .../cim-schema/cim-schema-final_2.40.0.bb          |   1 +
 ...rvice-ensure-the-PID-directory-is-created.patch |  25 ++++
 meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb |  11 +-
 .../recipes-support/geoip/files/run-ptest          |  11 ++
 .../recipes-support/geoip/geoip_1.6.6.bb           |  38 ++++++
 .../lowpan-tools/lowpan-tools_git.bb               |   2 +-
 meta-networking/recipes-support/nbd/nbd_3.11.bb    |   6 +-
 .../recipes-support/wireshark/wireshark_1.12.8.bb  |   2 +-
 meta-oe/classes/waf-samba.bbclass                  |  47 +++++++-
 meta-oe/conf/layer.conf                            |   1 +
 meta-oe/files/waf-cross-answers/README             |   3 +
 .../waf-cross-answers/cross-answers-aarch64.txt    |  38 ++++++
 .../files/waf-cross-answers/cross-answers-arm.txt  |  39 ++++++
 .../files/waf-cross-answers/cross-answers-i586.txt |  39 ++++++
 .../files/waf-cross-answers/cross-answers-i686.txt |  39 ++++++
 .../files/waf-cross-answers/cross-answers-mips.txt |  39 ++++++
 .../waf-cross-answers/cross-answers-mips64.txt     |  38 ++++++
 .../waf-cross-answers/cross-answers-powerpc.txt    |  39 ++++++
 .../waf-cross-answers/cross-answers-powerpc64.txt  |  39 ++++++
 .../waf-cross-answers/cross-answers-x86_64.txt     |  38 ++++++
 .../networkmanager/networkmanager_1.0.4.bb         |   1 +
 .../php/php-5.6.12/CVE-2015-7803.patch             |  85 +++++++++++++
 .../php/php-5.6.12/CVE-2015-7804.patch             |  64 ++++++++++
 .../php/php-5.6.12/CVE-2016-1903.patch             |  55 +++++++++
 meta-oe/recipes-devtools/php/php_5.6.12.bb         |   6 +-
 .../recipes-extended/logwatch/logwatch_7.4.1.bb    |   1 +
 ...010-fix-cross-compilation-on-i586-targets.patch |  46 +++++++
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |   1 +
 .../terminus-font/terminus-font_4.38.bb            |   2 +-
 meta-oe/recipes-navigation/orrery/orrery_2.7.bb    |   1 +
 meta-oe/recipes-qt/qwt/qwt.inc                     |   1 +
 meta-oe/recipes-support/mysql/mariadb.inc          |   3 +
 meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb     |   2 +-
 45 files changed, 1029 insertions(+), 23 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/21-add-config-option-without-valgrind.patch
 create mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/ncftp-configure-use-BUILD_CC-for-ccdv.patch
 create mode 100644 meta-networking/recipes-protocols/quagga/files/0001-ospf6d-check-ospf6-before-using-it-in-ospf6_clean.patch
 create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-functions-errors-with-gcc-5.x.patch
 create mode 100644 meta-networking/recipes-support/ctdb/ctdb/service-ensure-the-PID-directory-is-created.patch
 create mode 100644 meta-networking/recipes-support/geoip/files/run-ptest
 create mode 100644 meta-oe/files/waf-cross-answers/README
 create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-aarch64.txt
 create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-arm.txt
 create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-i586.txt
 create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-i686.txt
 create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-mips.txt
 create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-mips64.txt
 create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-powerpc.txt
 create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-powerpc64.txt
 create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-x86_64.txt
 create mode 100644 meta-oe/recipes-devtools/php/php-5.6.12/CVE-2015-7803.patch
 create mode 100644 meta-oe/recipes-devtools/php/php-5.6.12/CVE-2015-7804.patch
 create mode 100644 meta-oe/recipes-devtools/php/php-5.6.12/CVE-2016-1903.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch

-- 
2.3.5



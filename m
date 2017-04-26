Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 79C1F6007A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 06:57:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3Q6vHPA025932
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 23:57:18 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 25 Apr 2017 23:57:16 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Apr 2017 14:57:07 +0800
Message-ID: <cover.1493189113.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 0/8] ipmi/hpi/radius: add new recipes and related packages
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
X-List-Received-Date: Wed, 26 Apr 2017 06:57:17 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

---
The following changes since commit 444e1fb198076f34a0fa66e83f3eec76efba2e6c:

  php: remove PNBLACKLIST (2017-04-18 14:21:53 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/r_upstream-perl-ipmi-hpi_170426-0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/r_upstream-perl-ipmi-hpi_170426-0

Jackie Huang (8):
  openhpi: add new recipe
  freeradius: add new recipe
  libnet-ldap-perl: add new recipe
  libdata-hexdump-perl: add new recipe
  libnet-telnet-perl: add new recipe
  libauthen-radius-perl: add new recipe
  openipmi: add new recipe
  ipmitool: add new recipe

 .../freeradius/files/freeradius                    | 110 +++++
 .../freeradius-avoid-searching-host-dirs.patch     | 194 ++++++++
 ...radius-configure.ac-add-option-for-libcap.patch |  70 +++
 ...dius-configure.ac-allow-cross-compilation.patch |  31 ++
 .../files/freeradius-enble-user-in-conf.patch      |  28 ++
 ...eeradius-fix-error-for-expansion-of-macro.patch |  61 +++
 ...ius-fix-issues-related-to-m4-include-path.patch | 236 ++++++++++
 .../freeradius-fix-quoting-for-BUILT_WITH.patch    |  55 +++
 .../files/freeradius-libtool-detection.patch       |  89 ++++
 .../freeradius-libtool-do-not-use-jlibtool.patch   | 160 +++++++
 .../freeradius-rlm_python-add-PY_INC_DIR.patch     |  33 ++
 .../freeradius/files/radiusd-volatiles.conf        |   2 +
 .../freeradius/files/radiusd.service               |  16 +
 .../freeradius/files/volatiles.58_radiusd          |   3 +
 .../freeradius/freeradius_3.0.12.bb                | 223 +++++++++
 .../files/openhpi-add-libnetsnmp-when-link.patch   |  25 +
 .../files/openhpi-fix-alignment-issue.patch        |  23 +
 .../openhpi/files/openhpi-fix-host-gcc.patch       |  24 +
 .../files/openhpi-fix-testfail-errors.patch        |  31 ++
 .../openhpi/files/openhpi-glib-cross-compile.patch |  33 ++
 .../files/openhpi-hpi-shell-thread-fix.patch       |  29 ++
 .../openhpi/files/openhpi-invalide-session.patch   |  21 +
 .../files/openhpi-libxml2-cross-compile.patch      |  21 +
 .../openhpi/files/openhpi-linkfix.patch            |  33 ++
 .../files/openhpi-netsnmp-cross-compile.patch      |  48 ++
 .../files/openhpi-sysfs-cross-compile.patch        |  23 +
 ...i-use-serial-tests-config-needed-by-ptest.patch |  31 ++
 .../recipes-daemons/openhpi/files/openhpi.init     | 230 +++++++++
 .../recipes-daemons/openhpi/files/openhpid.service |  11 +
 .../recipes-daemons/openhpi/files/run-ptest        |   5 +
 .../recipes-daemons/openhpi/openhpi_3.6.1.bb       | 111 +++++
 .../recipes-support/ipmitool/ipmitool_1.8.18.bb    |  36 ++
 .../files/do-not-install-pyc-and-pyo.patch         |  25 +
 .../fix-symlink-install-error-in-cmdlang.patch     |  22 +
 .../files/ipmi-init-fix-the-arguments.patch        |  41 ++
 .../recipes-support/openipmi/files/ipmi.service    |  12 +
 .../openipmi/files/makefile-add-ldflags.patch      |  19 +
 .../openipmi/files/openipmi-don-t-rm-.libs.patch   |  32 ++
 .../recipes-support/openipmi/files/openipmi-helper | 512 +++++++++++++++++++++
 .../files/openipmi-no-openipmigui-man.patch        |  26 ++
 ...openipmi-remove-host-path-from-la_LDFLAGS.patch |  85 ++++
 .../recipes-support/openipmi/openipmi_2.0.22.bb    | 111 +++++
 .../libauthen/libauthen-radius-perl/run-ptest      |  21 +
 .../test.pl-adjust-for-ptest.patch                 |  90 ++++
 .../libauthen/libauthen-radius-perl_0.22.bb        |  39 ++
 meta-perl/recipes-perl/libdata/files/run-ptest     |  16 +
 .../libdata/libdata-hexdump-perl_0.02.bb           |  33 ++
 .../recipes-perl/libnet/libnet-ldap-perl_0.65.bb   |  29 ++
 .../recipes-perl/libnet/libnet-telnet-perl_3.04.bb |  25 +
 49 files changed, 3184 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-avoid-searching-host-dirs.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-add-option-for-libcap.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-allow-cross-compilation.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-enble-user-in-conf.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-error-for-expansion-of-macro.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-issues-related-to-m4-include-path.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-quoting-for-BUILT_WITH.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-detection.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-do-not-use-jlibtool.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-rlm_python-add-PY_INC_DIR.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/radiusd-volatiles.conf
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/radiusd.service
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/volatiles.58_radiusd
 create mode 100644 meta-networking/recipes-connectivity/freeradius/freeradius_3.0.12.bb
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-add-libnetsnmp-when-link.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-fix-alignment-issue.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-fix-host-gcc.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-fix-testfail-errors.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-glib-cross-compile.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-hpi-shell-thread-fix.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-invalide-session.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-libxml2-cross-compile.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-linkfix.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-netsnmp-cross-compile.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-sysfs-cross-compile.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-use-serial-tests-config-needed-by-ptest.patch
 create mode 100755 meta-networking/recipes-daemons/openhpi/files/openhpi.init
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpid.service
 create mode 100755 meta-networking/recipes-daemons/openhpi/files/run-ptest
 create mode 100644 meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
 create mode 100644 meta-oe/recipes-support/ipmitool/ipmitool_1.8.18.bb
 create mode 100644 meta-oe/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch
 create mode 100644 meta-oe/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
 create mode 100644 meta-oe/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
 create mode 100644 meta-oe/recipes-support/openipmi/files/ipmi.service
 create mode 100644 meta-oe/recipes-support/openipmi/files/makefile-add-ldflags.patch
 create mode 100644 meta-oe/recipes-support/openipmi/files/openipmi-don-t-rm-.libs.patch
 create mode 100755 meta-oe/recipes-support/openipmi/files/openipmi-helper
 create mode 100644 meta-oe/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
 create mode 100644 meta-oe/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
 create mode 100644 meta-oe/recipes-support/openipmi/openipmi_2.0.22.bb
 create mode 100644 meta-perl/recipes-perl/libauthen/libauthen-radius-perl/run-ptest
 create mode 100644 meta-perl/recipes-perl/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch
 create mode 100644 meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
 create mode 100644 meta-perl/recipes-perl/libdata/files/run-ptest
 create mode 100644 meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.65.bb
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.04.bb

-- 
2.11.0



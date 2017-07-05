Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F321B71985
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jul 2017 08:19:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v658JIUn012682
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Jul 2017 01:19:19 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 5 Jul 2017 01:19:18 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jul 2017 16:11:23 +0800
Message-ID: <20170705081133.6496-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [PATCH 00/10] Fix compile errors if distro feature openssl-no-weak-ciphers exists
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
X-List-Received-Date: Wed, 05 Jul 2017 08:19:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

Patches to add distro feature openssl-no-weak-ciphers have been sent to oe-core.

Jackie Huang (1):
  net-snmp: disable des for openssl-no-weak-ciphers

Kai Kang (9):
  Set packages conflict with distro feature openssl-no-weak-ciphers
  hostapd: disable configs depends on des if openssl not support
  krb5: toggle configure option pkinit
  libp11: fix compile error if OPENSSL_NO_EC defined
  opensc: add PACKAGECONFIG openssl
  uftp: set NO_EC if openssl not support ec
  stunnel: fix compile error when openssl disable des support
  poco: disable package configs NetSSL and Crypto
  postgresql: configure without openssl if openssl disable weak ciphers

 .../freeradius/freeradius_3.0.14.bb                |  5 +-
 .../recipes-daemons/openhpi/openhpi_3.6.1.bb       |  5 +-
 .../net-snmp/net-snmp-fix-for-disable-des.patch    | 32 +++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |  5 +-
 .../recipes-support/dovecot/dovecot_2.2.29.bb      |  4 +-
 .../ipsec-tools/ipsec-tools_0.8.2.bb               |  4 +-
 .../recipes-support/openvpn/openvpn_2.4.2.bb       |  4 +-
 .../stunnel/stunnel/fix-openssl-no-des.patch       | 54 ++++++++++++++++++++++
 .../recipes-support/stunnel/stunnel_5.35.bb        |  4 +-
 meta-networking/recipes-support/uftp/uftp_4.9.3.bb |  2 +
 .../recipes-connectivity/hostapd/hostapd_2.6.bb    | 16 +++++++
 meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb   |  4 +-
 .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb |  5 +-
 meta-oe/recipes-devtools/nodejs/nodejs_4.8.3.bb    |  5 ++
 .../recipes-extended/cfengine/cfengine_3.9.0.bb    |  4 +-
 meta-oe/recipes-extended/mailx/mailx_12.5-5.bb     |  5 +-
 meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb        |  4 +-
 meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb   |  2 +
 meta-oe/recipes-support/freerdp/freerdp_git.bb     |  4 +-
 ...-src-p11_ec.c-check-OPENSSL_NO_EC-earlier.patch | 46 ++++++++++++++++++
 meta-oe/recipes-support/libp11/libp11_0.4.0.bb     |  4 +-
 meta-oe/recipes-support/opensc/opensc_0.16.0.bb    |  5 ++
 meta-oe/recipes-support/poco/poco_1.7.8.bb         |  1 +
 meta-oe/recipes-support/postgresql/postgresql.inc  |  2 +
 .../python/python-cryptography.inc                 |  4 +-
 25 files changed, 215 insertions(+), 15 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
 create mode 100644 meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
 create mode 100644 meta-oe/recipes-support/libp11/libp11/0001-src-p11_ec.c-check-OPENSSL_NO_EC-earlier.patch

-- 
2.10.1



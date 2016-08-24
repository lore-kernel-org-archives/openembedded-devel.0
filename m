Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E11C56AC37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 09:22:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7O9MLtP019195
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 02:22:21 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 24 Aug 2016 02:22:21 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Aug 2016 17:06:48 +0800
Message-ID: <cover.1472027350.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH 00/16] control ipv6 support based on DISTRO_FEATURES
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
X-List-Received-Date: Wed, 24 Aug 2016 09:22:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

There is ipv6 configure option for these packages, and we need them
to be controled by DISTRO_FEATURES.

Tested with and without ipv6 in DISTRO_FEATURES on qemux86-64 and qemuarm.

---
The following changes since commit dc48e768f527cbed0cc3899f6a2ebb396cd9ada8:

  meta-oe: remove trailing spaces (2016-08-22 15:56:29 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/r_ipv6_160824-0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/r_ipv6_160824-0

Jackie Huang (16):
  chrony: control ipv6 support based on DISTRO_FEATURES
  cyrus-sasl: control ipv6 support based on DISTRO_FEATURES
  daq: control ipv6 support based on DISTRO_FEATURES
  mtr: control ipv6 support based on DISTRO_FEATURES
  ntp: control ipv6 support based on DISTRO_FEATURES
  squid: control ipv6 support based on DISTRO_FEATURES
  stunnel: control ipv6 support based on DISTRO_FEATURES
  tftp-hpa: control ipv6 support based on DISTRO_FEATURES
  tnftp: control ipv6 support based on DISTRO_FEATURES
  wolfssl: control ipv6 support based on DISTRO_FEATURES
  znc: control ipv6 support based on DISTRO_FEATURES
  iperf: control ipv6 support based on DISTRO_FEATURES
  php: control ipv6 support based on DISTRO_FEATURES
  cherokee: control ipv6 support based on DISTRO_FEATURES
  xfce4-mailwatch-plugin: control ipv6 support based on DISTRO_FEATURES
  inetutils: fixes for ipv6 feature

 .../recipes-connectivity/daq/daq_2.0.6.bb          |  3 ++
 .../inetutils/inetutils/fix-disable-ipv6.patch     | 43 +++++++++++++++++-----
 .../inetutils/inetutils_1.9.4.bb                   | 10 ++---
 .../recipes-connectivity/wolfssl/wolfssl_3.9.0.bb  |  2 +
 .../cyrus-sasl/cyrus-sasl_2.1.26.bb                |  2 +
 .../recipes-daemons/squid/squid_3.5.20.bb          |  2 +
 .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |  3 ++
 meta-networking/recipes-irc/znc/znc_git.bb         |  3 ++
 .../recipes-support/chrony/chrony_2.4.bb           |  5 ++-
 meta-networking/recipes-support/mtr/mtr_0.86.bb    |  2 +
 meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb |  5 ++-
 .../recipes-support/stunnel/stunnel_5.28.bb        |  5 ++-
 .../recipes-support/tnftp/tnftp_20151004.bb        |  5 ++-
 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb     |  3 ++
 meta-oe/recipes-devtools/php/php.inc               |  5 ++-
 .../recipes-httpd/cherokee/cherokee_1.2.98.bb      |  3 +-
 .../mailwatch/xfce4-mailwatch-plugin_1.2.0.bb      |  3 ++
 17 files changed, 83 insertions(+), 21 deletions(-)

-- 
2.8.3



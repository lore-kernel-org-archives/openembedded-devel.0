Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 882CE6C4AB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2018 00:52:27 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 5B6781C0033;
	Wed, 21 Nov 2018 13:52:27 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Nov 2018 13:52:14 +1300
Message-Id: <20181121005220.22091-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181120063718.28683-1-douglas.royds@taitradio.com>
References: <20181120063718.28683-1-douglas.royds@taitradio.com>
Subject: [meta-oe][PATCH v2 0/6] net-snmp: Reproducibility
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
X-List-Received-Date: Wed, 21 Nov 2018 00:52:28 -0000

There was a breakage in the "Remove PKG_CONFIG paths" patch,
in which I was unwittingly trimming the trailing close double quotes
from the CFLAGS in net-snmp-config.

I have also added a readability improvement for the sed expressions in
do_install().

Douglas Royds (6):
  Revert "net-snmp: improve reproducibility"
  net-snmp: Reproducibility: Fixed path to /bin/uname
  net-snmp: Reproducibility: Remove PKG_CONFIG paths from net-snmp-config
  net-snmp: Reproducibility: Don't check build host for /etc/printcap
  net-snmp: Reproducibility: Set NETSNMP_CONFIGURE_OPTIONS null
  net-snmp: Simplify sed expressions

 ...e-configure-options-from-versioninfo.patch | 42 -------------------
 ...ty-accept-configure-options-from-env.patch | 15 +++++++
 .../reproducibility-have-printcap.patch       | 19 +++++++++
 .../net-snmp/net-snmp_5.8.bb                  | 24 +++++------
 4 files changed, 46 insertions(+), 54 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-remove-configure-options-from-versioninfo.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-accept-configure-options-from-env.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch

-- 
2.17.1



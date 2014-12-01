Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id F1BF672270
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 01:04:20 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kq14so9957177pab.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2014 17:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=F0kiwinUcdfxHmUB9dtaDeKx/y84a3UiD0ndefTZlVg=;
	b=OzN81GKkCYLRMVgJ1eFiPbQE7E4se6bAu5YMR+Q3WHed9ObX4NX4Yz56GyqUYkQZ92
	McRgYaz9S7E9nKG4QwWKGt4RMuh11jQ18OSyT+Lrx57tB2IAryH8Ez4VaAKsGAfVBIzc
	OoGioDfIc6DsZOewDB0chKTZy8JxF0ETJH58zuIIAmkEyyLTXBxcHoDOIf5vKhn5BZAD
	l3uII4fX2WMPVopCgGVaNb918DE9+HqI3NPwtOfyLr1WJgyMt5pjJiJ+fS9z3I2cNC6Q
	NFhlTpw4vzm+pCuW210pfu4j2vqGPRf9ga/JbkVfpOsl2aGfIkVhrV8Bcf5nZhLGV9Pr
	m5ig==
X-Received: by 10.70.2.65 with SMTP id 1mr95938128pds.13.1417395861173;
	Sun, 30 Nov 2014 17:04:21 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id v7sm11872248pdl.5.2014.11.30.17.04.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 30 Nov 2014 17:04:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Nov 2014 17:04:02 -0800
Message-Id: <cover.1417194166.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: otavio@ossystems.com.br
Subject: [PATCH 00/15] for Dizzy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Dec 2014 01:04:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these change for meta-openembedded Dizzy branch

The following changes since commit 6dd8dedb5993c210394419934a2b080d17728f0e:

  phpmyadmin: fix for Security Advisory CVE-2014-5273 (2014-11-26 13:29:15 -0800)

are available in the git repository at:

  https://github.com/akuster/meta-openembedded.git akuster/dizzy-next
  https://github.com//tree/akuster/dizzy-next

Andreas Müller (2):
  xfce4-weather-plugin: make work properly after met.no API change
  gvfs: replace deprecated g_memmove by memmove

Armin Kuster (1):
  wireshark: update to 1.12.2

Kang Kai (8):
  postgresql: add fix for CVE-2014-0064 Security Advisory
  postgresql: add fix for CVE-2014-0060 Security Advisory
  postgresql: add fix for CVE-2014-0061 Security Advisory
  postgresql: add fix for CVE-2014-0062 Security Advisory
  postgresql: add fix for CVE-2014-0063 Security Advisory
  postgresql: add fix for CVE-2014-0067 Security Advisory
  postgresql: add fix for CVE-2014-0065 and CVE-2014-0066 Security
    Advisory
  libyaml: add fix for CVE-2014-2525 Security Advisory

Roy Li (2):
  phpmyadmin: fix for Security Advisory CVE-2014-5274
  net-snmp: fix for Security Advisory - CVE-2014-3565

Wenzong Fan (1):
  krb5: fix CVE-2014-5351

Xufeng Zhang (1):
  syslog-ng: Fix memory leak when udp connection is used [ LIN7-1379 ]

 ...daemonfile.c-replace-g_memmove-by-memmove.patch |   36 +
 meta-gnome/recipes-gnome/gvfs/gvfs.inc             |    1 +
 ...s-for-printing-variables-with-wrong-types.patch |  455 ++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb |    1 +
 .../{wireshark_1.12.1.bb => wireshark_1.12.2.bb}   |    4 +-
 ...rn-only-new-keys-in-randkey-CVE-2014-5351.patch |   92 ++
 meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb   |    1 +
 .../libyaml/files/libyaml-CVE-2014-2525.patch      |   42 +
 meta-oe/recipes-support/libyaml/libyaml_0.1.5.bb   |    4 +-
 ...integer-overflow-to-avoid-buffer-overruns.patch |  605 +++++++++++
 .../0003-Shore-up-ADMIN-OPTION-restrictions.patch  |  273 +++++
 ...vilege-escalation-in-explicit-calls-to-PL.patch |  267 +++++
 ...ted-name-lookups-during-table-and-index-D.patch | 1082 ++++++++++++++++++++
 ...ix-handling-of-wide-datetime-input-output.patch |  465 +++++++++
 ...al-available-to-pg_regress-of-ECPG-and-is.patch |   75 ++
 ...-potential-overruns-of-fixed-size-buffers.patch |  393 +++++++
 meta-oe/recipes-support/postgresql/postgresql.inc  |   11 +-
 .../logwriter-dont-allocate-a-new-buffer.patch     |   26 +
 .../logwriter-still-free-the-unconsumed-item.patch |   47 -
 .../rewrite-expr-grammar.ym-Free-up-token.patch    |   17 +
 .../files/still-free-the-unconsumed-item.patch     |   90 ++
 .../recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb |    4 +-
 ...4505-security-XSS-in-view-operations-page.patch |   43 +
 .../recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb     |    1 +
 ...-ready-for-met.no-locationforecast-1.2-AP.patch |  162 +++
 ...et.no-locationforecastLTS-1.2-API-bug-109.patch |   27 +
 .../weather/xfce4-weather-plugin_0.8.3.bb          |    4 +
 27 files changed, 4175 insertions(+), 53 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gvfs/files/0005-client-gdaemonfile.c-replace-g_memmove-by-memmove.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Added-checks-for-printing-variables-with-wrong-types.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_1.12.1.bb => wireshark_1.12.2.bb} (92%)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-Return-only-new-keys-in-randkey-CVE-2014-5351.patch
 create mode 100644 meta-oe/recipes-support/libyaml/files/libyaml-CVE-2014-2525.patch
 create mode 100644 meta-oe/recipes-support/postgresql/files/0002-Predict-integer-overflow-to-avoid-buffer-overruns.patch
 create mode 100644 meta-oe/recipes-support/postgresql/files/0003-Shore-up-ADMIN-OPTION-restrictions.patch
 create mode 100644 meta-oe/recipes-support/postgresql/files/0004-Prevent-privilege-escalation-in-explicit-calls-to-PL.patch
 create mode 100644 meta-oe/recipes-support/postgresql/files/0005-Avoid-repeated-name-lookups-during-table-and-index-D.patch
 create mode 100644 meta-oe/recipes-support/postgresql/files/0006-Fix-handling-of-wide-datetime-input-output.patch
 create mode 100644 meta-oe/recipes-support/postgresql/files/0007-Make-pqsignal-available-to-pg_regress-of-ECPG-and-is.patch
 create mode 100644 meta-oe/recipes-support/postgresql/files/0008-Prevent-potential-overruns-of-fixed-size-buffers.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/logwriter-dont-allocate-a-new-buffer.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/logwriter-still-free-the-unconsumed-item.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/rewrite-expr-grammar.ym-Free-up-token.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/still-free-the-unconsumed-item.patch
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4505-security-XSS-in-view-operations-page.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/weather/files/0001-Make-plugin-ready-for-met.no-locationforecast-1.2-AP.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/weather/files/0002-Switch-to-met.no-locationforecastLTS-1.2-API-bug-109.patch

-- 
1.9.1



Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SI6wq-0004eK-Mh
	for openembedded-devel@openembedded.org; Thu, 12 Apr 2012 01:27:36 +0200
Received: (qmail 7953 invoked by uid 1003); 11 Apr 2012 23:11:37 -0000
Received: from unknown (HELO localhost.localdomain)
	(philip@balister.org@157.22.28.13)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	11 Apr 2012 23:11:37 -0000
From: philip@balister.org
To: openembedded-devel@openembedded.org
Date: Wed, 11 Apr 2012 16:11:26 -0700
Message-Id: <1334185891-25460-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.7.6
Cc: Philip Balister <philip@opensdr.com>
Subject: [meta-oe 0/5] Update UHD and GNU Radio to current versions.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 23:27:37 -0000

From: Philip Balister <philip@opensdr.com>

Build tested on a distroless oe-core+toolchain-layer+meta-oe setup.

Philip Balister (5):
  uhd-firmware : Update to version 003.004.000.
  python-cheetah : Remove DEPENDS on python native packages.
  uhd : Update to version 3.4.1.
  gnuradio : Update to version 3.5.3.
  gnuradio : Remove old files.

 meta-oe/recipes-connectivity/gnuradio/gnuradio.inc |   48 ------------
 ...-all-traces-of-volk-from-configure-for-OE.patch |   42 ----------
 .../recipes-connectivity/gnuradio/gnuradio_git.bb  |   79 ++++++++++++++++++--
 .../uhd/uhd-firmware_003.003.001.bb                |   27 -------
 .../uhd/uhd-firmware_003.004.000.bb                |   27 +++++++
 meta-oe/recipes-connectivity/uhd/uhd.inc           |    2 +-
 meta-oe/recipes-connectivity/uhd/uhd_git.bb        |    6 +-
 .../python/python-cheetah_2.4.4.bb                 |    2 -
 8 files changed, 102 insertions(+), 131 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio.inc
 delete mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-volk-Remove-all-traces-of-volk-from-configure-for-OE.patch
 delete mode 100644 meta-oe/recipes-connectivity/uhd/uhd-firmware_003.003.001.bb
 create mode 100644 meta-oe/recipes-connectivity/uhd/uhd-firmware_003.004.000.bb

-- 
1.7.7.6




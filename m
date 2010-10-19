Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P8KHk-0007GF-Ct
	for openembedded-devel@openembedded.org; Wed, 20 Oct 2010 00:04:09 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 1D99C1D360EE;
	Wed, 20 Oct 2010 00:03:18 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Oct 2010 00:03:20 +0200
Message-Id: <1287525802-13312-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/2] ts72xx update
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
X-List-Received-Date: Tue, 19 Oct 2010 22:05:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This two patches contains kernel fixes for ts7400 SBC, build what is poss=
ible
in kernel as module, add UBIFS image possibility and cleans the machine c=
onfig
little bit. Please apply. Thanks.

-- ynezz

Petr =C5=A0tetiar (2):
  ts72xx: update machine config
  linux-2.6.34: ts72xx - update the kernel patchset and defconfig

 conf/machine/ts72xx.conf                           |   23 +-
 .../linux-2.6.34/ts72xx/0015-ts72xx_sdcard.patch   |   64 +-
 ...hdog-ts72xx_wdt-disable-watchdog-at-probe.patch |   36 +
 recipes/linux/linux-2.6.34/ts72xx/defconfig        |  701 ++++++++++++++=
+-----
 recipes/linux/linux_2.6.34.bb                      |    3 +-
 5 files changed, 620 insertions(+), 207 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0019-watchdog-ts72x=
x_wdt-disable-watchdog-at-probe.patch




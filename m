Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDZEC-0000vz-0j
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 13:11:00 +0200
Received: by wgbdq11 with SMTP id dq11so2241062wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 03:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=z5EiRzaPjuhfVrS/W5RnPHjlHDiTM2cEd7xoCA6fB4c=;
	b=SfFzu5vFB2olJZShgsOkqP1KLZHsBcQVJmrLnz1FxF/mNM+/hqeMSsDlppQoP7ZJxh
	tLDdmE2vHc19s9FeKViIRZi5APmdo7JtZVYcGCyZVQs7vD4o9CYTVItuFcVa4ARq5Wt8
	AAwYc9nl4MO93cwcqQ8IEKYQ3Ah1EI6TNq+y8Tq2uL021X8UTRtG59dWU8yY/R2BNglJ
	XJ/KFzgtt+j0T8rgMzRhRPYtQDm/eQkL/VAUTPnv8nQm/v5efHPM3nubQf1IEiZWBBGN
	+oCmlLawkq2SGPsVoTJGXwjL/02UwjJok+cmWz37TqrAeQt7IGQjlvCK1kwhA6di7jQ3
	vAnQ==
Received: by 10.180.98.200 with SMTP id ek8mr15430011wib.0.1347879501443;
	Mon, 17 Sep 2012 03:58:21 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id cl8sm17277618wib.10.2012.09.17.03.58.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 03:58:20 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2012 12:58:05 +0200
Message-Id: <1347879491-2425-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQl9AsW+c7uO9+BYG2J+sN+9YTYrNq586bUexR37yVYRiZFmfZ6uoRPs94eRPFVumMnaf4c5
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [for-denzil][systemd update 0/6] Systemd updates
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
X-List-Received-Date: Mon, 17 Sep 2012 11:11:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A big update to systemd v189. Runtime tested on angstrom.

This patchset depends on the bluez updates sent to the oe-core list since bluez uses a deprecated udev API that went away somewhere in between 182 and 189.

Andreas Müller (3):
  systemd-systemctl-native: Add additional messages for better
    debugging
  systemd-systemctl-native: handle ALIAS tag
  gdm: do not rely on dev-tty7.device

Denis 'GNUtoo' Carikli (1):
  meta-systemd: systemd-systemctl-native: Also add support for
    WantedBy=*.service

Koen Kooi (1):
  systemd: update to v189

Martin Jansa (1):
  systemd-systemctl-native: extend systemctl wrapper to support mask
    action

 meta-gnome/recipes-gnome/gdm/gdm/gdm.service       |    3 +-
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |    2 +-
 .../systemd/systemd-systemctl-native.bb            |    2 +-
 .../systemd/systemd-systemctl-native/systemctl     |   42 +++-
 .../systemd/systemd/format-replace-m-uclibc.patch  |  380 --------------------
 meta-oe/recipes-core/systemd/systemd/gtk-doc.make  |  230 ++++++++++++
 .../recipes-core/systemd/systemd/modprobe.rules    |   17 +
 .../systemd/systemd/paper-over-mkostemp.patch      |   19 -
 .../systemd-pam-configure-check-uclibc.patch       |   26 ++
 .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   29 ++
 .../systemd/systemd-pam-fix-fallocate.patch        |   82 +++++
 .../systemd/systemd-pam-fix-getty-unit.patch       |   35 ++
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 +++++++++
 .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 +++++++++++++++++
 .../recipes-core/systemd/systemd/touchscreen.rules |   18 +
 .../systemd/systemd/use-rootlibdir.patch           |   94 +++++
 meta-oe/recipes-core/systemd/systemd_git.bb        |  105 +++++-
 17 files changed, 1167 insertions(+), 418 deletions(-)
 delete mode 100644 meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd/gtk-doc.make
 create mode 100644 meta-oe/recipes-core/systemd/systemd/modprobe.rules
 delete mode 100644 meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd/touchscreen.rules
 create mode 100644 meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch

-- 
1.7.7.6




Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 277F8601DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:29:39 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so3300905eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=qQFEXhhz2TByTphFL+PR89ChHLZkbvuWmlXtaX7cMXM=;
	b=jPdtsdstxUxBZmKld8ofFRnYt7W47XfdHzHVYXIgzTrh4JOE3bAzdi9x/ab8nXGHKN
	LJOCIK5rWjiATdkTuQ9bFBEM6bYRVhNrxoiwfHAASGSxQUZsxJ2KZrejgIIa9vkRJ4T/
	zYmi4vnNJv7sT34og+UwCC+SO3p7R6BivEZz8HhUGJhsJUzWkE87YTBCcHrMzw9DlMCm
	jRYQEu6Vcl2LDZpbOV9yetJm71PjPVN3thp9OcIP9F3Fv0nFFjkslYBEZMX/orK7sEHL
	Q5HHxTKa5E37k2OI4A3rYUFUdQ2QP77b1P28u5buP/BFuWd3mwr1wYv1Lcr5g/pR+Gh0
	0R9A==
X-Received: by 10.14.202.70 with SMTP id c46mr3674165eeo.28.1371662980701;
	Wed, 19 Jun 2013 10:29:40 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.29.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:29:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:07 +0200
Message-Id: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 00/20] updates and fixes
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
X-List-Received-Date: Wed, 19 Jun 2013 17:29:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1->V2:
* polkit/networkmanager+datetime(new) rule into own recipe [13-15]: This is more
  flexible so distro/image can decide to use it or not
* [12+19+20]: new

The following changes since commit f7fc06cc5143b66b47c83965e0e430809c17ab57:

  nostromo: make SRC_URI work for multilib builds. (2013-06-18 23:40:06 +0100)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git updates-and-fixes2

Andreas Müller (20):
      midori: update to 0.5.2
      tumbler: add curl to dependencies to make build deterministic
      tumbler: update to 0.1.29
      poppler: update to 0.22.4
      xfce4-xkb-plugin: update to 0.7.0 tarball
      atkmm: add glibmm to DEPENDS
      p11-kit: initial add 0.19.1
      gcr: initial add 3.8.2
      mozjs: initial add 17.0.0
      polkit: update to 0.111
      networkmanager: rework dependencies/configure-option and use PACKAGECONFIG
      networkmanager: replace absolute paths
      polkit-group-rule.inc: add a common template for polkit-rules/user-groups
      polkit-group-rule-network: initial add
      polkit-group-rule-datetime: initial add
      lxdm: remove consolekit dependencies in systemd environment and fix build
      xfce4-power-manager: rework polkit/consolekit selection and implement polkit/systemd shutdown
      xarchiver: update to 0.5.3 for various bugfixes
      xfwm4: don't turn into unusablity after setting system time backwards
      xfce4-genmon-plugin: Allow timer period to be set at 250ms resolution

 .../midori/{midori_0.5.0.bb => midori_0.5.2.bb}    |    4 +-
 meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb          |   20 +
 .../networkmanager/networkmanager_0.9.8.0.bb       |   20 +-
 ...-not-include-RequiredDefines.h-for-depend.patch |   35 +
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |   35 +
 .../files/50-org.freedesktop.NetworkManager.rules  |    8 +
 .../files/50-org.freedesktop.timedate1.rules       |    8 +
 ...ession-Set-error-if-we-cannot-find-a-sess.patch |   70 --
 ...ession-Actually-return-TRUE-if-a-session-.patch |   46 --
 .../polkit-0.104/obsolete_automake_macros.patch    |   23 -
 .../polkit/polkit-group-rule-datetime.bb           |   14 +
 .../polkit/polkit-group-rule-network.bb            |   14 +
 .../recipes-extended/polkit/polkit-group-rule.inc  |    9 +
 .../{polkit-0.104 => polkit}/polkit-1_pam.patch    |    0
 .../polkit/{polkit_0.104.bb => polkit_0.111.bb}    |   51 +-
 meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb          |    2 +-
 ...heck-only-for-ck-connector-in-case-consol.patch |   48 ++
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |    6 +-
 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb  |   18 +
 ...sh.cc-add-cast-to-fix-build-for-enable-fi.patch |   42 --
 .../{poppler_0.22.3.bb => poppler_0.22.4.bb}       |    7 +-
 .../{xarchiver_0.5.2.bb => xarchiver_git.bb}       |   16 +-
 ...-period-to-be-set-at-250ms-resolution.-Pa.patch |   36 +
 .../genmon/xfce4-genmon-plugin_3.4.0.bb            |    2 +
 ...xkb-plugin_git.bb => xfce4-xkb-plugin_0.7.0.bb} |   13 +-
 .../{tumbler_0.1.27.bb => tumbler_0.1.29.bb}       |    6 +-
 ...shutdown-reboot-functionality-for-systemd.patch |  677 ++++++++++++++++++++
 .../xfce4-power-manager_1.2.0.bb                   |    9 +-
 ...-display-events-when-time-is-set-backward.patch |   33 +
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.1.bb       |    1 +
 30 files changed, 1038 insertions(+), 235 deletions(-)
 rename meta-gnome/recipes-connectivity/midori/{midori_0.5.0.bb => midori_0.5.2.bb} (89%)
 create mode 100644 meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
 create mode 100644 meta-oe/recipes-extended/polkit/files/50-org.freedesktop.NetworkManager.rules
 create mode 100644 meta-oe/recipes-extended/polkit/files/50-org.freedesktop.timedate1.rules
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/obsolete_automake_macros.patch
 create mode 100644 meta-oe/recipes-extended/polkit/polkit-group-rule-datetime.bb
 create mode 100644 meta-oe/recipes-extended/polkit/polkit-group-rule-network.bb
 create mode 100644 meta-oe/recipes-extended/polkit/polkit-group-rule.inc
 rename meta-oe/recipes-extended/polkit/{polkit-0.104 => polkit}/polkit-1_pam.patch (100%)
 rename meta-oe/recipes-extended/polkit/{polkit_0.104.bb => polkit_0.111.bb} (50%)
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0002-configure-check-only-for-ck-connector-in-case-consol.patch
 create mode 100644 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
 delete mode 100644 meta-oe/recipes-support/poppler/poppler/0001-splash-Splash.cc-add-cast-to-fix-build-for-enable-fi.patch
 rename meta-oe/recipes-support/poppler/{poppler_0.22.3.bb => poppler_0.22.4.bb} (80%)
 rename meta-xfce/recipes-apps/xarchiver/{xarchiver_0.5.2.bb => xarchiver_git.bb} (60%)
 create mode 100644 meta-xfce/recipes-panel-plugins/genmon/files/0001-Allow-timer-period-to-be-set-at-250ms-resolution.-Pa.patch
 rename meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_git.bb => xfce4-xkb-plugin_0.7.0.bb} (63%)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.27.bb => tumbler_0.1.29.bb} (84%)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-power-manager/files/0001-Add-shutdown-reboot-functionality-for-systemd.patch
 create mode 100644 meta-xfce/recipes-xfce/xfwm4/files/0001-don-t-block-display-events-when-time-is-set-backward.patch

-- 
1.7.4.4



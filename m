Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U2r7r-0002BC-6R
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 23:36:28 +0100
Received: by mail-ee0-f43.google.com with SMTP id c50so393979eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 14:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=BRJJt3yhyolTD5qAmHC+ZlgZO5CZwUl+O1SYn+o6z3w=;
	b=MiSye0J1lDTyTwzBjQpoQzuBhj7DNJsBEVAsBSv7KcZcuog8eqF0RAaxHaOuIjVQaT
	GX7qgXHms+od5FW82vUoPRFkLHIX4OrshuwZCPkUSjpc7OzgcNDHbsF2RY6mMm6W9zbf
	YTxiIb4HNV4uTslUTtOeZsDstfSrQ2kN1XGm233TOSOZUbdQ0+OdNe2dze/WprAIPYkZ
	b+/PfNQeo6Q0E4gaR+W4eUX1IRzFqAs+M6dWNqAIld60DHKn/JAgmXpQ0XQgWhNevVce
	Z7OACNi5aNhTmB6+AGodJKFHcyC1YhVzaYJUmNKde+JQ5jiMhmuMlcW4PiqbNCn3hA8b
	sKkA==
X-Received: by 10.14.213.7 with SMTP id z7mr89947355eeo.2.1360102836980;
	Tue, 05 Feb 2013 14:20:36 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id q5sm33901931eep.11.2013.02.05.14.20.35
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 14:20:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Feb 2013 23:18:38 +0100
Message-Id: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe-meta-systemd 0/5] xinput-calibrator rework
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
X-List-Received-Date: Tue, 05 Feb 2013 22:36:29 -0000
X-List-Received-Date: Tue, 05 Feb 2013 22:36:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Implemented are 3 modes of invocation:
    1. udev/systemd
    2. /etc/xdg/autostart
    3. manual
  1/2 are selected upon DISTRO_FEATURES containing systemd or not

* The calibration is stored in /etc/X11/xorg.conf.d/99-<name-of-touchscreen>.conf
  Herby support for multiple touchsceen devices is prepared.

* The script detects upon parameter information how it was called and waits for
  xserver to come up / detect connected touchsceen devices. If no matching
  calibration file is found, the xinput_calibrator is called for this device.
  For systemd invocation the default display is choosen.

* For manual invocation and multiple touchscreen devices attached, the operator
  can select which device to calibrate interactively.

* Multiple touchscreen support is prepared - the following open issues are known:
  * Multiple touchscreens with same device name will get same calibration values.
    An unique device identifier could not be found yet.
  * systemd startup with multiple device cause multiple instances of
    xinput_calibrator being started without information for which device
    the calibration is performed.

* Many many tests were performed:
  2 automatic invocation types * (1st + 2nd startup) * (0, 1, 2 touchscreens)

* Other layers need alignment for pointercal removement. If accepted I can take
  care (this is NOT an extortion :)



The following changes since commit 4128325a4c87bcde6ac6ffe5dbf5d6d057ee4804:

  nodejs: export DESTDIR to fix build with dash (2013-02-05 11:05:51 +0100)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git xinput-calibrator

Andreas Müller (5):
      xinput-calibrator: update to latest git commit
      xinput-calibrator: Add --output-filename to store calibration to file
      xinput-calibrator: rework
      pointercal-xinput: remove
      xinput-calibrator: do not RDEPEND xterm

 .../pointercal-xinput/pointercal.xinput            |    1 -
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |   19 --
 ...er-output-filename-and-store-in-output_fi.patch |  248 ++++++++++++++++++++
 ...vent-timeout-exit-when-no-timeout-is-used.patch |   82 +++++++
 ...vdev-do-write-calibration-results-if-outp.patch |  164 +++++++++++++
 ...orgPrint-do-write-calibration-results-if-.patch |  156 ++++++++++++
 ...sbtouchscreen-overridde-default-file-name.patch |   50 ++++
 ...librator-destructors-virtual-to-fix-warni.patch |   64 +++++
 ...er-size-for-max-line-length-only-once-in-.patch |   77 ++++++
 .../99-xf86-xinput-calibrator.rules                |    6 +
 .../xinput-calibrator/xinput-calibrator@.service   |    8 +
 .../xinput_calibrator_pointercal2.sh               |  151 ++++++++++++
 .../xinput-calibrator/xinput-calibrator_git.bb     |   52 ++++-
 .../xinput-calibrator/xinput-calibrator.service    |   11 -
 .../xinput-calibrator_git.bbappend                 |   10 -
 15 files changed, 1046 insertions(+), 53 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-Add-parameter-output-filename-and-store-in-output_fi.patch
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-Prevent-timeout-exit-when-no-timeout-is-used.patch
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0002-CalibratorEvdev-do-write-calibration-results-if-outp.patch
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0003-CalibratorXorgPrint-do-write-calibration-results-if-.patch
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0004-CalibratorUsbtouchscreen-overridde-default-file-name.patch
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0005-Make-all-Calibrator-destructors-virtual-to-fix-warni.patch
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0006-Set-up-buffer-size-for-max-line-length-only-once-in-.patch
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/99-xf86-xinput-calibrator.rules
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator@.service
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput_calibrator_pointercal2.sh
 delete mode 100644 meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
 delete mode 100644 meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend

-- 
1.7.6.5




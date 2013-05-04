Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1UYZ9m-00047h-K7
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 May 2013 11:53:38 +0200
Received: by mail-wi0-f179.google.com with SMTP id l13so1275062wie.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 May 2013 02:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=5QwD45Gjr/fLGP7S59b63Ug2Ghhu7Y9UEICUE0u18Ms=;
	b=sC5uTV9O+KQmw8yCqHjMl6+mg+XjOBcmOZ/4TJgM+wollERIZXoEH5Av+ZwbbJaclJ
	pWmO9q9GFCjdtTd1K9fwvGtUWhSfYsfyoEN0eiyWbZ/DMsAb7/JroaF7vOmHD5Vn0dCX
	GOMIaawwzpFIWO8+FXgdpYSu5JwmYhSvi/2rROZkVZKemdahWxipmddINnN4042p7NrL
	LfZUmwfdl119n641Qh59WiN5lJcKDCIYEeXRAS9uauoXzTjXkuw3SW80rM5vx3zL3zLM
	7xNlbhYshCMI21uZzHyR+wziUoZmkwq242vra3ukXIPk+kJHM1b/eA3AYRO0y7nxuF5o
	Wu/A==
X-Received: by 10.194.71.241 with SMTP id y17mr17654307wju.31.1367660134327;
	Sat, 04 May 2013 02:35:34 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id ed20sm2150948wic.0.2013.05.04.02.35.32
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 04 May 2013 02:35:33 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 May 2013 10:35:12 +0100
Message-Id: <1367660117-19572-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.2.2
Subject: [meta-multimedia][PATCH 0/5] vlc: move to meta-multimedia and tidy up
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
X-List-Received-Date: Sat, 04 May 2013 09:53:49 -0000
X-List-Received-Date: Sat, 04 May 2013 09:53:49 -0000
X-List-Received-Date: Sat, 04 May 2013 09:53:49 -0000

Fixes all warnings and errors I could find when building vlc except for the
do_package failure I've previously discussed with Martin. That will be fixed by
a patch to qt4 in openembedded-core.

Builds correctly with ENTERPRISE_DISTRO=1. Also builds correctly with
ENTERPRISE_DISTRO=0 and LICENSE_FLAGS_WHITELIST="commercial". I've not had the
opportunity to test on real hardware as I've been working with console only
images so far. Currently building core-image-x11 and will see if I can use that
to test vlc.

Paul Barker (5):
  fluidsynth: fixed license name
  fluidsynth: added dependency on glib
  vlc: moved to meta-multimedia
  vlc: removed unrecognised configure options
  vlc: fix configure failures with ENTERPRISE_DISTRO=1

 .../recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb          |  4 ++--
 .../recipes-multimedia/vlc/libdvdcss_1.2.10.bb                 |  0
 {meta-oe => meta-multimedia}/recipes-multimedia/vlc/vlc.inc    | 10 +++++-----
 .../recipes-multimedia/vlc/vlc_1.1.11.bb                       |  0
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename {meta-oe => meta-multimedia}/recipes-multimedia/vlc/libdvdcss_1.2.10.bb (100%)
 rename {meta-oe => meta-multimedia}/recipes-multimedia/vlc/vlc.inc (90%)
 rename {meta-oe => meta-multimedia}/recipes-multimedia/vlc/vlc_1.1.11.bb (100%)

-- 
1.8.2.2




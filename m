Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 042A260781
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 19:39:31 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c41so1047047eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 12:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=8kTt1kB0+sRs24Xzs3Ap7AyBMNBuhm9oEppNkvopTAA=;
	b=pE5jK6Nil4jU/IrifkxEaWYnFIsuikDU/Zqcr9QaFGb1A1GtN3ojktJZNAuXm9jloj
	J6gBAP581q8V6etbcoJmXAWcqUmK50OHeaSDslspg9QiLsOF5F2TZLNTAlLYfENMVbTF
	lKc4+CXhhH7B5dJts3va+iBWfZ8LFpIrE/O5llAr0nwfyc94fPpmiOfdEvHBajWCibJe
	82fdDTX5ffYKIsfZLLkC6gFcG0gu9/FMB9ilhTSsbrVJOUJL2qnaAMKiV6+l2tSQCRwv
	1cHGEN7e3o51iDnsIiV8CY7V41FHJ5UWZsmdUUar4DUl56oDBpZy6+LwP8c9sk+qOybB
	ZX9Q==
X-Received: by 10.15.25.65 with SMTP id k41mr20173883eeu.36.1399491571909;
	Wed, 07 May 2014 12:39:31 -0700 (PDT)
Received: from localhost.localdomain (p5B0A08BA.dip0.t-ipconnect.de.
	[91.10.8.186])
	by mx.google.com with ESMTPSA id m8sm48389547eeg.11.2014.05.07.12.39.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 12:39:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 May 2014 21:39:13 +0200
Message-Id: <1399491557-3073-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/4] minor bugfixes & deterministic buildThe following changes since commit 55b09e522ca88c0c0b2dd7a36e4861a1cf6ca9c6:
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
X-List-Received-Date: Wed, 07 May 2014 19:39:33 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

  klcc_cross: move in target sysroot as crossscript (2014-05-04 11:41:12 +0100)

are available in the git repository at:

  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches

for you to fetch changes up to 8425b6f2a9169982f1849debc26d17d88a1ad43e:

  gimp: add DEPENDS and PACKAGECONFIG for help-browser (2014-05-07 21:32:04 +0200)

----------------------------------------------------------------
Andreas Müller (4):
      xfce4-settings: fix crash when no pointer device is connected
      xfce4-settings: add upower to DEPENDS
      xfce4-weather-plugin: add dbus-glib and upower to DEPENDS
      gimp: add DEPENDS and PACKAGECONFIG for help-browser

 meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb                                                                                     |  6 +++++-
 meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb                                                            |  2 +-
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch | 27 +++++++++++++++------------
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb                                                                      |  2 +-
 4 files changed, 22 insertions(+), 15 deletions(-)

-- 
1.8.3.1



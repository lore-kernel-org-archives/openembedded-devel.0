Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ucdpm-0006lC-9L
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 17:41:43 +0200
Received: by mail-ee0-f41.google.com with SMTP id d4so1180254eek.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 08:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=y06erNSvlaaNT/qJ3KgodIUZMvCs8HKEJm03MhcaGMc=;
	b=OB7syg0Orksv6iI3mxFPloX0fOT7e1c6qRc5gNiMoGSqVPpaT8J4uVBBQIHTGkiBpy
	B+3pi2ZCjfRK+LYWmTAYja/Gn+qmxPWpYqxi12Sn9GYnqkUcijiFczeL7SRp3uDGiNRY
	+/pBDxjTwTjiEVF5saxYZgXdkEvFU7KjUpzXOQgu82KBkXuopnA8DlxSvef8WgKOhpgK
	5XOf5cVM+jQko7RAzPiKAoU2dmURJRutMkFmQvKD+0F7OzMyzqrZQ3TpTTmcFnNq6ksj
	yd5gs/7bPzLEeBVrkmHneIAIBM7wsV+gBKBTjs6BUJ7SsdGxDxBHtH3zlc+1FNU1ppy/
	w9Tg==
X-Received: by 10.14.108.1 with SMTP id p1mr104945433eeg.31.1368631409661;
	Wed, 15 May 2013 08:23:29 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id t9sm4599519eeo.11.2013.05.15.08.23.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 15 May 2013 08:23:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 17:20:45 +0200
Message-Id: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-xfce 00/14] updates & minor fixes
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
X-List-Received-Date: Wed, 15 May 2013 15:41:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit fcc900a459a5331f51ca41dd5c63644c7ae4a29f:

  phpmyadmin: remove dependency on bash (2013-05-14 23:47:37 +0100)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git xfce-updates

Andreas Müller (14):
      thunar: update to 1.6.3
      thunar-plugin.bbclass: initial add
      thunar-archive-plugin: initial add 0.3.1
      xarchiver: align libexecdir so that thunar-archive-plugin finds tap files
      thunar-media-tags-plugin: initial add 0.2.1
      packagegroup-xfce-extended: add thunar plugins
      xfwm4: update to 4.10.1
      xfce4-terminal: update to 0.6.2
      xfce4-panel: update to 4.10.1
      garcon: update to 0.2.1
      garcon: do not display settings in menu which are in settings-manager
      libxfce4util: update to 4.10.0
      xfce4-session: update to 4.10.1
      xfce4-appfinder: update to 4.10.1

 meta-xfce/classes/thunar-plugin.bbclass            |   10 +
 .../recipes-apps/xarchiver/xarchiver_0.5.2.bb      |    7 +-
 ...4-terminal_0.6.1.bb => xfce4-terminal_0.6.2.bb} |    4 +-
 .../archive/thunar-archive-plugin_0.3.1.bb         |   12 +
 .../media-tags/thunar-media-tags-plugin_0.2.1.bb   |   11 +
 ...ations.menu-don-t-bloat-settings-menu-by-.patch |   35 ++
 .../garcon/{garcon_0.2.0.bb => garcon_0.2.1.bb}    |    6 +-
 ...bxfce4util_4.10.0.bb => libxfce4util_4.10.1.bb} |    4 +-
 .../packagegroups/packagegroup-xfce-extended.bb    |    5 +-
 .../thunar/{thunar_1.6.2.bb => thunar_1.6.3.bb}    |    5 +-
 ...pfinder_4.10.0.bb => xfce4-appfinder_4.10.1.bb} |    4 +-
 ...xfce4-panel_4.10.0.bb => xfce4-panel_4.10.1.bb} |    4 +-
 ...n-reboot-functionality-for-systemd-bug-87.patch |  482 --------------------
 ...ultiple-interactive-session-save-bug-5379.patch |  152 ------
 ...1-configure.in-hard-code-path-to-iceauth.patch} |   10 +-
 .../0002-Remove-gnome-keyring-remains.patch        |   82 ----
 ...4-session_4.10.0.bb => xfce4-session_4.10.1.bb} |   11 +-
 .../xfwm4/{xfwm4_4.10.0.bb => xfwm4_4.10.1.bb}     |    4 +-
 18 files changed, 103 insertions(+), 745 deletions(-)
 create mode 100644 meta-xfce/classes/thunar-plugin.bbclass
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.6.1.bb => xfce4-terminal_0.6.2.bb} (68%)
 create mode 100644 meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.3.1.bb
 create mode 100644 meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.2.1.bb
 create mode 100644 meta-xfce/recipes-xfce/garcon/files/0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.2.0.bb => garcon_0.2.1.bb} (53%)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.10.0.bb => libxfce4util_4.10.1.bb} (62%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.2.bb => thunar_1.6.3.bb} (85%)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.10.0.bb => xfce4-appfinder_4.10.1.bb} (62%)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.10.0.bb => xfce4-panel_4.10.1.bb} (88%)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-Handle-multiple-interactive-session-save-bug-5379.patch
 rename meta-xfce/recipes-xfce/xfce4-session/xfce4-session/{0003-configure.in-hard-code-path-to-iceauth.patch => 0001-configure.in-hard-code-path-to-iceauth.patch} (87%)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0002-Remove-gnome-keyring-remains.patch
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.10.0.bb => xfce4-session_4.10.1.bb} (71%)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.10.0.bb => xfwm4_4.10.1.bb} (85%)

-- 
1.7.6.5




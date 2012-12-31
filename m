Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TpjE7-0005we-1u
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Dec 2012 18:32:53 +0100
Received: by mail-ee0-f49.google.com with SMTP id c4so6158652eek.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Dec 2012 09:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=sig3bKgdZotxw+5bJ+tXJg3+S7MkPvJXafuaDzbnOOY=;
	b=XjyepP7HaP5eKJi4LE1W/E/Wn9z6uPk1tfUQMS5ypKMhx6iWHfQQElF7LfeFMRvn66
	5ZyzMl7ciPZdunHPNcHsOEKYcPDLX3wlq6w1ufeaM4NnGsU2ju42FIQEVJdL40iKD+0p
	+QbJl57hH0cJNjX1bXgCzhHEfYJ/PiWXuh+HONxlMcMgdXnxmUElJF35s/Pi/MNoYyvF
	mzjKBs7xJod90PC9t8H9HFoPKjlSTueQN2QKGJBUAWrWCh+0GhNXhlernM3ZEs+A7C9s
	DdTbu8R3/V2980m4niIWLK0eCkJjWWkwSDAoZxznT6n4w0QPj+15GdHBSSLdvzhpnGC0
	DjdA==
X-Received: by 10.14.205.199 with SMTP id j47mr111554441eeo.26.1356974259285; 
	Mon, 31 Dec 2012 09:17:39 -0800 (PST)
Received: from localhost.localdomain (p5B0A1BD4.dip.t-dialin.net.
	[91.10.27.212])
	by mx.google.com with ESMTPS id 46sm86204729eeg.4.2012.12.31.09.17.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Dec 2012 09:17:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Dec 2012 18:17:15 +0100
Message-Id: <1356974245-3497-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 00/10] various updates
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
X-List-Received-Date: Mon, 31 Dec 2012 17:33:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 1de21e56eeefdcfe4972900cf9f651ba1d8c9f0b:

  imagemagick: disable opencl (2012-12-27 16:14:23 +0100)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches

Andreas Müller (10):
      exo: update to 0.10.1
      tumbler: update to 0.1.26
      thunar: update to 1.6.2
      xfce4-terminal: update to 0.6.0
      packagegroup-xfce-base: xfce-terminal -> xfce4-terminal
      mousepad: initial add 0.3.0
      xfce4-mixer: update to 4.10.0
      xfce4-places-plugin: update to 1.5.0
      midori: update to 0.4.7
      xfce4-session: fix build on X11-less hosts

 .../midori/{midori_0.4.6.bb => midori_0.4.7.bb}    |    7 +--
 meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb  |   10 +++++
 .../xfce-terminal/xfce-terminal_0.4.8.bb           |   20 ----------
 ...{xfce4-mixer_4.8.0.bb => xfce4-mixer_4.10.0.bb} |    6 +-
 .../xfce4-terminal/xfce4-terminal_0.6.0.bb         |   12 ++++++
 ...lugin_1.4.0.bb => xfce4-places-plugin_1.5.0.bb} |    4 +-
 meta-xfce/recipes-xfce/exo/exo/configure.patch     |    4 +-
 .../exo/{exo_0.8.0.bb => exo_0.10.2.bb}            |    4 +-
 .../packagegroups/packagegroup-xfce-base.bb        |    4 +-
 .../thunar/{thunar_1.4.0.bb => thunar_1.6.2.bb}    |    5 +-
 .../{tumbler_0.1.25.bb => tumbler_0.1.26.bb}       |    4 +-
 ...03-configure.in-hard-code-path-to-iceauth.patch |   40 ++++++++++++++++++++
 .../xfce4-session/xfce4-session_4.10.0.bb          |    6 ++-
 13 files changed, 83 insertions(+), 43 deletions(-)
 rename meta-gnome/recipes-connectivity/midori/{midori_0.4.6.bb => midori_0.4.7.bb} (86%)
 create mode 100644 meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb
 delete mode 100644 meta-xfce/recipes-apps/xfce-terminal/xfce-terminal_0.4.8.bb
 rename meta-xfce/recipes-apps/xfce4-mixer/{xfce4-mixer_4.8.0.bb => xfce4-mixer_4.10.0.bb} (53%)
 create mode 100644 meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.0.bb
 rename meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.4.0.bb => xfce4-places-plugin_1.5.0.bb} (68%)
 rename meta-xfce/recipes-xfce/exo/{exo_0.8.0.bb => exo_0.10.2.bb} (87%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.4.0.bb => thunar_1.6.2.bb} (84%)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.25.bb => tumbler_0.1.26.bb} (89%)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-session/files/0003-configure.in-hard-code-path-to-iceauth.patch

-- 
1.7.4.4




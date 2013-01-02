Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TqQHv-0000Xm-W2
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 16:31:28 +0100
Received: by mail-ee0-f44.google.com with SMTP id b47so6860858eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 07:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=0DyxUg91t7731fDx4TVIQjxIAl1qDEqLzxnfhtrjiQo=;
	b=ragfm93FC3GDCzgJ+WfZp1a3I6sLAfxVXxUcy7d1/UiNTgniU8MZ1Xjr9JsHXN1NI3
	mDhVqzTOh7/d/xPO+EgXfXAxSriyGy/DrZlFp8Nu1VXr0IgoTtfhVl7fckUYdXOk60hw
	gZjAygFUTwv/ZJNacOkatWrIJNRx+EfK/9dISWcj3XV8LjI7WmtY1nYnqxhZBiG/MN3L
	+LYV7Ke9eC4eiBii6S3Xu5SUj2PdoHaFEcLjeIsaRpRjC+7vdYBubqFvT+eTOwgwRMPF
	j6bfSM99TPtf8woANeKoDlgx1yTXSSH9kUQCx666UWBb4rJLWR3OE4TDUPd/jjCK2RkG
	mKdw==
X-Received: by 10.14.3.195 with SMTP id 43mr125829563eeh.36.1357139785558;
	Wed, 02 Jan 2013 07:16:25 -0800 (PST)
Received: from localhost.localdomain (p4FDF1C58.dip.t-dialin.net.
	[79.223.28.88])
	by mx.google.com with ESMTPS id b2sm98071345eep.9.2013.01.02.07.16.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 07:16:24 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 16:16:04 +0100
Message-Id: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome/V2 00/10] various updates
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
X-List-Received-Date: Wed, 02 Jan 2013 15:31:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1->V2:

* mousepad: add gtksourceview2 to depends
* exo: correct version 0.10.2 in commit message
* xfce4-terminal: V1 was 0.6.0 / V2 is 0.6.1

All patches were built from scratch and run tested on gumstix overo

The following changes since commit 1de21e56eeefdcfe4972900cf9f651ba1d8c9f0b:

  imagemagick: disable opencl (2012-12-27 16:14:23 +0100)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches

Andreas Müller (10):
      exo: update to 0.10.2
      tumbler: update to 0.1.26
      thunar: update to 1.6.2
      xfce4-terminal: update to 0.6.1
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
 .../xfce4-terminal/xfce4-terminal_0.6.1.bb         |   12 ++++++
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
 create mode 100644 meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.1.bb
 rename meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.4.0.bb => xfce4-places-plugin_1.5.0.bb} (68%)
 rename meta-xfce/recipes-xfce/exo/{exo_0.8.0.bb => exo_0.10.2.bb} (87%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.4.0.bb => thunar_1.6.2.bb} (84%)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.25.bb => tumbler_0.1.26.bb} (89%)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-session/files/0003-configure.in-hard-code-path-to-iceauth.patch

-- 
1.7.4.4




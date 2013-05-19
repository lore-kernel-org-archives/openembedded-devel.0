Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ue17W-00004z-32
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 12:45:42 +0200
Received: by mail-ee0-f42.google.com with SMTP id c50so3523911eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2013 03:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=aC7y/f5KOBD1qjPks7MFTJnsfcDcCKpQlBeNATLsNMg=;
	b=OSb+zqDwgcZFrdWPoewe/TIyoSxPvUeD2BtHJekjXZhWv2sSVtfwJX7lBou7Sq4UHa
	hMi9886/LoeD4pFfKBI0i4BhqK3LTcZdDq41eJNbTDOOvMguZXEmstZ+Q8R8VaG23rIy
	RWLZtClJG9YqwI3WIKwwQO0OYptFeDbbCRa18+wGxK7FeUS3VzCWOAUnSMjd+IXTTh42
	k3AMmZjky2G4jBI6gdKJCNLL9sDzm39xG48SbndhOUJQH+P49ivvej4aqXakOHXvImYD
	wcCuw2s5h9zTKXweS7CfMab7wptLYYFa6INGEOb/zJKnxrjUkEXlGLXwF5zSg0ypFQM9
	53zQ==
X-Received: by 10.14.87.9 with SMTP id x9mr20541935eee.3.1368959243813;
	Sun, 19 May 2013 03:27:23 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0719.dip0.t-ipconnect.de.
	[79.223.7.25])
	by mx.google.com with ESMTPSA id y10sm30762169eev.3.2013.05.19.03.27.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 03:27:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 May 2013 12:27:02 +0200
Message-Id: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe++/master 00/11] fixes and updates
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
X-List-Received-Date: Sun, 19 May 2013 10:45:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 22100f5b136e1be268055f4da14c39d7a32e9023:

  dmidecode: remove (2013-05-19 09:37:34 +0200)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git updates-and-fixes

Andreas Müller (11):
      mm-common: update to 0.9.6
      libsigc++-2.0: update to 2.2.11
      glibmm: merge glibmm.inc into recipe - and stylize a bit
      glibmm: update to 2.36.2
      pangomm: update to 2.34.0
      gtkmm: merge gtkmm.inc into recipe - and cleanup a bit
      atkmm: initial add 2.22.7
      gtkmm: update to 2.24.3
      gtkhtml2: fix build with glib 2.36
      evince: fix build with gcc 4.8
      gnome-system-monitor: fix build after gtkmm update

 .../evince/0001-tiff-fix-compile-warning.patch     |   33 +++++++++++++
 meta-gnome/recipes-gnome/evince/evince_2.32.0.bb   |    7 ++-
 ...0002-src-procman.cpp-include-main-gtkmm.h.patch |   49 ++++++++++++++++++++
 .../gnome-system-monitor_2.28.2.bb                 |    7 ++-
 .../recipes-core/glib-2.0/glibmm/glib-2.32.patch   |   10 ----
 meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb     |    9 ----
 .../glib-2.0/{glibmm.inc => glibmm_2.36.2.bb}      |   15 +++---
 ...sigc++-2.0_2.2.9.bb => libsigc++-2.0_2.2.11.bb} |    6 +-
 meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb  |   10 ----
 meta-oe/recipes-core/mm-common/mm-common_0.9.6.bb  |   12 +++++
 meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb          |   19 ++++++++
 meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb         |    7 ---
 .../gtk+/{gtkmm.inc => gtkmm_2.24.3.bb}            |   19 ++------
 ...001-tests-main.c-fix-build-with-glib-2.36.patch |   32 +++++++++++++
 meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb     |    3 +-
 .../pango/{pangomm_2.28.2.bb => pangomm_2.34.0.bb} |    8 +--
 16 files changed, 176 insertions(+), 70 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-tiff-fix-compile-warning.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-system-monitor/files/0002-src-procman.cpp-include-main-gtkmm.h.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glibmm/glib-2.32.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
 rename meta-oe/recipes-core/glib-2.0/{glibmm.inc => glibmm_2.36.2.bb} (75%)
 rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-2.0_2.2.9.bb => libsigc++-2.0_2.2.11.bb} (70%)
 delete mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb
 create mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.6.bb
 create mode 100644 meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb
 delete mode 100644 meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb
 rename meta-oe/recipes-gnome/gtk+/{gtkmm.inc => gtkmm_2.24.3.bb} (53%)
 create mode 100644 meta-oe/recipes-gnome/gtkhtml2/files/0001-tests-main.c-fix-build-with-glib-2.36.patch
 rename meta-oe/recipes-graphics/pango/{pangomm_2.28.2.bb => pangomm_2.34.0.bb} (76%)

-- 
1.7.4.4




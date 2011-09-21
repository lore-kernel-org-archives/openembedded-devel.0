Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R6G44-0002ha-KM
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 08:13:48 +0200
Received: (qmail invoked by alias); 21 Sep 2011 06:08:29 -0000
Received: from p4FDF1C6D.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.28.109]
	by mail.gmx.net (mp011) with SMTP; 21 Sep 2011 08:08:29 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/cpHRXoIDcDK+gpUc0b6R8ZVYBibMcmsHZi1BHzy
	h3bDzEe9pWhZEI
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Sep 2011 08:11:49 +0200
Message-Id: <1316585520-18605-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 00/11] various updates
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
X-List-Received-Date: Wed, 21 Sep 2011 06:13:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* xfce4-dev-tools mainly contain autoconf extensions -> native
* bump to latest mainline versions
* xfce4-notifyd added

The recipes were build tested and run tested on overo.

Andreas Müller (11):
  xfce4-dev-tools: add native support
  garcon: DEPENDS xfce4-dev-tools -> xfce4-dev-tools-native
  libxfce4util: DEPENDS xfce4-dev-tools -> xfce4-dev-tools-native
  xfce-utils: add openssh-misc to RDEPENDS_${PN}
  xfce4-session: Bump to version 4.8.2
  garcon: Bump to version 0.1.9
  libxfce4util: Bump to version 4.8.2
  gtk-xfce-engine: Bump to version 2.9.0 & minor cleanup
  xfdesktop: Bump to version 4.8.3 & recreate patch
  xfce4-notifyd: Add initial recipe with version 0.2.2
  task-xfce-base: add xfce4-notifyd

 .../xfce4-notifyd/xfce4-notifyd_0.2.2.bb           |   21 ++++++++++++++++++++
 .../garcon/{garcon_0.1.8.bb => garcon_0.1.9.bb}    |    6 ++--
 ...ce-engine_2.8.1.bb => gtk-xfce-engine_2.9.0.bb} |    7 +++--
 ...libxfce4util_4.8.1.bb => libxfce4util_4.8.2.bb} |    6 ++--
 meta-xfce/recipes-xfce/tasks/task-xfce-base.bb     |    2 +
 .../recipes-xfce/xfce-utils/xfce-utils_4.8.2.bb    |    4 +-
 .../xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb       |    7 +++++-
 .../xfce4-session/relative-symlinks-docs.patch     |   11 ----------
 ...ce4-session_4.8.1.bb => xfce4-session_4.8.2.bb} |    9 +------
 .../xfdesktop/relative-symlinks-docs.patch         |   11 ++++++---
 .../{xfdesktop_4.8.2.bb => xfdesktop_4.8.3.bb}     |    4 +-
 11 files changed, 52 insertions(+), 36 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.1.8.bb => garcon_0.1.9.bb} (52%)
 rename meta-xfce/recipes-xfce/gtk-xfce-engine/{gtk-xfce-engine_2.8.1.bb => gtk-xfce-engine_2.9.0.bb} (60%)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.8.1.bb => libxfce4util_4.8.2.bb} (53%)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/relative-symlinks-docs.patch
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.8.1.bb => xfce4-session_4.8.2.bb} (77%)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.8.2.bb => xfdesktop_4.8.3.bb} (73%)

-- 
1.7.4.4




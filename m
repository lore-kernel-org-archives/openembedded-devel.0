Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RKTsc-0001H8-QL
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Oct 2011 12:48:47 +0100
Received: (qmail invoked by alias); 30 Oct 2011 11:42:39 -0000
Received: from p4FDF1C25.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.28.37]
	by mail.gmx.net (mp068) with SMTP; 30 Oct 2011 12:42:39 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+yy5EjGmWya6IEEqDyJsR8F4IdcRbuOiSIZeARGP
	za1UR3sjh4VpLL
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Oct 2011 12:47:18 +0100
Message-Id: <1319975241-10849-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce][V2 0/3] update ristretto & add xfce4-eyes-plugin
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
X-List-Received-Date: Sun, 30 Oct 2011 11:48:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1 -> V2: ristretto 0.2.1 -> 0.2.2 (mainline fix for wide images [1])

[1] http://mail.xfce.org/pipermail/xfce/2011-October/029380.html
Andreas Müller (3):
  xfce-app.bbclass: just set SRC_URI commmon to most xfce-apps
  ristretto: update to 0.2.2
  xfce4-eyes-plugin: initial add 4.4.1

 meta-xfce/classes/xfce-app.bbclass                 |    4 +
 .../{ristretto_0.1.1.bb => ristretto_0.2.2.bb}     |   10 +--
 .../xfce4-notifyd/xfce4-notifyd_0.2.2.bb           |    5 +-
 .../xfce4-screenshooter_1.8.0.bb                   |    7 +--
 .../eyes/files/port-to-libxfce4ui.patch            |   68 ++++++++++++++++++++
 .../eyes/xfce4-eyes-plugin_4.4.1.bb                |   13 ++++
 6 files changed, 90 insertions(+), 17 deletions(-)
 create mode 100644 meta-xfce/classes/xfce-app.bbclass
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.1.1.bb => ristretto_0.2.2.bb} (51%)
 create mode 100644 meta-xfce/recipes-panel-plugins/eyes/files/port-to-libxfce4ui.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.1.bb

-- 
1.7.4.4




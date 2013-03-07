Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UDZWS-00019t-9J
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 13:02:08 +0100
Received: by mail-ee0-f54.google.com with SMTP id c41so228026eek.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 03:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=qxxIRNlE5qIuiVgXYy7SFwiVsTb7sXdQF0Vi1LtsRsw=;
	b=ZGA/56cClHj3Ce4cJJtDvSuEPqb3QFLKJyi1jAnAaMIQXJH04oT/btcEpV9i2bBBji
	0bjOWqxCteDSwdPikX5x53Mn1LRzAd8sYdbWS4Nr6WTxPLsGH+D266m2CKuaVJXKr7Y6
	k4D+Foi8d/qi+ymrPsWcxIP7uzdKefj7sK7ba9+4S321Bbr8ccCvejDLu2ugCLb6YDKm
	Lh6FOnMR4Bm8DOz1vJtZDwfzKrxhVsjxANwtj7+aGuwH0zTveU/RTkNYVIJpftvhuv7E
	HaCm9WWTlrvUwngI3M0HrJTfKZ5HafK3k/kV+RjiP5JoaLlnpS58vumw9EJcY93xq4pq
	hPMg==
X-Received: by 10.14.193.134 with SMTP id k6mr3180702een.37.1362656736330;
	Thu, 07 Mar 2013 03:45:36 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id q42sm1778870eem.14.2013.03.07.03.45.34
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 03:45:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2013 12:43:29 +0100
Message-Id: <1362656613-10357-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce/meta-gnome 0/4] updates/bugfix-world
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
X-List-Received-Date: Thu, 07 Mar 2013 12:02:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 230e2171d07815f51d5b6d044627afa0ff13c5d4:

  gpsd: fix udev rules file (2013-03-06 06:05:35 +0100)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches

Andreas Müller (4):
      midori: update to 0.4.8
      geany: fix build on perl-less machines
      xfce4-eyes-plugin: update to 4.4.2
      xfce4-vala: initial add 4.10.2

 .../midori/{midori_0.4.7.bb => midori_0.4.8.bb}    |    8 +-
 meta-oe/recipes-devtools/geany/geany_1.22.bb       |    4 +-
 .../vala/files/0001-align-vapi-dir.patch           |   39 +++++++++++
 .../recipes-bindings/vala/xfce4-vala_4.10.2.bb     |   17 +++++
 .../eyes/files/port-to-libxfce4ui.patch            |   68 --------------------
 .../eyes/xfce4-eyes-plugin_4.4.1.bb                |   13 ----
 .../eyes/xfce4-eyes-plugin_4.4.2.bb                |   11 +++
 7 files changed, 73 insertions(+), 87 deletions(-)
 rename meta-gnome/recipes-connectivity/midori/{midori_0.4.7.bb => midori_0.4.8.bb} (84%)
 create mode 100644 meta-xfce/recipes-bindings/vala/files/0001-align-vapi-dir.patch
 create mode 100644 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.2.bb
 delete mode 100644 meta-xfce/recipes-panel-plugins/eyes/files/port-to-libxfce4ui.patch
 delete mode 100644 meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.1.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.2.bb

-- 
1.7.6.5




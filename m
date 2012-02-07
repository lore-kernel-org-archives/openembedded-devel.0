Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RumtH-0003dN-Tn
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:23:31 +0100
Received: by eekd41 with SMTP id d41so2181828eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=W0Xqg4+obOhDrjgtKGfssi2i0aICGFDzdEICsIAZgME=;
	b=T+WDhp3soootLtFMtPDUyrzS3eDk47ja3W0cpr8sFG68zRqik2aG5VV0zgPnJs4dS2
	N2ai5g/b2temIAeU6pS2/25rfDmtqBFAAQEaYgoHwbBeVjOlFIIZ+KqfraSM4fWl+GC6
	DWc1e2/ztK+ApXAoQ6O8KeO/fqpFlpjKZoPuY=
Received: by 10.14.99.69 with SMTP id w45mr5182102eef.33.1328627729279;
	Tue, 07 Feb 2012 07:15:29 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id z47sm66752182eeh.9.2012.02.07.07.15.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:15:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: angstrom-distro-devel@linuxtogo.org
Date: Tue,  7 Feb 2012 16:15:28 +0100
Message-Id: <1328627734-5293-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-angstrom][RFC 0/6] systemd / initmanager rework
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
X-List-Received-Date: Tue, 07 Feb 2012 15:23:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the meta-angstrom part of the systemd / initmanager rework.

The whole series' can be found at (branches 'systemd'
meta-oe: git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded-systemd.git
meta-angstrom: git://gitorious.org/schnitzeltony-oe-meta/meta-angstrom-systemd.git

Andreas Müller (6):
  led-config: pack systemd support in ${PN}-systemd / remove unneeded
    systemd code
  timestamp-service: pack systemd support in ${PN}-systemd / remove
    unneeded systemd code
  angstrom-task-gnome: replace gdm-systemd by gdm
  xfce-nm-image: remove gdm-systemd - systemd.bbclass takes care
  systemd-image: remove connman-systemd / remove IMAGE_INIT_MANAGER
  angstrom-core-tweaks.inc: remove IMAGE_INIT_MANAGER

 conf/distro/include/angstrom-core-tweaks.inc  |    1 -
 recipes-angstrom/tasks/angstrom-task-gnome.bb |    4 ++--
 recipes-core/leds/led-config.bb               |   10 +++-------
 recipes-core/systemd/timestamp-service.bb     |   12 ++++--------
 recipes-images/angstrom/systemd-image.bb      |    4 ++--
 recipes-images/angstrom/xfce-nm-image.bb      |    2 +-
 6 files changed, 12 insertions(+), 21 deletions(-)

-- 
1.7.6.4




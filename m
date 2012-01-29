Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RrcQU-0005Wr-9p
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Jan 2012 22:36:42 +0100
Received: by eekd41 with SMTP id d41so997210eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jan 2012 13:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=yt9GpJzZYEOWv9j3vYMm1bzdO/IoArhH3vvZptTfvp4=;
	b=TSylh1DD7LSQXkIRb6xWNXPxG2gxfQmpW41uig/FFpvDXPrQt1C9Sn4l2GWgQ4OmCL
	6WxVKJdulgMCiJZfRocljLsNab04fF4j5GQAnDz/MNSjT23QUU9qqNKZ2akrc8XFASJR
	zt2NC4qN7KbDDts+KICdQwsuRu9eoppuluXHw=
Received: by 10.14.39.196 with SMTP id d44mr4575074eeb.108.1327872530537;
	Sun, 29 Jan 2012 13:28:50 -0800 (PST)
Received: from localhost.localdomain (p4FDF017C.dip.t-dialin.net.
	[79.223.1.124])
	by mx.google.com with ESMTPS id n17sm63740491eei.3.2012.01.29.13.28.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jan 2012 13:28:50 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Jan 2012 22:30:54 +0100
Message-Id: <1327872658-3574-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-xfce][v2 0/4] updates
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
X-List-Received-Date: Sun, 29 Jan 2012 21:36:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v1 -> v2: Fix typo in xfce4-genmon-plugin patch

Andreas Müller (4):
  README: Changed email address
  xfce4-genmon-plugin: initial add 3.3.1
  task-xfce-extended: add xfce4-genmon-plugin
  ristretto: update to 0.3.4

 meta-xfce/README                                   |    2 +-
 .../{ristretto_0.3.2.bb => ristretto_0.3.4.bb}     |    4 +-
 .../genmon/files/port-to-libxfce4ui.patch          |  150 ++++++++++++++++++++
 .../genmon/xfce4-genmon-plugin_3.3.1.bb            |   11 ++
 meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb |    3 +
 5 files changed, 167 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.3.2.bb => ristretto_0.3.4.bb} (70%)
 create mode 100644 meta-xfce/recipes-panel-plugins/genmon/files/port-to-libxfce4ui.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.3.1.bb

-- 
1.7.4.4




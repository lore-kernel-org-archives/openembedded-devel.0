Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QOVGL-0000kq-Jz
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 15:33:37 +0200
Received: by gwb11 with SMTP id 11so2199777gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2011 06:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=jQQOzWLQzxkM5E1J6xlNEMUNyt2c+er7LbcNOS00kFw=;
	b=TAGBrvvyikFKoGJKG5Y8G3xdWiseRvgfqxaZfxVqpmVtdFZANGxcxHkXGbdpkxEC/M
	oKojb6XTtLQllf7Oq3YGtUoGNmE9AJlv3VmmeZQPI6AOOq9Uu4xB8R1jV3hl157teqs2
	gfwtQHS8fonGfVsEkLoNmeTpPMyKcLOk0eLxU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=PiRg7UfUcPbMTrpn1IOThD8oJkq3Fq+10y3qvQx6mI2kC7lUBqb+JRrPaJ6B/Js9hH
	xb/K9Jhk9BBxz/Hn6+lOLiO/jcIoTmQ/KntAw8FPCX3EnHi6yVAYZVG1ytnk4i6bNV4A
	iWLRpLkzmKBnduZpWbFSG1rVylV6QRK65mURk=
Received: by 10.151.79.14 with SMTP id g14mr2783879ybl.187.1306157436804;
	Mon, 23 May 2011 06:30:36 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q29sm2723749yba.17.2011.05.23.06.30.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 May 2011 06:30:35 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 May 2011 13:30:20 +0000
Message-Id: <cover.1306157341.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 0/4] Pull request with udev changes from O.S. Systems tree
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
X-List-Received-Date: Mon, 23 May 2011 13:33:37 -0000

The following changes since commit c6b34871dc0fdd3c1e6a24f2a635505deaa28b20:

  freerdp: fix homepage field (2011-05-21 08:27:10 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe.git master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (4):
  udev: fix init script indenting
  udev: fix action used during startup
  udev: remove udev.inc since it was not being in use
  udev: move ConsoleKit files to udev-consolekit

 meta-oe/recipes-core/udev/udev.inc    |  101 ---------------------------------
 meta-oe/recipes-core/udev/udev/init   |   44 +++++++-------
 meta-oe/recipes-core/udev/udev_168.bb |    9 ++-
 3 files changed, 29 insertions(+), 125 deletions(-)
 delete mode 100644 meta-oe/recipes-core/udev/udev.inc

-- 
1.7.2.5




Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TyryL-0007by-VY
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 23:42:10 +0100
Received: by mail-ea0-f181.google.com with SMTP id i13so362746eaa.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 14:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=K6UFXXjQscNzEyKuUGGpRa15ZI669FeerXujPOr6jEw=;
	b=SFkPqFv40VqCffWOk6ll1tWuzsbLO+tEDh82z9Lsnf9wlTNGOvQ9+6PakY/4qyz3s0
	NkVI748LpfOkxp06F3NkcKrIhRUwYEVw4qrv/JSumUtiMv4luvpqUO3dBMe7UNmkBmE6
	60FLgSHqd1Cgqdvmg2x4dCQPVIXdpX15uREdb1HxxOFZeaHr9jqLPw1e9+WWZJVbnkxV
	2I2LOXnLkT44ttDhLkIENQcsjIvEBGVyq2NTqMxJ3RbZgYmIfJn59+gRXjE42zWXDAmg
	55Rw2lqpQgwGjpk+d3Ig1F3ppR6V/5puYOW9nh3+f9cdJdc2FCPxPsXynGLYn2PQLiEq
	ZaOg==
X-Received: by 10.14.207.195 with SMTP id n43mr22459843eeo.38.1359152795224;
	Fri, 25 Jan 2013 14:26:35 -0800 (PST)
Received: from localhost.localdomain (p5B0A1952.dip.t-dialin.net.
	[91.10.25.82])
	by mx.google.com with ESMTPS id k4sm3566723eep.15.2013.01.25.14.26.33
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 14:26:34 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2013 23:26:17 +0100
Message-Id: <1359152782-23743-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe/meta-systemd/V2 0/5] various patches
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
X-List-Received-Date: Fri, 25 Jan 2013 22:42:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1->V2: thunar remove RDEPENDS_${PN} = "eglibc-charmaps"

The following changes since commit b7ff6ac09affebe72b7587d7e345adaae427ef3d:

  autofs: fails to compile with openldap disabled (2013-01-24 10:35:49 -0500)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches

Andreas Müller (5):
      thunar: add RRECOMMENDS and RDEPENDS to ensure full functionality
      tumbler: update to 0.1.27
      daemonize: initial add 1.73+
      geany: initial add 1.22
      lxdm: disable screensaver by default when starting X

 meta-oe/recipes-devtools/geany/geany_1.22.bb       |   13 +++++++++++++
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |    5 +++--
 meta-oe/recipes-support/daemonize/daemonize_git.bb |   12 ++++++++++++
 meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb      |    3 +++
 .../{tumbler_0.1.26.bb => tumbler_0.1.27.bb}       |    4 ++--
 5 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/geany/geany_1.22.bb
 create mode 100644 meta-oe/recipes-support/daemonize/daemonize_git.bb
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.26.bb => tumbler_0.1.27.bb} (89%)

-- 
1.7.4.4




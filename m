Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tyi31-00034t-9z
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 13:06:19 +0100
Received: by mail-ea0-f178.google.com with SMTP id a14so126303eaa.23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 03:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=QpRgjiRXFYFZz4F6dPk1Ch7lEHuh7T3wti/6MkXTBTc=;
	b=JED1UnwhjxWzFvTzMcgrD3tDSZC0z37l/FF9jMd9Z1fgVx7M84lSWTvWA7bWphDrkk
	eED8QxpG5HbocDIlbcr+VGYBgx2jJdwBYUvmMZTFW1I4snuFBmPoZl92Psg/Y2+mFSOf
	Ity3EesrP4i96c360TdwYyS0KiqHBE5Y5YZqkD/g6oZ+P88teTrZv0wTuiXgKnm3//y8
	rqc7bKyLD8mEmOTsQmkel+6h4+fJycXbAL6iHtZp4wzrtz/3JACTr20WqnOtr2uAwGYA
	wUPwuDT4LvoDJ7cxUu45raq5YH0nnnamASBU6aKzAg5M4cD91iW9Gj7r+Csr+HUfFOKL
	+UuQ==
X-Received: by 10.14.225.133 with SMTP id z5mr17341825eep.15.1359114645255;
	Fri, 25 Jan 2013 03:50:45 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id f6sm1244955eeo.7.2013.01.25.03.50.43
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 03:50:44 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2013 12:48:51 +0100
Message-Id: <1359114536-3823-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe/meta-systemd 0/5] various patches
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
X-List-Received-Date: Fri, 25 Jan 2013 12:06:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
 meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb      |    5 +++++
 .../{tumbler_0.1.26.bb => tumbler_0.1.27.bb}       |    4 ++--
 5 files changed, 35 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/geany/geany_1.22.bb
 create mode 100644 meta-oe/recipes-support/daemonize/daemonize_git.bb
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.26.bb => tumbler_0.1.27.bb} (89%)

-- 
1.7.6.5




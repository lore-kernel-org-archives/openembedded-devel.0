Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0ift-0007Mx-V5
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 01:06:14 +0100
Received: by eekd41 with SMTP id d41so861176eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 15:57:52 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.47.8 as permitted sender) client-ip=10.14.47.8; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.47.8 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.47.8])
	by 10.14.47.8 with SMTP id s8mr2057297eeb.91.1330041472159 (num_hops =
	1); Thu, 23 Feb 2012 15:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=+dI//7UO92ZB7EftdTbEcSSW7DYBkEVz+stf3tvVVCQ=;
	b=ZpgdWAUpi6mleR1bplwPhnfH8V2bfCX0o02uKXa4F/462pswt1NeG1ZqzcCyduRZE5
	BQ9eMzmtgYEwsPRgox8ALwyD2DJjBV26t4335j7O2jO24Khl9XNwY5gOJnjD4R1e9ZTe
	H4zoTFX9sps/kau8Mc6Qpo1b/vn8uknaF3SDc=
Received: by 10.14.47.8 with SMTP id s8mr1586219eeb.91.1330041472009;
	Thu, 23 Feb 2012 15:57:52 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm11173871eeb.7.2012.02.23.15.57.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 15:57:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 00:57:43 +0100
Message-Id: <cover.1330041429.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [meta-oe][PATCH 0/3] Small updates for sstate
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
X-List-Received-Date: Fri, 24 Feb 2012 00:06:14 -0000

The following changes since commit 3c50d83184d58eba36f72c7e2e7116d2a8e92a71:

  toscoterm: add (2012-02-23 17:57:04 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (3):
  mysql5: PR bump after including *_config in default SSTATE_SCAN_FILES
  meta-oe: include pointercal-xinput in SIGGEN_EXCLUDERECIPES_ABISAFE
  meta-oe: include systemd-serialgetty in SIGGEN_EXCLUDERECIPES_ABISAFE

 meta-oe/conf/layer.conf                         |    2 ++
 meta-oe/recipes-support/mysql/mysql5_5.1.40.inc |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

-- 
1.7.8.4




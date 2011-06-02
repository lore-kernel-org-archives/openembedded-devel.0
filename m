Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QSD2Y-0007Ng-VT
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 20:54:43 +0200
Received: by bwz5 with SMTP id 5so1385143bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2011 11:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=6bU7UUVq2qZsTiFpGAWF73jP+M+x8SQo0PLyVa7KdH8=;
	b=mdlx+OxWWe5AlkUHBbwVw57yRd2r+4aluoxVS3GQDal5+GNpwI9URqUN3GS/oW2JLo
	Gxv7mOlbA+B97tDXRotC37RNyr4E1+MUIuuvyOHFuS5XdaTy/WnyNjrqhSRcTksMrB+/
	g+LE2aQEQNcuLqwiG+tG54nHPyk0eIjGK80Zc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=s4GS2+V5c5mX+UcGPxUSzNE7mxvBIBXcBLDksHiBqMmi38aoggbLvOO754qFKs2ZWI
	zQ9SfRdZAu5WQ0q21ZzxKOMn7b/V1JZa7I0jUXQk/8I7tLJzcIR8EmkM3FAA9kpSNXCj
	jswFXP27yOGYHT7EylL5apAIxs+b7+KqZV5sQ=
Received: by 10.204.46.98 with SMTP id i34mr1034941bkf.95.1307040690774;
	Thu, 02 Jun 2011 11:51:30 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id x6sm685181bkv.12.2011.06.02.11.51.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 11:51:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jun 2011 20:51:26 +0200
Message-Id: <cover.1307040582.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
Subject: [meta-oe][PATCH 0/2] Pull request #16
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
X-List-Received-Date: Thu, 02 Jun 2011 18:54:43 -0000

gobject-introspection from oe-core is not compatible with glib-2.0_git
we have here, added newer version also with D_P -1 (as glib-2.0) has.

The following changes since commit e69c7519399c06e82e25dcbfdd300e975393b00a:

  connman: enable service when using systemd (2011-06-02 16:26:04 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/meta-oe
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-oe

Martin Jansa (2):
  gobject-introspection: add newer git version compatible with
    glib-2.0_git
  gobject-introspection: move to recipes-gnome to match oe-core
    structure

 .../use-usr-bin-env-for-python.patch               |    0
 .../gnome}/gobject-introspection_0.9.10.bb         |    0
 .../gnome/gobject-introspection_git.bb             |   33 ++++++++++++++++++++
 3 files changed, 33 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-devtools/gobject-introspection => recipes-gnome/gnome}/gobject-introspection/use-usr-bin-env-for-python.patch (100%)
 rename meta-oe/{recipes-devtools/gobject-introspection => recipes-gnome/gnome}/gobject-introspection_0.9.10.bb (100%)
 create mode 100644 meta-oe/recipes-gnome/gnome/gobject-introspection_git.bb

-- 
1.7.5.3




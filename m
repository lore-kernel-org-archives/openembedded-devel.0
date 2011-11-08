Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RNlLk-0002R4-IT
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Nov 2011 14:04:24 +0100
Received: by gyh4 with SMTP id 4so475898gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Nov 2011 04:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=PrkQKh8jlhFZhEnIumVKpgMrNfvX9kxup4H9/3t7AuY=;
	b=RrmHx/mtntw4KsYBuzc1M2QfgpYEgkpjZKzLsui9GwbGUqJzKUQs4TFe3PQsor9Tlm
	r8q3FA9cXDrNUQOcEJaor7YH34YvBDCKjkV+bWxfae4mhqk5O8e2X6VAb3SZGqeMdKxg
	BDxs1VxY4bnWzrFvNW/BG8MIPiv8Am/3UuOBM=
Received: by 10.236.124.112 with SMTP id w76mr42464279yhh.22.1320757089823;
	Tue, 08 Nov 2011 04:58:09 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id y58sm2066338yhi.17.2011.11.08.04.58.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Nov 2011 04:58:08 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Nov 2011 12:57:59 +0000
Message-Id: <cover.1320757052.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/2] systemd related fixes
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
X-List-Received-Date: Tue, 08 Nov 2011 13:04:24 -0000

The following changes since commit bae85652e5fc8e78afe54e593686d5f74c933cb9:

  udev: update to 175 (2011-11-08 09:13:23 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (2):
  systemd.bbclass: stop using SYSTEMDPN to rdepends addition
  connman: bump PR due systemd.bbclass fixes

 meta-oe/classes/systemd.bbclass                    |   10 ++++++----
 .../recipes-connectivity/connman/connman_0.77.bb   |    2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
1.7.2.5




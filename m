Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RusFH-0001OE-E2
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 22:06:35 +0100
Received: by yhfq46 with SMTP id q46so3153839yhf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 12:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=IY7/c4QeDn8o9h8eeE62+MhaMIsL69wFCJfQ2rQtZc8=;
	b=hpdxMeBU3s6eg/RX+0l0Itm+k7bnbArcgKBrTIAqv445KZYlJpHG7dX/hsAtYBWR2O
	h1gH1ULnEm91SEOBEFdIBU6Y9BJUyDtZqwOOQ4zR34lg19+SLFahVQxo+WpDMOKM3IA1
	T3ap9Queb3xE5+ezDIOyqD/MEtEDeLqM8QwTI=
Received: by 10.236.136.99 with SMTP id v63mr34023030yhi.46.1328648311970;
	Tue, 07 Feb 2012 12:58:31 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o61sm30096056yhk.10.2012.02.07.12.58.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 12:58:31 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 20:58:21 +0000
Message-Id: <cover.1328648257.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH][meta-oe 0/3] O.S. Systems' systemd related changes
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
X-List-Received-Date: Tue, 07 Feb 2012 21:06:35 -0000

The following changes since commit 724ec1ea4ff52b88bf1f6970557e44768214fd7b:

  systemd: move to v40 and don't kill user processes on exit (2012-02-07 16:06:19 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (3):
  Revert "systemd.bbclass: depends on systemd"
  udisks: explicitly depends on systemd
  polkit: depends on systemd

 meta-oe/classes/systemd.bbclass                    |    2 +-
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    3 +++
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |    4 ++--
 3 files changed, 6 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit_0.104.bbappend

-- 
1.7.2.5




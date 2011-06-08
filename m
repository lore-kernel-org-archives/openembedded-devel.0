Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QUBtS-0007KK-UE
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 08:05:30 +0200
Received: by bwz5 with SMTP id 5so158058bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2011 23:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=64ARwSOpZH3Z2XJJJmiupMjIZ0jv/VIhPLvFdzFe3rw=;
	b=bccj8O1N5elQIjgxuHa+2n8jK/oVDbZsI2BC7v6Gut56yQzT1Fq9G0fcivJtuC8vKD
	BJ+hhC/8fMqlYIdB+9paywzn9Ld8eI3rxNll7hd4/PkQkSMzMZ40Pqm9n5R7zpUGJQHI
	QVV0cc54mdm047OHgmuSUflGSD0MFaF33lRV4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=K+4nSQ4VK22AdqnY30lnm+eDYuvutqrrPHJQsC8Ty6ZYzWA/3PIVrGXHyaL10ZwCNa
	ugVg3df4XMCVeBvJogGCAmXl+wRqq/hsr4EKH7gX8ly/X7STZrJgLgAQLPAB19bCskKz
	fHm7OfKI7DWP681ASfEM+OHhzgP19jJqIT440=
Received: by 10.204.127.68 with SMTP id f4mr178766bks.42.1307512933000;
	Tue, 07 Jun 2011 23:02:13 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id k16sm202007bks.13.2011.06.07.23.02.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 23:02:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2011 08:02:03 +0200
Message-Id: <cover.1307512818.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
Subject: [meta-oe][PATCH 0/2] Pull request #17
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
X-List-Received-Date: Wed, 08 Jun 2011 06:05:31 -0000

The following changes since commit 92492f8596ae74044f0cbf1813c22ba6f18f742c:

  systemd-compat-units: disable old style 'networking' script for the time being (2011-06-06 13:08:15 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/meta-oe
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-oe

Martin Jansa (1):
  check: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d

Michael 'Mickey' Lauer (1):
  vala[-native]: 0.12.0 -> 0.12.1

 meta-oe/recipes-devtools/vala/vala_0.12.0.bb       |    7 -------
 meta-oe/recipes-devtools/vala/vala_0.12.1.bb       |    7 +++++++
 meta-oe/recipes-support/check/check_0.9.5.bb       |   20 ++++++++++++++++++++
 ...graphs-in-macro-names-to-unbreak-autoconf.patch |   18 ++++++++++++++++++
 .../check/files/configure_fix.patch                |   12 ++++++++++++
 5 files changed, 57 insertions(+), 7 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/vala/vala_0.12.0.bb
 create mode 100644 meta-oe/recipes-devtools/vala/vala_0.12.1.bb
 create mode 100644 meta-oe/recipes-support/check/check_0.9.5.bb
 create mode 100644 meta-oe/recipes-support/check/files/check-m4-am-path-check-use-quadrigraphs-in-macro-names-to-unbreak-autoconf.patch
 create mode 100644 meta-oe/recipes-support/check/files/configure_fix.patch

-- 
1.7.5.3




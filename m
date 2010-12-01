Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PNsBL-0000X7-PK
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 20:17:36 +0100
Received: by fxm17 with SMTP id 17so4946541fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 11:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=ZVGAlF+F+SSrnyKh6lBVr3coB5hNdvuy+NJkiQiKEHE=;
	b=r8v60IPL5FeMv+h6Fy+wUGmHtE2OGtxmyhp5m+ISoJj+Kf1qwt+l6PzLm9Rs6QUI0T
	wnmjGxnw6ikkYpWq4x7Bq9GffAkvdlhp3BPEc1aYW3YQr0SGMNS19qW2nL9hdJwokehW
	59Gk54RPsGnVeDA0r1x9TOLz799ipRsrFX72o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=X3Szh385jhG1lrSFw4H3txK0o+evopie1l/6y7LvRUP2Xgd6LJP6rbioYYZRQvhr3a
	LtFovs0btySr6C/Kw7G4Kyt9fV1YPrEDUwegxLzfvehDAuLr0Anv0/00klLFTdCOAmFw
	pyt7O9/HZBUhcahF+TEf6X+9KkWbMwSq6LcKk=
Received: by 10.223.101.131 with SMTP id c3mr8984916fao.95.1291230971125;
	Wed, 01 Dec 2010 11:16:11 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id y1sm151485fak.39.2010.12.01.11.16.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Dec 2010 11:16:07 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PNs9s-0008KS-LL; Wed, 01 Dec 2010 20:16:04 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Tom Rini <tom_rini@mentor.com>
Date: Wed,  1 Dec 2010 20:15:51 +0100
Message-Id: <1291230954-31990-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <4CE682D4.1040304@mentor.com>
References: <4CE682D4.1040304@mentor.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 0/3] ext4 image support
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
X-List-Received-Date: Wed, 01 Dec 2010 19:17:36 -0000

Changes from previous iteration:
o factor out e2fsprogs.inc changes into separate patch
o use do_install_append_pn-e2fsprogs

Bernhard Reutner-Fischer (3):
  e2fsprogs: add 1.41.12, remove old versions
  e2fsprogs: fix alternatives of non-packaged native sysroot
  add ext4 image support

 conf/bitbake.conf                      |    4 +++
 conf/local.conf.sample                 |    2 +-
 recipes/e2fsprogs/e2fsprogs.inc        |   42 +++++++++++++------------------
 recipes/e2fsprogs/e2fsprogs_1.41.12.bb |   10 +++++++
 recipes/e2fsprogs/e2fsprogs_1.41.9.bb  |   10 -------
 5 files changed, 33 insertions(+), 35 deletions(-)
 create mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.12.bb
 delete mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.9.bb

-- 
1.7.2.3




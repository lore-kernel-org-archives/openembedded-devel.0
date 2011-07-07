Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1Qeoo5-0000JN-12
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 15:39:53 +0200
Received: by bwf20 with SMTP id 20so1009059bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 06:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	bh=msuB6rx1nkHVtyOky6y/EI7zxzsqJRhVDuvuCuTsPDA=;
	b=jByl8T2LXMA8tcs78ZB2ntg1xSvn1VMwlCqgHVC+LRN3V8Mm9WU1pkGT808T2gXvF7
	QmPi+rfzOPBVYAvt2SgzZBd8tHPPicKuizz4Bv8WPnR1TLEvDkVdmIb97OfnnVitH+B/
	19qJXle/QLC9+n8x5wUg7szbGjhwRfcRtSCCA=
Received: by 10.204.24.68 with SMTP id u4mr710421bkb.12.1310045731911;
	Thu, 07 Jul 2011 06:35:31 -0700 (PDT)
Received: from localhost.localdomain (wgr614v6.plus.sbg.ac.at
	[141.201.137.156])
	by mx.google.com with ESMTPS id t9sm8549654bkn.8.2011.07.07.06.35.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jul 2011 06:35:31 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jul 2011 15:35:49 +0200
Message-Id: <cover.1310045515.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe][PATCHv2 0/4] Various package additions/upgrades
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
X-List-Received-Date: Thu, 07 Jul 2011 13:39:53 -0000

Find attached the revised additions/upgrades for python-pyudev, 
python-sqlalchemy, audiofile and s-sd.

Pull URL: git://github.com/zoidrr/meta-openembedded.git
  Branch: master
  Browse: https://github.com/zoidrr/meta-openembedded/commits/master

Thanks,
    Michael Lippautz <michael.lippautz@gmail.com>
---


Michael Lippautz (4):
  python-pyudev: Add version 0.11 (initial recipe)
  python-sqlalchemy: Add version 0.7.1 (initial recipe)
  audiofile: Update 0.2.6 to 0.2.7
  start-stop-daemon: Add version 1.16.0.2 (initial recipe)

 .../recipes-devtools/python/python-pyudev_0.11.bb  |   22 +++++++
 .../python/python-sqlalchemy_0.7.1.bb              |   16 +++++
 .../audiofile/audiofile-0.2.6/CVE-2008-5824.patch  |   23 -------
 .../audiofile-0.2.6/audiofile-0.2.6.patch          |   67 --------------------
 .../audiofile-0.2.6/audiofile-m4_quote_fix.diff    |   11 ---
 .../audiofile-0.2.6/audiofile-oldstyle.patch       |   55 ----------------
 .../{audiofile_0.2.6.bb => audiofile_0.2.7.bb}     |   14 ++---
 .../start-stop-daemon_1.16.0.2.bb                  |   31 +++++++++
 8 files changed, 74 insertions(+), 165 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-pyudev_0.11.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
 delete mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/CVE-2008-5824.patch
 delete mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/audiofile-0.2.6.patch
 delete mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/audiofile-m4_quote_fix.diff
 delete mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/audiofile-oldstyle.patch
 rename meta-oe/recipes-multimedia/audiofile/{audiofile_0.2.6.bb => audiofile_0.2.7.bb} (55%)
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb

-- 
1.7.3.4




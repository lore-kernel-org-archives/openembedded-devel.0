Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S62gj-0002aV-8Y
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 17:29:05 +0100
Received: by yhjj56 with SMTP id j56so912695yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 08:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=mlaefyQQvmPL1jtCEDJr54il45FjLaKau4q31TsmBbg=;
	b=Hf+h9hBHRh4IdBaSoanXFKSC6XeIh+17I8E5wvkVc/t6oBi/aMoI2G/IKSHGnXuHu4
	kON2voSYGnjFnelOv851WFUF+Qxrskmr9oWuy2J6IkDOIsIy2OOoH+UsWS+Ak6GcRpIQ
	duulomPg34fvmvSXMNCOKo8r8WPvemD1udAI68+6cfFtqnXqs9ImO4uKYBgPYfRtN+CO
	I6Ys55sENBQ5kwKI3RwVgOy0cg5pb5cbmO/YEEfOg7sC5IZMcFSFrgzssryfvXnX/zJP
	990Z430DW3shxbLF1OCuPQDHRqNOcm6241kLB4eQ6fTAwHgNnYfzVZKpWNDwWMpRbWmD
	AJCQ==
Received: by 10.236.78.5 with SMTP id f5mr2947547yhe.103.1331310025354;
	Fri, 09 Mar 2012 08:20:25 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id v26sm15023935yhk.1.2012.03.09.08.20.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 08:20:23 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Mar 2012 16:20:14 +0000
Message-Id: <cover.1331309928.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH][meta-oe 0/3] Pending patches in O.S. Systems' tree
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
X-List-Received-Date: Fri, 09 Mar 2012 16:29:05 -0000

Bear on mind that all those patches depends on changes not yet merged
on OE-Core.

The following changes since commit 7d398784eef650c6a26b886393222f191a8c3caf:

  README: fix typo (2012-03-09 07:54:41 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (3):
  systemd-compat-units: rename service to run postinst scripts
  connman: update to 0.79
  openbox: update to 3.5.0

 ...connman_0.78.bbappend => connman_0.79.bbappend} |    2 +-
 .../recipes-core/systemd/systemd-compat-units.bb   |    8 +-
 .../{opkg.service => run-postinsts.service}        |    6 +-
 .../openbox/openbox/fix-decorations.patch          |   73 -
 .../openbox/openbox/fix-dialog-buttons.patch       |   38 -
 .../openbox/openbox/sync-with-3.4-working.patch    | 2739 --------------------
 .../{openbox_3.4.11.2.bb => openbox_3.5.0.bb}      |   10 +-
 7 files changed, 11 insertions(+), 2865 deletions(-)
 rename meta-oe/recipes-connectivity/connman/{connman_0.78.bbappend => connman_0.79.bbappend} (85%)
 rename meta-oe/recipes-core/systemd/systemd-compat-units/{opkg.service => run-postinsts.service} (64%)
 delete mode 100644 meta-oe/recipes-graphics/openbox/openbox/fix-decorations.patch
 delete mode 100644 meta-oe/recipes-graphics/openbox/openbox/fix-dialog-buttons.patch
 delete mode 100644 meta-oe/recipes-graphics/openbox/openbox/sync-with-3.4-working.patch
 rename meta-oe/recipes-graphics/openbox/{openbox_3.4.11.2.bb => openbox_3.5.0.bb} (81%)

-- 
1.7.2.5




Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QUBxg-0007b9-0S
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 08:09:52 +0200
Received: by bwz5 with SMTP id 5so160340bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2011 23:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=Qe6unj0Z+F+ts2fHnJ+KYS7uBsgu+XGzpI2bB8WZ5h4=;
	b=mwQ3zeTXEExRDEdvXPmG0FRffwFI7Bi42pFSDdW+birgBNPOWj5QiE02/AOmd3TLgJ
	DE63hVUaC9LwARri1HWoXHMaYbwT95DbvylMENRhlUgcmPpnohRCY/0sf53C603Iqy9J
	ZnyjCY2P+UmsssMbhPXCmcevL2QnTbazIk+Qg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=HAtwaYahEhX39u9GznnPuIZQKFwwZEhDcfXZHBUHs7xiDM04y2E9Q+zdSFnXfjiIjU
	Lnkh/0u6ghHB3XQObG9oKHBYaWdz+xpfTgw4dWFI3nJYY7ioq4ePck2/+8OSn7VWfCzZ
	9oGES0uqdkI1yu8ETy7QaSNe3ATtFEcPcJ/BU=
Received: by 10.204.22.12 with SMTP id l12mr29142bkb.178.1307513192584;
	Tue, 07 Jun 2011 23:06:32 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id t23sm204042bkf.16.2011.06.07.23.06.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 23:06:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2011 08:06:24 +0200
Message-Id: <cover.1307513108.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
Subject: [meta-efl][PATCH 0/3] Pull request #7
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
X-List-Received-Date: Wed, 08 Jun 2011 06:09:52 -0000

Hi, please merge following patches.

The following changes since commit 92492f8596ae74044f0cbf1813c22ba6f18f742c:

  systemd-compat-units: disable old style 'networking' script for the time being (2011-06-06 13:08:15 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/meta-efl
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-efl

Martin Jansa (3):
  e-base,e-wm: bump EFL_SRCREV and remove illume1 from e-wm
  eve: update LICENSE fields and remove patch applied upstream
  webkit-efl: import from OE rev
    d4f0211e2078d5033ae0dee74664de5520d8392d

 meta-efl/classes/e-base.bbclass                    |    2 +-
 .../e17/e-wm/illume-disable-screensaver.patch      |   13 ------
 .../recipes-efl/e17/e-wm/illume-flaunch-fix.patch  |   15 -------
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |   17 +-------
 ...unconditional-ewk_view_context_menu_forwa.patch |   34 ----------------
 meta-efl/recipes-efl/e17/eve_svn.bb                |    7 ++-
 .../webkit/webkit-efl/revert.r78057.patch          |   19 +++++++++
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |   42 ++++++++++++++++++++
 8 files changed, 67 insertions(+), 82 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm/illume-disable-screensaver.patch
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm/illume-flaunch-fix.patch
 delete mode 100644 meta-efl/recipes-efl/e17/eve/0001-eve-remove-unconditional-ewk_view_context_menu_forwa.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/revert.r78057.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb

-- 
1.7.5.3




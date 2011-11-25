Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RTysV-0001hX-1q
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Nov 2011 17:43:55 +0100
Received: by yenm2 with SMTP id m2so3660152yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2011 08:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=qSbPaNixtJMNCer4TUyBElezWW+so7MS17DZxYcmT5k=;
	b=GnhKbGV2uU6uoRiCM3XlE2GIdmShaqqLLK2XzTAmeX3+SDZ4LCJ3nnNVlLuMQrgv11
	uSD0W43gOtlF0+7xbfO7JA02hWRSgEHAS6RQUjS2ymoDYK/13wYNUjYnDrma2biuAUze
	4gfWOVlR6opfRP00Y/p84H37K/abd4DVsvNdg=
Received: by 10.236.116.37 with SMTP id f25mr11326078yhh.82.1322239039853;
	Fri, 25 Nov 2011 08:37:19 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id w68sm36619531yhe.14.2011.11.25.08.37.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Nov 2011 08:37:18 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Nov 2011 16:37:08 +0000
Message-Id: <cover.1322238977.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/1] digitemp build fixes
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
X-List-Received-Date: Fri, 25 Nov 2011 16:43:55 -0000

The following changes since commit 7019fbb50796fedcedef6ff92981a7f26659a251:

  mplayer: fix build with -Wl,-as-needed (2011-11-23 22:41:17 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (1):
  digitemp: fix build for non x86 architectures

 .../digitemp/digitemp/makefile-fix.patch           |   20 ++++++++++++++++++++
 meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb |   11 ++++++++++-
 2 files changed, 30 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-support/digitemp/digitemp/makefile-fix.patch

-- 
1.7.2.5




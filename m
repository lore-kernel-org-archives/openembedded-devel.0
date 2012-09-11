Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBRV2-0006ot-Ha
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 16:31:36 +0200
Received: by eekb57 with SMTP id b57so429158eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2012 07:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=G15X+ky0Koqwy9HYVuEzxaZVvp4DlWIZbFenL2b6bBM=;
	b=gjCYWXpKYI38zSRwQ/ca/ccNgHcGlb7ug/Qlb7DBXJt2Da2pG34RFi5uRIj2zMjU8J
	Uwb7lZPSYJFjnbGrV1WLXZfoUo7GuC6w6eUjEoXssYVizANyJyN0Gn3ULOGFnijBfVpF
	1GiX2xha3F/5bQBZVPmO6syqa4O0sErlOaYTg/3kW1Dfb7imW+5ex+cazSi36v448OJ/
	2XTLII8MuobVaOn+hH/f3NS6BgR+lGvbvpWPwq1g4bZifmvxwVn/HPu1oc+eY0t8YTfv
	oEJAk2a5F84oyfQfrSIeynZUW+Qf2XhACuwj1LvuInV7k2WiIObPHxAaGoMNOoOq++fX
	MrQw==
Received: by 10.204.130.25 with SMTP id q25mr4943572bks.119.1347373145404;
	Tue, 11 Sep 2012 07:19:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hs2sm9790555bkc.1.2012.09.11.07.19.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 07:19:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Sep 2012 16:18:58 +0200
Message-Id: <cover.1347363666.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [meta-oe][meta-efl][PATCH 0/5] Smaller fixes
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
X-List-Received-Date: Tue, 11 Sep 2012 14:31:36 -0000

The following changes since commit eb82b4f0e40e6ef54320d1e7a8278a918ca7d15e:

  pixman: drop patches, merged to oe-core (2012-09-10 15:37:16 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Denis 'GNUtoo' Carikli (1):
  meta-efl: enjoy: fix scrolling

Martin Jansa (4):
  evas: move EVAS_CPU_TWEAKS to target EXTRA_OECONF
  libwmf: fix DEPENDS_virtclass-native
  sip-native: inherit qmake2 instead of qt4x11
  mcnavi: add also target edje to DEPENDS

 ...position-as-percent-and-define-a-1-second.patch | 133 +++++++++++++++++++++
 meta-efl/recipes-efl/e17/enjoy_svn.bb              |   7 +-
 meta-efl/recipes-efl/efl/evas.inc                  |   4 +-
 meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb  |   4 +-
 meta-oe/recipes-extended/sip/sip-native_4.13.3.bb  |   3 +-
 meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb  |   2 +-
 6 files changed, 146 insertions(+), 7 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/enjoy/0001-always-use-position-as-percent-and-define-a-1-second.patch

-- 
1.7.12




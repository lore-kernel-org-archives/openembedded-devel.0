Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVfIK-0007LU-7b
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 09:13:32 +0100
Received: by eekc1 with SMTP id c1so149163eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 00:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=kPX5FN+jzfApC1Y2ldbPu1uniKvvnqAsY+Uaa8fzR1Q=;
	b=MkYKQ4RzfkXJFfhAF0RxrK3iJBSSOY4tw7sZCqO3P9BNt3pOuyDOHjschI1onDEzHv
	HD65t/Hhx7uMHWzqngUvx2F6ZNREeO3m2D6mZIQMZtpAn3QM4P8kWVP75c3nUHuSr8jv
	xm1sg3/uEMCQOkV5AL+xue2IJxEl6FhRsAKY8=
Received: by 10.14.12.78 with SMTP id 54mr118356eey.150.1322640408635;
	Wed, 30 Nov 2011 00:06:48 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c9sm1662940eeb.0.2011.11.30.00.06.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 00:06:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:06:39 +0100
Message-Id: <cover.1322640244.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
Subject: [meta-oo 0/4] mplayer changes and gconf-native drop
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
X-List-Received-Date: Wed, 30 Nov 2011 08:13:33 -0000

The following changes since commit f3ca7acd0b678a9247e432aee34512a26e30f509:

  libsdl-x11: drop from meta-oe (2011-11-30 08:52:38 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (4):
  mplayer-common: import from OE-classic
  mplayer2: drop armv7a/omapfb optimizations, those can be applied from
    bsp layer if needed
  mplayer2: drop OPTIMIZATIONs for now
  gconf-native: drop from meta-gnome, newer version is in oe-core

 .../recipes-gnome/gconf/gconf-native_2.6.1.bb      |   17 -
 .../recipes-multimedia/mplayer/mplayer-common.bb   |   22 +
 .../mplayer/mplayer-common/mplayer.conf            |   15 +
 .../0001-video-out-for-omapfb-support.patch        |  826 --------------------
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |   28 +-
 5 files changed, 43 insertions(+), 865 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gconf/gconf-native_2.6.1.bb
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer-common.bb
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer-common/mplayer.conf
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer2/0001-video-out-for-omapfb-support.patch

-- 
1.7.8.rc4




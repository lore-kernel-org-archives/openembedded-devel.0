Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5AE067704D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Sep 2015 00:28:54 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so27795177igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2015 17:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oYBYfeoQk51icSCFlXtj6IpMeQvF3rfJ5jtIWBS5hTQ=;
	b=j1fE3VveAj+Xv4Sy1Mbefzl41OCWlDN7/E/VsBePewMmg5xDuStRyaeXAH5X0Tm5QI
	egRLKP3ExYAgvY8q5qcAUkGbe4Q0/yS3hEo2zRXZTErA0x127iy/SrJtXRtSrJZaJCUk
	5R0IYp2qH/unS9B6gfQRgyKhlKzzf1+NV0sEZxqA1DnCwdhWot/89ZGvEoSLvaxywmt0
	laHKg+49hdEpaowT2GCA1hj/xPpQw4XrQk0xPPrIVNmxyye8m7QNBqC8Wm0x2tDy9nIN
	AEWZypF4x50cpc/6yt1d+NK9omcaOFY1uGDe4VNWsbOWNmuBc+4ZThz5pe6lfBkcIcRQ
	/h9g==
X-Received: by 10.50.83.104 with SMTP id p8mr12080170igy.90.1441412934826;
	Fri, 04 Sep 2015 17:28:54 -0700 (PDT)
Received: from localhost.localdomain (s206-116-3-180.bc.hsia.telus.net.
	[206.116.3.180]) by smtp.gmail.com with ESMTPSA id
	c64sm2541968ioc.13.2015.09.04.17.28.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Sep 2015 17:28:54 -0700 (PDT)
From: Adam YH Lee <adam.yh.lee@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Sep 2015 17:28:29 -0700
Message-Id: <1441412911-29933-1-git-send-email-adam.yh.lee@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-qt5 0/2] WIP Improve Qt5 flattened directory structure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Sep 2015 00:28:56 -0000

This is a WIP patch set for addressing improper directory parsing involving
QT_DIR_NAME[1]. When QT_DIR_NAME is set empty, Bitbake QA complains loudly for
double slash ("//").

Unfortunately I am still seeing errors during runtime:

   ~/qt5-test# qmake -project
   Could not find qmake configuration file linux-g++.
   Cannot find feature default_pre.prf
   Cannot find feature default_post.prf

   ~/qt5-test# find / -name default_pre.prf
   /usr/lib/mkspecs/features/default_pre.prf
   /usr/lib/mkspecs/features/win32/default_pre.prf
   /usr/lib/mkspecs/features/mac/default_pre.prf

I will continue looking for a complete fix as time allows.
Feel free to comment in the meantime.

[1] http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/68544

Adam YH Lee (2):
  Remove double slash when QT_DIR_NAME is empty
  Use `mkdir -p` when creating `/usr/bin`

 classes/populate_sdk_qt5.bbclass              |  2 +-
 classes/qmake5_base.bbclass                   |  6 ++---
 classes/qmake5_paths.bbclass                  | 34 +++++++++++++--------------
 recipes-qt/maliit/maliit-framework-qt5_git.bb |  4 ++--
 recipes-qt/qt5/nativesdk-qtbase_git.bb        |  8 +++----
 recipes-qt/qt5/qt5-creator_3.3.1.bb           | 20 ++++++++--------
 recipes-qt/qt5/qtbase_git.bb                  |  6 ++---
 recipes-qt/qt5/qttools_git.bb                 |  4 ++--
 8 files changed, 42 insertions(+), 42 deletions(-)

-- 
2.1.4



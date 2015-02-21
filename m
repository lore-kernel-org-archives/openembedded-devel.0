Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id AD0E5606E8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2015 09:52:47 +0000 (UTC)
Received: by wevk48 with SMTP id k48so9676247wev.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2015 01:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=LCFoHwpWxqctSGnqf9pFn7uVa4RIPswtIIg1YecUdA8=;
	b=C3U+MsQjnj2ort8cwuNPS3J8mTHIL6duWYwwCK3fqE5XgTmqpXffXMq+yyGH7ZbZSF
	57YtceHnhSezBAiI0R2tBRfgsmIYCHVpLA1v9MMkc4KLoGh5EqI71FD4vjijd2pTcDDf
	gpLKidI74htatJHe2Qq8em2zVyT2ucvFST7vYiuc5Eglx+InwUunYDSEF28B6du3k48g
	TzX1U/B1M/w3K1JRyl7skl6dAXQ/vcRvzYMw+ebd4OUKg8XRnE6ghe7DKGhejOpmENSz
	VFyARNnCFqxfCXUj0N4I+EBJrU52PhghDuWXCB7vyU2A8EfdgZW371BCpV7l8nY3EqH6
	sNSA==
X-Received: by 10.180.87.33 with SMTP id u1mr2749284wiz.20.1424512368956;
	Sat, 21 Feb 2015 01:52:48 -0800 (PST)
Received: from localhost.localdomain (ip-84-119-96-251.unity-media.net.
	[84.119.96.251])
	by mx.google.com with ESMTPSA id dm6sm6232120wib.22.2015.02.21.01.52.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Feb 2015 01:52:48 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Feb 2015 10:52:08 +0100
Message-Id: <1424512336-47007-1-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-oe][PATCH 0/7] Some SRC_URI fixes
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
X-List-Received-Date: Sat, 21 Feb 2015 09:52:51 -0000

Some of the SRC_URIs in meta-openembedded are not available anymore.
I looked for alternatives and fixed these recipes.

Sven Ebenfeld (7):
  lightmediascanner: Fix SRC_URI
  crda: Fix SRC_URI
  libgee: Update to Version 0.16.1
  serial-utils: Fix SRC_URI
  vala-dbus-binding-tool: Update to 0.4.1 and fix SRC_URI
  claws-mail: Fix SRC_URI
  pxaregs: Add source file and fix SRC_URI

 .../lightmediascanner/lightmediascanner_0.4.4.bb   |    8 +-
 .../recipes-connectivity/crda/crda_1.1.3.bb        |   10 +-
 meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb   |   10 +
 meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb    |   10 -
 .../vala-dbus-binding-tool.inc                     |    4 +-
 .../vala-dbus-binding-tool_0.4.0.bb                |    4 -
 .../vala-dbus-binding-tool_0.4.1.bb                |    4 +
 .../recipes-sato/claws-mail/claws-mail_3.9.0.bb    |    2 +-
 .../recipes-support/pxaregs/pxaregs-1.14/pxaregs.c | 1975 ++++++++++++++++++++
 meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb    |    4 +-
 .../serial-utils/pty-forward-native.bb             |    4 +-
 .../serial-utils/serial-forward_git.bb             |    2 +-
 12 files changed, 2007 insertions(+), 30 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb
 delete mode 100644 meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
 delete mode 100644 meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb
 create mode 100644 meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.1.bb
 create mode 100644 meta-oe/recipes-support/pxaregs/pxaregs-1.14/pxaregs.c

-- 
1.9.3



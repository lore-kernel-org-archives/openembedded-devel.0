Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id A6DC670C8B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 12:24:44 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id x48so9948865wes.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 05:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Ej8CM5ub2ZXdVbftwkW/UA9q5as2imdGBJpW4Vf4oWU=;
	b=EOfAfu8rqCR3w9oott2HNV2tIEgLBILm1tptSUYJutOBZt9K2tuET+PXasBg2SLcn4
	mfd4/YEREeji22HPKwf4hxo9d0XSbY0t0DRdXHOoLCrLVrziQ7GPtc1WgXjgDmIjUOiA
	9+TIhL7tA3xpJnY8i01cyZiE+wN2G/XguPS7Cjwr245ISlPISBci1d8WMYUtpZMKi1f7
	FUB3fw1tB48AxYQZNWbQcb3VM30sq3BUTj9mcrBkA6V1Ve6cRPhB3qrHgz1z7fJaxc8u
	zJkme5u9icF+Tqqj2VRJt2MT2hy6NYu0fVTzeRAMREZScBApsINF5x/Pa/TtpMm5yIX0
	iHvA==
X-Received: by 10.180.99.65 with SMTP id eo1mr27675517wib.12.1407846285833;
	Tue, 12 Aug 2014 05:24:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f6sm8942301wja.25.2014.08.12.05.24.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 05:24:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Aug 2014 14:25:10 +0200
Message-Id: <cover.1407846175.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [daisy][PATCH 0/5] small build fixes for daisy
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
X-List-Received-Date: Tue, 12 Aug 2014 12:24:49 -0000

The following changes since commit 9ee63edfd9c6e5c22ce707770955a5796cde2cfc:

  ltrace: add PV and PACKAGECONFIG for libunwind (2014-08-12 14:15:26 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib b90153d5981990ea9910c417a868fb26e7e264a4
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/daisy-backports

Martin Jansa (5):
  sethdlc: Set MACHINE_ARCH, because of virtual/kernel dependency
  ktap: Set MACHINE_ARCH because of ktap-module runtime dependency
  glmark2: Add virtual/libx11 dependency
  irssi: add --with-ncurses option
  libgc: add PACKAGECONFIG for libatomic-ops

 meta-networking/recipes-connectivity/sethdlc/sethdlc.bb | 3 ++-
 meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb    | 7 +++++--
 meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb  | 5 +++--
 meta-oe/recipes-kernel/ktap/ktap_0.4.bb                 | 2 +-
 meta-oe/recipes-support/libgc/libgc_7.2d.bb             | 4 ++++
 5 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.0.4



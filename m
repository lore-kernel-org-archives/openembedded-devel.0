Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5mSw-00037p-1F
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Apr 2011 00:05:15 +0200
Received: by mail-iw0-f175.google.com with SMTP id 10so4361066iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 15:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ahuof86lOrrCoyvHWL6nJThB7qYPLD+JyKHfCkkqlSg=;
	b=Y0ug6MW2fUvrxlpNsTuaAOa46AY7EV4x4Ccb+Lgjdqp4e40wLin5PCCdk9o8uVMVNk
	VY02bV6lgCXMoSSXW3CqgLAnXl0G/Qs2UoYQCPCpQiM3/dFMiwq2PeronE25BOejMBjl
	FImLxQ50fqbI+mNAkfMLXWS67q4HgTQjpA1cY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=tdPjJf7sKbrzEchobjOtl9RB+Nv0hz6yGArt7XvbS0EZc2/xtMcuRPptMTfAWmzNJP
	fw1QTvNHS2LeQ8o4+xjM/6aCrFvBf1iWcu9Q/BG0V2+Oy1Jdx7V8a8UbRXE0NwYXzdM4
	j1aWPlD+vp8AarSt9i9dYywSdCLSGnkRxp+vY=
Received: by 10.42.161.197 with SMTP id u5mr1166333icx.466.1301695394529;
	Fri, 01 Apr 2011 15:03:14 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d10sm1710981ibb.51.2011.04.01.15.03.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Apr 2011 15:03:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2011 15:03:04 -0700
Message-Id: <b60c8a54117077996bdf2b40de0c720140825791.1301695158.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301695158.git.raj.khem@gmail.com>
References: <cover.1301695158.git.raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/7] dbus.inc: Add missing dependency on libxdmcp
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
X-List-Received-Date: Fri, 01 Apr 2011 22:05:15 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/dbus/dbus.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/dbus/dbus.inc b/meta-oe/recipes-core/dbus/dbus.inc
index 40a670a..2ae5b1d 100644
--- a/meta-oe/recipes-core/dbus/dbus.inc
+++ b/meta-oe/recipes-core/dbus/dbus.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 LICENSE = "AFL2.1 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;firstline=6;endline=20;md5=6eea2e0c7750dd8e620dcb1437312fa5"
-DEPENDS = "expat virtual/libintl libsm libice virtual/libx11"
+DEPENDS = "expat virtual/libintl libsm libice virtual/libx11 libxdmcp"
 
 INC_PR = "r20"
 
-- 
1.7.4.1




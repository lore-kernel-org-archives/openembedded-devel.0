Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7215F6EE5C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 05:38:14 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id y10so473946pdj.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 21:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FdC9i1Zj1koRUxRTYeZbCTyAmmms5TzbgfHVzC2sFus=;
	b=aKq1LWqkZEH+0cFx4/E3ZtDxhhLePVgfYqDEpGyVemkgtkpCHVALKHi/dD2iiVTlS0
	2arK5RiZHVbqbvAlphsRJjJe3cs/vP15sRHY9L1Lqh44UBs5XOLgjj/9+6n3+9+FA1cV
	nFzSpk26oK7gMbe/Bm3Ddv/vmXYNVsBLEvAT0mLRQP5RfFbGx+jkjlU7kFoJoj8/FzUs
	GywD+H4Zto261FStpELl2htyNlAFQtrAlQQhMnHjS8L3ShwAY1sWXUgrGphXpDWhWpAg
	ZU8svK2wInvSVGgCRxbnF+T/oMbxplKf75vo8jgz6FW9UkoNqydmttnKkHKseU9VfEuj
	zV9A==
X-Received: by 10.68.106.130 with SMTP id gu2mr4307438pbb.59.1393393094445;
	Tue, 25 Feb 2014 21:38:14 -0800 (PST)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	vx10sm158944384pac.17.2014.02.25.21.38.12 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Feb 2014 21:38:13 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2014 21:39:54 -0800
Message-Id: <1393393197-23806-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-multimedia][PATCH v2 0/3] update vlc to 2.1.2
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
X-List-Received-Date: Wed, 26 Feb 2014 05:38:14 -0000

From: Tim Orling <TicoTimo@gmail.com>

v2: Incorporating JaMa's comments

Tim Orling (3):
  libdvdcss: update to 1.2.13
  live555: update to 2013.04.30
  vlc: update to 2.1.2

 .../vlc/files/0001-enable-subdir-objects.patch        | 13 +++++++++++++
 .../files/0002-glibc-does-not-provide-strlcpy.patch   | 17 +++++++++++++++++
 .../vlc/{libdvdcss_1.2.10.bb => libdvdcss_1.2.13.bb}  |  5 ++---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc        | 10 +++++++---
 meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb  | 19 -------------------
 meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb   | 17 +++++++++++++++++
 .../recipes-multimedia/live555/live555_20110314.bb    | 10 ----------
 .../recipes-multimedia/live555/live555_20130430.bb    |  7 +++++++
 8 files changed, 63 insertions(+), 35 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-objects.patch
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-provide-strlcpy.patch
 rename meta-multimedia/recipes-multimedia/vlc/{libdvdcss_1.2.10.bb => libdvdcss_1.2.13.bb} (71%)
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb
 delete mode 100644 meta-oe/recipes-multimedia/live555/live555_20110314.bb
 create mode 100644 meta-oe/recipes-multimedia/live555/live555_20130430.bb

-- 
1.8.3.2



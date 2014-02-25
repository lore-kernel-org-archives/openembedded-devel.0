Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id E62F26EAFA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 16:31:13 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id jt11so2978531pbb.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 08:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nsOnZI9GdA4WSOqKXtGSBwRgdaGMwcSKpbWCQ6oD5pU=;
	b=djQiXuEyalrUbIMpWviADgZq15l3LN4tvkqbX8YZbn+/J2wqGSx7Ed22QM/+dICIrZ
	obVCsY1P7MFLODnYCtm5UoZrhKx85YqA/afw+pEznIPbxYJGhEplshJB4acxmjnoxt4U
	jO5wE1MVbj2db7zoPemuQGzfxf0FGpINWtkd/dQjoIemm23AFtr6Eukm9luQFbKslYBY
	NiAn2bx2XGbfuUOm5Nnxx+qQD84rJ2yi4Zv+Y/DOVzgmM2cazOhEaljKJ1sxVRPT5Dmw
	+6gCfCB9Q9v3aCvxSYkDQKCcLc13vILxZDIrTvsoN9vgCErIE2G8Vfqr5EKFJW6jR7Vy
	l71w==
X-Received: by 10.67.14.231 with SMTP id fj7mr2465931pad.115.1393345874394;
	Tue, 25 Feb 2014 08:31:14 -0800 (PST)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	eb5sm146677117pad.22.2014.02.25.08.31.12 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Feb 2014 08:31:13 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2014 08:32:52 -0800
Message-Id: <1393345975-20556-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-multimedia][PATCH 0/3] vlc: update to 2.1.2
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
X-List-Received-Date: Tue, 25 Feb 2014 16:31:14 -0000

From: Tim Orling <TicoTimo@gmail.com>

RFC and request for testing :)

Tim Orling (3):
  libdvdcss: update to 1.2.13
  live555: update to 2013.04.30
  vlc: update to 2.1.2

 .../vlc/files/0001-enable-subdir-objects.patch        | 13 +++++++++++++
 .../files/0002-glibc-does-not-provide-strlcpy.patch   | 17 +++++++++++++++++
 .../recipes-multimedia/vlc/libdvdcss_1.2.13.bb        | 13 +++++++++++++
 meta-multimedia/recipes-multimedia/vlc/vlc.inc        | 12 +++++++++---
 meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb   | 19 +++++++++++++++++++
 .../recipes-multimedia/live555/live555_20130430.bb    |  9 +++++++++
 6 files changed, 80 insertions(+), 3 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-objects.patch
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-provide-strlcpy.patch
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb
 create mode 100644 meta-oe/recipes-multimedia/live555/live555_20130430.bb

-- 
1.8.3.2



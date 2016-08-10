Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 796C1731C8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 02:05:19 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id j37so1171732qta.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 19:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YtUh7Nx21VY3QTW1wimeBl5grm7Mn+dqNNM+ROkw0Co=;
	b=exHwRT7zqZEiZN13bLLhnEy+j3XwtQUMqRxt5FO2D1cgNJ8YMgXmQaQp6UJN96imJB
	ox+tTsFv/vfNPnCu6B9Nu10UTFeZMhzUWjOWXefoopQuMi4pmZkYCMF6lygbpDoDsYZ9
	CziQWveNBuVUpfpLk1CNFGOsZ2ISfF95382Tr7wZ63emeW1b6QOhLBOrkooZCKTAj9fH
	GV6Vd7CfQRJ3yNXaYO6bbkRd2oHPpM8B0spq8coMoPj6zPfDHCEc1fbpQgvfmfSONcur
	sGBFHOKybyGhhzb7jT1zO7M6RsPVFE/82klTSs1b4EpGz6e0ABdVsnSWu/QlyBa1CFNt
	mNmg==
X-Gm-Message-State: AEkoouto7R/137epVDKsqQDjF5Dmkm6UGo3vDQBS13jWjlFvOzw6ARWXOWu/pk6/2GN5nA==
X-Received: by 10.200.43.47 with SMTP id 44mr1668100qtu.66.1470794719502;
	Tue, 09 Aug 2016 19:05:19 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	u76sm3795919qkl.39.2016.08.09.19.05.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 19:05:19 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Aug 2016 22:05:11 -0400
Message-Id: <1470794711-3879-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] epeg: update to the latest version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Aug 2016 02:05:20 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/epeg/epeg_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/epeg/epeg_git.bb b/meta-oe/recipes-support/epeg/epeg_git.bb
index 8fe19b5..6b23bbf 100644
--- a/meta-oe/recipes-support/epeg/epeg_git.bb
+++ b/meta-oe/recipes-support/epeg/epeg_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e7732a9290ea1e4b034fdc15cf49968d \
 DEPENDS = "jpeg libexif"
 
 SRC_URI = "git://github.com/mattes/epeg.git"
-SRCREV = "d78becc558a682f1be0a78b1af90d1b4a08e5b4e"
+SRCREV = "337f55346425fbf2d283e794b702318ef2a74bcb"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
1.9.1



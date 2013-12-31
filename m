Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 87F226B5D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 09:49:38 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id f15so5470172eak.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 01:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IEQhD/SZwc5ROvqqIiZC+gctaSx5oamBFM4/tNl3TLs=;
	b=QK7thVbwrjlTQSh2z6rFsdtGUxCIozyYNwduB6P3cXN4+GARVuhT50qEhvK5Ub1LOv
	X0wI0E/0Dn1kC/5UJpAwLIxctEanhLnHIrezGGvShej/Mpd79Byq/duOtpq4Uub2nLD7
	KFJTP9fPMHfw6omqroRWynkY8H/w2mJHo3Fzyh/HDmir+AgWICSADvcBm8HjW+gvwJPT
	XuTrTPLdPICJk4dvDTFiXgEDKWor1Oen4hv1RLCNkSbuY0Hwd2G3cifJ27OPYUR28OsC
	ZriBybP5BYrFsfID5T5kOagHqS7QZ47CDDFOzdc9nIaO7TUt4+A9ssgL9Sia8wNko/QT
	690w==
X-Received: by 10.14.48.74 with SMTP id u50mr3940010eeb.107.1388483379291;
	Tue, 31 Dec 2013 01:49:39 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m1sm116634377eeg.0.2013.12.31.01.49.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Dec 2013 01:49:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Dec 2013 10:49:23 +0100
Message-Id: <1388483363-28575-11-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][for-dora][PATCH 11/11] sound-theme-freedesktop: Don't set PACKAGE_ARCH
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
X-List-Received-Date: Tue, 31 Dec 2013 09:49:38 -0000

* either fix build to prevent trying to access compiler or don't set
  PACKAGE_ARCH, signature is different for different MACHINEs
  e.g.
  List of dependencies for variable TUNE_ARCH changed from 'set(['X86ARCH32', 'X86ARCH64'])' to 'set([])'
  Hash for dependent task gettext_0.18.3.1.bb.do_populate_sysroot changed from 915bae004926e982f835d12f511a5f2b to 24c8263bb82124c9000fff3eab16d293

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
index 97a1dba..446cdfa 100644
--- a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
+++ b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
@@ -5,9 +5,6 @@ LIC_FILES_CHKSUM = "file://CREDITS;md5=3213e601ce34bb42ddc3498903ac4e69"
 
 inherit autotools gettext
 
-# with allarch.bbclass configure fails fo no compiler found
-PACKAGE_ARCH = "all"
-
 SRC_URI = "http://people.freedesktop.org/~mccann/dist/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "d7387912cfd275282d1ec94483cb2f62"
 SRC_URI[sha256sum] = "cb518b20eef05ec2e82dda1fa89a292c1760dc023aba91b8aa69bafac85e8a14"
-- 
1.8.4.3



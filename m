Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2Nyc-0002GR-Ee
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 15:24:26 +0100
Received: by mail-ee0-f47.google.com with SMTP id c1so769511eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 06:16:01 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.125.14 as permitted sender) client-ip=10.14.125.14; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.125.14 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.125.14])
	by 10.14.125.14 with SMTP id y14mr6394396eeh.5.1330438561406 (num_hops
	= 1); Tue, 28 Feb 2012 06:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=CBbqQDnYBeetqibc6NltZ4RpfxqVK2f/oNtF65sWW1M=;
	b=twNolnyXvJAsQBZLmoopHA3sZxjh8WZIC25RyM4h0EdGmuEasnYEt+8tp9KMX67lLV
	Aa48mNtDW11FhrO3EviLwpnqdDhjN9RfvxK+OZo4cdgvM4Qm+Jlcw8NMC99AS4qOdwMY
	pUR+nd28u2AItCdbe7W1gp28Uqw31+ImY4YXY=
Received: by 10.14.125.14 with SMTP id y14mr4779124eeh.5.1330438561153;
	Tue, 28 Feb 2012 06:16:01 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm70800385eei.3.2012.02.28.06.15.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 06:16:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 15:14:41 +0100
Message-Id: <e6d45cfbd62ea6796624f90cd13417912458af4e.1330438403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
References: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330438403.git.Martin.Jansa@gmail.com>
References: <cover.1330438403.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 10/14] imagemagick: bump PR to rebuild after libtiff3->libtiff5 change
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
X-List-Received-Date: Tue, 28 Feb 2012 14:24:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../imagemagick/imagemagick_6.7.5.bb               |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
index 4cecff0..1869a41 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=944f66dcedc98d5a4e5d964bd3b32e7b"
 # FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib"
 
+PR = "r1"
+
 PATCHSET = "6"
 SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
            file://PerlMagic_MakePatch.patch \
-- 
1.7.8.5




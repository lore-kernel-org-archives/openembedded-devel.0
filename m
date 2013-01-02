Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TqPKA-0006mp-2W
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 15:29:42 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so5756515eaa.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 06:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=nMYM8ddsV7ApkD6J8Me4wM35/zWDRVS2kWOsh01MMQs=;
	b=v4ET1y5IYoyAerDo8RHUsSF7rK6DNa3tNOWo2R+qVGYL1ElV/ltyxZCC9F3T7Al4D8
	VqC5P/ejijQtX8YLXbEWYbo/5dO3QewxcVHzYshZ6SliPYZ2AWCiPnU3IkMXGhefY5mT
	b+wR/TOnDGgvVXyMkdWf8spppQXdH4GNATIXFfzW+PX2U/P6NNEa1qe01EHJ1peIM1ai
	70Xy00HQoZ3yKtnGET1tNSy8cdKG7zgIKuEqPKCUcp95TLhqqCcq1KxQoLlV7ywVXDmn
	0vOh2yu4T/lNDLNiLfU5VYRrGNLroPrOBUGCCjAxZ2gLHTSXOlPfMnIdyL2M7kIufvsi
	V7rA==
X-Received: by 10.14.1.195 with SMTP id 43mr126019714eed.31.1357136079690;
	Wed, 02 Jan 2013 06:14:39 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b2sm97769783eep.9.2013.01.02.06.14.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 06:14:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 15:14:41 +0100
Message-Id: <cover.1357135909.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [meta-oe][meta-efl][PATCH 0/6] EFL and sip/pyqt upgrade
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
X-List-Received-Date: Wed, 02 Jan 2013 14:29:42 -0000

The following changes since commit 1de21e56eeefdcfe4972900cf9f651ba1d8c9f0b:

  imagemagick: disable opencl (2012-12-27 16:14:23 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (6):
  sip-native: upgrade to 4.14.2
  python-sip: upgrade to 4.14.2
  python-pyqt: upgrade to 4.9.6
  e-base: bump EFL_SRCREV
  edbus2: update SRC_URI
  edbus2: fix segfaults in eve/enjoy

 meta-efl/classes/e-base.bbclass                                    | 2 +-
 meta-efl/recipes-efl/efl/edbus2.inc                                | 2 +-
 meta-efl/recipes-efl/efl/edbus2_svn.bb                             | 6 ++++--
 .../{python-pyqt-4.9.5 => python-pyqt-4.9.6}/pyqt-generated.patch  | 0
 .../qreal_float_support.diff                                       | 0
 .../python/{python-pyqt_4.9.5.bb => python-pyqt_4.9.6.bb}          | 4 ++--
 meta-oe/recipes-devtools/python/python-sip_4.13.3.bb               | 3 ---
 .../python/{python-sip.inc => python-sip_4.14.2.bb}                | 4 +++-
 .../sip/{sip-native_4.13.3.bb => sip-native_4.14.2.bb}             | 7 +++----
 9 files changed, 14 insertions(+), 14 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-pyqt-4.9.5 => python-pyqt-4.9.6}/pyqt-generated.patch (100%)
 rename meta-oe/recipes-devtools/python/{python-pyqt-4.9.5 => python-pyqt-4.9.6}/qreal_float_support.diff (100%)
 rename meta-oe/recipes-devtools/python/{python-pyqt_4.9.5.bb => python-pyqt_4.9.6.bb} (96%)
 delete mode 100644 meta-oe/recipes-devtools/python/python-sip_4.13.3.bb
 rename meta-oe/recipes-devtools/python/{python-sip.inc => python-sip_4.14.2.bb} (87%)
 rename meta-oe/recipes-extended/sip/{sip-native_4.13.3.bb => sip-native_4.14.2.bb} (82%)

-- 
1.8.0.2




Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1A808724DC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Apr 2015 16:24:17 +0000 (UTC)
Received: by pddn5 with SMTP id n5so154939739pdd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Apr 2015 09:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=cLfsUR1/UI1W7wu8IqmCs3Qsv371UF1Jztk8VuME1KA=;
	b=MQve1dtKvZBannwz4F3B3Mi6EiXuHJOELUwD6IgZwPhJD6DMrkPxV5eP+ivuyymhkk
	ggz06BHkrMFlmL0FpRsa19ig55kBansYCYeCUU4utesgjJd7pG5eJoK24K66fGMtrnbQ
	5p0fn1d26x7S+8vK5gfo0k6BKT3TeG7ohqTUGOKWAtvnl+CpfsNLfDdbE0+uMkqgCinf
	tgN9S01mv39eZDcAMxF+a4uokVX5W7xatgLYdQyMqmCMgxY5cc6VAzyuMMNQhRk9416r
	Eote/d3kklNTB5cwEZt2Y4FMXS0hz5Xr9UacMzFeKIKCF3LjrqGbbHhr5Qnw9C8dMyu0
	JzAg==
X-Received: by 10.66.221.193 with SMTP id qg1mr13047822pac.134.1428164658339; 
	Sat, 04 Apr 2015 09:24:18 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id eo1sm6618896pbd.36.2015.04.04.09.24.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 Apr 2015 09:24:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Apr 2015 09:24:10 -0700
Message-Id: <cover.1428164164.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/2] update ruby package
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
X-List-Received-Date: Sat, 04 Apr 2015 16:24:18 -0000

This is an major update for the Ruby package. For those interested in it, please try it out and provide feedback on testing.

The following changes since commit df6c7b1279790d27ebfd58fbdfbac89bde5782ec:

  python-pyopenssl: Upgrade to 0.14 (2015-03-21 16:42:30 +0100)

are available in the git repository at:

  git://github.com/akuster/meta-openembedded.git akuster/ruby_update
  https://github.com//tree/akuster/ruby_update

Armin Kuster (2):
  ruby: package update to verison 2.2.1
  README: update maintainer

 meta-ruby/README                                   |   2 +-
 meta-ruby/recipes-devtools/ruby/ruby.inc           |   8 +-
 ...onf-hardcode-wide-getaddr-info-test-outco.patch |  26 --
 .../ruby/ruby/remove-the-dependency-on-dir.patch   |  37 ---
 .../ruby/ruby/ruby-1.9.3-always-use-i386.patch     |  11 -
 .../ruby/ruby-1.9.3-custom-rubygems-location.patch |  86 ------
 .../ruby/ruby-1.9.3-disable-versioned-paths.patch  | 149 -----------
 .../ruby/ruby/ruby-1.9.3-install-cross.patch       |  16 --
 .../ruby/ruby/ruby-1.9.3-mkmf-verbose.patch        |  11 -
 .../ruby-1.9.3-rubygems-1.8.11-uninstaller.patch   |  76 ------
 ...kmf.rb-fix-race-conditions-at-install-ext.patch |  31 ---
 .../ruby/rubygems-1.8.11-binary-extensions.patch   | 296 ---------------------
 .../ruby/{ruby_1.9.3-p547.bb => ruby_2.2.1.bb}     |  23 +-
 13 files changed, 10 insertions(+), 762 deletions(-)
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/remove-the-dependency-on-dir.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-always-use-i386.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-custom-rubygems-location.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-disable-versioned-paths.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-install-cross.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-mkmf-verbose.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-rubygems-1.8.11-uninstaller.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-mkmf.rb-fix-race-conditions-at-install-ext.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/rubygems-1.8.11-binary-extensions.patch
 rename meta-ruby/recipes-devtools/ruby/{ruby_1.9.3-p547.bb => ruby_2.2.1.bb} (52%)

-- 
2.3.5



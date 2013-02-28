Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UB2jD-0005CD-Ke
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Feb 2013 13:36:52 +0100
Received: by mail-pb0-f51.google.com with SMTP id un15so1041194pbc.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2013 04:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=DeHxixB8+waTV2sucwUVnSZsXIYLHpFfpaQ8WIGjZmw=;
	b=IK4UpOrXt+5C9/7gV4ewdIvfgerA8XR56WGqTJ4oWKHKHZ2yUWHWFrQDPRTnmTuvWu
	ho1k123Nm/lIJABYXdfrVv8e3xdXZzjFzwhiKyZlYGWF1x1YdkCk8Osk3LxvDTNfKxTA
	jcUpByj0k+jaLEJMZfYra1tTmk0X9nV/v3EDaRLe04Vb1rGk70g3YK8vcmOg+eHbEmQq
	sT3Ysp5K90AfysFYx8a+o4egwfQf6gXeYyCdlfnvSQ0brANPFu4hjx94wSleO25Ar8nw
	MTD/qNsgxDw9F6/o7nuW+B0k1u4hgSwB3UjPcD3BykoUipgzfm4oJEEjuAwRUPYlxKmA
	V3qw==
X-Received: by 10.66.250.131 with SMTP id zc3mr9291174pac.107.1362054028729;
	Thu, 28 Feb 2013 04:20:28 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d1sm9101034pav.6.2013.02.28.04.20.22
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 04:20:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Feb 2013 13:20:06 +0100
Message-Id: <cover.1362053615.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.4
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [PATCH][for-danny 0/3] backport meta-ruby
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
X-List-Received-Date: Thu, 28 Feb 2013 12:37:09 -0000

I know that adding new layer is not typical "backport", but we need ruby 
in danny and IIRC Koen also needs.

Also because it's separate layer, there is no danger to users which don't 
need or use it.

The following changes since commit c02834a7cc5fda525c7ebeec545625233bab4cb5:

  xf86-video-geode: Update to 2.11.14 (2013-02-15 12:16:55 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/for-danny3
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/for-danny3

Jackie Huang (2):
  ruby: Add from OE-Classic
  ruby: update to 1.9.3-194

Martin Jansa (1):
  meta-ruby: add empty layer

 meta-ruby/COPYING.MIT                              |  17 ++
 meta-ruby/README                                   |  15 ++
 meta-ruby/conf/layer.conf                          |   9 +
 meta-ruby/recipes-devtools/ruby/ruby.inc           |  43 +++
 ...onf-hardcode-wide-getaddr-info-test-outco.patch |  26 ++
 meta-ruby/recipes-devtools/ruby/ruby/extmk.patch   |  13 +
 .../recipes-devtools/ruby/ruby/extmk_run.patch     |  15 ++
 .../ruby/ruby/ruby-1.9.3-always-use-i386.patch     |  11 +
 .../ruby/ruby/ruby-1.9.3-bignum-test-fix.patch     |  31 +++
 .../ruby/ruby-1.9.3-custom-rubygems-location.patch |  86 ++++++
 .../ruby/ruby-1.9.3-disable-versioned-paths.patch  | 149 +++++++++++
 .../ruby/ruby/ruby-1.9.3-fix-s390x-build.patch     |  12 +
 .../ruby/ruby/ruby-1.9.3-install-cross.patch       |  16 ++
 .../ruby/ruby/ruby-1.9.3-mkmf-verbose.patch        |  11 +
 .../ruby-1.9.3-rubygems-1.8.11-uninstaller.patch   |  76 ++++++
 .../ruby/ruby/ruby-1.9.3-webrick-test-fix.patch    |  24 ++
 .../ruby/rubygems-1.8.11-binary-extensions.patch   | 296 +++++++++++++++++++++
 meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb |  50 ++++
 18 files changed, 900 insertions(+)
 create mode 100644 meta-ruby/COPYING.MIT
 create mode 100644 meta-ruby/README
 create mode 100644 meta-ruby/conf/layer.conf
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby.inc
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby/0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby/extmk.patch
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby/extmk_run.patch
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-always-use-i386.patch
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-bignum-test-fix.patch
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-custom-rubygems-location.patch
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-disable-versioned-paths.patch
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-fix-s390x-build.patch
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-install-cross.patch
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-mkmf-verbose.patch
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-rubygems-1.8.11-uninstaller.patch
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-webrick-test-fix.patch
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby/rubygems-1.8.11-binary-extensions.patch
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb

-- 
1.8.1.4




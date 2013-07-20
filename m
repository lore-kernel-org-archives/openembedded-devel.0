Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4FD706A549
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 15:08:13 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id d10so2962736eaj.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 08:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=yZWSCkO/SySFSTZS4ny5ACGW8efFXer/sDsH6KKTuJA=;
	b=XVhYPhTTLPzKB/9/DeZhPualQ4mCbDSsOyTOyVk6CoKNaNvbmoFuQm/PyO9woJLr9f
	QXQ7sLw1P9paa4vOJK4j6WotvPJcsEjy8x5n0gtVPLy4pxkNixwON7U59mtNmZ2ULqxy
	c6ge6HPUgVbBLPiuo9oaaPMZeo7eoOw14lvaJyNId4RSrpko+j8tj3y+47Uh6ZsDARXU
	NeLp39WsWFt8gdAwtfvbMt4wUxxHiT/vTgplJfSnrtAdIVP+BlZBji5ypRXGWDkzkpJ4
	7nSV2TWXkCHbvfoC0sexBYDjZt2vtu2aaoCeLOfia2wqYeMBR8ymJwPW1GP2Nm/5RfJm
	Kaxg==
X-Received: by 10.15.73.197 with SMTP id h45mr20160606eey.146.1374332893096;
	Sat, 20 Jul 2013 08:08:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p49sm35990294eeu.2.2013.07.20.08.08.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 08:08:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jul 2013 17:08:31 +0200
Message-Id: <cover.1374332866.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH 00/11] autodetected dependencies
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
X-List-Received-Date: Sat, 20 Jul 2013 15:08:13 -0000

The following changes since commit 41748a4afc494b714315ba529f138214f80d41b9:

  licences: Add iozone3, SMAIL_GPL (2013-07-20 17:03:29 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/deps
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/deps

Martin Jansa (11):
  lcdproc5: add PACKAGECONFIG for libftdi, libusb
  openldap: convert to PACKAGECONFIGs, explicitly disable openssl
  samba: use more specific LICENSE
  samba: add dependency on zlib popt, PACKAGECONFIG for pam
  libgphoto2: add configure option for gd and add PACKAGECONFIG
  jack: add dependency on libsaplerate0 and readline
  glog: add dependency on libunwind
  lvm2: add PACKAGECONFIG for readline
  libunwind: add PACKAGECONFIG for lzma
  ntp: add PACKAGECONFIG for libcap and readline
  vim: add PACKAGECONFIG for acl

 meta-networking/recipes-support/ntp/ntp.inc        |   2 +
 meta-oe/recipes-connectivity/samba/samba.inc       |   9 +-
 meta-oe/recipes-extended/lcdproc/lcdproc5.inc      |   8 +-
 .../libgphoto2-2.4.11/allow.to.disable.gd.patch    |  33 +++++
 .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |   6 +-
 meta-oe/recipes-multimedia/jack/jack_0.121.0.bb    |   3 +-
 meta-oe/recipes-support/glog/glog.inc              |   2 +
 meta-oe/recipes-support/libunwind/libunwind.inc    |   4 +
 meta-oe/recipes-support/lvm2/lvm2.inc              |   3 +
 .../recipes-support/openldap/openldap_2.4.23.bb    | 136 +++++++--------------
 meta-oe/recipes-support/vim/vim.inc                |   1 +
 11 files changed, 107 insertions(+), 100 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.4.11/allow.to.disable.gd.patch

-- 
1.8.3.2



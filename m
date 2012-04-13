Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SIgOq-00013Q-El
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2012 15:18:52 +0200
Received: by wgbds1 with SMTP id ds1so5457017wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2012 06:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Dcp8O8uA+DqmAibeo7i6d3zcG8EfJyfhHQiNN7SGgXw=;
	b=WZjJPxrmGGso1l9oV3A03PjyAXE4z2CPwtNj4ZQ85w2wD3OwLshEn+nU+LnyHU59o0
	vfDGmieZ2GwV2sIPcPFevkSpg0XXhn7Zv/QdbXvqE8Ky/wzatOEJWiELhnkkgnbTEakF
	hdfYvDBGq0XUx1O3d9JF4JBHUrYYQTTyUJuLKripC0LLGaF129vSmb4TV4IEBfC06Vw+
	pMxC8Ajma5uUL/XC8X57CO7DFXGTftmCCzYsx53pZPZG3qyolLX5HrqUGRHX5XxdFguC
	65WPQtGJd1UbH/0VH4L7xp+C+aWQhOdqIoHZGGe94JtPrwIKDOfU8oqSbpg5aABakGcx
	W2qA==
Received: by 10.180.78.40 with SMTP id y8mr4563110wiw.15.1334322571262;
	Fri, 13 Apr 2012 06:09:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm4673426wiy.7.2012.04.13.06.09.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Apr 2012 06:09:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Apr 2012 15:09:22 +0200
Message-Id: <cover.1334322354.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [meta-oe][PATCH 0/1] Possible fix for missing -native support for gtk+-native
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
X-List-Received-Date: Fri, 13 Apr 2012 13:18:52 -0000

Please note that this patch is old and not tested with current HEAD, 
because I'm using different solution in SHR branches - BBCLASSEXTENDs in oe-core
recipes instead of small bbappends which makes recipe upgrades harder because of 
inter-layer dependencies, see: 
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019624.html
from this patchset
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019619.html

But because fix for PACKAGECONFIG added DEPENDS is now in you can find this patch usefull
and maybe we'll be allowed to move at least some BBCLASSEXTENDs to oe-core later - after release.

The following changes since commit 118734e096fda6c47172025969f3df4cfb0b33c3:

  qte-toolchain: add qwte support (2012-04-13 10:50:40 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/xorg
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/xorg

Martin Jansa (1):
  xorg: add more native BBCLASSEXTENDs for gtk+-native

 .../xorg-lib/libxcomposite_0.4.3.bbappend          |    1 +
 .../xorg-lib/libxcursor_1.1.12.bbappend            |    1 +
 .../xorg-lib/libxdamage_1.1.3.bbappend             |    1 +
 .../xorg-lib/libxfixes_5.0.bbappend                |    1 +
 .../xorg-lib/libxrandr_1.3.2.bbappend              |    1 +
 .../xorg-proto/compositeproto_0.4.2.bbappend       |    1 +
 .../xorg-proto/damageproto_1.2.1.bbappend          |    1 +
 .../xorg-proto/fixesproto_5.0.bbappend             |    1 +
 .../xorg-proto/randrproto_1.3.2.bbappend           |    1 +
 9 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxcomposite_0.4.3.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.12.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxdamage_1.1.3.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxrandr_1.3.2.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-proto/compositeproto_0.4.2.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-proto/damageproto_1.2.1.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-proto/fixesproto_5.0.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-proto/randrproto_1.3.2.bbappend

-- 
1.7.8.5




Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T9Lyi-0003QR-Bp
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 22:13:36 +0200
Received: by bkcik5 with SMTP id ik5so532118bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2012 13:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=IoYQCA8x0omM3+uQGmTcGDa/pVFkiZc68AXiM2GA4Y8=;
	b=daoDh6qZ11wlGBQRkGXoL9cpvWr3En+M8ApGvWwPBMqjgDsk1oK0Potpg25HbIiuUg
	NFHv5twHCK7zOjbmGUnRjIUFvpuJA831XtWgAbo9Rmx+3BXmNQUVoKG/AI0P5mvZwyQR
	zrQbZF02pA0SR+X/ZbOaT+9uwf1p1rakY1bItKdZnuVan8kGodKJHyNuxYCNr/jQdHPO
	OYuuBw+uDP58ZLZLwn1S7A5HVpkaAETSuDJk4N+ZrZ3Eo0sq1YP8o3mNMmF7q/vYSSmE
	tOp7BPb67KX/8LAc1CLj5/xKw72WLY7XAKyvcDSt9Fs6+Nf+BXf0Q9pHiczx7hDKxIBs
	n06Q==
Received: by 10.204.4.154 with SMTP id 26mr9789628bkr.91.1346875272938;
	Wed, 05 Sep 2012 13:01:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id he8sm2063451bkc.3.2012.09.05.13.01.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 13:01:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 22:01:36 +0200
Message-Id: <cover.1346875241.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [meta-oe][meta-efl][PATCH 0/2] Drop task-x11*
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
X-List-Received-Date: Wed, 05 Sep 2012 20:13:36 -0000

The following changes since commit 49e269ecc66adda341922cbd86167bbfa97c54ca:

  packagegroup: add RPROVIDES/RREPLACES/RCONFLICTS and bump PR to get some upgrade path (2012-09-05 10:05:06 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (2):
  task-x11*: remove in favor of packagegroup-core-x11* variants from
    oe-core
  task-x11-illume: rename to packagegroup-x11-illume

 .../packagegroup-x11-illume.bb}                    | 11 +++++---
 meta-oe/conf/layer.conf                            |  1 -
 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb  | 23 -----------------
 meta-oe/recipes-core/tasks/task-x11_1.0.bb         | 30 ----------------------
 4 files changed, 7 insertions(+), 58 deletions(-)
 rename meta-efl/recipes-efl/{tasks/task-x11-illume.bb => packagegroups/packagegroup-x11-illume.bb} (67%)
 delete mode 100644 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
 delete mode 100644 meta-oe/recipes-core/tasks/task-x11_1.0.bb

-- 
1.7.12




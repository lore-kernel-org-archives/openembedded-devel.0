Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S5iEO-0003oi-Or
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 19:38:28 +0100
Received: by eekc1 with SMTP id c1so201290eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2012 10:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=lxOs0THMJrFWs5ZDZYGZCNcAfTFHqIoHMwbPHhERKLc=;
	b=mzw8Jw3qmORRScCiltKm8DLBo6gGx6WFfbKJP9Nyqs1gmM49V642WSrCwUAsubPb7a
	nH718GJx5CVRl1XRqFXwlvxjUIQu4op6ZNzbxv5Gpkb2GZDZlDWNfcd/yuaGMReq9E+U
	accSrHYFItD97PSA2BZMXRQQdMFTLjBpbIIKKMzVXLGjED4NlhSQ6SJLoUvHogDdj/j2
	l3IImb0T93EvpMnEHU1pvCcLZCyr6BqczAtzCCjfvYDiG85qnL8a1Yvt9GSkUIOvw3s5
	ZO+TbQHF/eRdmmTf5xsmVAiKzxsGCihkHIz9YFwXSYC1IX+VqHarMrOBCRVbUsOB9gzz
	iFAw==
Received: by 10.14.127.139 with SMTP id d11mr2545686eei.74.1331231390322;
	Thu, 08 Mar 2012 10:29:50 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y11sm8911166eem.3.2012.03.08.10.29.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 10:29:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Mar 2012 19:29:40 +0100
Message-Id: <cover.1331231195.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [meta-oe][meta-efl][PATCH 0/7] PR bumps and DEPENDS fixes after tiff upgrade
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
X-List-Received-Date: Thu, 08 Mar 2012 18:38:28 -0000

The following changes since commit 5b3974ed483418b206678acca7414b81bcf749a7:

  udev: consolekit package requires x11 (2012-03-07 15:17:13 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (7):
  e-base: bump EFL_SRCREV
  poppler: add tiff to DEPENDS to make builds more deterministic
  elementary: add poppler to DEPENDS
  epdf: another PR bump for libtiff3->libtiff5
  python-elementary: another PR bump for libtiff3->libtiff5
  lcms: add tiff to DEPENDS
  eve: another PR bump for libtiff3->libtiff5

 meta-efl/classes/e-base.bbclass                    |    2 +-
 .../python/python-elementary_svn.bb                |    2 +-
 ...ume-Remove-the-popup.-It-s-not-needed-now.patch |  135 --------------------
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |    1 -
 meta-efl/recipes-efl/e17/eve_svn.bb                |    2 +-
 meta-efl/recipes-efl/efl/elementary_svn.bb         |    4 +-
 meta-efl/recipes-efl/efl/epdf_svn.bb               |    2 +-
 meta-oe/recipes-support/lcms/lcms_1.17.bb          |    3 +-
 meta-oe/recipes-support/poppler/poppler.inc        |    2 +-
 meta-oe/recipes-support/poppler/poppler_0.18.0.bb  |    2 +-
 10 files changed, 10 insertions(+), 145 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm/0001-Revert-Illume-Remove-the-popup.-It-s-not-needed-now.patch

-- 
1.7.8.5




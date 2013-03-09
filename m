Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UEQBX-0004Nf-2K
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Mar 2013 21:16:06 +0100
Received: by mail-ee0-f45.google.com with SMTP id b57so1557357eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Mar 2013 11:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=MrtZt4j9ZG3ONin2CdHZNJdmzKZHyGoZqBQixA3cuF8=;
	b=VB5is5ZFFx9jdZrMAvst75GcZJ6dZs9mIrQFtGF8OLRHpwUV4o4vXOOKFW2owZ83N7
	KuDRazxNxwP8CyoUUMnTI4np8+zLvUbvJMdXmj3+lB/vu8Ce8wKrKEP7X3jfsRNE0z1y
	GbtWaTaYPbzLkZ5iN5ztj8rgYIj7QM/Ydvr5yxfwNofSkOJ21wBVpyRmEFtV65sKc8uK
	GyN5xofvLT3UNd9dSUUvKNKHLC0FdTa4KPreWrm6CsvfpSc6a9+4K8wZmSaghGBPJkwI
	6PXUcqnRcLWMePxKDYRDXvxRv04B5Mb1CVtbOacgAIb5JsEkkzqECOWixkS60r7oxzSY
	wrXQ==
X-Received: by 10.14.225.72 with SMTP id y48mr19027688eep.45.1362859157362;
	Sat, 09 Mar 2013 11:59:17 -0800 (PST)
Received: from localhost.localdomain (p5B0A1B31.dip.t-dialin.net.
	[91.10.27.49])
	by mx.google.com with ESMTPS id m46sm14583955eeo.16.2013.03.09.11.59.15
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 09 Mar 2013 11:59:16 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Mar 2013 20:59:03 +0100
Message-Id: <1362859144-336-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe] gedit build fix
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
X-List-Received-Date: Sat, 09 Mar 2013 20:16:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6c9ac38e8b998e6739383ba91e0c4e0c0ed0094b:

  modphp5: use ${baselib} instead of hardcoded "lib" (2013-03-07 11:44:11 +0000)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git gedit-fix

Andreas Müller (1):
      gedit: fix compile

 .../0001-workaround-void-pointer-arithmetic.patch  |   57 ++++++++++++++++++++
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb     |    3 +-
 2 files changed, 59 insertions(+), 1 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gedit/files/0001-workaround-void-pointer-arithmetic.patch

-- 
1.7.4.4




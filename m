Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UYFSP-0000IW-9j
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 14:51:28 +0200
Received: by mail-ea0-f182.google.com with SMTP id z16so716251ead.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2013 05:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=68wDojbfKi3m40x1+Gz4AJwSLPmDOZ8D1OTox100iPk=;
	b=WT/Pqqakw3uruAIhUJGekRTOBMLYdkoUIj2K8EkoiwOuT+xIIlyaWSFpWwZVd2jQ3Z
	9Fuw7hD/34QqLxws+db79Nm83XsBWWxcLKTb8/uWAKksbz0n+bDAkeYqq2zYFjrXIJzz
	l8vfTNuFWRICJiFZC+OTZEVHOgjcEyjaMWsfdmLiIOhqstVhSn/3sPF/4YAHisf17dAE
	3T35lLi55wdOeBVBqb/Em4QHKfRv12rYI/PngMzsQVUB3aqhtBS8j6xGikaaQy77QWdj
	vem6n6z4/oiIPnUJj0fbySjmKzsyIpwZwMkoB+xHEO8PrCoMMaNLx2md0KZ2DfgfAgCM
	FVmQ==
X-Received: by 10.15.23.133 with SMTP id h5mr8571729eeu.12.1367584410492;
	Fri, 03 May 2013 05:33:30 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204]) by mx.google.com with ESMTPSA id
	bk42sm15658333eeb.3.2013.05.03.05.33.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 03 May 2013 05:33:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 May 2013 14:31:03 +0200
Message-Id: <1367584267-8767-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe/master,V2 0/4] glib 2.36 fixes
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
X-List-Received-Date: Fri, 03 May 2013 12:51:39 -0000
X-List-Received-Date: Fri, 03 May 2013 12:51:39 -0000
X-List-Received-Date: Fri, 03 May 2013 12:51:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1->V2

* orbit2 commit message
* added 'gnome-disk-utility: backport property DeviceAutomountHint'

The following changes since commit 62ad7c96a12bc54871bf37366cfe89ec96881537:

  connman: Fix .bbappend name (2013-05-02 13:04:52 +0200)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git glibc-2.36-fixes

Andreas Müller (4):
      gvfs: slightly update to 1.10.1 and backport patches to build with glib 2.36
      gnome-disk-utility: backport property DeviceAutomountHint
      orbit2: update to 2.14.17 to fix build with glib 2.36
      geany: update to 1.23 to fix build with glib 2.36

 .../0001-Add-support-for-DeviceAutomountHint.patch |   74 +
 .../gnome-disk-utility_2.32.0.bb                   |    3 +-
 ...ect-UDISKS_AUTOMOUNT_HINT-available-in-re.patch |   57 +
 .../0001-gvfsfusedaemon.c-fix-glib-build.patch     |   31 -
 ...ib-2.31-deprecations-and-thread-API-chang.patch |  599 +++++
 .../0003-Adapt-to-glib-mutex-API-changes.patch     | 2454 ++++++++++++++++++++
 .../0004-Adapt-to-glib-thread-API-changes.patch    |   44 +
 ..._1.8.2.bb => gvfs-gdu-volume-monitor_1.10.1.bb} |    2 +-
 meta-gnome/recipes-gnome/gvfs/gvfs.inc             |   15 +-
 .../gvfs/{gvfs_1.8.2.bb => gvfs_1.10.1.bb}         |    2 +-
 ...-src-Makefile.am-fix-build-with-glib-2.36.patch |   34 +
 .../configure-lossage.patch                        |    0
 .../{orbit2-2.14.17 => orbit2}/pkgconfig-fix.patch |    0
 .../{orbit2_2.14.17.bb => orbit2_2.14.19.bb}       |   16 +-
 .../geany/{geany_1.22.bb => geany_1.23.bb}         |    7 +-
 15 files changed, 3289 insertions(+), 49 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-Add-support-for-DeviceAutomountHint.patch
 create mode 100644 meta-gnome/recipes-gnome/gvfs/files/0001-Revert-Respect-UDISKS_AUTOMOUNT_HINT-available-in-re.patch
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/files/0001-gvfsfusedaemon.c-fix-glib-build.patch
 create mode 100644 meta-gnome/recipes-gnome/gvfs/files/0002-Adapt-to-GLib-2.31-deprecations-and-thread-API-chang.patch
 create mode 100644 meta-gnome/recipes-gnome/gvfs/files/0003-Adapt-to-glib-mutex-API-changes.patch
 create mode 100644 meta-gnome/recipes-gnome/gvfs/files/0004-Adapt-to-glib-thread-API-changes.patch
 rename meta-gnome/recipes-gnome/gvfs/{gvfs-gdu-volume-monitor_1.8.2.bb => gvfs-gdu-volume-monitor_1.10.1.bb} (97%)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.8.2.bb => gvfs_1.10.1.bb} (97%)
 create mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2/0001-linc2-src-Makefile.am-fix-build-with-glib-2.36.patch
 rename meta-gnome/recipes-gnome/orbit2/{orbit2-2.14.17 => orbit2}/configure-lossage.patch (100%)
 rename meta-gnome/recipes-gnome/orbit2/{orbit2-2.14.17 => orbit2}/pkgconfig-fix.patch (100%)
 rename meta-gnome/recipes-gnome/orbit2/{orbit2_2.14.17.bb => orbit2_2.14.19.bb} (68%)
 rename meta-oe/recipes-devtools/geany/{geany_1.22.bb => geany_1.23.bb} (58%)

-- 
1.7.6.5




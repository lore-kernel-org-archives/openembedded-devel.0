Received: from na3sys009aog125.obsmtp.com ([74.125.149.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1QrvjP-0001Lm-Ct
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Aug 2011 19:41:15 +0200
Received: from mail-vw0-f52.google.com ([209.85.212.52]) (using TLSv1) by
	na3sys009aob125.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTkVkqjNkBqBf1YQwxYwHOmGcKXK/viTp@postini.com;
	Fri, 12 Aug 2011 10:36:44 PDT
Received: by mail-vw0-f52.google.com with SMTP id 16so3966728vws.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2011 10:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=g9LVrq0K7ckKNpp5mr4NOCflerw4q5CSCMlbx22/+/g=;
	b=dPRP7SymM3juGv+T/D+qfEpfAu7RM16KyAYqSLdemT3TPD3yVey3XBJl46bGJZhXGd
	dFptH5hmH9bgXdx2KCcQ1qsg0n6FdRgBcOGYWKW28olwf3LrdriGov6ovjBM0S0tq8hL
	U6D5KjvzqtAyonaLUBp1BWZP3GuYDOi4/x1vg=
Received: by 10.52.182.164 with SMTP id ef4mr1002512vdc.319.1313161136131;
	Fri, 12 Aug 2011 07:58:56 -0700 (PDT)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id o3sm1343976vca.26.2011.08.12.07.58.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Aug 2011 07:58:55 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Aug 2011 10:58:53 -0400
Message-Id: <1313161133-8899-1-git-send-email-bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.4.1
Cc: Tom Rini <tom_rini@mentor.com>
Subject: [2011.03-maintenance] pull-request: mtd-utils
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
X-List-Received-Date: Fri, 12 Aug 2011 17:41:15 -0000

The following changes since commit c8f2107a4784fabf877fa6750e05655e6092da73:

  gtk-icon-cache bbclass: only add runtime dependencies on hicolor-icon-theme when installing icons (2011-08-04 09:38:55 +0200)

are available in the git repository at:
  git://github.com/BenGardiner/openembedded.git 2011.03-maintenance-mtdutils

Andrea Adami (3):
      mtd-utils: upgrade to latest 1.4.4 release (bugfix)
      mtd-utils: remove broken 1.4.1 version
      mtd-utils: archive obsolete old versions

Tom Rini (1):
      mtd-utils-native.inc: Drop lzo-native

 .../mtd/mtd-utils-1.4.1/fix_heap_corruption.patch  |   95 --------------------
 recipes/mtd/mtd-utils_1.4.1.bb                     |   18 ----
 recipes/mtd/mtd-utils_1.4.4.bb                     |   34 +++++++
 recipes/{ => obsolete}/mtd/mtd-utils-native.inc    |    2 +-
 .../{ => obsolete}/mtd/mtd-utils-native_1.1.0.bb   |    0
 .../mtd/mtd-utils-native_1.2.0+git.bb              |    0
 .../{ => obsolete}/mtd/mtd-utils-native_1.3.1.bb   |    0
 .../{ => obsolete}/mtd/mtd-utils-native_1.4.1.bb   |    0
 .../mtd/mtd-utils-tests_1.2.0+git.bb               |    0
 recipes/{ => obsolete}/mtd/mtd-utils.inc           |    0
 .../add-exclusion-to-mkfs-jffs2-git.patch          |    0
 .../mtd/mtd-utils/fix-ignoreerrors-git.patch       |    0
 .../{ => obsolete}/mtd/mtd-utils/lzo_1x-git.patch  |    0
 recipes/{ => obsolete}/mtd/mtd-utils/lzo_1x.patch  |    0
 recipes/{ => obsolete}/mtd/mtd-utils_1.1.0.bb      |    0
 recipes/{ => obsolete}/mtd/mtd-utils_1.2.0+git.bb  |    0
 recipes/{ => obsolete}/mtd/mtd-utils_1.3.1.bb      |    0
 17 files changed, 35 insertions(+), 114 deletions(-)
 delete mode 100644 recipes/mtd/mtd-utils-1.4.1/fix_heap_corruption.patch
 delete mode 100644 recipes/mtd/mtd-utils_1.4.1.bb
 create mode 100644 recipes/mtd/mtd-utils_1.4.4.bb
 rename recipes/{ => obsolete}/mtd/mtd-utils-native.inc (76%)
 rename recipes/{ => obsolete}/mtd/mtd-utils-native_1.1.0.bb (100%)
 rename recipes/{ => obsolete}/mtd/mtd-utils-native_1.2.0+git.bb (100%)
 rename recipes/{ => obsolete}/mtd/mtd-utils-native_1.3.1.bb (100%)
 rename recipes/{ => obsolete}/mtd/mtd-utils-native_1.4.1.bb (100%)
 rename recipes/{ => obsolete}/mtd/mtd-utils-tests_1.2.0+git.bb (100%)
 rename recipes/{ => obsolete}/mtd/mtd-utils.inc (100%)
 rename recipes/{ => obsolete}/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git.patch (100%)
 rename recipes/{ => obsolete}/mtd/mtd-utils/fix-ignoreerrors-git.patch (100%)
 rename recipes/{ => obsolete}/mtd/mtd-utils/lzo_1x-git.patch (100%)
 rename recipes/{ => obsolete}/mtd/mtd-utils/lzo_1x.patch (100%)
 rename recipes/{ => obsolete}/mtd/mtd-utils_1.1.0.bb (100%)
 rename recipes/{ => obsolete}/mtd/mtd-utils_1.2.0+git.bb (100%)
 rename recipes/{ => obsolete}/mtd/mtd-utils_1.3.1.bb (100%)



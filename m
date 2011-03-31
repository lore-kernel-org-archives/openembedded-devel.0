Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5DzF-0006xx-9d
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 11:16:18 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so1664438bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 02:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=1oyyJxvwVUnx1T7nZcbgMXSlWR/H1WbpT3vnAkI01rw=;
	b=IybS1pkIt5/0K+b4lPxaUXRprIaC85FW1bBG/4FkNhlh9297e4oG64jehYaOhutqUC
	ehPLrM63pE0hqN5X9VxE530D+rLnYrUaT5NV8ugIr/FG6WI1D4wVpONo96Ee1VLqdzcI
	st4ubOiYAg6jxGjhrpD41DpDUPNTdPtWIMrLM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=AVTKb3tL0jnrFBKdS6wFsFPmfIXqHe9vuwNcK9w7CV6gfPdTi/xXzWrfNfAOsJsiqx
	0fF1ajz8picl4vSNo6ul4r2tgP5aUSaRU/DTIYE7qff+mBxprU4jqmnM/iLvFdcYBElS
	2cGnz9L/mqgUW4gxJKECcNiddlN0CkKK8ThhE=
Received: by 10.204.7.3 with SMTP id b3mr2143354bkb.160.1301562858571;
	Thu, 31 Mar 2011 02:14:18 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q24sm586002bks.21.2011.03.31.02.14.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 02:14:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 11:14:10 +0200
Message-Id: <cover.1301560589.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/8] [meta-efl] Pull request #2
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
X-List-Received-Date: Thu, 31 Mar 2011 09:16:18 -0000

More LIC_FILES_CHKSUMs
Imported python-efl from meta-shr (will need python-cython from following meta-oe pull request)

Pull URL: git://gitorious.org/shr/meta-openembedded.git
  Branch: jama/meta-efl
  Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/meta-efl

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (8):
  illume-keyboards-shr: add LICENSE
  elementary: add LIC_FILES_CHKSUM
  emotion: add LIC_FILES_CHKSUM
  epdf: add LIC_FILES_CHKSUM
  ethumb: add LIC_FILES_CHKSUM
  libeflvala: add LIC_FILES_CHKSUM
  task-x11-illume: add LIC_FILES_CHKSUM
  python-efl: import from meta-shr

 .../recipes-devtools/python/python-ecore_svn.bb    |    6 +++
 .../recipes-devtools/python/python-edbus_svn.bb    |    7 +++
 .../python-edje/0001-fix-unicode-conversion.patch  |   38 ++++++++++++++++
 .../recipes-devtools/python/python-edje_svn.bb     |    8 +++
 meta-efl/recipes-devtools/python/python-efl.inc    |   46 ++++++++++++++++++++
 .../python/python-elementary_svn.bb                |    6 +++
 .../recipes-devtools/python/python-emotion_svn.bb  |    6 +++
 .../recipes-devtools/python/python-evas_svn.bb     |    5 ++
 .../recipes-efl/e17/illume-keyboards-shr/LICENSE   |   25 +++++++++++
 .../recipes-efl/e17/illume-keyboards-shr_git.bb    |    7 ++-
 meta-efl/recipes-efl/efl/elementary_svn.bb         |    3 +-
 meta-efl/recipes-efl/efl/emotion_svn.bb            |    1 +
 meta-efl/recipes-efl/efl/epdf_svn.bb               |    6 ++-
 meta-efl/recipes-efl/efl/ethumb_svn.bb             |    3 +-
 meta-efl/recipes-efl/efl/libeflvala_svn.bb         |    3 +-
 meta-efl/recipes-efl/tasks/task-x11-illume.bb      |    1 +
 16 files changed, 164 insertions(+), 7 deletions(-)
 create mode 100644 meta-efl/recipes-devtools/python/python-ecore_svn.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-edbus_svn.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-edje/0001-fix-unicode-conversion.patch
 create mode 100644 meta-efl/recipes-devtools/python/python-edje_svn.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-efl.inc
 create mode 100644 meta-efl/recipes-devtools/python/python-elementary_svn.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-emotion_svn.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-evas_svn.bb
 create mode 100644 meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE

-- 
1.7.4.1




Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVfS0-0008BK-OG
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 09:23:32 +0100
Received: by eekc1 with SMTP id c1so154835eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 00:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=CaMe6IMbcsoQlhe7zXZzKi6xOTmBUowv9ZZZ6yqSGdI=;
	b=SR1DhQLDKUGfO05KcqbadBdC0ATnSRZxdqJk0kZnrBRrWik6HS5zBb2VbpyQbtGAsa
	Jq+wk5pxHavWZ7p35mcndfu+2GOje2pN1sf6yVK1LhJ+/1BsjmCWi+5fGgGbGgzyQ5PK
	Rpovjvjyo4Gcn/O/b/QV9z/4xLLxgYhx1WBW8=
Received: by 10.14.16.97 with SMTP id g73mr116682eeg.73.1322641009707;
	Wed, 30 Nov 2011 00:16:49 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q28sm3655560eea.6.2011.11.30.00.16.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 00:16:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:16:45 +0100
Message-Id: <cover.1322640506.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
Subject: [meta-efl 00/11] efl upgrade
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
X-List-Received-Date: Wed, 30 Nov 2011 08:23:32 -0000

I'm testing even newer revisions for 1.1.0-beta, but with current elementary
changes I'll keep it a bit longer in shr or jansa/test branch until API settle
a bit again.. (ie elm_genlist/elm_gengrid API was unifiend to elm_gen around r64250
but today there is new plan to remove new elm_gen and merge gengrid to genlist and 
keep genlist api see r65700)

The following changes since commit f3ca7acd0b678a9247e432aee34512a26e30f509:

  libsdl-x11: drop from meta-oe (2011-11-30 08:52:38 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/meta-efl
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-efl

Martin Jansa (11):
  elsa: add sessreg xauth to RDEPENDS
  elsa: add elsa.conf to CONFFILES
  elsa: use common-* instead of system-auth in pam config
  e-base: bump EFL_SRCREV for 1.1.0 alpha versions
  efl.bbclass: don't remove STAGING_LIBDIR STAGING_INCDIR from efl
    pkgconfig files
  epdf: drop upstream applied patch and ewl is gone too
  eeze: pass /bin/true instead of eject which is not available
  edje: fix license metadata
  elementary: fix license metadata
  elementary: add gettextize patch
  elementary: disable web support

 meta-efl/classes/e-base.bbclass                    |    2 +-
 meta-efl/classes/efl.bbclass                       |    2 +-
 meta-efl/recipes-efl/e17/elfe_svn.bb               |    3 +-
 meta-efl/recipes-efl/efl/edje.inc                  |    5 +-
 meta-efl/recipes-efl/efl/eeze.inc                  |    3 +
 .../0001-elementary-gettextize-0.18.1.patch        |   76 ++++++++++++++++++++
 meta-efl/recipes-efl/efl/elementary_svn.bb         |    7 ++-
 ...am-use-common-auth-instead-of-system-auth.patch |   29 ++++++++
 meta-efl/recipes-efl/efl/elsa_svn.bb               |    8 ++-
 .../efl/epdf/epdf.poppler-0.16.api.change.patch    |   11 ---
 meta-efl/recipes-efl/efl/epdf_svn.bb               |    2 -
 meta-efl/recipes-efl/efl/evas_svn.bb               |    3 +-
 12 files changed, 126 insertions(+), 25 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/elementary/0001-elementary-gettextize-0.18.1.patch
 create mode 100644 meta-efl/recipes-efl/efl/elsa/0001-pam-use-common-auth-instead-of-system-auth.patch
 delete mode 100644 meta-efl/recipes-efl/efl/epdf/epdf.poppler-0.16.api.change.patch

-- 
1.7.8.rc4




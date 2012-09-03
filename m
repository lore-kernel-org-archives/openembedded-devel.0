Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T8dM1-0005vw-Vn
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Sep 2012 22:34:42 +0200
Received: by wibhn17 with SMTP id hn17so3665027wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Sep 2012 13:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=U8HlKa0uWBffUFgKxowQVWqwaqzbhY0wa+3OKpL05OQ=;
	b=B3oBqTbwbfTNxVjmCYgjNdoqkDjUCxNZWdfvodJEhv4wCG+SIGc8w0hwbqq9hYHu+n
	qX3uh1ItQIYdvYKym3X3J1GdLw2IOoT58Ns4LSHPNnS/nQRWMBnwsj+LnNHZE7dV8jBF
	pavFfbGi1d0VgCAzzMWjricd7RjeB90ua1Af4s1/2zjZ4zwsHzhZg5G477FvbKYlz3pR
	peaAEw5deyrCHFhX4heVMsRKgalUelyWVKBHfJ+21o4IeOIzdsik0mJ1F9u38ZRu7pGb
	loJl/urG+jBdpnEBWhPxpWWogSVT7p7+uYAxtT2dQ0SZ78Aa2f3m6Zu6x42ZRdBR0iv3
	IE+Q==
Received: by 10.180.94.164 with SMTP id dd4mr25657419wib.1.1346703741085;
	Mon, 03 Sep 2012 13:22:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h9sm20612142wiz.1.2012.09.03.13.22.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 13:22:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Sep 2012 22:22:42 +0200
Message-Id: <cover.1346703604.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [meta-oe][meta-efl][PATCH 0/3] EFL upgrade to 1.7.0
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
X-List-Received-Date: Mon, 03 Sep 2012 20:34:42 -0000

The following changes since commit a81cdc840c1dfca2bd0cb4ddd6e4bc1488286649:

  gtk-xfce-engine: fix staticdev warning (2012-08-31 09:06:17 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (3):
  e-base: bump EFL_SRCREV to 1.7.0 release and update PV in svn recipes
  terminology: add version 0.1.0, negative D_P to svn and bump PE
  recipes-efl: upgrade from 1.7.0-beta to 1.7.0

 meta-efl/classes/e-base.bbclass                    |  2 +-
 .../conf/distro/include/efl-from-svn-recipes.inc   | 17 +++++++++-------
 meta-efl/recipes-efl/e17/terminology.inc           | 23 ++++++++++++++++++++++
 meta-efl/recipes-efl/e17/terminology_0.1.0.bb      | 10 ++++++++++
 meta-efl/recipes-efl/e17/terminology_svn.bb        | 22 +++------------------
 .../efl/{ecore_1.6.99-beta.bb => ecore_1.7.0.bb}   |  6 ++----
 meta-efl/recipes-efl/efl/ecore_svn.bb              |  2 +-
 meta-efl/recipes-efl/efl/edbus_1.6.99-beta.bb      | 12 -----------
 meta-efl/recipes-efl/efl/edbus_1.7.0.bb            | 10 ++++++++++
 meta-efl/recipes-efl/efl/edbus_svn.bb              |  2 +-
 meta-efl/recipes-efl/efl/edje_1.6.99-beta.bb       | 12 -----------
 meta-efl/recipes-efl/efl/edje_1.7.0.bb             | 10 ++++++++++
 meta-efl/recipes-efl/efl/edje_svn.bb               |  2 +-
 meta-efl/recipes-efl/efl/eet_1.6.99-beta.bb        | 12 -----------
 meta-efl/recipes-efl/efl/eet_1.7.0.bb              | 10 ++++++++++
 meta-efl/recipes-efl/efl/eet_svn.bb                |  2 +-
 meta-efl/recipes-efl/efl/eeze_1.6.99-beta.bb       | 12 -----------
 meta-efl/recipes-efl/efl/eeze_1.7.0.bb             | 10 ++++++++++
 meta-efl/recipes-efl/efl/eeze_svn.bb               |  2 +-
 meta-efl/recipes-efl/efl/efreet_1.6.99-beta.bb     | 12 -----------
 meta-efl/recipes-efl/efl/efreet_1.7.0.bb           | 10 ++++++++++
 meta-efl/recipes-efl/efl/efreet_svn.bb             |  2 +-
 meta-efl/recipes-efl/efl/eina_1.6.99-beta.bb       | 12 -----------
 meta-efl/recipes-efl/efl/eina_1.7.0.bb             | 10 ++++++++++
 meta-efl/recipes-efl/efl/eina_svn.bb               |  2 +-
 meta-efl/recipes-efl/efl/eio_1.6.99-beta.bb        | 12 -----------
 meta-efl/recipes-efl/efl/eio_1.7.0.bb              | 10 ++++++++++
 meta-efl/recipes-efl/efl/eio_svn.bb                |  2 +-
 meta-efl/recipes-efl/efl/elementary_1.6.99-beta.bb | 12 -----------
 meta-efl/recipes-efl/efl/elementary_1.7.0.bb       | 10 ++++++++++
 meta-efl/recipes-efl/efl/elementary_svn.bb         |  2 +-
 meta-efl/recipes-efl/efl/embryo_1.6.99-beta.bb     | 12 -----------
 meta-efl/recipes-efl/efl/embryo_1.7.0.bb           | 10 ++++++++++
 meta-efl/recipes-efl/efl/embryo_svn.bb             |  2 +-
 meta-efl/recipes-efl/efl/emotion_1.6.99-beta.bb    | 12 -----------
 meta-efl/recipes-efl/efl/emotion_1.7.0.bb          | 10 ++++++++++
 meta-efl/recipes-efl/efl/emotion_svn.bb            |  2 +-
 meta-efl/recipes-efl/efl/ethumb_1.6.99-beta.bb     | 12 -----------
 meta-efl/recipes-efl/efl/ethumb_1.7.0.bb           | 10 ++++++++++
 meta-efl/recipes-efl/efl/ethumb_svn.bb             |  3 +--
 .../efl/evas-generic-loaders_1.6.99-beta.bb        | 12 -----------
 .../recipes-efl/efl/evas-generic-loaders_1.7.0.bb  | 10 ++++++++++
 .../recipes-efl/efl/evas-generic-loaders_svn.bb    |  2 +-
 meta-efl/recipes-efl/efl/evas_1.6.99-beta.bb       | 12 -----------
 meta-efl/recipes-efl/efl/evas_1.7.0.bb             | 10 ++++++++++
 meta-efl/recipes-efl/efl/evas_svn.bb               |  2 +-
 meta-efl/recipes-efl/efl/expedite_1.6.99-beta.bb   | 12 -----------
 meta-efl/recipes-efl/efl/expedite_1.7.0.bb         | 10 ++++++++++
 meta-efl/recipes-efl/efl/expedite_svn.bb           |  2 +-
 49 files changed, 204 insertions(+), 215 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/terminology.inc
 create mode 100644 meta-efl/recipes-efl/e17/terminology_0.1.0.bb
 rename meta-efl/recipes-efl/efl/{ecore_1.6.99-beta.bb => ecore_1.7.0.bb} (46%)
 delete mode 100644 meta-efl/recipes-efl/efl/edbus_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/edbus_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edje_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/edje_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eet_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/eet_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eeze_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/eeze_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.0.bb

-- 
1.7.12




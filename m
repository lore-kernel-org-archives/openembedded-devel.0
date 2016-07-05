Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7544A601D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jul 2016 02:04:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6524mMD008727
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Jul 2016 19:04:48 -0700
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 4 Jul 2016 19:04:47 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Jul 2016 10:04:43 +0800
Message-ID: <cover.1467683887.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [meta-gnome][PATCH 0/2] gtksourceview2 and mousepad: fix build error with gcc6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jul 2016 02:04:48 -0000
Content-Type: text/plain


The following changes since commit 1cb7275961fd4bca3a6cb70e064ad6e6e1ff04d6:

  gnome-terminal, toscoterm, vala-terminal, xfce4-terminal: use vte9 (2016-06-23 15:21:27 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/gcc6-fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/gcc6-fixes

Yi Zhao (2):
  gtksourceview2: fix build with gcc6
  mousepad: remove blacklist caused by gtksourceview2

 .../suppress-string-format-literal-warning.patch   | 33 ++++++++++++++++++++++
 .../gtksourceview/gtksourceview2_2.10.5.bb         |  3 +-
 meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb  |  1 -
 3 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/suppress-string-format-literal-warning.patch

-- 
2.7.4



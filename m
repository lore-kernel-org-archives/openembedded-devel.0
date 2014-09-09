Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D30EB7107F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 07:30:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s897UVH1000727
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Sep 2014 00:30:32 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 9 Sep 2014 00:30:31 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Sep 2014 03:30:28 -0400
Message-ID: <cover.1410247589.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1][meta-oe] talloc: ignore exit status of rmdir
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Sep 2014 07:30:38 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* fix do_insall errors:
  rmdir: failed to remove `.../talloc/2.0.1-r2/image/usr/bin': \
  No such file or directory

The following changes since commit 46824934fa4ac6a61bebe2c92faa31c0a8e85392:

  meta-networking: Update layer dependency information (2014-09-08 16:34:25 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/fix-talloc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/fix-talloc

Wenzong Fan (1):
  talloc: ignore exit status of rmdir

 meta-oe/recipes-support/talloc/talloc_2.0.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5



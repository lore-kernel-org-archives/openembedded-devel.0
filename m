Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76F72731C5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 May 2016 19:08:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u48J8RIA011462
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 8 May 2016 12:08:27 -0700
Received: from co-op.corp.ad.wrs.com (128.224.56.235) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 8 May 2016 12:08:26 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 8 May 2016 15:08:11 -0400
Message-ID: <1462734493-3819-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v2 0/2] netcf build fail / gnulib handling fix.
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
X-List-Received-Date: Sun, 08 May 2016 19:08:29 -0000
Content-Type: text/plain

In the previous version[1] of the attempt to fix the netcf build on
newer hosts, Martin noted that my change broke fontforge.

The reason for that is the ./bootstrap in fontforge is older and
doesn't support the "--no-git" option I used for netcf.

This highlighted the fact that we will want to be able to use
different args to the ./bootstrap for different packages.

The first commit moves the configure_prepend step as-is out to
the packages, so we can do the above, and thus making
autotools-bootstrap unused in the process.

The second commit fixes the netcf prepend to not overwrite
contents from the netcf package itself, which was the source
of the build failure.

The functionality of the prepend for fontforge is left as-is
so that it will continue to build w/o issue.

Both packages build tested on a meta-overc host [which used to
fail] and an Ubuntu host [v15.10 - worked before ; still works].

Paul.

[1] http://patchwork.openembedded.org/patch/119183/

---

Paul Gortmaker (2):
  autotools-bootstrap: make bootstrap package specific.
  netcf: fix mishandling of gnulib submodule causing build fail

 meta-networking/recipes-support/netcf/netcf_git.bb | 21 ++++++++++++++++++-
 meta-oe/classes/autotools-bootstrap.bbclass        | 24 ----------------------
 .../fontforge/fontforge_20150824.bb                | 18 +++++++++++++++-
 3 files changed, 37 insertions(+), 26 deletions(-)
 delete mode 100644 meta-oe/classes/autotools-bootstrap.bbclass

-- 
2.7.4



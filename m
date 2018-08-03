Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE12E78ABE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Aug 2018 09:23:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w739Nego012286
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 3 Aug 2018 02:23:41 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Fri, 3 Aug 2018 02:23:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 3 Aug 2018 17:34:01 +0800
Message-ID: <1533288843-73014-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][PATCH 0/2] python3-pbr: remove it to use the on in oe-core
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
X-List-Received-Date: Fri, 03 Aug 2018 09:23:41 -0000
Content-Type: text/plain

Please note the second patch which removes python-pbr.inc since it is duplicated
to the one in oe-core. There are also other recipes have the similar issues,
for example, python-six, there is a python-six.inc in both oe-core and meta-python,
but their contents are the same, while oe-core's is for python3, and
meta-python's is for python2, I think that we can remove the one in meta-python
as I did for python-pbr. I will send patches to cleanup them if no objections.

// Robert

Robert Yang (2):
  python3-pbr: remove it
  python-pbr.inc: remove it

 meta-python/recipes-devtools/python/python-pbr.inc       | 14 --------------
 meta-python/recipes-devtools/python/python-pbr_4.2.0.bb  |  3 ++-
 meta-python/recipes-devtools/python/python3-pbr_4.2.0.bb |  2 --
 3 files changed, 2 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pbr.inc
 delete mode 100644 meta-python/recipes-devtools/python/python3-pbr_4.2.0.bb

-- 
2.7.4



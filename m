Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ABA0174B11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 06:38:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4U6cDni003748
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 23:38:13 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 23:38:12 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 May 2018 14:38:06 +0800
Message-ID: <1527662290-31549-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-python][PATCH 0/4] add UPSTREAM_CHECK_URI for recipes
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
X-List-Received-Date: Wed, 30 May 2018 06:38:13 -0000
Content-Type: text/plain

Some recipes can not get upstream version with bitbake foo -c checkpkg. Add UPSTREAM_CHECK_URI for these recipes.

Yi Zhao (4):
  python3-pykickstart: add UPSTREAM_CHECK_GITTAGREGEX
  python3-blivet: add UPSTREAM_CHECK_GITTAGREGEX
  python-protobuf: add UPSTREAM_CHECK_REGEX
  python-click: add UPSTREAM_CHECK_REGEX

 meta-python/recipes-devtools/python/python-click.inc                    | 2 ++
 meta-python/recipes-devtools/python/python-protobuf.inc                 | 2 ++
 meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb      | 2 ++
 .../recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb     | 2 ++
 4 files changed, 8 insertions(+)

-- 
2.7.4



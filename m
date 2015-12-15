Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 34E1F73173
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 02:41:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBF2fDZl017076
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 18:41:13 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 14 Dec 2015 18:41:13 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Dec 2015 10:28:45 +0800
Message-ID: <1450146525-31866-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1450146525-31866-1-git-send-email-kai.kang@windriver.com>
References: <1450146525-31866-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python-tornado: move old version recipe from meta-oe to meta-python
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
X-List-Received-Date: Tue, 15 Dec 2015 02:41:13 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Move old version recipe of python-tornado from meta-oe to meta-python
that there is a higher version in meta-python already. And rename from
_git to exact version _2.2.1.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch           | 0
 .../recipes-devtools/python/python-tornado_2.2.1.bb                       | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-python}/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch (100%)
 rename meta-oe/recipes-devtools/python/python-tornado_git.bb => meta-python/recipes-devtools/python/python-tornado_2.2.1.bb (100%)

diff --git a/meta-oe/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch b/meta-python/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch
rename to meta-python/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch
diff --git a/meta-oe/recipes-devtools/python/python-tornado_git.bb b/meta-python/recipes-devtools/python/python-tornado_2.2.1.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-tornado_git.bb
rename to meta-python/recipes-devtools/python/python-tornado_2.2.1.bb
-- 
2.6.1



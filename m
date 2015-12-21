Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F390E60118
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 08:37:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBL8b5YT009714
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Dec 2015 00:37:05 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 21 Dec 2015 00:37:05 -0800
From: <kai.kang@windriver.com>
To: <Martin.Jansa@gmail.com>
Date: Mon, 21 Dec 2015 16:24:13 +0800
Message-ID: <1450686254-23383-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1450686254-23383-1-git-send-email-kai.kang@windriver.com>
References: <1450686254-23383-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] mime-construct: move from meta-networking to meta-perl
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
X-List-Received-Date: Mon, 21 Dec 2015 08:37:06 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

mime-construct only provides a perl script and depends on many perl
modules that cause layer meta-networking depends on meta-perl.

Move mime-construct from meta-networking to meta-perl to avoid the
layer dependency.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../mime-construct/files/fix-mime-construct-help-return-value.patch       | 0
 .../recipes-extended/mime-construct/mime-construct_1.11.bb                | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-networking => meta-perl}/recipes-extended/mime-construct/files/fix-mime-construct-help-return-value.patch (100%)
 rename {meta-networking => meta-perl}/recipes-extended/mime-construct/mime-construct_1.11.bb (100%)

diff --git a/meta-networking/recipes-extended/mime-construct/files/fix-mime-construct-help-return-value.patch b/meta-perl/recipes-extended/mime-construct/files/fix-mime-construct-help-return-value.patch
similarity index 100%
rename from meta-networking/recipes-extended/mime-construct/files/fix-mime-construct-help-return-value.patch
rename to meta-perl/recipes-extended/mime-construct/files/fix-mime-construct-help-return-value.patch
diff --git a/meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb b/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
similarity index 100%
rename from meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb
rename to meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
-- 
2.6.1



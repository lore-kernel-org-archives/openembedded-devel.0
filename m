Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 75FCA77DB3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 15:18:41 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z133so253149wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 08:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mWKQYzLs3IAcIaf+ljuuiXRcle1gLmz6SPMKMPUbM2U=;
	b=LOap2AXcX3Jn7hvq3qKYbsDg0eBRkCnEERpnWGDscTXOP9wwk2IWp37CvBaIDfQ6Oo
	iDdgyus+CLJAxIdttE1zJ2WKH5Pe5fMObaB597PuVuBb2kjSjA003fWyxB7Ka5FJqJdp
	fwWPsb8WQ4QW8/dzXsOHaSh0OfAKPRqtDL/fhpYGJBHqhjCYw9Gd1MjHXOC6f1QsrkKK
	Te1uS5yGFwotpqw10q5uPB4nQ7VK/kFtWSzb/o3+HhXSwaP15pAxIaFJorTJbg34R8/d
	dRq8RK1ZNBxoBQqTVneTzvO5BES1dUyfyXc28j8xRwoRyQsMiNL+1CESrpLRJnaGqPnQ
	z2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mWKQYzLs3IAcIaf+ljuuiXRcle1gLmz6SPMKMPUbM2U=;
	b=ktwbEFLvVik6G2c3cglRU6/i5VlVD51xzZZBtvuQQCyvQIDSwZMLUbrgNcyQF93ftd
	s08p/dKvB8AqXO6bFEdBEBrVbVvzfrx4n3inV84jIn2U0o31xgXO3MCqE5oD2hqezoYy
	nnsqcr2TPG7iwEa7gZy7H6YH4U0AYlOAjvrX8DtMBizgAKPVCEW6pHR98LT7DArS1/zY
	BzT3lGcUf6iv/sP+SpuepxSNHfhbr8Lp7rmLiV6tcnSbaRvgslmvlyV15BJZ0dIfgMqw
	XOYxcjoBc2s97BoQg4BzLghVpw+B7V7OQN35SLX1C8W9mbQgygf6njsRUq0VAXokOWu4
	ryAw==
X-Gm-Message-State: AFeK/H2QjVQ/eZkrICTdwl3lojH48gDalZzmU4oTiHLH8hFAwKWGYFnkIfsl4rd5oa0iMA==
X-Received: by 10.28.222.4 with SMTP id v4mr3417430wmg.75.1490973522277;
	Fri, 31 Mar 2017 08:18:42 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w17sm7083854wrc.20.2017.03.31.08.18.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 08:18:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 17:18:26 +0200
Message-Id: <20170331151828.25907-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170331151828.25907-1-Martin.Jansa@gmail.com>
References: <adec7310-ce23-cef8-0c06-ea4b5bf9036c@gmail.com>
	<20170331151828.25907-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][morty][PATCHv2 5/7] hwdata: use github instead of fedorahosted.org
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
X-List-Received-Date: Fri, 31 Mar 2017 15:18:41 -0000

* fedorahosted is retired
  https://fedoraproject.org/wiki/Infrastructure/Fedorahosted-retirement
* cherry picked from master:
  commit 8e804afebc057c304f5b9c127f6d7f438cd551c6
  Author: Martin Jansa <Martin.Jansa@gmail.com>
  Date:   Wed Mar 29 10:13:59 2017 +0200

    hwdata: use github instead of fedorahosted.org

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/hwdata/{hwdata_0.291.bb => hwdata_git.bb}  | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.291.bb => hwdata_git.bb} (57%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.291.bb b/meta-oe/recipes-support/hwdata/hwdata_git.bb
similarity index 57%
rename from meta-oe/recipes-support/hwdata/hwdata_0.291.bb
rename to meta-oe/recipes-support/hwdata/hwdata_git.bb
index f00f73b91..50d35c682 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.291.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_git.bb
@@ -1,13 +1,15 @@
 DESCRIPTION = "Hardware identification and configuration data"
-HOMEPAGE = "http://git.fedorahosted.org/git/hwdata.git"
+HOMEPAGE = "https://github.com/vcrhonek/hwdata"
 SECTION = "System/Base"
 
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
-SRC_URI = "https://git.fedorahosted.org/cgit/${BPN}.git/snapshot/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "90ffce584bbcb1a5e77eac8503949f71"
-SRC_URI[sha256sum] = "e1007a96645cb3390aa9c0ed3f090a69d2302ce4d801914b6af1ab4ec85ede4e"
+PV = "0.291+git${SRCPV}"
+SRCREV = "4bfbdcf5913d6dd53336d31b8035708075e6fdfa"
+SRC_URI = "git://github.com/vcrhonek/${BPN}.git"
+
+S = "${WORKDIR}/git"
 
 do_configure() {
     ${S}/configure --datadir=${datadir} --libdir=${libdir}
-- 
2.12.2



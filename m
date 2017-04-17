Return-Path: <Yadi.Hu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9601A60069
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Apr 2017 08:04:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3H84JTg018743
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Apr 2017 01:04:19 -0700 (PDT)
Received: from pek-yhu2-d1.wrs.com (128.224.162.195) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.294.0; Mon, 17 Apr 2017 01:04:18 -0700
From: Yadi Hu <yadi.hu@windriver.com>
To: <yadi.hu@windriver.com>, <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Apr 2017 16:04:09 +0800
Message-ID: <1492416250-15487-1-git-send-email-yadi.hu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: meta-networking: drbd-utils:drbd-overview fails to run
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
X-List-Received-Date: Mon, 17 Apr 2017 08:04:18 -0000
Content-Type: text/plain

drbd-utils:add denpendency for perl-module-strict
and perl-module-warnings.

Perl script drbd-overview fails to run due to perl noexists
under small rootfs,fix it with definitions both perl-module-strict
and perl-module-warnings.

meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)



Return-Path: <prvs=072d76755=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 02A067D71B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 11:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1561463630; x=1592999630;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=mE1uKLUihX7WmqAggavzRx/frZU0ByTllw/0/lL5WBo=;
	b=td7r21swwe4dfSINaddRoouWBrzO1rRTmTd9S5BqQKGby/2HtVSOohM5
	ekoAULfY7tq99Z56UxBpXL1YGHuaDylRuFoc+yT75XpD2GWdZTs4pDmhi
	sdUPfJHLyx+T8x+uw5zq/NmoPVrcDr3wUT0njERGqVk05Spvqr3r2PBxD
	k28DFpzFnlTGiyKNiKvTzoWhBXS9v5zn0Ez9Z1twBPVrBxCW+MhGd2cf/
	Kiv72Ym0TQWddxxSi5Rd1Jtagavqv85FQvD/LL7iwrozuF+4faRUmVo6B
	6J9Atwn7MHnveFiiF/5Qy5eB+pj8ooDS+4eA+kQjE98NYLFPTXWIqzN6e Q==;
IronPort-SDR: rZFAIzryzMp/Vx/Rvpqc/VyMcqhJiraAeZDSk0701p7RXL2q51TOxqdqefrYhsXsSckfyOWJIp
	2hM6M36c8WU1ayEZVAyAwlIwzs3MCkLkOtqljuHqghJmMy7dEhEb1fiLoS+RDjj4BCaDSEgpS3
	aJFDmD5If8Z4zPMcQ1ZSl7GCZNxlMM/Q4nFuwGrFbe0tkWk/k0Uodt/7loWe3J4j10qdazxQ4m
	KvjWc0ykCb/8/UmBWGkJDW8WdZoIH2hK2Ogj678yETls6xLFcoQToX3R6m/Xj3tGsmzd2rVsKh
	UOQ=
X-IronPort-AV: E=Sophos;i="5.63,415,1557180000"; 
   d="scan'208";a="2207510"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Jun 2019 13:53:23 +0200
Message-ID: <20190625115327.9314-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 0/4] fix build errors for Fedora 29
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
X-List-Received-Date: Tue, 25 Jun 2019 11:53:49 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This series fixes openjdk-7 and openjdk-8  builds for Fedora 29.
Setting Wno-error for compiler warnings is only a workaround and
will be removed when we update openjdk/icedtea native to the latest
versions again.

Richard Leitner (4):
  cacao: update to latest staging tip 2d6f6c14daf9
  README: rewrite build host dependencies
  icedtea7-native: disable new compiler warnings
  openjdk-8: disable stringop-overflow compiler errors

 README                                                    | 8 ++++----
 .../cacao-1.6.1-do-not-rely-on-absolute-paths.patch       | 0
 .../system-boehm-gc.patch                                 | 0
 .../cacao/{cacao_1.6.1.bb => cacao_2d6f6c14daf9.bb}       | 7 ++++---
 recipes-core/icedtea/icedtea7-native.inc                  | 3 +++
 recipes-core/openjdk/openjdk-8-release-172b11-common.inc  | 5 +++++
 6 files changed, 16 insertions(+), 7 deletions(-)
 rename recipes-core/cacao/{cacao-1.6.1 => cacao-2d6f6c14daf9}/cacao-1.6.1-do-not-rely-on-absolute-paths.patch (100%)
 rename recipes-core/cacao/{cacao-1.6.1 => cacao-2d6f6c14daf9}/system-boehm-gc.patch (100%)
 rename recipes-core/cacao/{cacao_1.6.1.bb => cacao_2d6f6c14daf9.bb} (89%)

-- 
2.20.1



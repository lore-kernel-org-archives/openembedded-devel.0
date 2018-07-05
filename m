Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 9F43D78887
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2018 18:58:37 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-227-236-43.adslplus.ch
	[84.227.236.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1BA26208A3;
	Thu,  5 Jul 2018 18:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1530817118;
	bh=K8pI65YRfweNRLM4EYYHbHk8J0r5cBnuBYYG4UdJe0g=;
	h=From:To:Cc:Subject:Date:From;
	b=ULxj5XELK39pFLR5zyvI0bObU8U2aI8+TA9UXCVGtob5M3+iIRHMVT0F3zs/Zjzn5
	s6JRcaZeao+B0XcCrjvQBX+gSdyowB752OS5q3Ajk15Lr/yFyWnk1w3EoMavMGBQVG
	U839Y+S6aq1OrIaUx3IfEkKLfqM/ON1BD8unSuAw=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2018 20:58:09 +0200
Message-Id: <20180705185812.23209-1-krzk@kernel.org>
X-Mailer: git-send-email 2.14.1
Subject: [meta-networking][PATCH v5 0/3] Add static/embedded wireless regulatory data
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
X-List-Received-Date: Thu, 05 Jul 2018 18:58:37 -0000

Hi,

Changes since v4:
1. Extend kernel_wireless_regdb.bbclass description (suggested by Khem Raj).
2. Use '-D' for install (suggested by Khem Raj).

Changes since v3:
1. Re-order patches, start with version bump.
2. Add patch 2/3 for new kernel (since v4.15 embedding regulatory
   data has changed).

Changes since v2:
1. Rebase on sumo.
2. Fix task order - run do_kernel_add_regdb task after do_configure.

Changes since v1:
1. Remove debugging echo.

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  wireless-regdb: Bump version to latest upstream 2018.05.31
  wireless-regdb: Add wireless-regdb-static package with static
    regulatory data
  kernel_wireless_regdb: Add class for embedding regulatory data into
    older kernel

 .../classes/kernel_wireless_regdb.bbclass          | 20 +++++++++++
 .../wireless-regdb/wireless-regdb_2016.06.10.bb    | 20 -----------
 .../wireless-regdb/wireless-regdb_2018.05.31.bb    | 42 ++++++++++++++++++++++
 3 files changed, 62 insertions(+), 20 deletions(-)
 create mode 100644 meta-networking/classes/kernel_wireless_regdb.bbclass
 delete mode 100644 meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
 create mode 100644 meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb

-- 
2.14.1



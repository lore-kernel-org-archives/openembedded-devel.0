Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web11.24684.1629941631012933625
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Aug 2021 18:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=C42qKpOG;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629941628; i=@fujitsu.com;
	bh=Egl20T3DXcjOaFk7gztN8TEm7831jNKaOci70USwMXU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=C42qKpOGiW3+rJyr2puq/0n93i4N1y6YNwaGPHqA8G7sJQebdS+5zmu5EzO2KxeQ9
	 7QGITBSaB4SqcX61h7a1mmdVBduBM/ADIRUUYT8FzU/Nvkrxli5qxNh/2W1ECC+Ut5
	 iANUUBQu1PWi20taf/Qx/UR0B7L94C/Z9C9lVY3Ewha+fOhrquoWw97KD0cCLKuMWU
	 6H06nWJRpFUuBt/aM0Ztu8gQwl+cFg4eUvd5KLaBjiFRvIZ93FldzyjaAONwsicT50
	 dsQpcZIjiNDxf6UVb3zNnLNqcVvZe3+fCPgxCBQ+2XzkFryKmeIU3sbhwYGprJsQPG
	 vi5LoU3jPaCxQ==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id A1/C5-28466-C7FE6216; Thu, 26 Aug 2021 01:33:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MRolvzXi3
  R4OkSPouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP6mZtsBQ85K87uesbcwPiYo4uRk0NIYDaT
  RMd7IJsLyD7BKLF6wX92kASbgJrE9Fs3WEFsEQF9iaWz9zCD2MwCKhIvfveA1QgLeEv0Lp0GF
  mcRUJW48fMOmM0r4CTxtO8XmC0hoCAx5eF7MJtTwFni15nTQDM5gJY5SVydGwVRLihxcuYTFo
  jxEhIHX7yAalWUmH25mQXCrpCYNauNaQIj/ywkLbOQtCxgZFrFaJFUlJmeUZKbmJmja2hgoGt
  oaKRraAnEJiZ6iVW6iXqppbrlqcUluoZ6ieXFesWVuck5KXp5qSWbGIHBmFJwYMIOxv2vP+gd
  YpTkYFIS5Z1/UC1RiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvt9dAOcGi1PTUirTMHGBkwKQlO
  HiURHj93gGleYsLEnOLM9MhUqcYdTkuX5+3iFmIJS8/L1VKnHcZSJEASFFGaR7cCFiUXmKUlR
  LmZWRgYBDiKUgtys0sQZV/xSjOwagkzDsZZApPZl4J3KZXQEcwAR1RwKcKckRJIkJKqoGJM6V
  8o+jxHccU+gMlow93bEjYK3l08tcnfDv1za+te5KbNvnLPQ+t426RPycxSq1dlPnZs1czb51V
  dYFn+Q6JtAPBAc+5Pu/NPNnyzejXbo/vuZ/8rhz7G7CAw/EE3+xrez82rz132zVRoFL2Rcj2w
  N9zKorMzV4d7uq7IStw7NuC0ouLRZl3sT6tmBPSa8e5Y933/c+cOlOnmOilfss/Z+3wodKzIs
  9gXkJRz16HPQZMZlYaVlmL1bS7FR+vUdGocPm6MaD2+SKZKWfTJSPYF3f+Ez2oKP3pUPcNhXO
  bNO46uy/yUfaY+PLuuX3ck9PNkvunciy9oMPEkDR3e399yjEJ9oJ/N7YubfmX9aJJiaU4I9FQ
  i7moOBEAs2Vvg00DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-267.messagelabs.com!1629941627!103913!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7031 invoked from network); 26 Aug 2021 01:33:48 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-2.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Aug 2021 01:33:48 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17Q1XjWe017333
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 02:33:47 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 26 Aug 2021 02:33:43 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] xfsprogs: upgrade 5.12.0 -> 5.13.0
Date: Thu, 26 Aug 2021 09:33:17 +0800
Message-ID: <1629941597-62033-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1629941597-62033-1-git-send-email-wangmy@fujitsu.com>
References: <1629941597-62033-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfsprogs/{xfsprogs_5.12.0.bb => xfsprogs_5.13.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_5.12.0.bb => xfsprogs_5.13.0.bb} (96%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.12.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.13.0.bb
similarity index 96%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.12.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.13.0.bb
index 323493e7e1..64873ac038 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.12.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.13.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
            file://0001-support-usrmerge.patch \
            "
-SRC_URI[sha256sum] = "bec44445cf18f49e63971d4f27dc4e90a17b118b852714a1104b621ea30e3507"
+SRC_URI[sha256sum] = "4e142d4babe086adf9016d8c606c805829da08e46389a4433f40346204f90cdb"
 inherit autotools-brokensep
 
 PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
-- 
2.25.1


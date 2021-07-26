Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web09.24920.1627264017814479918
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jul 2021 18:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QBUmoKvP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627264015; i=@fujitsu.com;
	bh=Ty4qZpRtEXqy5dJWx44MqKrWbJ9QG21e/dKKO1r446I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QBUmoKvP8kiTjMYp8IUeOysRhi0+tX4Jf9HpKDyHvOpbvJ71IozN8JSJMqe4a1uYp
	 f9Q4JktCs1O0i73THbPNeC3L81JbEJR1HdtOOZqnyB1SOJbcj/WFZ8Q7OT8yIEvAmF
	 mIXSo5ZKBkTFc/rPus9kLQpA9rbIy9p37vPrE5p2yV17icbEYLAvA+jjwMIFwKttpo
	 h2gaIiZ6iOJ3q4v/DvHG40pNyJ6N5Tc4fA+a2gqGrUUV2eG1LZxAon+h+LRzMHXAs2
	 6IkqF9rg7+zEfqMIMYDvn1bB+B41wAVapfduad+2+mP9XezNUi3Kx1fjsfPEq38T8B
	 3mhaGkTW7hogQ==
Received: from [100.113.1.116] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 72/51-07223-F041EF06; Mon, 26 Jul 2021 01:46:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYossv8i/
  BYP8bZouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP2nTusBZe4Kn5tWMzUwHiFs4uRi0NIYDaT
  ROfVk0wQzh5GiY7Zd5i7GDk52AR0Jc49XssOYosI6Essnb0HLC4s4C9x7v52NhCbRUBV4v2Tx
  2A2r4C7xJnGN2A1EgIKElMevmeGiAtKnJz5hAXEZhaQkDj44gVQnAOoRlFi9nR5iPIKideHLz
  FPYOSZhaRjFpKOBYxMqxgtk4oy0zNKchMzc3QNDQx0DQ2NdQ11jYzM9BKrdBP1Ukt1k1PzSoo
  SgbJ6ieXFesWVuck5KXp5qSWbGIGBlFLI+GgH4+nXH/QOMUpyMCmJ8vat/ZMgxJeUn1KZkVic
  EV9UmpNafIhRhoNDSYLXUuhfgpBgUWp6akVaZg4wqGHSEhw8SiK8EbxAad7igsTc4sx0iNQpR
  kUpcd58YaCEAEgiozQPrg0WSZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfO6gUzhycwrgZ
  v+CmgxE9Di4Pq/IItLEhFSUg1M29YpbC4Q4RGaJhgrGsKX9cMyW3D6YslD+y8a+EtOmZ7yM79
  +zuarsQb964+9unOB5X6vQuWTNYyL7+jN/6xjuPN7jOTxqmb7bbx9LXPmTea5vy+tgI9TfvYy
  jnVLArUcvrQnri7I3CYdsvCL+4SEI/aZgtsO3ig29g9/onWcr/Wx7LSdryfccT00P8PXSqB1Z
  mXUD9mmv8eOTFz7VTdPVV/5xfUj2w+e9g1ku2Hl+NQ2uMvK+tentgvnyuQqiq59MMt1mXWod+
  v5x1uE01QS32U4LRSWa9oevTOkbH+LqdW8LaLfpzj92tGUc4fF5Io9c9yfeZd362UvXb6Qee2
  lQ0d4bku+5D8qWZp2YMXpZUosxRmJhlrMRcWJAC7y3wIfAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-228.messagelabs.com!1627264014!376689!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8966 invoked from network); 26 Jul 2021 01:46:54 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-7.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Jul 2021 01:46:54 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16Q1ksc9016515
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jul 2021 02:46:54 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 26 Jul 2021 02:46:53 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libtest-warnings-perl: upgrade 0.030 -> 0.031
Date: Mon, 26 Jul 2021 18:46:48 +0800
Message-ID: <1627296408-3743-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0.031     2021-07-13 22:13:48Z
          - remove unneeded develop prereqs that caused metacpan to unduly
            raise the river position of some dependent modules

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...st-warnings-perl_0.030.bb => libtest-warnings-perl_0.031.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libtest/{libtest-warnings-perl_0.030.bb => libtest-warnings-perl_0.031.bb} (92%)

diff --git a/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.030.bb b/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.031.bb
similarity index 92%
rename from meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.030.bb
rename to meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.031.bb
index 78110ca475..8014c19a95 100644
--- a/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.030.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.031.bb
@@ -19,7 +19,7 @@ file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=30c0b8a5048cc2f4be5ff15ef0d8cf
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/E/ET/ETHER/Test-Warnings-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "89a4947ddf1564ae01122275584433d7f6c4370370bcf3768922d796956ae24f"
+SRC_URI[sha256sum] = "1e542909fef305e45563e9878ea1c3b0c7cef1b28bb7ae07eba2e1efabec477b"
 
 S = "${WORKDIR}/Test-Warnings-${PV}"
 
-- 
2.25.1


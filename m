Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.2661.1623982702951677333
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jun 2021 19:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NkZyji1R;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623982700; i=@fujitsu.com;
	bh=Kt7WgcEjnsAlc6Ho90zdqHHC/R7u/mAKwQRmTQnc0N8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NkZyji1R9Ym/Chw5iOJtWuNql1jrC5pJIHVSVMb4oDI2O2Vrezbp1GbwdXxEJKikN
	 Xg6nNiCd6nJ4ahAIrGno9QKV4BtUhb+i+mOyKmhFyad2tcAUknjw33lzBRS2aR0wd/
	 lDXzK/9ftWwyEjR89hnxTP8//cNoNN9Q0vKg96k/7fEK0x+SmnhpRGkqMjaCtigSze
	 akxQY73fm8lDrl+P/8f9dihwjPs4H1YT25fUdavQaHoiCN0XMRB90m88fWnhT9x6kq
	 iD3HOzYK0vZrSKHr42aY/APTSS4/1EqQpK53cz3E2UZGIs+oDvig7+9e0RoOFEgc+u
	 jqMZf9XoMN6XQ==
Received: from [100.113.4.24] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id C9/BB-50909-B620CC06; Fri, 18 Jun 2021 02:18:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+EI1c1mOpN
  gcGaKjsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFpxUuWgntsFcfefGRqYOxk62Lk4hASmM0k
  8Wn7KijnBKPEwndngRxODjYBHYmOF90sILaIgL7E0tl7mEFsYQEXiQuXTzCC2CwCqhLP5l8Ds
  3kF3CQe3PrLCmJLCChITHn4nhkiLihxcuYTsDnMAhISB1+8YIaoUZTYvvMMC4RdITFjxja2CY
  w8s5C0zELSsoCRaRWjZVJRZnpGSW5iZo6uoYGBrqGhsa6prqGpsV5ilW6SXmqpbnJqXklRIlB
  WL7G8WK+4Mjc5J0UvL7VkEyMwlFIKWWfuYPz0+oPeIUZJDiYlUV6rl6cThPiS8lMqMxKLM+KL
  SnNSiw8xynBwKEnwqvwHygkWpaanVqRl5gDDGiYtwcGjJML7huFMghBvcUFibnFmOkTqFKOil
  DjvR5CEAEgiozQPrg0WS5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOmgUzhycwrgZv+Cm
  gxE9DiNqFTIItLEhFSUg1MrYsPqU+crK4VIVKt+pzVeE2TFfO8ysc7vhRfuvLJaFI+B+dnwae
  rrq/YufT+jyQ5p1Sf4FUKj6/uyOf/vmLHryPvGuWvCZgdmeHEN1n2jIGAgPm0nKpYF+frf75K
  Fk1YyfhJN3rCqd2/Qu6fejw9V3KF++qvwh+NKt4InJxj2b6UfQ3byTiv988c2j3WmvmvCWori
  NoqPk96vmhgGc8ih6dGuxRlKzZ935k366/wLFevkhkrBXIYihmXmHafFO7mnSHfvIjh2BXptT
  4mRla/b0yNfPJkofrbqvm81e8XhIW/Nv9T+ryyf0E/s54sY+mPHjuNuGCP3Qs+7726jP/ptdh
  DH7l4mM5vmXBmqamkkRJLcUaioRZzUXEiAOVHXpkgAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-245.messagelabs.com!1623982699!97479!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3245 invoked from network); 18 Jun 2021 02:18:19 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-6.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Jun 2021 02:18:19 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15I2IJ0q031996
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 03:18:19 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 18 Jun 2021 03:18:17 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] googletest: upgrade 1.10.0 -> 1.11.0
Date: Fri, 18 Jun 2021 22:18:11 +0800
Message-ID: <1624025891-7635-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 meta-oe/recipes-test/googletest/googletest_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-test/googletest/googletest_git.bb b/meta-oe/recipes-test/googletest/googletest_git.bb
index 2e0fecf7a9..3e1fc4ff88 100644
--- a/meta-oe/recipes-test/googletest/googletest_git.bb
+++ b/meta-oe/recipes-test/googletest/googletest_git.bb
@@ -4,12 +4,12 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
 
-PV = "1.10.0+git${SRCPV}"
+PV = "1.11.0+git${SRCPV}"
 
 PROVIDES += "gmock gtest"
 
 S = "${WORKDIR}/git"
-SRCREV = "662fe38e44900c007eccb65a5d2ea19df7bd520e"
+SRCREV = "e2239ee6043f73722e7aa812a459f54a28552929"
 SRC_URI = "git://github.com/google/googletest.git"
 
 inherit cmake
-- 
2.25.1


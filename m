Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8A5A178299
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Oct 2017 12:42:57 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id 17so11276566qkq.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Oct 2017 05:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=slStM1EWRWi1EjlT9DloX5Gbrr0w0ZPLBxr2dV33D3s=;
	b=tWiPIqJSyzShb9BG1ejQjJFIpL6UHuOjgBNMRaMBzTwGtp893MJZj+TxJU08P2tE7h
	YrnrHS5Lp++Dkl+ysp8ZoxICyyp9fK5+43WKCV+vhodvzNQnhy+8UC6OPmGzaxGjAh/5
	RhiRzz8FVQlaZM1sfgP9OmpjTdIb54q799WOFlpeevw72ZB0op9H5OM8COcIIa6viElw
	PzvTu17e2pP6sT6Ic1Y1lNm76MHSHfKzJSVeVK+ZvuMNkB5xcYyYHRYGpqmHwA/xnxZO
	DK1fP+fBIZifKFCS0H7DQU6VofLvJUUR86VJrojXbhJcNG4zsNcuCdxy18wW20vxgqTd
	kj/Q==
X-Gm-Message-State: AMCzsaUxQx4Oys33TX4xI5HP2p0LuWT+E5H5Z/KI6kCKtP7LFdTae66U
	oNuNkpyFocyerbhAMwCvoH6vFpwM
X-Google-Smtp-Source: ABhQp+SDKrlG76pDPOK5rYc938swOK1vjXa51uePfFZEgEgHs45fPWfWvxvXQ1KxQtHzb72xnheJmg==
X-Received: by 10.55.175.132 with SMTP id y126mr5478763qke.45.1509194578336;
	Sat, 28 Oct 2017 05:42:58 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id 20sm6399690qke.52.2017.10.28.05.42.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 Oct 2017 05:42:57 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Oct 2017 08:42:47 -0400
Message-Id: <1509194567-24032-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libnet-dns-perl: update to version 1.13
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
X-List-Received-Date: Sat, 28 Oct 2017 12:42:57 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../libnet/{libnet-dns-perl_1.10.bb => libnet-dns-perl_1.13.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.10.bb => libnet-dns-perl_1.13.bb} (81%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.10.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.13.bb
similarity index 81%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.10.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.13.bb
index 0d89844..da274ef 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.10.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.13.bb
@@ -9,8 +9,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "4fa45b0dfe79667453c1553e16e52c2a"
-SRC_URI[sha256sum] = "ebe53e7f433138fb9a7845b4edae6b8f4dc227da97eaf6b347584816ec63a525"
+SRC_URI[md5sum] = "ed0c4c22daaf88c4071bae13b6f71f99"
+SRC_URI[sha256sum] = "7ec76663365f2f96de46fe07bd6c9d45ab21171ae83954e8d1b816428b518c36"
 
 S = "${WORKDIR}/Net-DNS-${PV}"
 
-- 
2.7.4



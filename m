Return-Path: <Adrian.Dudau@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.39])
	by mail.openembedded.org (Postfix) with ESMTP id 034AE6FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 13:20:02 +0000 (UTC)
Received: from 1bly8w-0005nn-Tr by out11a.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1bly8w-0005oA-U9
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2016 05:57:54 -0700
Received: by emcmailer; Mon, 19 Sep 2016 05:57:54 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11a.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1bly8w-0005nn-Tr
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2016 05:57:54 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Sep 2016 14:57:53 +0200
Received: by sestofb11.enea.se (Postfix, from userid 4451)	id 8140D441551;
	Mon, 19 Sep 2016 14:57:53 +0200 (CEST)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 19 Sep 2016 14:57:53 +0200
Message-ID: <1474289873-12118-1-git-send-email-adrian.dudau@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: adrian.dudau@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: Adrian.Dudau@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [meta-oe][PATCH] crash: Enforce use of LDFLAGS during make
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
X-List-Received-Date: Mon, 19 Sep 2016 13:20:04 -0000
Content-Type: text/plain

This avoids a "QA Issue: No GNU_HASH in the elf binary:".

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 meta-oe/recipes-kernel/crash/crash_7.1.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/crash/crash_7.1.5.bb b/meta-oe/recipes-kernel/crash/crash_7.1.5.bb
index 06fe1a8..936438b 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.1.5.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.1.5.bb
@@ -41,6 +41,7 @@ EXTRA_OEMAKE = 'RPMPKG="${PV}" \
                 GDB_TARGET="${TARGET_SYS}" \
                 GDB_HOST="${BUILD_SYS}" \
                 GDB_MAKE_JOBS="${PARALLEL_MAKE}" \
+                LDFLAGS="${LDFLAGS}" \
                 '
 
 EXTRA_OEMAKE_class-cross = 'RPMPKG="${PV}" \
-- 
1.9.1



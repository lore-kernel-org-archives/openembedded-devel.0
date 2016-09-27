Return-Path: <Adrian.Dudau@enea.com>
X-Greylist: delayed 1150 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 Sep 2016 08:20:07 UTC
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.40])
	by mail.openembedded.org (Postfix) with ESMTP id 45C4460102
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 08:20:07 +0000 (UTC)
Received: from 1bonJx-0006m5-T8 by out10c.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1bonJx-0006oQ-VG
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Sep 2016 01:00:57 -0700
Received: by emcmailer; Tue, 27 Sep 2016 01:00:57 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10c.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1bonJx-0006m5-T8
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Sep 2016 01:00:57 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 27 Sep 2016 10:00:56 +0200
Received: by sestofb11.enea.se (Postfix, from userid 4451)	id BFEF2441CF3;
	Tue, 27 Sep 2016 10:00:56 +0200 (CEST)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Sep 2016 10:00:56 +0200
Message-ID: <1474963256-3266-2-git-send-email-adrian.dudau@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1474963256-3266-1-git-send-email-adrian.dudau@enea.com>
References: <1474963256-3266-1-git-send-email-adrian.dudau@enea.com>
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
Subject: [meta-oe][PATCH 2/2] pam-passwedqc: Obey exported LDFLAGS
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
X-List-Received-Date: Tue, 27 Sep 2016 08:20:09 -0000
Content-Type: text/plain

This avoids a "QA Issue: No GNU_HASH in the elf binary"

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
index 37b5fef..6bd6118 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
@@ -39,6 +39,8 @@ S = "${WORKDIR}/git"
 
 PV = "0.5.0+git${@'${SRCPV}'.split('+')[-1]}"
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 # The exact version of SYSTEMD does not matter but should be greater than 209.
 #
 EXTRA_OEMAKE = 'MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} \
-- 
1.9.1



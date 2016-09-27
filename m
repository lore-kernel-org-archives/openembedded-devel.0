Return-Path: <Adrian.Dudau@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.33])
	by mail.openembedded.org (Postfix) with ESMTP id D001F60722
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 08:00:56 +0000 (UTC)
Received: from 1bonJx-0005Uo-T6 by out11b.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1bonJx-0005Vi-TT
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Sep 2016 01:00:57 -0700
Received: by emcmailer; Tue, 27 Sep 2016 01:00:57 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11b.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1bonJx-0005Uo-T6
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Sep 2016 01:00:57 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 27 Sep 2016 10:00:56 +0200
Received: by sestofb11.enea.se (Postfix, from userid 4451)	id BB668441CF0;
	Tue, 27 Sep 2016 10:00:56 +0200 (CEST)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Sep 2016 10:00:55 +0200
Message-ID: <1474963256-3266-1-git-send-email-adrian.dudau@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: adrian.dudau@enea.com does not
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
Subject: [meta-oe][PATCH 1/2] pam-passwedqc: Obey exported LDFLAGS
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
X-List-Received-Date: Tue, 27 Sep 2016 08:00:58 -0000
Content-Type: text/plain

This avoids a "QA Issue: No GNU_HASH in the elf binary"

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb b/meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb
index 4233ba4..cb9aa22 100644
--- a/meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb
+++ b/meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb
@@ -27,6 +27,8 @@ EXTRA_OEMAKE = "CFLAGS="${CFLAGS} -Wall -fPIC -DHAVE_SHADOW" \
     SECUREDIR=${base_libdir}/security \
 "
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 do_install() {
     oe_runmake install DESTDIR=${D}
 }
-- 
1.9.1



Return-Path: <Adrian.Calianu@enea.com>
X-Greylist: delayed 1567 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 02 Mar 2017 16:40:01 UTC
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0945D775EB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Mar 2017 16:40:01 +0000 (UTC)
Received: from 1cjTMY-0005qt-Un by out10c.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Calianu@enea.com>) id 1cjTMZ-0005rf-Tf
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Mar 2017 08:13:55 -0800
Received: by emcmailer; Thu, 02 Mar 2017 08:13:55 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10c.electric.net with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.87) (envelope-from <Adrian.Calianu@enea.com>)
	id 1cjTMY-0005qt-Un for openembedded-devel@lists.openembedded.org;
	Thu, 02 Mar 2017 08:13:54 -0800
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2; Thu, 2 Mar 2017
	17:13:54 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4191)	id 375A728929C;
	Thu,  2 Mar 2017 17:13:54 +0100 (CET)
From: Adrian Calianu <adrian.calianu@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Mar 2017 17:13:50 +0100
Message-ID: <1488471230-46540-1-git-send-email-adrian.calianu@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: adrian.calianu@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: Adrian.Calianu@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:ECDHE-RSA-AES256-SHA:256
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [meta-oe][PATCH] krb5: allow to generate empty package
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
X-List-Received-Date: Thu, 02 Mar 2017 16:40:02 -0000
Content-Type: text/plain

Since other packages may depend on krb5(${PN}).

Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
index 656a02f..a0589a6 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
@@ -107,6 +107,8 @@ PACKAGES =+ "${PN}-admin-server \
              libkrb5support \
              libverto"
 
+ALLOW_EMPTY_${PN} = "1"
+
 FILES_${PN} = ""
 FILES_${PN}-doc += "${datadir}/examples"
 FILES_${PN}-dbg += "${libdir}/krb5/plugins/*/.debug"
-- 
1.9.1



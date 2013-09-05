Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.202])
	by mail.openembedded.org (Postfix) with ESMTP id 473706B064
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 11:54:32 +0000 (UTC)
Received: from [216.82.241.196:11937] by server-10.bemta-8.messagelabs.com id
	A8/49-20977-8F078225; Thu, 05 Sep 2013 11:54:32 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-10.tower-46.messagelabs.com!1378382072!31417431!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.9.11; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15240 invoked from network); 5 Sep 2013 11:54:32 -0000
Received: from mail.mx1.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-10.tower-46.messagelabs.com with RC4-SHA encrypted SMTP;
	5 Sep 2013 11:54:32 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Thu, 5 Sep 2013 06:54:26 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.327.1; Thu, 5 Sep 2013 06:54:31 -0500
Received: from log-cln-jviguera.digi.com (10.101.1.79) by
	dor-sms-exch01.digi.com (10.49.8.100) with Microsoft SMTP Server id
	8.3.327.1; Thu, 5 Sep 2013 13:54:29 +0200
From: Javier Viguera <javier.viguera@digi.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 5 Sep 2013 13:54:28 +0200
Message-ID: <1378382068-24795-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 1.8.4
MIME-Version: 1.0
Subject: [meta-webserver] cherokee: fix SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Sep 2013 11:54:32 -0000
Content-Type: text/plain

The package is no longer available in the official cherokee site,
so download it from a mirror.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---

Notes:
    To be cherry-picked to Dylan as well.

 meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
index 265e24e..4b2d68d 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
@@ -9,7 +9,7 @@ PR = "r9"
 
 DEPENDS = "libpcre openssl mysql5 ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-SRC_URI = "http://www.cherokee-project.com/download/1.2/${PV}/cherokee-${PV}.tar.gz \
+SRC_URI = "ftp://ftp.osuosl.org/.1/cherokee/1.2/${PV}/cherokee-${PV}.tar.gz \
            file://cherokee.init \
            file://cherokee.service \
 "


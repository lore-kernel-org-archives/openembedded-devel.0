Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.12])
	by mail.openembedded.org (Postfix) with ESMTP id 151A060782
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 08:34:55 +0000 (UTC)
Received: from [216.82.249.131:56775] by server-12.bemta-12.messagelabs.com id
	E6/80-29721-03B77535; Wed, 23 Apr 2014 08:34:56 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-15.tower-28.messagelabs.com!1398242095!29939591!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.11.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4128 invoked from network); 23 Apr 2014 08:34:55 -0000
Received: from mail.mx2.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-15.tower-28.messagelabs.com with RC4-SHA encrypted SMTP;
	23 Apr 2014 08:34:55 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Wed, 23 Apr 2014 03:34:44 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.342.0; Wed, 23 Apr 2014 03:34:54 -0500
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-exch01.digi.com (10.49.8.100) with Microsoft SMTP Server id
	8.3.342.0; Wed, 23 Apr 2014 10:34:52 +0200
From: Javier Viguera <javier.viguera@digi.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Apr 2014 10:34:52 +0200
Message-ID: <1398242092-43050-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [meta-networking][PATCH] stunnel: fix configure ssl parameter
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
X-List-Received-Date: Wed, 23 Apr 2014 08:34:56 -0000
Content-Type: text/plain

'--with-ssl=DIR' configure parameter expects the location of the
libraries and include files in the sysroot. This means the directory
containing the 'lib' and 'include' subdirectories, not the include
directory itself.

This fixes an error at configure time:

checking
<local-path>/tmp/sysroots/ccimx6adpt/usr/include/include/openssl/engine.h
usability... no

(notice duplicated include entry in above line)

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---

Notes:
    To backport to Dora as well.

 meta-networking/recipes-support/stunnel/stunnel_4.56.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
index 086d0b7aafea..938f043a9d97 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
@@ -12,4 +12,4 @@ SRC_URI[sha256sum] = "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec8d2778a01c
 
 inherit autotools
 
-EXTRA_OECONF += "--with-ssl='${STAGING_INCDIR}' --disable-fips"
+EXTRA_OECONF += "--with-ssl='${STAGING_EXECPREFIXDIR}' --disable-fips"


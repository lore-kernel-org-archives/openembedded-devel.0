Return-Path: <gyurco@freemail.hu>
X-Greylist: delayed 522 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 12 Aug 2016 16:26:57 UTC
Received: from mail-outd.mail.t-online.hu (mail-outd.mail.t-online.hu
	[195.228.240.63])
	by mail.openembedded.org (Postfix) with ESMTP id D7158731DB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 16:26:57 +0000 (UTC)
Received: from fsmeopfe.local (51B60A41.dsl.pool.telekom.hu [81.182.10.65])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail00d.mail.t-online.hu (Postfix) with ESMTPSA id 3s9qn23WbtzKyR
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 18:18:14 +0200 (CEST)
From: Szombathelyi =?ISO-8859-1?Q?Gy=F6rgy?= <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Aug 2016 18:18:13 +0200
Message-ID: <1869197.4IFFTrBUMF@gyurco.localdomain>
User-Agent: KMail/5.2.3 (Linux/4.6.5-300.fc24.x86_64; KDE/5.24.0; x86_64; ; )
MIME-Version: 1.0
X-DCC--Metrics: mail00d.mail.t-online.hu 1308; Body=1 Fuz1=1
X-Spam-Probability: 2.6280680462e-05
Subject: [meta-webserver][PATCH] nginx: PACKAGECONFIG for httpv2
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
X-List-Received-Date: Fri, 12 Aug 2016 16:26:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

    Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/
recipes-httpd/nginx/nginx.inc
index ebf926a..cb57b42 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -31,6 +31,8 @@ NGINX_USER   ?= "www"
 EXTRA_OECONF = ""
 DISABLE_STATIC = ""
 
+PACKAGECONFIG[http2] = "--with-http_v2_module,,"
+
 do_configure () {
        if [ "${SITEINFO_BITS}" = "64" ]; then
                PTRSIZE=8



Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQjwq-0000mh-K7
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 18:06:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 2423E314B86C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:05:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id odleXmHO-QPS
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:04:53 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id C7B07314B04A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:04:52 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 09 Dec 2010 17:04:52 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Dec 2010 17:04:52 +0000
Message-Id: <1291914292-25223-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] openssl: allow to add configure options through EXTRA_OECONF
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Dec 2010 17:06:29 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/openssl/openssl.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/openssl/openssl.inc b/recipes/openssl/openssl.inc
index bcebc4a..95572e1 100644
--- a/recipes/openssl/openssl.inc
+++ b/recipes/openssl/openssl.inc
@@ -97,7 +97,7 @@ do_configure () {
         if [ "x$useprefix" = "x" ]; then
                 useprefix=/
         fi        
-	perl ./Configure shared --prefix=$useprefix --openssldir=${libdir}/ssl $target
+	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --openssldir=${libdir}/ssl $target
 
 	eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "/_FILE_OFFSET_BITS/,/#endif/d" ${S}/crypto/bio/bss_file.c', d)}"
 	eval "${@base_contains('DISTRO_FEATURES', 'ipv6', '', 'sed -i -e "/AF_INET6/,/break/d" ${S}/crypto/bio/bss_dgram.c', d)}"
-- 
1.7.2.3




Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SjdpM-0004AD-DM
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jun 2012 00:01:40 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id CBB8CEA042;
	Tue, 26 Jun 2012 23:57:35 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id DDEF964495; Tue, 26 Jun 2012 23:50:47 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jun 2012 23:50:47 +0200
Message-Id: <1340747447-17919-2-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1340747447-17919-1-git-send-email-apelete@seketeli.net>
References: <1340747447-17919-1-git-send-email-apelete@seketeli.net>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][PATCH 1/1] openssl_1.0.0e: fix build issue for hosts without ipv6
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
X-List-Received-Date: Tue, 26 Jun 2012 22:01:40 -0000

This patch fixes an issue where some ipv6 code was injected into the
bss_dgram.c regardless of the ipv6 availability of the host.
The code is now injected only if the host is ipv6 enabled.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/openssl/openssl.inc |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes/openssl/openssl.inc b/recipes/openssl/openssl.inc
index 2aff24a..d45fca9 100644
--- a/recipes/openssl/openssl.inc
+++ b/recipes/openssl/openssl.inc
@@ -106,7 +106,10 @@ do_configure () {
 	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --openssldir=${libdir}/ssl $target
 
 	eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "/_FILE_OFFSET_BITS/,/#endif/d" ${S}/crypto/bio/bss_file.c', d)}"
-	eval "${@base_contains('DISTRO_FEATURES', 'ipv6', '', 'sed -i -e "/AF_INET6/,/break/d" ${S}/crypto/bio/bss_dgram.c', d)}"
+	# inject ipv6 specific code if ipv6 is enabled on host
+	if [ `lsmod | grep -q ipv6; echo $?` -eq 0 ]; then
+                eval "${@base_contains('DISTRO_FEATURES', 'ipv6', '', 'sed -i -e "/AF_INET6/,/break/d" ${S}/crypto/bio/bss_dgram.c', d)}"
+	fi
 }
 
 do_compile () {
-- 
1.7.10




Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNaRM-0002V7-Pu
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 01:20:57 +0100
Received: by pzk12 with SMTP id 12so928924pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 16:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=zGMMArc43TqJbkul70Q4ttV5Km6qxFTA8A6UHuR91ck=;
	b=MCi6qvc/YypoGmB2B6Voe7bADTuW0JpqRJjdzV+2ohOTgDa8hu97l7NCogApEmdIzs
	TPhKuDH1lYXKsPKuXdwF9rX3q0ijsrcdVGSxE6fQYZmp7pGoUgda499b0nLXrPtfWu0F
	vmJOiCP/9YNREwKqcNenvvbNBB17z6ztnGzTM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=cMs4GB7lAom32emkauhxdS+dyYc4TJl5vk/J61JvA8cliyFuawSCUpkc2TD3tAEE6A
	dxXvV99MAWgELQlQK08c6RHS/SJCQaJHS4iCeVMnTitTDvZIMhvK2fQwjjgRaejBuwPB
	p6TObXRCoIREKBacGnjDyfn6yGsUbhZSywEDs=
Received: by 10.143.163.19 with SMTP id q19mr8013049wfo.289.1291162771448;
	Tue, 30 Nov 2010 16:19:31 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	x18sm9664324wfa.23.2010.11.30.16.19.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 30 Nov 2010 16:19:30 -0800 (PST)
Message-ID: <4CF5948C.8020901@gmail.com>
Date: Wed, 01 Dec 2010 10:49:24 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] iputils_20071127.bb: Don't build ipv6 utils if DISTRO_FEATURES lacks ipv6.
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
X-List-Received-Date: Wed, 01 Dec 2010 00:20:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/iputils/iputils_20071127.bb |   29 ++++++++++++++++++++---------
 1 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/recipes/iputils/iputils_20071127.bb b/recipes/iputils/iputils_20071127.bb
index e5861eb..bcb35c4 100644
--- a/recipes/iputils/iputils_20071127.bb
+++ b/recipes/iputils/iputils_20071127.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 LICENSE ="BSD"
 DEPENDS = "docbook-utils-native sgmlspl-native"
 
-PR = "r2"
+PR = "r3"
 
 DEFAULT_PREFERENCE_angstrom = "2"
 
@@ -22,10 +22,14 @@ SRC_URI = "http://ftp.de.debian.org/debian/pool/main/i/iputils/iputils_${PV}.ori
 
 S = "${WORKDIR}/iputils_20071127.orig"
 
-PACKAGES += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath ${PN}-tracepath6 ${PN}-traceroute6"
+PACKAGES_IPV4 = "${PN}-ping ${PN}-arping ${PN}-tracepath"
+PACKAGES_IPV6 = "${PN}-ping6 ${PN}-tracepath6 ${PN}-traceroute6"
+all_pkgs = "${PACKAGES_IPV4} \
+	${@base_contains('DISTRO_FEATURES', 'ipv6', '${PACKAGES_IPV6}', '', d)}"
+PACKAGES += "${all_pkgs}"
 
 ALLOW_EMPTY_${PN} = "1"
-RDEPENDS_{PN} += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath ${PN}-tracepath6 ${PN}-traceroute6"
+RDEPENDS_{PN} += "${all_pkgs}"
 
 FILES_${PN}		= ""
 FILES_${PN}-ping	= "${base_bindir}/ping.${PN}"
@@ -37,25 +41,32 @@ FILES_${PN}-traceroute6	= "${bindir}/traceroute6"
 FILES_${PN}-doc		= "${mandir}/man8"
 
 do_compile () {
+	make_targets="${@base_contains('DISTRO_FEATURES', 'ipv6', 'all', 'tracepath ping arping', d)}"
 	oe_runmake 'CC=${CC}' \
 		   KERNEL_INCLUDE="${STAGING_INCDIR}" \
-		   LIBC_INCLUDE="${STAGING_INCDIR}" all man
+		   LIBC_INCLUDE="${STAGING_INCDIR}" ${make_targets} man
 }
 
+do_install_ipv6 () {
+	install -m 4555 ping6 ${D}${base_bindir}/ping6.${PN}
+	install -m 4555 traceroute6 ${D}${bindir}/
+	install -m 0755 tracepath6 ${D}${bindir}/
+	install -m 0644 doc/traceroute6.8 ${D}${mandir}/man8/ || true
+}
 do_install () {
 	install -m 0755 -d ${D}${base_bindir} ${D}${bindir} ${D}${mandir}/man8
 	# SUID root programs
 	install -m 4555 ping ${D}${base_bindir}/ping.${PN}
-	install -m 4555 ping6 ${D}${base_bindir}/ping6.${PN}
-	install -m 4555 traceroute6 ${D}${bindir}/
-	# Other programgs
-	for i in arping tracepath tracepath6; do
+	# Other programs
+	for i in arping tracepath; do
 	  install -m 0755 $i ${D}${bindir}/
 	done
 	# Manual pages for things we build packages for
-	for i in tracepath.8 traceroute6.8 ping.8 arping.8; do
+	for i in tracepath.8 ping.8 arping.8; do
 	  install -m 0644 doc/$i ${D}${mandir}/man8/ || true
 	done
+
+	${@base_contains('DISTRO_FEATURES', 'ipv6', 'do_install_ipv6', '', d)}
 }
 
 # Busybox also provides ping and ping6, so use update-alternatives
-- 
1.7.1




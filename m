Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2arm-0000Uf-5b
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:38 +0200
Received: by an-out-0708.google.com with SMTP id b6so1008390ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ttcd9KyV8JjeBGUL0Pgo5NUUVgBAX2lgOLp/TJ6k/FU=;
	b=S/L2BLohAU3rrFbw1eOgPMDhx6GJ34lYzgzFcG2ziuESt7TGh0ul1xf5o2NgEIzSXR
	RM1x/+24arVftk+F7U2vKrpGgcUmA76GDmeJ5Ta8fXRq76s/R/0aRcuVvehtZAkPPN3j
	L9QA8HncNn7F+5x/SklR4qjef3Lv3L2G7DmMU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=NF7qt6pVIFTV/mcxgsZl9iHKERv2qd5HxT+s6X6mYnEzusrj7Ce6IcgL5dxaBMIVC9
	rE5QhOP7bGAAsC6YOl04/2dvmhlPDzqmoU1FkusBd6df0PdnTIOUaX5grqgEU3zEdwhR
	peOzP9ZnkObgLWuwdNEV7klUhqxPDg+dir1TY=
Received: by 10.100.9.11 with SMTP id 11mr5174959ani.72.1241830223042;
	Fri, 08 May 2009 17:50:23 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 8sm1629023ywg.23.2009.05.08.17.50.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:22 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 182CC6101AD; Fri,  8 May 2009 21:50:53 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:38 -0300
Message-Id: <1241830239-5594-23-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-22-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-8-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-9-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-10-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-11-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-12-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-13-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-14-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-15-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-16-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-17-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-18-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-19-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-20-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-21-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-22-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 22/23] ppp: add peers dir
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
X-List-Received-Date: Sat, 09 May 2009 00:56:38 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/ppp/ppp_2.4.3.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/ppp/ppp_2.4.3.bb b/recipes/ppp/ppp_2.4.3.bb
index 295a3fb..3b1f8ad 100644
--- a/recipes/ppp/ppp_2.4.3.bb
+++ b/recipes/ppp/ppp_2.4.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Point-to-Point Protocol (PPP) daemon"
 HOMEPAGE = "http://samba.org/ppp/"
 DEPENDS = "libpcap"
 LICENSE = "BSD GPLv2"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
         file://ppp-2.4.3-mppe-mppc-1.1.patch;patch=1 \
@@ -39,6 +39,7 @@ do_install_append () {
 	mkdir -p ${D}${bindir}/ ${D}${sysconfdir}/init.d
 	mkdir -p ${D}${sysconfdir}/ppp/ip-up.d/
 	mkdir -p ${D}${sysconfdir}/ppp/ip-down.d/
+	mkdir -p ${D}${sysconfdir}/ppp/peers/
  	install -m 0755 ${WORKDIR}/pon ${D}${bindir}/pon
 	install -m 0755 ${WORKDIR}/poff ${D}${bindir}/poff
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/ppp
-- 
1.6.3.rc1.51.gea0b7




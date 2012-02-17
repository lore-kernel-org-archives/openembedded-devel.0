Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RyRxo-00021t-2c
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2012 18:51:21 +0100
Received: by mail-yx0-f175.google.com with SMTP id r5so1932238yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2012 09:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=TlHdAqia909FJ90/il0YjPDy9ReiEiu+tL9MViaOChE=;
	b=xD24JKUuPG8mx2ICqEcLG6FG8BnONPC7dp7u4YsEpYUE8diNGR5viGEQl92kR7Gwaj
	/xm5W3ILLSAlf85yIsfcFCgvc+HLXyoxUypYKApXicl+0ge8OKehFAEvRALZJgTH1NB/
	dIsHjJuBUQBivgNrZkzsOD9y4RtVwLjktODAs=
Received: by 10.236.197.41 with SMTP id s29mr11147373yhn.7.1329500586383;
	Fri, 17 Feb 2012 09:43:06 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id d5sm15769900anm.22.2012.02.17.09.43.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Feb 2012 09:43:05 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Feb 2012 17:42:34 +0000
Message-Id: <cde9b7fd463366d116e258eda12434707644ae86.1329500480.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1329500479.git.otavio@ossystems.com.br>
References: <cover.1329500479.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1329500479.git.otavio@ossystems.com.br>
References: <cover.1329500479.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 6/7] net-snmp: move static libs onto ${PN}-staticdev
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
X-List-Received-Date: Fri, 17 Feb 2012 17:51:21 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-extended/net-snmp/net-snmp.inc |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp.inc b/meta-oe/recipes-extended/net-snmp/net-snmp.inc
index c202751..66dac43 100644
--- a/meta-oe/recipes-extended/net-snmp/net-snmp.inc
+++ b/meta-oe/recipes-extended/net-snmp/net-snmp.inc
@@ -7,7 +7,7 @@ RDEPENDS_${PN}-server += "net-snmp-mibs"
 RDEPENDS_${PN}-client += "net-snmp-mibs"
 RDEPENDS_${PN}-dev = "net-snmp-client (= ${EXTENDPV}) net-snmp-server (= ${EXTENDPV})"
 RRECOMMENDS_${PN}-dbg = "net-snmp-client (= ${EXTENDPV}) net-snmp-server (= ${EXTENDPV})"
-INC_PR = "r1"
+INC_PR = "r2"
 
 inherit autotools update-rc.d siteinfo
 
@@ -36,11 +36,10 @@ do_install_append() {
 		-i ${STAGING_BINDIR}/net-snmp-config
 }
 
-PACKAGES = "net-snmp-dbg net-snmp-doc net-snmp-dev net-snmp-static net-snmp-libs \
+PACKAGES = "net-snmp-dbg net-snmp-doc net-snmp-dev net-snmp-staticdev net-snmp-static net-snmp-libs \
             net-snmp-mibs net-snmp-server net-snmp-client"
 
-FILES_${PN}-static = "${libdir}/*.a"
-FILES_${PN}-libs = "${libdir}/*"
+FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
 FILES_${PN}-mibs = "${datadir}/snmp/mibs"
 FILES_${PN}-server = "${sbindir}/* ${sysconfdir}"
 FILES_${PN}-client = "${bindir}/* ${datadir}/snmp/"
-- 
1.7.2.5




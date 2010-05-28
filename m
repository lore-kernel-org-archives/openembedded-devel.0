Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OHnhZ-000355-AE
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 May 2010 02:45:40 +0200
Received: by gya1 with SMTP id 1so396459gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 May 2010 17:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=fPafjj+Mv5gMs6aQlS651v45+E8SltCZY83ti2y6R6o=;
	b=jX87bC/SJ1Neinz6IMtn0y/2knccuTT87iaXpd9eML9Oo1bD+QZCaxVc0smkuYgYGv
	7JCJQOBEfJVeBkxYcsHKivdycJkuL5VezOc7Y72E4jaauz4TF/YF+czEbDrwa1+9ljUj
	agFUlePY72SJqDxc+LfLtp0TuOoJCbpej0+zk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=GgC3vEmJRrhszH++DWiX5fZ2DioR13yd/AcUVNG5k3X3/LFjzCupDtIZOBPFGH0fxg
	nWubS0yw+bSxFutMaxQUuSiDBzPv75atOpcbAx/IULhsQNrOZTZ9JvpHa1VxEDij+WE8
	pFiYq3XV4cZEvRUX6UwhKEqRwsbd07pHE+tLs=
Received: by 10.151.73.41 with SMTP id a41mr1095143ybl.117.1275007239162;
	Thu, 27 May 2010 17:40:39 -0700 (PDT)
Received: from localhost.localdomain ([201.53.192.211])
	by mx.google.com with ESMTPS id u2sm14509542ybh.15.2010.05.27.17.40.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 27 May 2010 17:40:38 -0700 (PDT)
From: "Joao H. Freitas" <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 May 2010 21:40:12 -0300
Message-Id: <1275007212-4095-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/1] fix missing packages
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
X-List-Received-Date: Fri, 28 May 2010 00:45:41 -0000

---
 recipes/lksctp-tools/lksctp-tools.inc |   24 +++++++++++++++++++++---
 1 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/recipes/lksctp-tools/lksctp-tools.inc b/recipes/lksctp-tools/lksctp-tools.inc
index 02ec988..9832dc9 100644
--- a/recipes/lksctp-tools/lksctp-tools.inc
+++ b/recipes/lksctp-tools/lksctp-tools.inc
@@ -19,10 +19,28 @@ do_install_append_virtclass-native() {
 
 DEBIANNAME_${PN} = "lksctp"
 
-PACKAGES =+ "${PN}-tools"
+PACKAGES =+ "${PN}-withsctp ${PN}-utils"
+
 FILES_${PN} = "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_libdir}/*${SOLIBS}"
 
-FILES_${PN}-dev += "${bindir}/*-config"
-FILES_${PN}-utils = ""
+FILES_${PN}-withsctp = " \
+  ${libdir}/lksctp-tools/lib*"
+
+FILES_${PN}-dev += " \
+  ${datadir}/lksctp-tools/checksctp.c \
+  ${datadir}/lksctp-tools/sctp_socket.c \
+  ${datadir}/lksctp-tools/sctp_bind.c \
+  ${datadir}/lksctp-tools/sctp_darn.c \
+  ${datadir}/lksctp-tools/sctp_load_libs.c \
+  ${datadir}/lksctp-tools/sctp_sockopt.c \
+  ${datadir}/lksctp-tools/sctp_socket.h \
+  ${datadir}/lksctp-tools/sctp_test.c \
+  ${datadir}/lksctp-tools/sctp_darn.h"
+
+FILES_${PN}-utils = " \
+  ${bindir}/sctp_test \
+  ${bindir}/sctp_darn \
+  ${bindir}/checksctp \
+  ${bindir}/withsctp"
-- 
1.7.0.4




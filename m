Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OTlRw-0001r8-BT
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 02:46:50 +0200
Received: by gyc15 with SMTP id 15so146839gyc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 17:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=dOgGQgsLgu0GkDiGlUuDZxsw5QoXXLnGn1fEuMEw7V0=;
	b=vQs0EYkW4AmF6hrCCiSpZKUtrn2rfbkD6jAF2Gb3bu40vLWpDAot2JVXu3koVAAm4H
	JnhVamVzbV1oZptt2f0op3sh9iIy+BD5A9g9IKYBPjBQ9cAvhKXEDXbno7RcQpjzDcFy
	LZGEIphhidnEg0q5wf1f0X78nqiLoL7BMO4OM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=hECMcD96C24hQrx55L8xOLi+GxZh1h858m+oyf+HaAGXimO+u9B5dy/ddVVwAiuLgV
	cMKOKb1mpuqYHb4BSGQpMXD0SwB0+6DH0mIGCMD2D2DtaXBQGUo27r92Dr+Qo/gXOicY
	aaMCg3gP+0USzSLgcNf/ytBGtE0GERxFNj+yU=
Received: by 10.91.163.11 with SMTP id q11mr6187978ago.90.1277858524474;
	Tue, 29 Jun 2010 17:42:04 -0700 (PDT)
Received: from localhost.localdomain ([201.53.204.31])
	by mx.google.com with ESMTPS id r42sm345299yba.0.2010.06.29.17.42.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 17:42:03 -0700 (PDT)
From: "Joao H. Freitas" <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jun 2010 21:41:42 -0300
Message-Id: <1277858503-27321-4-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277858503-27321-1-git-send-email-joaohf@gmail.com>
References: <1277858503-27321-1-git-send-email-joaohf@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/4] fix missing packages
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
X-List-Received-Date: Wed, 30 Jun 2010 00:46:51 -0000

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
1.7.0.2




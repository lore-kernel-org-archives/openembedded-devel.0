Return-Path: <Lauren.Post@freescale.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe003.messaging.microsoft.com [213.199.154.206])
	by mail.openembedded.org (Postfix) with ESMTP id 7FF126F643
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 21:37:59 +0000 (UTC)
Received: from mail44-am1-R.bigfish.com (10.3.201.225) by
	AM1EHSOBE003.bigfish.com (10.3.204.23) with Microsoft SMTP Server id
	14.1.225.22; Fri, 7 Mar 2014 21:37:59 +0000
Received: from mail44-am1 (localhost [127.0.0.1])	by mail44-am1-R.bigfish.com
	(Postfix) with ESMTP id 6E25F3604DF	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 21:37:59 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIe0eahzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz8275ch1de098h177df4h17326ah8275bh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h1155h)
Received: from mail44-am1 (localhost.localdomain [127.0.0.1]) by mail44-am1
	(MessageSwitch) id 1394228276984415_22680;
	Fri,  7 Mar 2014 21:37:56 +0000 (UTC)
Received: from AM1EHSMHS017.bigfish.com (unknown [10.3.201.246])	by
	mail44-am1.bigfish.com (Postfix) with ESMTP id DCF6A3000C5;
	Fri,  7 Mar 2014 21:37:56 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS017.bigfish.com
	(10.3.207.155) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 7 Mar 2014 21:37:56 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 7 Mar 2014 21:37:54 +0000
Received: from neo.am.freescale.net (neo.am.freescale.net [10.81.16.89])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s27LbrwF002056;
	Fri, 7 Mar 2014 14:37:53 -0700
From: Lauren Post <lauren.post@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Mar 2014 15:26:10 -0600
Message-ID: <1394227575-27897-2-git-send-email-lauren.post@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1394227575-27897-1-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1394227575-27897-1-git-send-email-lauren.post@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH 2/7] obexftp: Create 0.23 version
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
X-List-Received-Date: Fri, 07 Mar 2014 21:38:00 -0000
Content-Type: text/plain

obexftp is a tool to transfer files from any
OBEX enabled device. Disable prints to improve
performance

Signed-off-by: Lauren Post <lauren.post@freescale.com>
---
 .../obexftp/Remove_some_printf_in_obexftpd.patch   |   34 ++++++++++++++++++++
 .../recipes-connectivity/obexftp/obexftp_0.23.bb   |   16 +++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_obexftpd.patch
 create mode 100644 meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb

diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_obexftpd.patch b/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_obexftpd.patch
new file mode 100644
index 0000000..8b73af3
--- /dev/null
+++ b/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_obexftpd.patch
@@ -0,0 +1,34 @@
+Signed-off-by: Jun Zhu <R01007@freescale.com>
+
+Upstream-Status:  Not applicable
+
+diff -Nru obexftp-0.23/apps.orig/obexftpd.c obexftp-0.23/apps/obexftpd.c
+--- obexftp-0.23/apps.orig/obexftpd.c	2013-11-08 10:42:20.816631583 +0800
++++ obexftp-0.23/apps/obexftpd.c	2013-11-08 10:44:18.628634893 +0800
+@@ -639,7 +639,7 @@
+ 	struct stat statbuf;
+ 	//char *namebuf = NULL;
+ 
+-	fprintf(stderr, "put_done>>>\n");
++	//fprintf(stderr, "put_done>>>\n");
+ 	while(OBEX_ObjectGetNextHeader(handle, object, &hi, &hv, &hlen))	{
+ 		switch(hi)	{
+ 		case OBEX_HDR_BODY:
+@@ -671,7 +671,7 @@
+ 		}
+ 	}
+ 	if(!body)	{
+-		printf("Got a PUT without a body\n");
++		//printf("Got a PUT without a body\n");
+ 		OBEX_ObjectSetRsp(object, OBEX_RSP_CONTINUE, OBEX_RSP_SUCCESS);
+ 	}
+ 	if(!name)	{
+@@ -807,7 +807,7 @@
+ 			
+ 		switch(obex_cmd) {
+ 		case OBEX_CMD_PUT:
+-			fprintf(stderr, "obex_ev_progress: obex_cmd_put\n");
++			//fprintf(stderr, "obex_ev_progress: obex_cmd_put\n");
+ 			put_done(handle, obj, 0);
+ 			break;
+ 		default:
diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb b/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb
new file mode 100644
index 0000000..b6bdfb7
--- /dev/null
+++ b/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "A tool for transfer files to/from any OBEX enabled device"
+LICENSE = "GPLv2 & LGPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+DEPENDS += "openobex"
+
+SRC_URI = "http://sourceforge.net/projects/openobex/files/obexftp/${PV}/obexftp-${PV}.tar.bz2 \
+           file://Remove_some_printf_in_obexftpd.patch "
+
+SRC_URI[md5sum] = "f20762061b68bc921e80be4aebc349eb"
+SRC_URI[sha256sum] = "44a74ff288d38c0f75354d6bc2efe7d6dec10112eaff2e7b10e292b0d2105b36"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--disable-tcl --disable-perl --disable-python --disable-ruby"
+
-- 
1.7.9.5




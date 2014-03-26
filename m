Return-Path: <zhenhua.luo@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe004.messaging.microsoft.com [207.46.163.27])
	by mail.openembedded.org (Postfix) with ESMTP id D1BF16D305
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 12:22:41 +0000 (UTC)
Received: from mail214-co9-R.bigfish.com (10.236.132.243) by
	CO9EHSOBE008.bigfish.com (10.236.130.71) with Microsoft SMTP Server id
	14.1.225.22; Wed, 26 Mar 2014 12:22:42 +0000
Received: from mail214-co9 (localhost [127.0.0.1])	by
	mail214-co9-R.bigfish.com (Postfix) with ESMTP id D814A12022B	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 12:22:41 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -5
X-BigFish: VS-5(zz444fMzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh1155h)
Received: from mail214-co9 (localhost.localdomain [127.0.0.1]) by mail214-co9
	(MessageSwitch) id 1395836560722912_25327;
	Wed, 26 Mar 2014 12:22:40 +0000 (UTC)
Received: from CO9EHSMHS022.bigfish.com (unknown [10.236.132.251])	by
	mail214-co9.bigfish.com (Postfix) with ESMTP id A06702006C;
	Wed, 26 Mar 2014 12:22:40 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS022.bigfish.com
	(10.236.130.32) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 26 Mar 2014 12:22:40 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Wed, 26 Mar 2014 12:22:39 +0000
Received: from fly.ap.freescale.net (fly.ap.freescale.net [10.193.20.113])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s2QCMaW1032055; Wed, 26 Mar 2014 05:22:37 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Mar 2014 20:22:36 +0800
Message-ID: <1395836556-24961-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Cc: b40527@freescale.com
Subject: [meta-oe v2] lvm2: replace CPPFunction with rl_completion_func_t to fix build error
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
X-List-Received-Date: Wed, 26 Mar 2014 12:22:42 -0000
Content-Type: text/plain

lvm2 depends on readline, CPPFunction has been replaced by rl_completion_func_t
in recent readline,

Error log:
| lvm.c: In function 'lvm_shell':
| lvm.c:189:38: error: 'CPPFunction' undeclared (first use in this function)
|   rl_attempted_completion_function = (CPPFunction *) _completion;
|                                       ^

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc              |  1 +
 ...ace-CPPFunction-with-rl_completion_func_t.patch | 33 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-Replace-CPPFunction-with-rl_completion_func_t.patch

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index c2e1007..4b43328 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -9,6 +9,7 @@ INC_PR = "r4"
 
 S = "${WORKDIR}/LVM2.${PV}"
 SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
+           file://0001-Replace-CPPFunction-with-rl_completion_func_t.patch \
            file://lvm.conf"
 
 PACKAGECONFIG ??= "readline"
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-Replace-CPPFunction-with-rl_completion_func_t.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-Replace-CPPFunction-with-rl_completion_func_t.patch
new file mode 100644
index 0000000..98c21fd
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/0001-Replace-CPPFunction-with-rl_completion_func_t.patch
@@ -0,0 +1,33 @@
+From e2484e179c389b98366c8b66b451d9d2ba8f35e8 Mon Sep 17 00:00:00 2001
+From: Zhenhua Luo <zhenhua.luo@freescale.com>
+Date: Tue, 25 Mar 2014 17:39:43 +0800
+Subject: [PATCH] Replace CPPFunction with rl_completion_func_t
+
+lvm2 depends on readline, CPPFunction has been replaced by rl_completion_func_t
+in recent readline,
+
+Upstream-Status: Inappropriate [configuration]
+The change depends on the build environment, it is required by OpenEmbedded env 
+due to readline upgrade. 
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+---
+ tools/lvm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/lvm.c b/tools/lvm.c
+index e002a76..5fa35d2 100644
+--- a/tools/lvm.c
++++ b/tools/lvm.c
+@@ -186,7 +186,7 @@ int lvm_shell(struct cmd_context *cmd, struct cmdline_context *cmdline)
+ 	char *input = NULL, *args[MAX_ARGS], **argv;
+ 
+ 	rl_readline_name = "lvm";
+-	rl_attempted_completion_function = (CPPFunction *) _completion;
++	rl_attempted_completion_function = (rl_completion_func_t *) _completion;
+ 
+ 	_read_history(cmd);
+ 
+-- 
+1.9.1
+
-- 
1.9.1




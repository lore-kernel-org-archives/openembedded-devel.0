Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Song.Li@windriver.com>) id 1Std1b-0003R8-EH
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jul 2012 13:11:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6O9mNbR028711
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Jul 2012 02:48:23 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 24 Jul 2012 02:48:22 -0700
Message-ID: <500E6F68.7090506@windriver.com>
Date: Tue, 24 Jul 2012 17:48:24 +0800
From: "Song.Li" <Song.Li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1342506029-32113-1-git-send-email-Song.Li@windriver.com>
In-Reply-To: <1342506029-32113-1-git-send-email-Song.Li@windriver.com>
X-Forwarded-Message-Id: <1342506029-32113-1-git-send-email-Song.Li@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: "Zhao, Zhenfeng" <Zhenfeng.Zhao@windriver.com>, "Yang,
	Liezhi" <Liezhi.Yang@windriver.com>,
	openembedded-devel@lists.openembedded.org
Subject: [PATCH] sysstat:use a new way to remove -s option of LFLAGS
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
X-List-Received-Date: Tue, 24 Jul 2012 11:11:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi saul:

I sent this patch last week, didn't get any reply, just resent it to 
confirm.

Thanks
Song.Li


-------- Original Message --------
Received: 	from mail.windriver.com (147.11.1.11) by 
ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server (TLS) 
id 14.1.255.0; Tue, 17 Jul 2012 00:00:40 -0700
Received: 	from mr1.windriver.com (mr1 [192.124.127.25]) by 
mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6H70eYc012147 
(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL); 
Tue, 17 Jul 2012 00:00:40 -0700 (PDT)
Received: 	from sna.ihostsxode.net (sna.ihostsxode.net [216.237.12.146]) 
by mr1.windriver.com (8.14.5/8.14.5) with ESMTP id q6H70d1r015995 
(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO); Tue, 
17 Jul 2012 00:00:39 -0700 (PDT)
X-Envelope-From: 	openembedded-devel-bounces@lists.openembedded.org
X-Envelope-To: 	kai.kang@windriver.com
Received: 	from usp2.mailhostsxode.net (sna2.ihostsxode.net 
[216.237.12.147]) by sna.ihostsxode.net (8.12.11.20060308/8.12.11) with 
ESMTP id q6H70WIk002893; Tue, 17 Jul 2012 03:00:34 -0400
X-IronPort-Anti-Spam-Filtered: 	true
X-IronPort-Anti-Spam-Result: 
As4BANYMBVC8KFPImWdsb2JhbABFuVwiAQEBAQEICwsHFCeCIAEBAQUBATcMBQEEHgsDAwECBgIbAwECHwQECAMBIwEnDhMFiAgEB615AQGOUIs+CYY+A4hJikmDO5FggUk 

X-IronPort-AV: 	E=Sophos;i="4.77,599,1336363200"; 
d="scan'208";a="280764572"
Received: 	from linuxtogo.org ([188.40.83.200]) by 
usp2.mailhostsxode.net with ESMTP/TLS/AES256-SHA; 17 Jul 2012 03:00:33 
-0400
Received: 	from localhost ([127.0.0.1]) by linuxtogo.org with esmtp 
(Exim 4.72) (envelope-from 
<openembedded-devel-bounces@lists.openembedded.org>) id 
1Sr1wK-0000fA-6w; Tue, 17 Jul 2012 09:11:24 +0200
Received: 	from mail.windriver.com ([147.11.1.11]) by linuxtogo.org with 
esmtp (Exim 4.72) (envelope-from <Song.Li@windriver.com>) id 
1Sr1wI-0000ex-He for openembedded-devel@lists.openembedded.org; Tue, 17 
Jul 2012 09:11:22 +0200
Received: 	from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40]) by 
mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6H6KbMQ007865 
(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL) for 
<openembedded-devel@lists.openembedded.org>; Mon, 16 Jul 2012 23:20:37 
-0700 (PDT)
Received: 	from localhost.localdomain (128.224.163.66) by 
ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id 
14.1.255.0; Mon, 16 Jul 2012 23:20:37 -0700
From: 	<Song.Li@windriver.com>
To: 	<openembedded-devel@lists.openembedded.org>
Date: 	Tue, 17 Jul 2012 14:20:28 +0800
Message-ID: 	<1342506029-32113-1-git-send-email-Song.Li@windriver.com>
X-Mailer: 	git-send-email 1.7.9.5
CC: 	<Zhenfeng.Zhao@windriver.com>
Subject: 	[oe] [PATCH] sysstat:use a new way to remove -s option of LFLAGS
X-BeenThere: 	openembedded-devel@lists.openembedded.org
X-Mailman-Version: 	2.1.11
Precedence: 	list
Reply-To: 	<openembedded-devel@lists.openembedded.org>
List-Id: 	Using the OpenEmbedded metadata to build Distributions 
<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: 
<http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>, 
<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe> 

List-Archive: 	<http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: 	<mailto:openembedded-devel@lists.openembedded.org>
List-Help: 
<mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: 
<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>, <mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe> 

Content-Type: 	text/plain; charset="us-ascii"
Content-Transfer-Encoding: 	7bit
Sender: 	<openembedded-devel-bounces@lists.openembedded.org>
Errors-To: 	openembedded-devel-bounces@lists.openembedded.org
Return-Path: 	openembedded-devel-bounces@lists.openembedded.org
X-MS-Exchange-Organization-AuthSource: 	ALA-HCA.corp.ad.wrs.com
X-MS-Exchange-Organization-AuthAs: 	Anonymous
X-MS-Exchange-Organization-SCL: 	-1
X-MS-Exchange-Organization-AVStamp-Mailbox: 	NAI;54068898;0;novirus
MIME-Version: 	1.0



From: "Song.Li" <Song.Li@windriver.com>

sysstat Makefile shouldn't use -s option to strip binary
because we need debug info for dbg package.
The old way to remove -s option is passing LFLAGS=''
in make command line to clean all the LFLAGS variable in Makefile.
That will cause build failure when sensors lib is needed.
In fact,Only the "-s" should be removed, others LFLAGS should be kept.

[YOCTO #2740]

Signed-off-by: Song.Li <Song.Li@windriver.com>
---
  .../sysstat/files/remove-s-option-of-LFLAGS.patch  |   34 ++++++++++++++++++++
  meta/recipes-extended/sysstat/sysstat.inc          |    5 +--
  meta/recipes-extended/sysstat/sysstat_10.0.3.bb    |    2 +-
  3 files changed, 38 insertions(+), 3 deletions(-)
  create mode 100644 meta/recipes-extended/sysstat/files/remove-s-option-of-LFLAGS.patch

diff --git a/meta/recipes-extended/sysstat/files/remove-s-option-of-LFLAGS.patch b/meta/recipes-extended/sysstat/files/remove-s-option-of-LFLAGS.patch
new file mode 100644
index 0000000..5c23091
--- /dev/null
+++ b/meta/recipes-extended/sysstat/files/remove-s-option-of-LFLAGS.patch
@@ -0,0 +1,34 @@
+From 69f0088cbe300628f5d94b66505ac8ed07565229 Mon Sep 17 00:00:00 2001
+From: "Song.Li" <Song.Li@windriver.com>
+Date: Fri, 13 Jul 2012 13:51:13 +0800
+Subject: [PATCH] remove -s option of LFLAGS
+
+sysstat Makefile shouldn't use -s option to strip binary
+because we need debug info for dbg package.
+The old way to remove -s option is passing LFLAGS=''
+in make command line to clean all the LFLAGS variable in Makefile.
+That will cause build failure when sensors lib is needed.
+In fact,only "-s" should be removeed, others LFLAGS should be kept.
+
+[YOCTO #2740]
+
+Signed-off-by: Song.Li <Song.Li@windriver.com>
+---
+ Makefile.in |    1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index d1ea853..ee6cbc1 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -71,7 +71,6 @@ SYSCONFIG_DIR = @SYSCONFIG_DIR@
+ # Compiler flags
+ CFLAGS = @CFLAGS@ -Wall -Wstrict-prototypes -pipe -O2
+ DFLAGS = @DFLAGS@
+-LFLAGS =  -s
+ DFLAGS += -DSA_DIR=\"$(SA_DIR)\" -DSADC_PATH=\"$(SADC_PATH)\"
+ DFLAGS += $(DFSENSORS)
+
+--
+1.7.9.5
+
diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 9da40a7..1c98101 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -5,11 +5,12 @@ LICENSE = "GPLv2+"
  SECTION = "console/utils"
  
  SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.gz \
-		   file://99_sysstat"
+		   file://99_sysstat \
+		   file://remove-s-option-of-LFLAGS.patch \
+          "
  
  inherit autotools gettext
  
-EXTRA_OEMAKE += 'LFLAGS=""'
  
  do_install() {
  	autotools_do_install
diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.3.bb b/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
index 7ef6c60..93fbe21 100644
--- a/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
+++ b/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
@@ -2,7 +2,7 @@ require sysstat.inc
  
  LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
  
-PR = "r1"
+PR = "r2"
  
  SRC_URI[md5sum] = "0e1ed5200f31f69a3b90ff1e81c07745"
  SRC_URI[sha256sum] = "7c0dd172f09edaff100b33db29ef502e15e71867b505c6d519f76a24fabcc1f5"
-- 
1.7.9.5


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel






Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id D4E737325A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 16:00:41 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id 78so5765822qgt.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 09:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g8sQ0+UtpUPDTKjQoooyAJ2HIHkiYyKX4pFY8iY0uQw=;
	b=FJ2up47mfMnPbpq0ZL/N+94rFDOwzrMcPyxjdZ0Z7xofWzoVEI99C3XKpX5R78Rcpy
	v0NpPgjtQkpCWTUnS9V8vyksYucjf6aF0i1wYdEi7v6eUrpsyaC+hrA75Xd+tFYqf9Vm
	HIsLKBDLmkyj/7RiaG7bnxvYCMVJZSQnzRzkK0ZoYRCswlML1LT9AqulKoopzBJJvyht
	CihjjrROLTV+8AlX3ktkCgf8mC0kXazUvnYPVxSjY8XOuT4EUHjyHkNQt/MhRiYd3w5F
	8Jg2U8tyyJtR2E4ARc06ENpvPdZVifL85HFT1INVWbtdZN9A1DTKP/BfzXvj5DkyqWqa
	eg3g==
X-Gm-Message-State: ALyK8tK2sgox7VQf1+YpLvnubETHMfCt9KzGlpBaSGTMs3RzFlbl94aHIzoRovaExPiAcA==
X-Received: by 10.140.84.231 with SMTP id l94mr3091179qgd.44.1466179242114;
	Fri, 17 Jun 2016 09:00:42 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	k6sm13231383qkc.42.2016.06.17.09.00.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jun 2016 09:00:41 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jun 2016 12:00:27 -0400
Message-Id: <1466179227-30855-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-multimedia][PATCH] tvheadend: add a patch to fix issues with gcc 6 and drop the -Wno-error=misleading-indentation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jun 2016 16:00:43 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../tvheadend/0002-fix-issues-with-gcc6.patch      | 46 ++++++++++++++++++++++
 .../recipes-dvb/tvheadend/tvheadend_git.bb         |  3 +-
 2 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0002-fix-issues-with-gcc6.patch

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0002-fix-issues-with-gcc6.patch b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0002-fix-issues-with-gcc6.patch
new file mode 100644
index 0000000..55b9249
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0002-fix-issues-with-gcc6.patch
@@ -0,0 +1,46 @@
+--- git/src/htsmsg.c.orig	2016-06-17 11:47:53.026921237 -0400
++++ git/src/htsmsg.c	2016-06-17 11:49:03.086922457 -0400
+@@ -574,13 +574,13 @@
+     case HMF_MAP:
+       printf("MAP) = {\n");
+       htsmsg_print0(&f->hmf_msg, indent + 1);
+-      for(i = 0; i < indent; i++) printf("\t"); printf("}\n");
++      for(i = 0; i < indent; i++) {printf("\t");} printf("}\n");
+       break;
+ 
+     case HMF_LIST:
+       printf("LIST) = {\n");
+       htsmsg_print0(&f->hmf_msg, indent + 1);
+-      for(i = 0; i < indent; i++) printf("\t"); printf("}\n");
++      for(i = 0; i < indent; i++) {printf("\t");} printf("}\n");
+       break;
+       
+     case HMF_STR:
+--- git/src/dvb/dvb_tables.c.orig	2016-06-17 11:51:09.142924652 -0400
++++ git/src/dvb/dvb_tables.c	2016-06-17 11:54:33.962928219 -0400
+@@ -935,10 +935,10 @@
+     onid = (ptr[24] << 8) | ptr[25];
+     
+     /* Search all muxes on adapter */
+-    LIST_FOREACH(tdmi, &tda->tda_muxes, tdmi_adapter_link)
+-      if(tdmi->tdmi_transport_stream_id == tsid && tdmi->tdmi_network_id == onid);
+-	break;
+-    
++    LIST_FOREACH(tdmi, &tda->tda_muxes, tdmi_adapter_link) {
++      if(tdmi->tdmi_transport_stream_id == tsid && tdmi->tdmi_network_id == onid)
++    	break;
++    }
+     if(tdmi == NULL)
+       continue;
+ 
+--- git/src/epggrab/module/eit.c.orig	2016-06-17 11:49:57.726923409 -0400
++++ git/src/epggrab/module/eit.c	2016-06-17 11:50:14.526923701 -0400
+@@ -214,7 +214,7 @@
+   if (m && m->enabled) cptr = _eit_freesat_conv;
+   else
+     m = epggrab_module_find_by_id("uk_freeview");
+-    if (m && m->enabled) cptr = _eit_freesat_conv;
++  if (m && m->enabled) cptr = _eit_freesat_conv;
+ 
+   /* Convert */
+   return dvb_get_string_with_len(dst, dstlen, src, srclen, charset, cptr);
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index 9fed042..bd5062c 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -8,14 +8,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9eef91148a9b14ec7f9df333daebc746"
 
 SRC_URI = "git://github.com/tvheadend/tvheadend.git \
            file://0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch \
+           file://0002-fix-issues-with-gcc6.patch \
 "
 SRCREV = "a420c83a0e0d2c31c2c15d0fec6fedc3f5a36dfe"
 PV = "3.3"
 
 S = "${WORKDIR}/git"
 
-TARGET_CFLAGS += "-Wno-error=misleading-indentation"
-
 do_configure() {
     ./configure --prefix=${prefix} \
                 --libdir=${libdir} \
-- 
1.9.1



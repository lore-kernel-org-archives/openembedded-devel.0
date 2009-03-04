Received: from [209.85.200.168] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Leo7x-00050L-I0
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 11:16:08 +0100
Received: by wf-out-1314.google.com with SMTP id 28so3959449wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2009 02:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=zC3aKt1kpMwQDP6VD69U2d9bFb7CMJOOv1W61zneyiI=;
	b=GQiU1zFouyOmuiyp1VDvDMeXJzESxBue4Tob4cy4p14JnqT9Rnadkv8Sk4HJvc7Qvh
	VcOgEkbF+F1eYhyaNKZekNSPorWaROgzozloXrY9PT98Q7tsDjJ/MyQxJR6cXyiGavJX
	00h6OBo1mrPA8ZYzY9NVoN45j7hmelARV8FoU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=Xujm6VmC+JLrlrn1Y/5MMHL1RYNVWskGvxw5b91SSM9xhc9EQMLdiM0FSGj08zn4q4
	H17M29qv/r0VjWZmR3u3jVPDCCR737xs6/wwleT6S3LjLnORdS39TDKwY6HQFCA9qbkG
	V8gosFPwuq8E2gyF/JjgCpDsyLfSTP4xe2cDM=
Received: by 10.143.28.8 with SMTP id f8mr4122673wfj.204.1236161451070;
	Wed, 04 Mar 2009 02:10:51 -0800 (PST)
Received: from gmail.com (adsl-71-146-1-99.dsl.pltn13.sbcglobal.net
	[71.146.1.99])
	by mx.google.com with ESMTPS id 24sm13717510wfc.57.2009.03.04.02.10.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Mar 2009 02:10:50 -0800 (PST)
Date: Wed, 4 Mar 2009 02:10:45 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090304101045.GA736@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: [patch] Fix for nfs-utils tools build
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
X-List-Received-Date: Wed, 04 Mar 2009 10:23:22 -0000
X-Groupsio-MsgNum: 8125
Content-Type: multipart/mixed; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline

--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

Currently nfs-utils 1.1.2 does not build correctly. The reason is that
there are certain tools which are passed in CFLAGS in their makefiles
even though they are to be build using host compiler for them to be run
on host machine. 

Current builds use target headers to build them due to CFLAGS funkiness
where we have alters system include dirs. This goes ok with arm and x86
but on mips you see errors.

This patch fixes the issue

OK for .dev

Thx

-Khem



--YZ5djTAD1cGYuMQK
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="nfs-utils-tools-unset-cflags.patch"

Index: nfs-utils-1.1.2/tools/Makefile.am
===================================================================
--- nfs-utils-1.1.2.orig/tools/Makefile.am	2008-03-14 08:46:29.000000000 -0700
+++ nfs-utils-1.1.2/tools/Makefile.am	2009-03-04 01:58:50.000000000 -0800
@@ -5,7 +5,10 @@
 if CONFIG_RPCGEN
 OPTDIRS += rpcgen
 endif
-
+CFLAGS=$(CFLAGS_FOR_BUILD)
+CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
+CXXFLAGS=$(CXXFLAGS_FOR_BUILD)
+LDFLAGS=$(LDFLAGS_FOR_BUILD)
 SUBDIRS = locktest rpcdebug nlmtest $(OPTDIRS)
 
 MAINTAINERCLEANFILES = Makefile.in
Index: nfs-utils-1.1.2/tools/locktest/Makefile.am
===================================================================
--- nfs-utils-1.1.2.orig/tools/locktest/Makefile.am	2008-03-14 08:46:29.000000000 -0700
+++ nfs-utils-1.1.2/tools/locktest/Makefile.am	2009-03-04 01:58:50.000000000 -0800
@@ -1,12 +1,13 @@
 ## Process this file with automake to produce Makefile.in
 
 CC=$(CC_FOR_BUILD)
+CFLAGS=$(CFLAGS_FOR_BUILD)
+CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
+CXXFLAGS=$(CXXFLAGS_FOR_BUILD)
+LDFLAGS=$(LDFLAGS_FOR_BUILD)
 LIBTOOL = @LIBTOOL@ --tag=CC
 
 noinst_PROGRAMS = testlk
 testlk_SOURCES = testlk.c
-testlk_CFLAGS=$(CFLAGS_FOR_BUILD)
-testlk_CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
-testlk_LDFLAGS=$(LDFLAGS_FOR_BUILD)
 
 MAINTAINERCLEANFILES = Makefile.in
Index: nfs-utils-1.1.2/tools/nlmtest/Makefile.am
===================================================================
--- nfs-utils-1.1.2.orig/tools/nlmtest/Makefile.am	2008-03-14 08:46:29.000000000 -0700
+++ nfs-utils-1.1.2/tools/nlmtest/Makefile.am	2009-03-04 01:58:50.000000000 -0800
@@ -1,5 +1,8 @@
 ## Process this file with automake to produce Makefile.in
-
+CFLAGS=$(CFLAGS_FOR_BUILD)
+CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
+CXXFLAGS=$(CXXFLAGS_FOR_BUILD)
+LDFLAGS=$(LDFLAGS_FOR_BUILD)
 EXTRA_DIST = \
 	README \
 	host.h \
Index: nfs-utils-1.1.2/tools/rpcgen/Makefile.am
===================================================================
--- nfs-utils-1.1.2.orig/tools/rpcgen/Makefile.am	2008-03-14 08:46:29.000000000 -0700
+++ nfs-utils-1.1.2/tools/rpcgen/Makefile.am	2009-03-04 01:58:50.000000000 -0800
@@ -1,6 +1,10 @@
 ## Process this file with automake to produce Makefile.in
 
 CC=$(CC_FOR_BUILD)
+CFLAGS=$(CFLAGS_FOR_BUILD)
+CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
+CXXFLAGS=$(CXXFLAGS_FOR_BUILD)
+LDFLAGS=$(LDFLAGS_FOR_BUILD)
 LIBTOOL = @LIBTOOL@ --tag=CC
 
 noinst_PROGRAMS = rpcgen
@@ -9,10 +13,6 @@
 		 rpc_util.c rpc_sample.c rpc_output.h rpc_parse.h \
 		 rpc_scan.h rpc_util.h
 
-rpcgen_CFLAGS=$(CFLAGS_FOR_BUILD)
-rpcgen_CPPLAGS=$(CPPFLAGS_FOR_BUILD)
-rpcgen_LDFLAGS=$(LDFLAGS_FOR_BUILD)
-
 MAINTAINERCLEANFILES = Makefile.in
 
 EXTRA_DIST = rpcgen.new.1
Index: nfs-utils-1.1.2/tools/rpcdebug/Makefile.am
===================================================================
--- nfs-utils-1.1.2.orig/tools/rpcdebug/Makefile.am	2009-03-04 02:01:41.000000000 -0800
+++ nfs-utils-1.1.2/tools/rpcdebug/Makefile.am	2009-03-04 02:02:42.000000000 -0800
@@ -1,6 +1,10 @@
 ## Process this file with automake to produce Makefile.in
 
 CC=$(CC_FOR_BUILD)
+CFLAGS=$(CFLAGS_FOR_BUILD)
+CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
+CXXFLAGS=$(CXXFLAGS_FOR_BUILD)
+LDFLAGS=$(LDFLAGS_FOR_BUILD)
 LIBTOOL = @LIBTOOL@ --tag=CC
 
 man8_MANS = rpcdebug.man

--YZ5djTAD1cGYuMQK--

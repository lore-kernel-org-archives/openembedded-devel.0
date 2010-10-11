Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P5Bnv-0006nR-5o
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 08:24:13 +0200
Received: by pwj9 with SMTP id 9so135834pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 23:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=K9Vrv/9DSPY9VyitmIAj7DqJBiBvrjxtYHZ6vjX2ikE=;
	b=aO4Ecf91iBDmNuWwxIwMp5pqEliJRhW8c0eUVAPUDo2fF2oTzdyybTANIrrA1+PQGH
	kVRl94jzUABhfLPaaDqLpdJZremAlVIoHDJ40gC+M6QTs0ybQHQvvSsbZPjNkur9aFrP
	mYDQ/QaG3JAHhO2rMNs7lSrBhd0drgnhtnVSM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=O+YLYDBLLq1diIZuZwT74kD9OKljeiZYNBNyOUXvAmitFGdyHtjyLIact9j93RJ5Ev
	ZdKovIIGsHmoG0QyjhqxjQeydzitWc2XC++QildsVtwMFqWvOCY/PluSplUtvv8qbkwm
	xdO70eG+Eb2xP+ndyasjU8ZyC2e26tokdvYF0=
Received: by 10.114.39.16 with SMTP id m16mr6529677wam.221.1286778218605;
	Sun, 10 Oct 2010 23:23:38 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id i4sm2789331wal.22.2010.10.10.23.23.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 10 Oct 2010 23:23:37 -0700 (PDT)
Message-ID: <4CB2AD64.90800@gmail.com>
Date: Mon, 11 Oct 2010 16:53:32 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] prboom_2.5.0.bb: fix compilation failure due to undefined references.
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
X-List-Received-Date: Mon, 11 Oct 2010 06:24:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Need to #define _GNU_SOURCE for sched.h to define CPU_ZERO/CPU_SET.

 SDL/libsdldoom.a(i_system.o): In function `I_SetAffinityMask':
| i_system.c:(.text+0x7d4): undefined reference to `CPU_ZERO'
| i_system.c:(.text+0x7e8): undefined reference to `CPU_SET'
| collect2: ld returned 1 exit status

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 .../prboom-2.5.0/gnu_source_for_sched_h.patch      |   12 ++++++++++++
 recipes/prboom/prboom_2.5.0.bb                     |    3 ++-
 2 files changed, 14 insertions(+), 1 deletions(-)
 create mode 100644 recipes/prboom/prboom-2.5.0/gnu_source_for_sched_h.patch

diff --git a/recipes/prboom/prboom-2.5.0/gnu_source_for_sched_h.patch b/recipes/prboom/prboom-2.5.0/gnu_source_for_sched_h.patch
new file mode 100644
index 0000000..e77917a
--- /dev/null
+++ b/recipes/prboom/prboom-2.5.0/gnu_source_for_sched_h.patch
@@ -0,0 +1,12 @@
+Upstream: http://sourceforge.net/mailarchive/forum.php?thread_name=4CB2549C.2030100%40gmail.com&forum_name=prboom-devel
+
+--- prboom-2.5.0/src/SDL/i_system.c.orig	2010-10-11 09:58:02.000000000 +1030
++++ prboom-2.5.0/src/SDL/i_system.c	2010-10-11 09:59:16.000000000 +1030
+@@ -33,6 +33,7 @@
+  *-----------------------------------------------------------------------------
+  */
+ 
++#define _GNU_SOURCE
+ #include <stdio.h>
+ 
+ #include <stdarg.h>
diff --git a/recipes/prboom/prboom_2.5.0.bb b/recipes/prboom/prboom_2.5.0.bb
index 92a276d..13f3623 100644
--- a/recipes/prboom/prboom_2.5.0.bb
+++ b/recipes/prboom/prboom_2.5.0.bb
@@ -4,10 +4,11 @@ PRIORITY = "optional"
 DEPENDS = "virtual/libsdl libsdl-mixer libsdl-net"
 LICENSE = "GPL"
 
-PR = "r2"
+PR = "r3"
 RRECOMMENDS_${PN} = "freedoom"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/prboom/prboom-${PV}.tar.gz \
+	   file://gnu_source_for_sched_h.patch \
 	   "
 
 inherit autotools
-- 
1.7.1




Received: from [209.85.218.227] (helo=mail-bw0-f227.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MwKI7-0002V6-22
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Oct 2009 20:34:14 +0200
Received: by bwz27 with SMTP id 27so831485bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Oct 2009 11:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=PTI12fsxk6u3xyxs6f8ccTs44e/6z/SI5OJsGVtm8UE=;
	b=duFcYjrmhrwXhQ3HUOS4eGsrebrRrIYfsvt0MKnvIJ3UpSX9X+g8Espv2IE/PMXcQ0
	G9t1xRvk83n5Ip2EhC3XcDjb4ujWsOX94jErvYC5ISJlHiZSdZRyo61kj7/OrtY7vQaW
	o/yf+N0Pfof+KA7fM9cbIWKX52QBEXgaa/vvM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=JBqVs1q8EAgXb4hCXcK3Of8nluTte11MZgC18A1XdaxDtEVhVoq9ou10rQemsTjPfS
	djep8h8n1wQVfWtm+kQBLa9pvaOKT6E618I8XNTjr6pXdrJCYn6x1wEDpaKIkfE0zr71
	NJqStVmp+Ro4SCtcyMTBjpPXSPUie/cJfW11A=
Received: by 10.103.37.38 with SMTP id p38mr1244498muj.134.1255113199600;
	Fri, 09 Oct 2009 11:33:19 -0700 (PDT)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b9sm629908mug.33.2009.10.09.11.33.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 09 Oct 2009 11:33:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Oct 2009 11:32:55 -0700
Message-Id: <1255113176-19171-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1255113176-19171-1-git-send-email-raj.khem@gmail.com>
References: <1255113176-19171-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.227
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/3] angstrom: Revert to linux-gnu triplet
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
X-List-Received-Date: Fri, 09 Oct 2009 18:34:14 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/include/angstrom-eglibc.inc |    6 +++---
 conf/distro/include/angstrom-glibc.inc  |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/distro/include/angstrom-eglibc.inc b/conf/distro/include/angstrom-eglibc.inc
index 47147a1..2a1b7b0 100644
--- a/conf/distro/include/angstrom-eglibc.inc
+++ b/conf/distro/include/angstrom-eglibc.inc
@@ -3,10 +3,10 @@ require conf/distro/include/eglibc.inc
 
 TARGET_OS = "linux"
 
-TARGET_OS .= "${@['','eabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
-TARGET_OS .= "${@['','spe'][bb.data.getVar('TARGET_ARCH',d,1) in ['ppc', 'powerpc'] and bb.data.getVar('MACHINE',d) in ['calamari']]}"
+TARGET_OS .= "${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
+TARGET_OS .= "${@['','-gnuspe'][bb.data.getVar('TARGET_ARCH',d,1) in ['ppc', 'powerpc'] and bb.data.getVar('MACHINE',d) in ['calamari']]}"
 
-#TARGET_OS = "linux-spe"
+#TARGET_OS = "linux-gnuspe"
 
 #mess with compiler flags to use -Os instead of -O2
 #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
diff --git a/conf/distro/include/angstrom-glibc.inc b/conf/distro/include/angstrom-glibc.inc
index 28c31e3..dae149f 100644
--- a/conf/distro/include/angstrom-glibc.inc
+++ b/conf/distro/include/angstrom-glibc.inc
@@ -4,7 +4,7 @@ require conf/distro/include/glibc.inc
 PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers"
 
 TARGET_OS = "linux"
-TARGET_OS .= "${@['','eabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
+TARGET_OS .= "${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
 
 #mess with compiler flags to use -Os instead of -O2
 #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
-- 
1.6.3.3




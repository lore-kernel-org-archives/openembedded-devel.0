Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P5BpT-00073s-21
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 08:25:49 +0200
Received: by pzk28 with SMTP id 28so153347pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 23:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=6sDdP4DF/f5VfD7k8QdU2FNWi68dsew0sF6wOabTVqs=;
	b=eoOBU/jb4kGsmolgHRsw8iLDzCz0K83mYBV2Ev9613vqRZ1AIJAVy0a16QwKL9GIHL
	yJjckHnyph8Bo1Xz0QAfyEU4wZblCAWUTwNCWFUzOImfYo5IYGOYvdXhgh/KJkb65xuR
	cqjbdV8Foq/asIpT0c49YX8CUJa13sg3/SNNI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=Gg3wpAouYlPUnWQ5qT6SVqtC0nPWhLwZ2sc+WfFNmOZwILBD3ccUW9JqmhdUO/5nFr
	9c1tWCzoCOD2SCK3qjpF5KZR0SvLS2zP5pFImSLWUyyKJphUI8HPzvlj6K4eR803l1js
	8ryOgwY9PsVLTkCfAgZHs6OnkUjwb0aEDlqss=
Received: by 10.142.141.4 with SMTP id o4mr4859657wfd.314.1286778316502;
	Sun, 10 Oct 2010 23:25:16 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id t38sm7785975wfc.9.2010.10.10.23.25.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 10 Oct 2010 23:25:15 -0700 (PDT)
Message-ID: <4CB2ADC6.3030804@gmail.com>
Date: Mon, 11 Oct 2010 16:55:10 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] dsniff_2.3.bb: fix buildability.
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
X-List-Received-Date: Mon, 11 Oct 2010 06:25:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This almost 10 year old software is beginning to suffer bitrot. Libnids now
uses glib, and openssl structs have moved headers.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/dsniff/dsniff-2.3/openssl-includes.patch |   11 +++++++++++
 recipes/dsniff/dsniff_2.3.bb                     |    7 ++++---
 2 files changed, 15 insertions(+), 3 deletions(-)
 create mode 100644 recipes/dsniff/dsniff-2.3/openssl-includes.patch

diff --git a/recipes/dsniff/dsniff-2.3/openssl-includes.patch b/recipes/dsniff/dsniff-2.3/openssl-includes.patch
new file mode 100644
index 0000000..033fc5c
--- /dev/null
+++ b/recipes/dsniff/dsniff-2.3/openssl-includes.patch
@@ -0,0 +1,11 @@
+--- dsniff-2.3/sshcrypto.c.orig	2010-10-11 16:38:25.000000000 +1030
++++ dsniff-2.3/sshcrypto.c	2010-10-11 16:38:30.000000000 +1030
+@@ -14,6 +14,8 @@
+ 
+ #include <sys/types.h>
+ #include <openssl/ssl.h>
++#include <openssl/blowfish.h>
++#include <openssl/des.h>
+ 
+ #include <err.h>
+ #include <stdio.h>
diff --git a/recipes/dsniff/dsniff_2.3.bb b/recipes/dsniff/dsniff_2.3.bb
index 03ef527..51f2113 100644
--- a/recipes/dsniff/dsniff_2.3.bb
+++ b/recipes/dsniff/dsniff_2.3.bb
@@ -3,16 +3,17 @@ SECTION = "console/network"
 HOMEPAGE = "http://www.monkey.org/~dugsong/dsniff/"
 AUTHOR = "Dug Song <dugsong@monkey.org>"
 LICENSE = "BSD"
-PR = "r2"
+PR = "r3"
 
 # There is a significant API change beween 1.0.2a of libnet and
 # 1.1.x, dsniff will only work with the older and there is no
 # updated version of dnsniff.
-DEPENDS = "virtual/db libpcap libnet-1.0 libnids openssl"
+DEPENDS = "virtual/db libpcap libnet-1.0 libnids openssl glib-2.0"
 
 SRC_URI = "\
   http://www.monkey.org/~dugsong/dsniff/dsniff-${PV}.tar.gz \
   file://configure.patch \
+  file://openssl-includes.patch \
 "
 
 inherit autotools
@@ -27,7 +28,7 @@ EXTRA_OECONF = "\
 EXTRA_OEMAKE = "'install_prefix=${D}'"
 
 CFLAGS =+ "-I${S}/missing"
-LDFLAGS += "-lresolv"
+LDFLAGS += "-lresolv -lglib-2.0 -lgthread-2.0 -lrt -pthread"
 
 SRC_URI[md5sum] = "183e336a45e38013f3af840bddec44b4"
 SRC_URI[sha256sum] = "82e492455486e655c315f027d393dbeb49ad930804acccdc51b30d57e1294ff5"
-- 
1.7.1




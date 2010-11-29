Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PMtyl-0004rv-W3
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 04:00:42 +0100
Received: by pzk12 with SMTP id 12so568237pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Nov 2010 18:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=Qw6se3yP+GVDtynvyN2xTA5H8H3WysLhjxU9v0tW2cw=;
	b=EAZBBSmDDESEgYMbphuZTmlm0Y7ymMNhw8xM8Ph+ZD2FklmiAloGZ0sMbAJjUS/s5X
	uTTWwT6BS2kmbBK6IKECJt3kJh3O3EPVoBfPVj4m+QYXtge/ZMH2z7VkeW1LdSWwEQxY
	Dm/Z3D4EXD5nOwZgUZ2hb7WhmCh9oxlGd7my4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=jf89aiLt9Yhh9zu2G6CBgneNEWRpZ+Utd+EqQjlNs/FB0DE97AP1ZiAYQf0RkfA0gK
	JdmO5uVjp1c2ZufW0zPAkmhqoQSys8IRMlH0CdRl6OB4hAIl3me8HAtSc49AAgPkqPTy
	Gc30EZr+sjJZoLL43FnW0T+eJJHJpfM9XI+qc=
Received: by 10.142.136.3 with SMTP id j3mr4812674wfd.38.1290999555728;
	Sun, 28 Nov 2010 18:59:15 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id x35sm6839547wfd.1.2010.11.28.18.59.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 28 Nov 2010 18:59:14 -0800 (PST)
Message-ID: <4CF316FB.6010809@gmail.com>
Date: Mon, 29 Nov 2010 13:29:07 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
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
Subject: [PATCH] util-linux-ng_2.17.bb: Fix for uClibc when DISTRO_FEATURES lacks "largefile".
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
X-List-Received-Date: Mon, 29 Nov 2010 03:00:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


../shlibs/blkid/src/.libs/libblkid.so: undefined reference to `lseek64'

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 .../util-linux-ng-2.17/uclibc-nolargefile.patch    |   13 +++++++++++++
 recipes/util-linux-ng/util-linux-ng_2.17.bb        |    3 ++-
 2 files changed, 15 insertions(+), 1 deletions(-)
 create mode 100644 recipes/util-linux-ng/util-linux-ng-2.17/uclibc-nolargefile.patch

diff --git a/recipes/util-linux-ng/util-linux-ng-2.17/uclibc-nolargefile.patch b/recipes/util-linux-ng/util-linux-ng-2.17/uclibc-nolargefile.patch
new file mode 100644
index 0000000..2c0c1bd
--- /dev/null
+++ b/recipes/util-linux-ng/util-linux-ng-2.17/uclibc-nolargefile.patch
@@ -0,0 +1,13 @@
+Upstream: http://www.spinics.net/lists/util-linux-ng/msg03651.html
+
+--- util-linux-ng-2.17/shlibs/blkid/src/llseek.c.orig	2010-11-29 11:31:49.000000000 +1030
++++ util-linux-ng-2.17/shlibs/blkid/src/llseek.c	2010-11-29 11:52:07.000000000 +1030
+@@ -28,7 +28,7 @@
+ 
+ #include "blkidP.h"
+ 
+-#ifdef __linux__
++#if defined(__linux__) && !(defined(__UCLIBC__) && !defined(__USE_FILE_OFFSET64))
+ 
+ #if defined(HAVE_LSEEK64) && defined(HAVE_LSEEK64_PROTOTYPE) || defined(__UCLIBC__)
+ 
diff --git a/recipes/util-linux-ng/util-linux-ng_2.17.bb b/recipes/util-linux-ng/util-linux-ng_2.17.bb
index e906abb..8b4b1c9 100644
--- a/recipes/util-linux-ng/util-linux-ng_2.17.bb
+++ b/recipes/util-linux-ng/util-linux-ng_2.17.bb
@@ -1,10 +1,11 @@
 require util-linux-ng.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 SRC_URI += "file://uclibc-compile.patch \
 	    file://util-linux-ng-replace-siginterrupt.patch \
 	    file://fdiskbsdlabel.h-nios2.patch \
+	    file://uclibc-nolargefile.patch \
            "
 
 # fallocate is glibc 2.10, fallocate64 is glibc 2.11
-- 
1.7.1




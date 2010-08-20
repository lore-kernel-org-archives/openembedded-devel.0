Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OmSPl-0007fY-Vj
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 16:17:52 +0200
Received: by ewy7 with SMTP id 7so2138879ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 07:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=wjUGE84F0AWMVGMJlgljTd7TAHsodwqVFhOYtB7RXds=;
	b=ZpORzTWEZT0xeqwn14Qwi0EOFK/JeyAVEAajiQ7kt63azwC4OVLtFbrYkLF5JMaRJN
	SKgg6Z6OZklCmoJ8jVIl6kPzugEQU3AuQYfNQgdbXtdU+WwkM+gvz6C/T1k0z1LYejgd
	yBm3+esKUcqt6NyXqEggmarcjsWspEwA8oSaQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=prAop4zrGKtTAKdl/KSrcdLcQCD5QQmmsSpG1NRt7WESd081UBVpp0pzsX9LXxwJkw
	Yvg7sZyBsds9jVv+1Cy0eQ3ttkFNuzHyVqilw6xDdZnHIFHpVHrdR6YxErIr9mUVKg1x
	RcK8145KeP7ZhuGTEQPPS0WUyC7/3PRZI1zFE=
Received: by 10.213.97.129 with SMTP id l1mr365217ebn.56.1282313849929;
	Fri, 20 Aug 2010 07:17:29 -0700 (PDT)
Received: from localhost.localdomain (atwork-193.r-212.178.107.atwork.nl
	[212.178.107.193])
	by mx.google.com with ESMTPS id z55sm4836608eeh.3.2010.08.20.07.17.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 20 Aug 2010 07:17:29 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Aug 2010 16:19:37 +0200
Message-Id: <1282313977-31805-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] native.bbclass: add (re)definitions for TARGET_SYS and HOST_SYS
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
X-List-Received-Date: Fri, 20 Aug 2010 14:17:52 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

The issue at hand was discovered by setting 
TARGET_OS_local = "linux-gnuspe"
in my local.conf file as I needed to build for ppc e500
This caused configure of gmp-native to be called with
--build=x86_64-linux --host=x86_64-linux --target=x86_64-linux-gnuspe
which in turn caused configure to fail.
The odd thing is that for a native recipe I would expect
that build host and target gets the same args.

The configure line comes from autotools.bbclass 
which says:
CONFIGUREOPTS = " --build=${BUILD_SYS} \
                  --host=${HOST_SYS} \
                  --target=${TARGET_SYS} \

Apparently HOST_SYS and TARGET_SYS are not identical for native recipes
Peeking into native.bbclass learned that things like TARGET_PREFIX and
HOST_PREFIX are redefined, but TARGET_SYS and HOST_SYS are not.

This patch adds assignments to fix this.
I have tested this by building the image I am working on 
(which includes some low level stuff like kernel and u-boot, and 
also requires that lots of native recipes are build)
No problem was detected during that test.

If TARGET_OS = "linux" this will not make any difference for you.
If your TARGET_OS = "linux-gnuspe" like it is for me and your
build system has "linux" as OS, a side effect of this change
is that a rebuild is needed as the work dir will change
from (in my case) x68_64-linux to x86_64-linux-gnuspe
It might be that a full rebuild is needed in that case
(haven't tested that case)

Frans

 classes/native.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/classes/native.bbclass b/classes/native.bbclass
index 3437836..85c7cf1 100644
--- a/classes/native.bbclass
+++ b/classes/native.bbclass
@@ -23,6 +23,7 @@ TARGET_VENDOR = "${BUILD_VENDOR}"
 TARGET_PREFIX = "${BUILD_PREFIX}"
 TARGET_CC_ARCH = "${BUILD_CC_ARCH}"
 TARGET_EXEEXT = "${BUILD_EXEEXT}"
+TARGET_SYS = "${BUILD_SYS}"
 
 HOST_ARCH = "${BUILD_ARCH}"
 HOST_OS = "${BUILD_OS}"
@@ -30,6 +31,7 @@ HOST_VENDOR = "${BUILD_VENDOR}"
 HOST_PREFIX = "${BUILD_PREFIX}"
 HOST_CC_ARCH = "${BUILD_CC_ARCH}"
 HOST_EXEEXT = "${BUILD_EXEEXT}"
+HOST_SYS = "${BUILD_SYS}"
 
 CPPFLAGS = "${BUILD_CPPFLAGS}"
 CFLAGS = "${BUILD_CFLAGS}"
-- 
1.7.0.4




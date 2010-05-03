Received: from fg-out-1718.google.com ([72.14.220.154])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O90XN-0003x3-D9
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 May 2010 20:38:42 +0200
Received: by fg-out-1718.google.com with SMTP id e12so736550fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 May 2010 11:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=0M/VZ23NgITL2yZVQ22L4CF+1T5QJJMwbRJQMZA8EyY=;
	b=X7wxLImESCg2s9GDy1zON8gwCXO/K/eFqV8hYlVNy/CgykQm33lDZYjaxT3HRmftcL
	KCXdO7jXPVaAsH70Cm8f/hfeE1DFvHLwTVwEhBc9tiA4sUwHZp6KP43ld8WS5K97ANx8
	PgRg6p5A/sHUBbo3MgiMB6ku+6lRM8FYbdYrY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=aAVzg3D2JRRathwAo1cnOWedJrYxC75g8DnU/Q8GYBT19/+0g+k8zSlU8KXv5kPE6x
	NCdKFgpaw6l9CTlymPb6tP0IvnbhHF35oNBY1HJ0p/n8f6Kfe5V3x1QAmVCI3WMRhSXl
	+qYE8l6QS49Yoj24xkg+9U+96IPkmmhC1E67c=
Received: by 10.87.64.25 with SMTP id r25mr10859979fgk.20.1272911693575;
	Mon, 03 May 2010 11:34:53 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id p17sm9537148fka.46.2010.05.03.11.34.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 May 2010 11:34:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 May 2010 20:35:13 +0200
Message-Id: <1272911713-981-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 72.14.220.154
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] kexec-tools: update kexec-tools-2-klibc.patch for latest klibc/kernel
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
X-List-Received-Date: Mon, 03 May 2010 18:38:43 -0000

* not sure if it's changed in latest kernel I use (2.6.34-rc6) or newest
  klibc added today (1.5.18)
* just in case someone else hit this too (haven't tried if it works with
  older kernel/klibc)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../kexec-tools/files/kexec-tools-2-klibc.patch    |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/kexec-tools/files/kexec-tools-2-klibc.patch b/recipes/kexec-tools/files/kexec-tools-2-klibc.patch
index 2008829..4f8e678 100644
--- a/recipes/kexec-tools/files/kexec-tools-2-klibc.patch
+++ b/recipes/kexec-tools/files/kexec-tools-2-klibc.patch
@@ -16,12 +16,13 @@ Index: kexec-tools-2.0.1/kexec/ifdown.c
 ===================================================================
 --- kexec-tools-2.0.1.orig/kexec/ifdown.c	2009-09-24 14:15:34.025828340 +0100
 +++ kexec-tools-2.0.1/kexec/ifdown.c	2009-09-24 14:15:47.014827381 +0100
-@@ -14,7 +14,7 @@
+@@ -14,7 +14,8 @@
  #include <sys/ioctl.h>
  #include <sys/socket.h>
  #include <sys/time.h>
 -#include <sys/errno.h>
 +#include <errno.h>
++#include <linux/sockios.h>
 
  #include <net/if.h>
  #include <netinet/in.h>
-- 
1.7.0.4




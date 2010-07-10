Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OXcqe-00036I-Rk
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Jul 2010 18:24:17 +0200
Received: by bwz10 with SMTP id 10so2057738bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Jul 2010 09:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=kDO3GyXsJGeuWHFHzU3ePwGSTDVW9Br/kbUZ9DQ+EAE=;
	b=uNBd0R5KW3+0K+n7s7s6+FjIW/0tp6+DoDp2CYCgm08PfbRpzfqtkvayJpB3SjVt/B
	Fwj3ZMhDxEmub5VuKs0hgF2lT9yh5ViTqDlIzuvFJ8oXb3sFYXqeL0V6fOjS+i9P+xE3
	zGCfF9MeIwiqiQk9YGuHVkMWTnMFNqL/+NKjQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=um0YCjf9rqZKKICbylhcAb/FxGK/wIYXKWM4cUENb8i5rbEiySKAxUyEWkL8Vlz5Pb
	J0mDLT/u0L/tQu/IeG+jrZV2F7ia8MyM3EA7I8cpvwSHls3QuWgZfAe6QMjisZ/QGxYB
	jpdFQ1JbNCEmDrtaiZx62p87kgGnVzxxEjOfk=
Received: by 10.204.143.68 with SMTP id t4mr902320bku.115.1278778764478;
	Sat, 10 Jul 2010 09:19:24 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id v59sm18596118eeh.10.2010.07.10.09.19.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 10 Jul 2010 09:19:23 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Jul 2010 18:19:17 +0200
Message-Id: <1278778757-31330-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1278577398.15825.1.camel@lenovo.internal.reciva.com>
References: <1278577398.15825.1.camel@lenovo.internal.reciva.com>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] base.bbclass: introduce COMPATIBLE_TARGET_SYS
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
X-List-Received-Date: Sat, 10 Jul 2010 16:24:17 -0000

This patch introduces COMPATIBLE_TARGET_SYS
It is similar to COMPATIBLE_MACHINE but where COMPATIBLE_MACHINE
is used to specify that a certain recipe is for a certain machine
COMPATIBLE_TARGET_SYS can be used to specify that a certain recipe
is for a certain architecture.

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

---

as also discussed on the oe ML in the thread
[PATCH] classes/base.bbclass: add INCOMPATIBLE_MACHINE
---
 classes/base.bbclass |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index b30310d..f76d03c 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -391,6 +391,13 @@ python () {
             if this_machine and not re.match(need_machine, this_machine):
                 raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
 
+        need_target = bb.data.getVar('COMPATIBLE_TARGET_SYS', d, 1)
+        if need_target:
+            import re
+            this_target = bb.data.getVar('TARGET_SYS', d, 1)
+            if this_target and not re.match(need_target, this_target):
+                raise bb.parse.SkipPackage("incompatible with target system %s" % this_target)
+
     pn = bb.data.getVar('PN', d, 1)
 
     # OBSOLETE in bitbake 1.7.4
-- 
1.6.4.2




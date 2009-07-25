Received: from [209.85.146.180] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MUlfu-00046V-TX
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jul 2009 20:08:52 +0200
Received: by wa-out-1112.google.com with SMTP id m34so293102wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jul 2009 10:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=CcuuvZF0FernXFl77pWz9SwO5W3yuUQz/VKbNCCUMG8=;
	b=XDm9ZOLt2w+NqsiEwwU43+FMHIHXdk7TJyDQ2dSqBHxH5Pqf7ELYEOcyqcJBvJxxIK
	NSE5RMlsRMz8L/RHuSKR2bYgxmXJYT3ReHgHiCxqDEWdipEFKU5+hvXNKEeXk9rwKIpg
	36wwEx40Ufaoa3CP6vD+BaWTZv9yw+9fd6Ry4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=WvIGi050BhvizrCmEYcryn4fDKopg8RuXYXqrkRX8NlJQ5XoyafJ2KnGNiDjH3JpCr
	0L5H4Pf6Oc4X9Y8Chi+0694G4nKdpytHnZ0OT0aRRYBAsjzB3CTrzkaNKiuwG8w+hG6A
	Mn0Aimk7ZHXruyAAHsxwbRv/85518akVC9uWU=
Received: by 10.115.18.7 with SMTP id v7mr6632909wai.185.1248544461117;
	Sat, 25 Jul 2009 10:54:21 -0700 (PDT)
Received: from localhost (adsl-71-146-0-187.dsl.pltn13.sbcglobal.net
	[71.146.0.187])
	by mx.google.com with ESMTPS id m17sm9432876waf.3.2009.07.25.10.54.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 25 Jul 2009 10:54:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Jul 2009 10:53:52 -0700
Message-Id: <1248544432-5221-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] shell.py: Quash python warning: DeprecationWarning: the sets module is deprecated.
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
X-List-Received-Date: Sat, 25 Jul 2009 18:08:54 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 lib/bb/shell.py |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/lib/bb/shell.py b/lib/bb/shell.py
index 2ab855b..1e532c0 100644
--- a/lib/bb/shell.py
+++ b/lib/bb/shell.py
@@ -55,7 +55,6 @@ PROBLEMS:
 try:
     set
 except NameError:
-    from sets import Set as set
 import sys, os, readline, socket, httplib, urllib, commands, popen2, copy, shlex, Queue, fnmatch
 from bb import data, parse, build, fatal, cache, taskdata, runqueue, providers as Providers
 
-- 
1.6.3.3




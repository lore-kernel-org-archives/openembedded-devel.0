Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OWZb2-000515-4D
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 20:43:49 +0200
Received: by ewy7 with SMTP id 7so6087ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 11:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=HedixV59k9zsQKLqQltYAvXMQQWY2Y58mBKI9EvNxeo=;
	b=MQnpL98sdxUAyEm04N00S+8OUyyamM9MUTOVXpzdly91U1A3bT9rXEjtqgxV7byLTO
	ikhV4xWEB+iDhrOpCKogG4wvOga3AvYEaJoUrJIDKKbJkJ4FZ/5OUGHVrUp76MXDIG0o
	3DBF25NyqAoCnD84QwUrMKKWFtoZhmUInOKBM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=cvP8cgER8J4krJc6WImV0mrwTM11Xc4wm6Lq5j2f8BfJZAmJnoVnTuhl+76detqzl8
	9qBeuie5HIG6aWxePKZKtObnV6h8WNv2Xx7h+cY2zIxht4Qv7ci6fymehQ7iY3B4OaHF
	6R/G8hAfeq186asynGs8rcZ7fKEeIczZMBXaA=
Received: by 10.213.12.196 with SMTP id y4mr6200949eby.12.1278527938791;
	Wed, 07 Jul 2010 11:38:58 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id v8sm63471306eeh.14.2010.07.07.11.38.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 07 Jul 2010 11:38:58 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Jul 2010 20:38:46 +0200
Message-Id: <1278527926-5065-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] classes/base.bbclass: add INCOMPATIBLE_MACHINE
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
X-List-Received-Date: Wed, 07 Jul 2010 18:43:49 -0000

added INCOMPATIBLE_MACHINE
we have COMPATIBLE_MACHINE but that does not allow to say that
a package is supported by all except a certain machine.
a regexp like "(?!arch)"
This mechanism can be used to exclude certain machines.
Idea is that in binutils and gcc you can use this to specify that
a certain version does not support a certain machine

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 classes/base.bbclass |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 2da0b7a..3174469 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -380,6 +380,13 @@ python () {
             if this_machine and not re.match(need_machine, this_machine):
                 raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
 
+        need_machine = bb.data.getVar('INCOMPATIBLE_MACHINE', d, 1)
+        if need_machine:
+            import re
+            this_machine = bb.data.getVar('MACHINE', d, 1)
+            if this_machine and re.match(need_machine, this_machine):
+                raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
+
     pn = bb.data.getVar('PN', d, 1)
 
     # OBSOLETE in bitbake 1.7.4
-- 
1.6.4.2




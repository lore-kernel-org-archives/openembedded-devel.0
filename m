Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jader@2mi.com.br>) id 1LjYnb-0005Sy-3Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 13:54:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id B99A4503618F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 09:58:01 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3SFo+QSAas59
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 09:57:57 -0300 (BRT)
Received: from [192.168.15.103] (unknown [189.102.205.109])
	by mail.2mi.com.br (Postfix) with ESMTP id 099725026716
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 09:57:56 -0300 (BRT)
From: "Jader H. Silva" <jader@2mi.com.br>
To: OpenEmbedded Dev List <openembedded-devel@lists.openembedded.org>
Organization: 2MI Tecnologia
Date: Tue, 17 Mar 2009 09:52:38 -0300
Message-Id: <1237294358.6587.68.camel@northpole>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 208.51.207.131
X-SA-Exim-Mail-From: jader@2mi.com.br
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: TARGET_ARCH should be a weak assignment no x86.conf
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
X-List-Received-Date: Tue, 17 Mar 2009 12:54:34 -0000
X-Groupsio-MsgNum: 8477
Content-Type: multipart/mixed; boundary="=-qmAmNLszKuWs0Dw4CMH2"

--=-qmAmNLszKuWs0Dw4CMH2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

In conf/machine/x86.conf TARGET_ARCH is assigned as i486:

# i386 doesn't work with NTPL, see
http://ecos.sourceware.org/ml/libc-ports/2006-03/msg00030.html
TARGET_ARCH = "i486"

But according to url page text, it should be i486 or greater, and I
would like to compile my target for i586.

Ideally, it should check for TARGET_ARCH=i386 or TARGET_ARCH= and set
itself to "i486", otherwise leave TARGET_ARCH unmodified, but I don't
know if this is possible.

I'm using a weak assignment to fix it. Patch is attached.

Att.


Jader H. Silva
jader@2mi.com.br
Depto. de desenvolvimento
2MI Tecnologia






--=-qmAmNLszKuWs0Dw4CMH2
Content-Disposition: attachment; filename="0001-Make-TARGET_ARCH-a-weak-reference-in-x86.conf.patch"
Content-Type: text/x-patch; name="0001-Make-TARGET_ARCH-a-weak-reference-in-x86.conf.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From f755e1fd25fba568f5006c4534044d2bd86e8a20 Mon Sep 17 00:00:00 2001
From: root <root@developer.citrix.2mi.com.br>
Date: Tue, 17 Mar 2009 09:46:03 -0300
Subject: [PATCH] Make TARGET_ARCH a weak reference in x86.conf

---
 conf/machine/x86.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/x86.conf b/conf/machine/x86.conf
index 30eb943..31e23e1 100644
--- a/conf/machine/x86.conf
+++ b/conf/machine/x86.conf
@@ -5,7 +5,7 @@
 #@DESCRIPTION: Machine configuration for a Linux running on x86 compatible machines
 
 # i386 doesn't work with NTPL, see http://ecos.sourceware.org/ml/libc-ports/2006-03/msg00030.html
-TARGET_ARCH = "i486"
+TARGET_ARCH ?= "i486"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux"
 PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
-- 
1.5.4.3


--=-qmAmNLszKuWs0Dw4CMH2--

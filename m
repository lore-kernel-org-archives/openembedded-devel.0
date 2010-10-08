Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4Jht-0006vP-BM
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 22:38:23 +0200
Received: by ewy7 with SMTP id 7so852435ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Oct 2010 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=l1dOoEYnH0xQluVPiWo4pvGd5UkScuYH0vrBNSaYc8Y=;
	b=jC/tbd/oYKr9XG8STNUimgB/oezFZd/V7r3asfo4ZWvxsSuIlCCk4fcxkIFbNJ/o+x
	C+/etUsw1FrFLnF27w4vth0QkVJEhBGUPtfRB4kMS7HWrf46a0sch2SCAoBR7OEirG2D
	PJyPnrRPgdja3SAsYNkiS29R404x8QkPQX1g4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=sIcHDI9l1SkGzq73WLnfsIHbHl7ptaooNUYPf1bR3CBrWNRGVjIeW6hk8E7dIpedIY
	JIUhiCsO/0xrl5VH06mGaexpP+U3ldn2xKEWEUL0LIHY88bAFe0orgH4DQB+1O4hrayV
	JXT968P2Zl8BDaz9iDh7FvCsWHRAb/N3NWsEI=
Received: by 10.213.21.140 with SMTP id j12mr1913593ebb.98.1286570261123;
	Fri, 08 Oct 2010 13:37:41 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id v8sm6045307eeh.20.2010.10.08.13.37.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 Oct 2010 13:37:40 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Oct 2010 22:37:35 +0200
Message-Id: <1286570255-7554-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] module.bbclass: RDEPENDS -> RDEPENDS_${PN}
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
X-List-Received-Date: Fri, 08 Oct 2010 20:38:24 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

one more place in classes where there is an RDEPENDS i.s.o. RDEPENDS_${PN}
 classes/module.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/module.bbclass b/classes/module.bbclass
index 83463ac..0e0018e 100644
--- a/classes/module.bbclass
+++ b/classes/module.bbclass
@@ -1,4 +1,4 @@
-RDEPENDS += "kernel (${KERNEL_VERSION}) update-modules"
+RDEPENDS_${PN} += "kernel (${KERNEL_VERSION}) update-modules"
 DEPENDS += "virtual/kernel"
 
 inherit module-base
-- 
1.6.4.2




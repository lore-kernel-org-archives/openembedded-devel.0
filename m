Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OJujN-00030l-JO
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 22:40:07 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so2440067pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 13:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=pJIgUw3JBEZgy6TcXmSHPm9uOuks6j/gePMHt8fSwjo=;
	b=T3ZPx2x9e78tq4Yr9+OlTJlZtv8OceL3RceMj8F3WiXAyS6o0bL2R3tkCrvvPuspJi
	JeKbKAMTR2Duz9JUSohxvRS3akCP/yufMJDUZAAdts4+8L47bw2FX53RI6v34uCqzNp1
	ILED7VaJSjK9qchLhN1N1So7RafNeAGbakTYE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=MZeU+MhmBch2UBg/CFoEZYR5aftX94r58QOQ9Rs6gcelAJdHikLg6FwQGT1VmyHtrC
	zqFi6P+5NyrA4xTgyFwePy4EmNh0bKhA0DBm7AwQheLZxOsKcBzdYOxuH7uYuYdOiSN5
	nKghRAKO8MkbuRw0pfcGpvDvEfaxs1IEx3wiM=
Received: by 10.143.85.10 with SMTP id n10mr5564756wfl.106.1275510952369;
	Wed, 02 Jun 2010 13:35:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 20sm5942447pzk.7.2010.06.02.13.35.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Jun 2010 13:35:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jun 2010 13:34:56 -0700
Message-Id: <1275510896-30845-17-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 16/16] shadow_4.1.4.2.bb: add --with-nscd=no when compiling for uclibc
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
X-List-Received-Date: Wed, 02 Jun 2010 20:40:07 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/shadow/shadow_4.1.4.2.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/shadow/shadow_4.1.4.2.bb b/recipes/shadow/shadow_4.1.4.2.bb
index 05b3279..ebf54a7 100644
--- a/recipes/shadow/shadow_4.1.4.2.bb
+++ b/recipes/shadow/shadow_4.1.4.2.bb
@@ -1,8 +1,11 @@
 require shadow.inc
 
-SRC_URI += " file://shadow.automake-1.11.patch"
+SRC_URI += "file://shadow.automake-1.11.patch \
+	   "
 
 PR = "${INC_PR}.1"
 
+EXTRA_OECONF_libc-uclibc += " --with-nscd=no "
+
 SRC_URI[md5sum] = "d593a9cab93c48ee0a6ba056db8c1997"
 SRC_URI[sha256sum] = "97987f6a7967a85e6aa0dba2a1d52db8bd69af5a717391de5693db768fb78990"
-- 
1.7.0.4




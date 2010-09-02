Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OrEtu-0003Xe-QI
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 20:52:43 +0200
Received: by eyb7 with SMTP id 7so552223eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 11:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=zQTmmqDio2p1Fmi4a8fXZUqh1pSF48Frx6jOqKR/F+M=;
	b=HHoZiFe69GihSPUfFkb+MAmyZ5AOoHhanO4GMxbDGQ+QyJtyzRN405T7RqW28sFo++
	JChKkm2QyUSc0gwLDI8RJ3JovuTh1K0Lhc8WxNicAcxWHeEtCicLu8jC2w0p5sR2qokm
	7RsrI0m+TwHrjvYlRTWEAYi4KrqoZnS/3hbm8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=m3NYonTHqfoyuLYq2C32D0w2Q9pUJKzd00ufWclNxwJtoIbTHedUgi4knhP6n3I4Xi
	Exde9k0u9MLPN1f59SOf/3yR+VHxJ+aZhs7/BZ9wuzQdOqaNc8e3XY7H5Y9P4yC6rdSr
	yrTwBcgRVCWITBeoZWbOsAdHn6wFMQtPCavZI=
Received: by 10.213.22.19 with SMTP id l19mr14251ebb.75.1283453529430;
	Thu, 02 Sep 2010 11:52:09 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id z55sm1202485eeh.3.2010.09.02.11.52.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 02 Sep 2010 11:52:08 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Sep 2010 20:52:02 +0200
Message-Id: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] base.bbclass: fix soc-family test
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
X-List-Received-Date: Thu, 02 Sep 2010 18:52:43 -0000

see http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-September/023680.html

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 classes/base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 299e875..2c9ad89 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -337,7 +337,7 @@ python () {
             this_machine = bb.data.getVar('MACHINE', d, 1)
             if this_machine and not re.match(need_machine, this_machine):
                 this_soc_family = bb.data.getVar('SOC_FAMILY', d, 1)
-                if this_soc_family and not re.match(need_machine, this_soc_family):
+                if (this_soc_family and not re.match(need_machine, this_soc_family)) or not this_soc_family:
                     raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
 
         need_target = bb.data.getVar('COMPATIBLE_TARGET_SYS', d, 1)
-- 
1.6.4.2




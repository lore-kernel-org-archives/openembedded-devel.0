Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P5qcY-0006W1-8c
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 03:59:12 +0200
Received: by gwb17 with SMTP id 17so1471512gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 18:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=TUd3AwoyuzF8qXOkb1QzGzUqwVZw44NqZCMPJ/eFgKo=;
	b=ljiLwJ00w2/WyfxAfYl4YULBAS1eZHTBnhsvHL0Cq6w5+98qMB8fvgxofSPU/+MvM2
	BTA5M2WUuvhtIIwkZHhWupUB/8JpAo6DAsunMFs9XMu/n80BgJbbUBYK6ArS/sdLr3G3
	IIRuw6ABhpnc9Y6tkrSOABMPpZtW5G7wH1Hmk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=cLMC3AuIsaza+gqlXycPEfmuoTV0ezfLee8xs95Q20L1aMQFPhGJqceGi9LNsAx075
	l3GyF21q/Q/LNN5AsGTRT4hmBunZSbMiTwvHS7JonRQInQJk1Ro2MqanfHxwu3oxEZ03
	eJbzxWwP0J3FhxiKEZtZrU+k/pF1omqekdPgM=
Received: by 10.236.110.40 with SMTP id t28mr16581403yhg.86.1286935122023;
	Tue, 12 Oct 2010 18:58:42 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id j7sm2322789yha.18.2010.10.12.18.58.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 12 Oct 2010 18:58:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Oct 2010 18:58:34 -0700
Message-Id: <1286935114-4673-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] distutils-common-base.bbclass: Prepend STAGING_LIBDIR to linker library search path.
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
X-List-Received-Date: Wed, 13 Oct 2010 01:59:12 -0000

* This was done generically in bitbake.conf this should be done on
  demand and distutils based recipes seem to need it. So we define it
  here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/distutils-common-base.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/classes/distutils-common-base.bbclass b/classes/distutils-common-base.bbclass
index f66a5cd..b6caf24 100644
--- a/classes/distutils-common-base.bbclass
+++ b/classes/distutils-common-base.bbclass
@@ -4,6 +4,8 @@ EXTRA_OEMAKE = ""
 
 export STAGING_INCDIR
 export STAGING_LIBDIR
+# libtool 2.4 does not export with LDFLAGS but distutils need it
+LDFLAGS_prepend = "-L${STAGING_LIBDIR} "
 
 PACKAGES = "${PN}-dev ${PN}-dbg ${PN}-doc ${PN}"
 
-- 
1.7.1




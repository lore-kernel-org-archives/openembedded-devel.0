Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OyDPP-00073a-Ct
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 02:42:05 +0200
Received: by pvg6 with SMTP id 6so3526pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 17:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=zJpAliBYmzhRxL/N5zF9VeGK9Y+cg4eU3yPez/45Dg4=;
	b=kA7AB/uvgqXnIOy4HaBEN/LHLZ+XPIvxzkpmPjGFnFHs7pmRehP4MhaYRAvGAnx3wB
	OibLlV0mr5fIFI42AwyHormqwTUomAsEn+O3ZSMQEYku9eKDWKs5UrQ/plC9uBqW3SyM
	PmM5lyQPPADFgGPU04vhvcpPZn3CRDGrKXW0g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=tmoJLHI+gsUypd5pmi65KmWPXmqTyoGkgZz6w4L57rt/ZRbp5DCoYa1jWgJP25OZ5f
	QgJxmuiq17JLSZbS+zpKfsLVXiprDCsZ0M+WY97mVhig+bh7oEAQ16A5aa56JYdfLviI
	3gYjSlPX9QxUyxnZP/d0PuUnro1tfOCUy2gP4=
Received: by 10.114.79.1 with SMTP id c1mr12944855wab.1.1285116117718;
	Tue, 21 Sep 2010 17:41:57 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id d2sm16492190wam.2.2010.09.21.17.41.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Sep 2010 17:41:57 -0700 (PDT)
Message-ID: <4C9950D0.7000907@gmail.com>
Date: Wed, 22 Sep 2010 10:11:52 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] at91bootstrap.inc: Mark COMPATIBLE_MACHINEs.
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
X-List-Received-Date: Wed, 22 Sep 2010 00:42:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From b90a9fef712cc934863ee786b2d2dedc37d6902d Mon Sep 17 00:00:00 2001
From: Graham Gower <graham.gower@gmail.com>
Date: Wed, 22 Sep 2010 09:39:00 +0930
Subject: [PATCH 1/5] at91bootstrap.inc: Mark COMPATIBLE_MACHINEs.


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/at91bootstrap/at91bootstrap.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/at91bootstrap/at91bootstrap.inc b/recipes/at91bootstrap/at91bootstrap.inc
index 2160f64..dfe143a 100644
--- a/recipes/at91bootstrap/at91bootstrap.inc
+++ b/recipes/at91bootstrap/at91bootstrap.inc
@@ -1,6 +1,7 @@
 DESCRIPTION = "at91bootstrap: loaded into internal SRAM by AT91 BootROM"
 SECTION = "bootloaders"
 
+COMPATIBLE_MACHINE = "(afeb9260|at91cap9adk|at91sam9g20ek|at91sam9rlek|at91sam9263ek|at91sam9260ek|at91sam9xeek|at91sam9261ek)"
 SRC_URI = "ftp://www.at91.com/pub/buildroot/${PN}-${PV}.tar.bz2 \
 	   file://defconfig \
            "
-- 
1.7.1




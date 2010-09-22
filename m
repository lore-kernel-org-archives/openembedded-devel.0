Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OyDQM-00074j-77
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 02:43:03 +0200
Received: by pxi11 with SMTP id 11so3611pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 17:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=LSR4ZfUFolVLlQYulGJMZ5ouhMmEoLySpJYiDc4ZR6I=;
	b=fBbIQ64KmgDXZsgPa2PcnjuzVVjGe5o8aoIxNy9UtfqLkjfi7+CGuQSV292GUE+JtO
	O9HRQwqYLPa6hv3GwfwocVC6OB0STi+TIsnPJITCfliDgq9KyloM1xn/OKAjC6id0PtE
	HbPB4mNA8B6tSKRE7EHdRPN25+BImnPGoKTLs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=AjGlocDTHMb8TW2JwY3mgqUEeJWljVhxyo/V7h70PFZAHgU7sy5x8EL4cDwUPhC7ZA
	Q9+g1IMNflSCQ1RNWhFg4/AdsOW9VEsX7bHpXlhRDs407u9UV4gFU2kQ23yOtTraXkcX
	CFDmW7yFiaa9/GNE4w0T1OisIVSrTCFgbJrlQ=
Received: by 10.114.78.1 with SMTP id a1mr12541421wab.216.1285116172714;
	Tue, 21 Sep 2010 17:42:52 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	q6sm16498181waj.22.2010.09.21.17.42.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Sep 2010 17:42:51 -0700 (PDT)
Message-ID: <4C995108.5070108@gmail.com>
Date: Wed, 22 Sep 2010 10:12:48 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] pivotinit_1.0.0.bb: Mark as COMPATIBLE_MACHINE=spitz.
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
X-List-Received-Date: Wed, 22 Sep 2010 00:43:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From 909e5617f2534b505c6940b9e409a1ce3cdae1e9 Mon Sep 17 00:00:00 2001
From: Graham Gower <graham.gower@gmail.com>
Date: Wed, 22 Sep 2010 09:47:53 +0930
Subject: [PATCH 3/5] pivotinit_1.0.0.bb: Mark as COMPATIBLE_MACHINE=spitz.


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/pivotinit/pivotinit_1.0.0.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/pivotinit/pivotinit_1.0.0.bb b/recipes/pivotinit/pivotinit_1.0.0.bb
index 912cfeb..8b40db2 100644
--- a/recipes/pivotinit/pivotinit_1.0.0.bb
+++ b/recipes/pivotinit/pivotinit_1.0.0.bb
@@ -4,6 +4,7 @@ PRIORITY = "required"
 LICENSE = "MIT"
 PR = "r0"
 
+COMPATIBLE_MACHINE = "(spitz)"
 SRC_URI = "file://init"
 
 do_install () {
-- 
1.7.1




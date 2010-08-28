Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRxo-0001qj-Nt
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:21 +0200
Received: by mail-pv0-f175.google.com with SMTP id 6so1648285pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=2TZ2BG8yRvQX145LFRLm4Yp7djh6zH8PQOj7WDEE7YA=;
	b=IptHdY6DsFJk/3hZKYV03h2lPxi+G8ncJEnCn2154JOpt2nMKQBgFO8HP/SYb7GtfJ
	Y/e/Sfvsk54hlogyeRwG7n2OTnydu1QRPHU390sp1qYzw6On8hFaxy95GNMCK3GbcO/R
	57Gk+0TS7j8Ex1TZbwZwitc++O1guK0hHYNeQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=UDmW9B8TZH4KricWeHyGC/UREYKOPP9/Fo3zqgwGfqzOuzIwZ74TcTz84NApedsde4
	iP8I7040w6QPr3Ll69OpB6Kx2Np2zgVvwQI0Hr6u78cTX0bUgUitZHFExvq3ZgOp1r4y
	FlhpmsejGR2CEXjy9NB+UiQbsDfQ4ijFajojc=
Received: by 10.142.144.16 with SMTP id r16mr2652114wfd.312.1283027091468;
	Sat, 28 Aug 2010 13:24:51 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.24.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:24:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:17 -0700
Message-Id: <1283027073-12308-8-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 07/23] task-arago-toolchain-target.bb: remove libpng12-dev which is not provided and e2fsprogs-libs-dev is now e2fsprogs-dev
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
X-List-Received-Date: Sat, 28 Aug 2010 20:25:21 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/tasks/task-arago-toolchain-target.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes/tasks/task-arago-toolchain-target.bb b/recipes/tasks/task-arago-toolchain-target.bb
index aa592b6..496910e 100644
--- a/recipes/tasks/task-arago-toolchain-target.bb
+++ b/recipes/tasks/task-arago-toolchain-target.bb
@@ -14,14 +14,13 @@ RDEPENDS_${PN} = "\
     alsa-lib-dev \
     alsa-utils-dev \
     curl-dev \
-    e2fsprogs-libs-dev \
+    e2fsprogs-dev \
     i2c-tools-dev \
     freetype-dev \
     jpeg-dev \
     lzo-dev \
     libopkg-dev \
     libpng-dev \
-    libpng12-dev \
     readline-dev \
     libts-dev \
     libusb-compat-dev \
-- 
1.7.1




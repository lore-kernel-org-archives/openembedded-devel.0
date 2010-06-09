Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OMOsW-0001Me-FB
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 19:15:48 +0200
Received: by bwz14 with SMTP id 14so1788324bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 10:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=BUXC+fQd756+KUNw65TdyjleSlLyPUFl5ksGoY0ohPU=;
	b=LDgrxfE7qBnTeSoQ+zY2grMBqOOlf6wkHawEt3nM9ZpcKxVG5tLqvhv+56hpCSHsxu
	MRr+DHwcuCVx6tq/7T+0aGBnd/wZ1utSzmhkBVVwzh9x49Q2zXW8/UrmiIIyKQZDZTjT
	ESiudDIEoi216PO+fVhv8YlTni59XNimle2FQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RKNkJgqsnkv/3JRGAUDGAewD35KEzSJSYVOA44kFV04lA9mL/PCPe2DfFLsBRdtiNa
	RNaMy7gnFMicxJlrctCusT5QUlyEWTNcsEX8rrqfSOHuRR5S3wPBzxZ1NNOnHBEbArph
	TVPtksO3WgJkeS6Xmv2I+1TY1dCS2edL4VTB0=
Received: by 10.204.81.228 with SMTP id y36mr2287997bkk.151.1276103488461;
	Wed, 09 Jun 2010 10:11:28 -0700 (PDT)
Received: from s42.loc (85-127-249-17.dynamic.xdsl-line.inode.at
	[85.127.249.17])
	by mx.google.com with ESMTPS id z20sm30392480bkx.3.2010.06.09.10.11.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Jun 2010 10:11:28 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OMOoS-0000kZ-Pt; Wed, 09 Jun 2010 19:11:36 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: raj.khem@gmail.com
Date: Wed,  9 Jun 2010 19:10:37 +0200
Message-Id: <1276103437-2755-4-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
References: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/3] busybox: picking IPv6 per default is not up to the package
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
X-List-Received-Date: Wed, 09 Jun 2010 17:15:48 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/busybox/busybox-1.15.3/micro/defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/busybox/busybox-1.15.3/micro/defconfig b/recipes/busybox/busybox-1.15.3/micro/defconfig
index 8431d19..f6eaa6d 100644
--- a/recipes/busybox/busybox-1.15.3/micro/defconfig
+++ b/recipes/busybox/busybox-1.15.3/micro/defconfig
@@ -608,7 +608,7 @@ CONFIG_TIME=y
 #
 # Networking Utilities
 #
-CONFIG_FEATURE_IPV6=y
+# CONFIG_FEATURE_IPV6 is not set
 CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
 # CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
 # CONFIG_ARP is not set
-- 
1.7.1




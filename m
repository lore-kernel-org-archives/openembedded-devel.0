Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OWD5R-0005Y2-G9
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 20:41:41 +0200
Received: by mail-bw0-f47.google.com with SMTP id 10so3406337bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jul 2010 11:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=BUXC+fQd756+KUNw65TdyjleSlLyPUFl5ksGoY0ohPU=;
	b=KiKHn1a9xfCwc7ICE3hv3tY4MLLgQMXXEIy3EJN3xZR5LriQzsrhbpqeOxiKpEotEQ
	NJLpNeEjGELsYmXjO1bRhDoKvsPLi/KgZcaXy/K8Q44tpOJ3xACEx+bqZmpj0w/Yh63J
	ETRL/35XJQi2x1ppNfIhtIOdwW659hIgOGb5s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GefVGd6OGh0bYlrPsVeut7MG7Gc7ZrZRJARC1oL53q9mjWaOZe4PwjrQHxO5VRSKJe
	lWFBuyeZtuGX2EtLT2y2C7NXzU+ImBB8VmuGzPi7Iclzoe94Wmd0N+rCBQ3hOSDufEF9
	0iHVnWhvEZwtn5HQc/00BPKGxiYWJxio1z150=
Received: by 10.204.47.99 with SMTP id m35mr4103927bkf.106.1278441412477;
	Tue, 06 Jul 2010 11:36:52 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id x19sm24189862bkv.21.2010.07.06.11.36.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 06 Jul 2010 11:36:51 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OWD0d-0000u2-DR; Tue, 06 Jul 2010 20:36:43 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Phil Blundell <philb@gnu.org>
Date: Tue,  6 Jul 2010 20:36:35 +0200
Message-Id: <1278441397-3361-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1278441397-3361-1-git-send-email-rep.dot.nop@gmail.com>
References: <1278441397-3361-1-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH][v2 2/4] busybox: picking IPv6 per default is not up to the package
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
X-List-Received-Date: Tue, 06 Jul 2010 18:41:41 -0000

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




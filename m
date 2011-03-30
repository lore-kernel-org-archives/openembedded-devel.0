Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <v2g.udel@gmail.com>) id 1Q4wCa-0002OO-3f
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 16:16:52 +0200
Received: by vws2 with SMTP id 2so1151629vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2011 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=SdzcxNggP1dFjc+2AualCmNy+D3vNFqIMMdxg01Ujxo=;
	b=eer5dvc8D3QiICeJSFAAnXUzr1rp4VTPrRUmbujkpZSDuG8lNB3gCb6DWlGIuAGDvl
	5VnOmCpx0+kMTsnPNTOX7qmLyKVFZI1Ae9njtCJi6RCjG0d3dOJ28Rr3VjgGyDNNdgx7
	O48tkdpRWScGKhT3syA88tNWrYXBbYyoWXMdI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ZZoWQqAS8ct6h22Q1PS7/1UxxSJm19GBOv8+7/70aGD/yOWdRmj9H2bd95QnfU+xik
	QZTg0bgfAdCyQX8wOPtfjE9fIybies67o1VkDZATzheK+3pVgdzUVLnICi4YUbNqr68X
	LM5d5aGBxCKjg0vy9K7ByHlJ4H2OUH6qtePWY=
Received: by 10.52.99.65 with SMTP id eo1mr1545852vdb.215.1301494076534;
	Wed, 30 Mar 2011 07:07:56 -0700 (PDT)
Received: from localhost.localdomain (fundoo.ceoe.udel.edu [128.175.74.10])
	by mx.google.com with ESMTPS id h34sm26893vcr.18.2011.03.30.07.07.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2011 07:07:56 -0700 (PDT)
From: UDel V2G Team <v2g.udel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Mar 2011 10:07:06 -0400
Message-Id: <1301494030-10554-2-git-send-email-v2g.udel@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1301494030-10554-1-git-send-email-v2g.udel@gmail.com>
References: <1301494030-10554-1-git-send-email-v2g.udel@gmail.com>
Subject: [PATCH 2/6] Allows the use of the angstrom distribution with ARM cores that do not support THUMB_INTERWORK instructions
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
X-List-Received-Date: Wed, 30 Mar 2011 14:16:52 -0000

* Setting THUMB_INTERWORK = "yes" precludes the building of
  any angstrom distribution for cores that do not support
  thumb and thumb_interwork since the distro definitions
  take precedence over any local settings.

Signed-off-by: UDel V2G Team <v2g.udel@gmail.com>
---
 conf/distro/include/angstrom.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom.inc b/conf/distro/include/angstrom.inc
index 5a02723..9ec1dc7 100644
--- a/conf/distro/include/angstrom.inc
+++ b/conf/distro/include/angstrom.inc
@@ -54,7 +54,7 @@ ARM_INSTRUCTION_SET = "${ANGSTROM_ARM_INSTRUCTION_SET}"
 #    but requires more instructions (140% for 70% smaller code) so may be
 #    slower.
 
-THUMB_INTERWORK = "yes"
+THUMB_INTERWORK ?= "yes"
 # "yes" "no"
 #    Whether to compile with code to allow interworking between the two
 #    instruction sets.  This allows thumb code to be executed on a primarily
-- 
1.7.3.4




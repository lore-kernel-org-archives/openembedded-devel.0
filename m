Received: from fg-out-1718.google.com ([72.14.220.155])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OS7xh-00069G-LD
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 14:26:04 +0200
Received: by fg-out-1718.google.com with SMTP id d23so235649fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 05:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Hz1sGrzhc0tM1YVS+Gkc6NPLTlYpZcRBLpxqgdaXz7g=;
	b=nPkxiNXBR2CND5oeSnmIWFhe7ZlvbNFrIDPBHJVv+HKsItFqdKGWrsjHsyIRkWGUxa
	7Oz0b+612u0zN642Y0JIpYvHh0qwOAspqOPMPwiLvX2if/zpYONSTqI8gkAXZ+2SCmBB
	7Cglnsh3tEkRtBheg7FFv9qZOo00w3ilbgyj4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=DNOtVngLc7h7oP8dQDt1AciIScz8y88rsLnrpTy3veGUtPKRfKZbjynzmeB+N4cy7w
	/Pe8QgWx6Dr8kUPbwR8PTnfhzT18Fw0RJ4V7gfYHbXheWwyzaiwvhl5tmFUpzGWFF2wh
	zfkzEMavyOrVm/hoNtBArwT4pwvPnqh8nWdeM=
Received: by 10.87.1.7 with SMTP id d7mr1003615fgi.75.1277468413267;
	Fri, 25 Jun 2010 05:20:13 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z12sm37834934fah.33.2010.06.25.05.20.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 25 Jun 2010 05:20:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jun 2010 14:19:42 +0200
Message-Id: <1277468383-16679-9-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
References: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 8/9] htcdream: don't set PREFERRED_PROVIDER_virtual/libgl to mesa-dri
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
X-List-Received-Date: Fri, 25 Jun 2010 12:28:46 -0000

* there was --disable-egl in mesa-dri recipes (there are mesa recipes for this)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/machine/htcdream.conf |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/conf/machine/htcdream.conf b/conf/machine/htcdream.conf
index 89604d5..a10edb8 100644
--- a/conf/machine/htcdream.conf
+++ b/conf/machine/htcdream.conf
@@ -19,5 +19,3 @@ MACHINE_EXTRA_RRECOMMENDS = "\
 "
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-leviathan"
-
-PREFERRED_PROVIDER_virtual/libgl_shr = "mesa-dri"
-- 
1.7.0.2




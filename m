Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OTlck-0002iN-UH
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 02:58:01 +0200
Received: by gwj18 with SMTP id 18so148508gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 17:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ir9pujQCo3y/nOSq64T8nprsibnIXLXr0iR2yRi0ek4=;
	b=vwgqCgTBDAQgXa1awQ5VC9v3JpJ2O1lKfghUkhQVaOJYv9fp6xjaWBmVD1OKMs99wd
	U9mUQOJVeo5hzgeqxykg6m/dPOTbeWyIoTIFAIOlQHL/8I9L5INJvu1QaqkwbO1Jzl09
	Fkjwdxf96WE7Zn2YIkN3XH680PSWKh0/cCrOg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=tiqm+j3OgEBoLF+N3kiwBOOVkt7ReLIxfjGUt2pejKXxfbf96vln1b8Tgws8Pr7V2f
	Req45BX5saZdaw193gerFyACOulPSrMUyBW2z5aY4j7iTQaikREgbYJYeSnpmXl2WQGf
	FjMzosjmYA2O+xP1u29KNSsJv4X9NwRH6CA8Q=
Received: by 10.101.135.35 with SMTP id m35mr9557342ann.51.1277859195115;
	Tue, 29 Jun 2010 17:53:15 -0700 (PDT)
Received: from localhost.localdomain ([201.53.204.31])
	by mx.google.com with ESMTPS id k11sm55661196ani.10.2010.06.29.17.53.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 17:53:14 -0700 (PDT)
From: "Joao H. Freitas" <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jun 2010 21:52:38 -0300
Message-Id: <1277859158-28315-2-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277859158-28315-1-git-send-email-joaohf@gmail.com>
References: <1277859158-28315-1-git-send-email-joaohf@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] add unifdef to kernel 2.6.22
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
X-List-Received-Date: Wed, 30 Jun 2010 00:58:01 -0000

---
 .../linux-libc-headers_2.6.22.bb                   |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb
index 12845e0..d1b6206 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb
@@ -5,7 +5,8 @@ DEPENDS += "unifdef-native"
 PR = "r4"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
-           file://procinfo.h"
+           file://procinfo.h \
+           file://unifdef.patch"
 
 S = "${WORKDIR}/linux-${PV}"
 
-- 
1.7.0.2




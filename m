Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NXZhk-0002Vy-Lz
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 13:30:39 +0100
Received: by mail-fx0-f212.google.com with SMTP id 4so2829659fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 04:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=9Hxn8EONw3FWklIAj2qql8PhNuC3ntymYE0K7K2NXIE=;
	b=Vm4nuiS/qo1TQTrNVGsFqjk6mmu+Sw6F1YrHyW044kSA+qiOMEkwLs1YJSGG6aAqXg
	lJuf2YibXFkeYoSj2DktO6wFX/SPNcscZ5TNHuv6dmxng6c6MlXxghaWHu4F8Mrd1xNl
	Ap3jrFhLimF2n1udgqWXaJRu8uurBXhRImzkA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=gEj2wTPQVfl+V2xaZHiNlG7DCeTy0uINvevQZwlhDOgnKfZWENku68HLBWT1DiHUN+
	GFRRrW51PcLJgI5AeLICCvQj3Bvf+OXiRb8Vq/i6nzw8maK3nVC7ZdtWmto6WoqC58ad
	bm36vZRFg14CDJiRIV0+p4kyGvVBNg49vLUHI=
Received: by 10.87.44.27 with SMTP id w27mr13820fgj.71.1263990503055;
	Wed, 20 Jan 2010 04:28:23 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm3639833fxm.9.2010.01.20.04.28.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 Jan 2010 04:28:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jan 2010 13:27:55 +0100
Message-Id: <1263990478-28107-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.6
In-Reply-To: <1263990478-28107-3-git-send-email-Martin.Jansa@gmail.com>
References: <1263990478-28107-1-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-2-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-3-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 3/6] pixman_0.16.2: drop DEFAULT_PREFERENCE = -1 and add BBCLASSEXTEND=native (pixman-native used in cairo-native)
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
X-List-Received-Date: Wed, 20 Jan 2010 12:30:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/xorg-lib/pixman_0.16.2.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/xorg-lib/pixman_0.16.2.bb b/recipes/xorg-lib/pixman_0.16.2.bb
index 2517f8f..1a15ac4 100644
--- a/recipes/xorg-lib/pixman_0.16.2.bb
+++ b/recipes/xorg-lib/pixman_0.16.2.bb
@@ -3,7 +3,9 @@ PRIORITY = "optional"
 DESCRIPTION = "Low-level pixel manipulation library."
 LICENSE = "X11"
 
-DEFAULT_PREFERENCE = "-1"
+PR = "r1"
+
+BBCLASSEXTEND="native"
 
 SRC_URI = "http://cairographics.org/releases/pixman-${PV}.tar.gz \
 	  "
-- 
1.6.6




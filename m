Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <angelox.123@gmail.com>) id 1PF88K-0003wX-Bp
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 17:30:22 +0100
Received: by gwaa11 with SMTP id a11so3100459gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Nov 2010 08:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=sCG7AM3710njJK9axffMqOkgKXDp9JQdzCKKd6gDafY=;
	b=muqDk0hj7O9GPZbT9UF7dodhywM2JueZDYnXQ/AJpW56Abb/o7Be9F1wpgtUPDhCFa
	v4+kTs5+gzZJYxUAZSZYr1Vg47sd8J5kDqHFVVykLFDSAjVlqh4jE/AaMaXUCn1i+UK4
	zWFBpJ7Vxk3F2TmFdhmLiNzfdKyM/LZrmUXD8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=VZp+KPaFK5ncGDBYaoE80ftrQyUlhx1Gqkj1wVDWqeD/bYeAPWtxP4wp4u2mAiLQgL
	6vck7e/3vsm5jkZG4xH9UtmhNc+Aqkva+TnI3x74BUMrjd505MK1ndUcrkM3ikeGCuHM
	2sgS+3DauLmM3iJCVYM2h4CvwsKsHWmEqTcFE=
Received: by 10.100.143.8 with SMTP id q8mr1691081and.124.1289147364379;
	Sun, 07 Nov 2010 08:29:24 -0800 (PST)
Received: from localhost.localdomain (189-46-9-193.dsl.telesp.net.br
	[189.46.9.193])
	by mx.google.com with ESMTPS id w3sm4766942anw.25.2010.11.07.08.29.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 07 Nov 2010 08:29:23 -0800 (PST)
From: angelox_123 <angelox.123@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Nov 2010 14:29:12 -0200
Message-Id: <1289147352-1204-1-git-send-email-angelox.123@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <angelox.123@gmail.com>
References: <angelox.123@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: angelox.123@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] metano.conf: Fixed unbuildable errors with gpe packages on xorg-image
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
X-List-Received-Date: Sun, 07 Nov 2010 16:30:23 -0000

* Removed gpe-filemananger from DISTRO_EXTRA_RRECOMMENDS
* Removed gpe-mini-brownser from DISTRO_EXTRA_RRECOMMENDS
* That fix the "missing unbuildable errors..." from build xorg-image

Signed-off-by: angelox_123 <angelox.123@gmail.com>
---
 conf/distro/metano.conf |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/conf/distro/metano.conf b/conf/distro/metano.conf
index 9bab8d9..4d7ef31 100644
--- a/conf/distro/metano.conf
+++ b/conf/distro/metano.conf
@@ -123,8 +123,6 @@ DISTRO_EXTRA_RRECOMMENDS += " \
     alsa-lib \
     alsa-utils \
     nano \
-    gpe-filemanager \
-    gpe-mini-browser \
     ${XSERVER} \
     avahi-daemon \
     avahi-autoipd \
-- 
1.7.2.3




Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <angelox.123@gmail.com>) id 1PEV32-00086e-7S
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 23:46:16 +0100
Received: by yxe42 with SMTP id 42so2602765yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 15:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=qDmnUFrjoqILPWpHuFynCZDIN+Pj5kuK7Zyl1d3kLug=;
	b=RNia4Dnjju1GnL+4cQKEzc+2+reAIMBTGjqzJI8Q0uSdRKq18WBRZq9XQ2SyGb+kq7
	/ymE7LQHKXeQQbsc9qjja57/PpPQGnQ2JJlSiiOuCzr0lSKJZpH4Gr0IaVUA8OE6B0eG
	/g6EqP0McWWrR6exd3CuAJXiGfO2DWxgsBuE4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=KDYSK9Ej+0klapDZb8+38DCIvzDds6LXO6LMHHR8VVsC6/hoOWm67bvEHY473KJwSb
	BsM4D+kfCts7fk+sdDc0CKkx0KmDWuJKrMFfzzJMINrfQnsXxTBVNIabZGGVHO7Ue2Co
	FT1nCiIdkmShyJzVz1K2bKDlSyfNCh61RL0l0=
Received: by 10.150.144.10 with SMTP id r10mr4308524ybd.120.1288997122224;
	Fri, 05 Nov 2010 15:45:22 -0700 (PDT)
Received: from localhost.localdomain (201-95-46-2.dsl.telesp.net.br
	[201.95.46.2])
	by mx.google.com with ESMTPS id m45sm1315757yha.11.2010.11.05.15.45.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 05 Nov 2010 15:45:21 -0700 (PDT)
From: "Angelo S. Mavridis Bartolome" <angelox.123@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Nov 2010 20:45:01 -0200
Message-Id: <1288997101-2154-1-git-send-email-angelo@pynell.com>
X-Mailer: git-send-email 1.7.3.2
In-Reply-To: <angelo@pynell.com>
References: <angelo@pynell.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: angelox.123@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "Angelo S. Mavridis Bartolome" <angelo@pynell.com>
Subject: [PATCH] metano.conf: Removed inutil package
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
X-List-Received-Date: Fri, 05 Nov 2010 22:46:16 -0000

* Removed nano package from default,it isn't need at this time

Signed-off-by: Angelo S. Mavridis Bartolome <angelo@pynell.com>
---
 conf/distro/metano.conf |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/conf/distro/metano.conf b/conf/distro/metano.conf
index 9bab8d9..6262aa0 100644
--- a/conf/distro/metano.conf
+++ b/conf/distro/metano.conf
@@ -122,7 +122,6 @@ DISTRO_EXTRA_RRECOMMENDS += " \
     mplayer \
     alsa-lib \
     alsa-utils \
-    nano \
     gpe-filemanager \
     gpe-mini-browser \
     ${XSERVER} \
-- 
1.7.3.2




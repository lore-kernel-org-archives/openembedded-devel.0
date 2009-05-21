Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJO-0005cb-Hc
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:14 +0200
Received: by bwz19 with SMTP id 19so784003bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ZrjmBGI8Q1SJzyawHA5RO5ZllnDdq3NJ2HJiFYBFSsQ=;
	b=oMpWKfKJDRT8fCdvCoyQLY6lQPDvo9WJCbxXdJtxq/jmK31vfdkaxeQfj0GEiMVJFx
	iBx/0cO3ZuI+M/jFDYpTYJft+uLl9GXnwW4batcrf5FXuzr4DC1o4jEPzXXQPvXXdX1o
	ZFUPSkbSn3ThnlHDaTdac1D4dedRZO9s+q7yY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=Vq8iysM/Nl+xLLwKbZpu0nV6sDoo5JBEz+klVqTHKNJMPSoSoI+GdNL+gae1lNhbc+
	QX4efno91fTu/4uNrj6jECxbsBhhH3J/RiZnb6cfrf55mWduJxOUkTfIf9EFXlNqxjRV
	xbuWTorc4Ya77ZEtwchV/OzO7PHjvaM6xGVCc=
Received: by 10.103.227.13 with SMTP id e13mr1095594mur.2.1242873580089;
	Wed, 20 May 2009 19:39:40 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id b9sm3450622mug.39.2009.05.20.19.39.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:38 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 689F56103B5; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:20 -0300
Message-Id: <1242873578-17444-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-5-git-send-email-otavio@ossystems.com.br>
References: <1242873578-17444-1-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-2-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-3-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-4-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-5-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 05/23] checksums.ini: add flash-plugin
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
X-List-Received-Date: Thu, 21 May 2009 02:47:15 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 2070cfd..8a8c088 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -6126,6 +6126,10 @@ sha256=9635a44bceb478bbf2ee8a785cf6986fba525afb5fad1fd4bba73cf71f2d3edf
 md5=8845d4536fcd3a329690c93bce9bbf8e
 sha256=c7345faf10b269b3556f2e1373c4afc35f08891f8bbd54e45d49151a8c8e4ac0
 
+[http://fpdownload.macromedia.com/get/flashplayer/current//flash-plugin-10.0.22.87-release.i386.rpm]
+md5=a3bb1f9a8e2b1238ffaf89193e60be02
+sha256=ec5ace49df7cfe69b7c02c8d1b6df8089f32076a390b931051feed2a9762d554
+
 [http://downloads.sourceforge.net/flex/flex-2.5.31.tar.bz2]
 md5=363dcc4afc917dc51306eb9d3de0152f
 sha256=701353279a17655d78e3b3678ad78d0375f5bf45877ad8b3507d589c42427f26
-- 
1.6.3.1.54.g99dd




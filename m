Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UZqri-0003Qs-TP
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 01:00:13 +0200
Received: by mail-ea0-f181.google.com with SMTP id a15so575662eae.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2013 15:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=genVKcurPDJ1msncUbxDK20iKtNYCtqNqbB0c/29qo4=;
	b=wpUM863O3l0BIk/mO5C+zHy/qKThn/mOujm8UgFFZX8T43isLYlPheU7hOoSeh85ZX
	FphwRvywqYiVnx/CUnUfhghJ1CTu0z1K4KCReF3TEg6UvGiBpsmHGkrNjdyaFAlvNOC8
	72AwVAn4beuKPujRw+GWGZ0suZck7kXGgwvijAvm0U1lw4+SXWfhVBeyQUrdtrhFC9ll
	9EUvxAJizg7yM3NyMeN3u+obhs2whdFnziDQIlDaGJbdyrz0UqmXM7jvi3kqBi6Gngwg
	mDxnnh+jiGB79WdvmisOzdh4dmGzKBJkx3U8gpUNy8zdmiw4za2iDhJRN7L1xtvtYw48
	75lA==
X-Received: by 10.15.48.193 with SMTP id h41mr10083356eew.23.1367966529776;
	Tue, 07 May 2013 15:42:09 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0896.dip0.t-ipconnect.de.
	[91.10.8.150])
	by mx.google.com with ESMTPSA id i3sm41969409eev.1.2013.05.07.15.42.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 15:42:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2013 00:41:40 +0200
Message-Id: <1367966513-12566-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-gnome 02/15] libbonobo: remove unreferenced patch
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
X-List-Received-Date: Tue, 07 May 2013 23:00:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../bonobo/libbonobo/configure-gthread.patch       |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo/configure-gthread.patch

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo/configure-gthread.patch b/meta-gnome/recipes-gnome/bonobo/libbonobo/configure-gthread.patch
deleted file mode 100644
index 005fa67..0000000
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo/configure-gthread.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- libbonobo-2.14.0/configure.in.orig	2006-09-04 09:21:54.000000000 +0100
-+++ libbonobo-2.14.0/configure.in	2006-09-04 09:22:58.000000000 +0100
-@@ -166,7 +166,7 @@
- 		AC_MSG_RESULT(no)
- 		AC_MSG_ERROR(
- 			[No working gthread-2.0 support found, using --disable-threads IS DISCOURAGED])
--	]
-+	],[AC_MSG_RESULT(yes)]
-   )
-   CFLAGS=$libbonobo_save_CFLAGS
-   LIBS=$libbonobo_save_LIBS
-- 
1.7.4.4




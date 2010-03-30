Received: from mail-iw0-f184.google.com ([209.85.223.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1NwTWD-0006Uf-3W
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 06:57:37 +0200
Received: by iwn14 with SMTP id 14so12387972iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 21:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=N5s+kC5ido3U+XgM6RlvJB4ToVEYyxpvPDTK9zz/zjo=;
	b=scQ8Dg6VHcM5OHtYCZSfRfIE59lKO/YK63C2g52JeZlr/mDWk1eN724VwgGyNSAMcU
	dF2b8V0f1zNYYBt4TbW+exUSstyBThtdkzYOBKY66P50ua4XiPTToNyLG68MKDJpCGll
	swUN5/BMuq+9EJXLcXJ0SjFjmdsKnSg6lUo0I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=JWFyZhsFYNLQ/9hMstSTA/uBIp6NdjX7Hhl9tHt4gw2N23qslOhhAyKobWmeUESeyd
	YLvGm1+CMCLnjUk4gLaE6OBqw0QBj50yP0JDLN1wxxVaih7KYCz8VAmsNQa9Gji5J9+k
	ePCM4WF0lY+/JgjLvRQuHiNdljX2k+3Qo436w=
Received: by 10.231.145.206 with SMTP id e14mr3068775ibv.10.1269924860785;
	Mon, 29 Mar 2010 21:54:20 -0700 (PDT)
Received: from localhost.localdomain ([201.153.211.3])
	by mx.google.com with ESMTPS id j42sm5029405ibr.19.2010.03.29.21.54.18
	(version=SSLv3 cipher=RC4-MD5); Mon, 29 Mar 2010 21:54:20 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Mar 2010 22:53:29 -0600
Message-Id: <1269924810-3069-1-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <openembedded-devel@lists.openembedded.org>
References: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.223.184
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] imagemagick_6.3.5-10.bb: openm4 fix
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
X-List-Received-Date: Tue, 30 Mar 2010 04:57:37 -0000

* m4/openmp.m4 (AC_OPENMP): Do not define with Autoconf 2.62 or newer.
* 2008-12-03  Ralf Wildenhues  <[EMAIL PROTECTED]>
*             Bruno Haible  <[EMAIL PROTECTED]>
* ref: http://www.mail-archive.com/bug-gnulib@gnu.org/msg12387.html

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/imagemagick/imagemagick_6.3.5-10.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/imagemagick/imagemagick_6.3.5-10.bb b/recipes/imagemagick/imagemagick_6.3.5-10.bb
index 58f3b23..a6a7a7e 100644
--- a/recipes/imagemagick/imagemagick_6.3.5-10.bb
+++ b/recipes/imagemagick/imagemagick_6.3.5-10.bb
@@ -8,7 +8,8 @@ SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}.tar.bz2 \
            file://PerlMagic_MakePatch;patch=1 \
            file://makefile-am.patch;patch=1 \
            file://binconfig-fixes.patch;patch=1 \
-	   file://fix_open_file.patch;patch=1 "
+	       file://fix_open_file.patch;patch=1 \
+           file://openm4-autoconf-fix.patch;patch=1"
 
 IMVER = "6.3.5"
 
-- 
1.6.6.1



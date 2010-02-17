Received: from mail-fx0-f210.google.com ([209.85.220.210])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NhhUu-0002Fq-5U
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 11:51:15 +0100
Received: by fxm2 with SMTP id 2so1021211fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 02:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=IV3Obxyzj1fJ0Yy9WXFjU8E2zQyxJV5vv9heqtY/8BA=;
	b=lS/yDZiodIGH0GUMHUw9jpra2ohMR1b8lozwrzaJlx4hlStkxw7SMk/H8We/X18XoS
	fah/9YzbPnkn0huNOUI874PiMxmXbLSofHP/0rMBCWZsfJ1vvJJVHKhl2x7ExRqT6Icl
	e5wXsD9ijOKmy3acNVSOz0XuJSl4/11XZfDFs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=wFeqxnFmmz6dSgS9AWO2r7S8XdBonULXjvh1YvjJB7jePUnnmyJWXo4CnCxOtr6McJ
	dCqg5WvC6VHH3AgFbL1J9HRRnaYpOF4rDyFd6Kw3EJNr2bJc9a3wtzta3LQ6UszLPK1S
	HPWhTUdEW8V9lqA+uKPywk/M5OZgnq3f4oFuQ=
Received: by 10.223.62.78 with SMTP id w14mr7128647fah.82.1266403712569;
	Wed, 17 Feb 2010 02:48:32 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm4003608fxm.7.2010.02.17.02.48.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 17 Feb 2010 02:48:32 -0800 (PST)
Date: Wed, 17 Feb 2010 11:48:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100217104816.GJ3233@jama>
References: <E1Nhfko-0005L8-Mc@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1Nhfko-0005L8-Mc@melo.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.210
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Koen Kooi : qt4: add 4.6.2
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
X-List-Received-Date: Wed, 17 Feb 2010 10:51:15 -0000
X-Groupsio-MsgNum: 16861
Content-Type: multipart/mixed; boundary="hHWLQfXTYDoKhP50"
Content-Disposition: inline

--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 17, 2010 at 08:59:30AM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: fba63ed00f92f939529bd1fd1f47a8d715f8bea8
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=fba63ed00f92f939529bd1fd1f47a8d715f8bea8
> 
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Tue Feb 16 10:47:02 2010 +0100
> 
> qt4: add 4.6.2
> 
> * fix 4.6.1 references in 4.6.0 files as well
> * make qt-config.patch work with QT_NO_CAST_{TO,FROM},ASCII strict checking

No idea if that's new issue with 4.6.2 or because of my chroot, but now
it cannot find any headers from staging.

I found that now there is LFLAGS (not LDFLAGS) set with libdir and patched 
configure to use that too somehow, maybe it was needed before -I -L parameters
added to configure script itself?

Attached patch works for me.. but if it's right way, then it should be
integrated to .inc files instead.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         

--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-qt4-tools-native-use-I-and-L-to-specify-staging-dire.patch"

From d86a53dc732810f3a0ed93664cb1bad03177bdb4 Mon Sep 17 00:00:00 2001
From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 17 Feb 2010 11:39:34 +0100
Subject: [PATCH] qt4-tools-native: use -I and -L to specify staging directories

---
 recipes/qt4/qt4-tools-native_4.6.2.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/qt4/qt4-tools-native_4.6.2.bb b/recipes/qt4/qt4-tools-native_4.6.2.bb
index d9ab033..c40738b 100644
--- a/recipes/qt4/qt4-tools-native_4.6.2.bb
+++ b/recipes/qt4/qt4-tools-native_4.6.2.bb
@@ -13,6 +13,8 @@ SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
 EXTRA_OECONF = "-prefix ${prefix} \
+                -L ${STAGING_LIBDIR_NATIVE} \
+                -I ${STAGING_INCDIR_NATIVE} \
                 -qt-libjpeg -qt-gif -system-zlib \
                 -no-libjpeg -no-libpng \
                 -no-accessibility \
-- 
1.7.0


--hHWLQfXTYDoKhP50--

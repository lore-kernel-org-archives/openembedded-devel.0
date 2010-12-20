Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PUa78-0003NM-A1
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 08:24:58 +0100
Received: by pzk27 with SMTP id 27so799256pzk.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Dec 2010 23:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=yR0R04oY4fcOjyHhLVM/FdCxvrA7T0epv8ZzS9x+BdU=;
	b=c5BWRwxnjJPwIxBgLLFHEGMaXP8gB+3+ZL67izoJmtwaq/VIL3foX9i9pZ31lPBXsV
	AI4j9MJZOEXiy+9OSGbXVB9nSX0qPwleOsirrW3ekPCsmkl33KC50SHSfMEGNfXML7VY
	MUz22Pj63WVbxU9L0HpSQONPEYM1NcUbIwV3I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ImpfSkXfweqowcTqcEZ3w66DKu5PwHha5fef22EFctHibxdsPltnS/24S+biA86Xr5
	XkXmSx2OoPUhcPMDRam4LKcdZ6K41Z3TCmO4aBEmEiJcXIsEmdK41gsUKNIZCTmpeH4N
	pY0BLPeSUDhEZwdsRGZDlPxEWDAbXylXWgfoQ=
Received: by 10.142.12.4 with SMTP id 4mr3101953wfl.242.1292829890197;
	Sun, 19 Dec 2010 23:24:50 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w22sm5404307wfd.19.2010.12.19.23.24.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 19 Dec 2010 23:24:49 -0800 (PST)
Date: Sun, 19 Dec 2010 23:24:58 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101220072458.GA17079@gmail.com>
References: <1292507333-20222-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1292507333-20222-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [RFC] xorg: upgrade to X11R7.6 and remove preferred-xorg-versions*.inc files
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
X-List-Received-Date: Mon, 20 Dec 2010 07:24:58 -0000
X-Groupsio-MsgNum: 27290
Content-Type: multipart/mixed; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline

--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/12/10 14:48), Martin Jansa wrote:
> * X11R7.6-RC1 was already released
>   http://www.x.org/releases/X11R7.6-RC1/doc/xorg-docs/ReleaseNotes.html
>   so it's IMHO time to start migration there
> * preferred-xorg-versions-live.inc was tracking latest stable released
>   tarballs, but only reason I was maintaining it was to overwrite older
>   preferred-xorg-versions-X11R7.5.inc if your distribution included ie
>   X11R7.5.inc and you wanted live.inc from local.conf
> * default recipe versions without any preferred-xorg-versions include
>   are now the same as live.inc
> * we will get better test coverage if we use same versions
> * if someone really needs older release then pinning only core stuff
>   like xserver/libx11 will be probably better, than pinning every xorg
>   app/proto/font etc.
> * I can slow down adding newest xorg stuff or ie keep it everytime for
>   at least a week on ML for another review and test on more targets
>   (I'm testing it only on om-gta02/spitz/nokia900)
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I am still testing the builds on uclibc. However here is one patch you need
to apply to mesa 7.9 (earlier it was using mesa 7.2) to get it building on
uclibc.

Thanks
-Khem 


--n8g4imXOkfNTN/H1
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="uclibc.patch"

Index: Mesa-7.9/src/mesa/main/imports.c
===================================================================
--- Mesa-7.9.orig/src/mesa/main/imports.c
+++ Mesa-7.9/src/mesa/main/imports.c
@@ -756,7 +756,7 @@ _mesa_strdup( const char *s )
 float
 _mesa_strtof( const char *s, char **end )
 {
-#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
+#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && !defined(__UCLIBC__)
    static locale_t loc = NULL;
    if (!loc) {
       loc = newlocale(LC_CTYPE_MASK, "C", NULL);

--n8g4imXOkfNTN/H1--

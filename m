Received: from [64.233.170.188] (helo=rn-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LXKuQ-0005pr-Fg
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Feb 2009 20:38:10 +0100
Received: by rn-out-0910.google.com with SMTP id j42so384417rne.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2009 11:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=8funYdz//iYRRn3hIVIrYy/mzOHZzDdres/xfT51yjc=;
	b=sK7QHzKVe/X3B9YgjR1u6TVlP3kyhvMsICPHVDfSHaGBYnW0T5qdqHAJJ1xkKqmQOB
	oBU0x+VWqgxHe0Cz6c0WLSSST0mTZMLU107Gy4pbY6ojpQ6pmTpYtmNkDy1Vc+kvZybw
	aRexKofbgkaUm0WpZfiC9oqtQhV43OwfFrpvI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Bevw7AonnLY9emYaV61/p5tYzMFgg0SPytzgfH14QT/WQG3kIdDd8jP47B6BFmlN+u
	eHKqCR1BVWEpFbZQHUq79x684YeA6telDQgSDlA3UfDLm0cZ13n1UQD/EixTK7OvWMa9
	DTIT6Dzq0GoqGwAIHG0vK9TX4pjYs9A9KTgzU=
Received: by 10.143.8.10 with SMTP id l10mr10750wfi.175.1234381019860;
	Wed, 11 Feb 2009 11:36:59 -0800 (PST)
Received: from gmail.com (adsl-71-146-3-29.dsl.pltn13.sbcglobal.net
	[71.146.3.29])
	by mx.google.com with ESMTPS id 22sm15322637wfi.1.2009.02.11.11.36.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 11 Feb 2009 11:36:59 -0800 (PST)
Date: Wed, 11 Feb 2009 11:36:57 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090211193657.GB16064@gmail.com>
References: <20090126074953.GA26318@gmail.com>
	<1232958250.4890.104.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1232958250.4890.104.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: fix for strl functions in alsautils
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
X-List-Received-Date: Wed, 11 Feb 2009 19:38:10 -0000
X-Groupsio-MsgNum: 7614
Content-Type: multipart/mixed; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (26/01/09 08:24), Phil Blundell wrote:
> On Sun, 2009-01-25 at 23:49 -0800, Khem Raj wrote:
> > * These funtions are provided by C libraries like uclibc
> >         Declaring them static here causes static not static declaration
> >         issues reported by gcc.
> > [...]
> > + #ifdef __GLIBC__
> > +-static size_t strlcpy(char *dst, const char *src, size_t size)
> > ++size_t strlcpy(char *dst, const char *src, size_t size)
> > + {
> 
> Wouldn't it be better to change that "#ifdef __GLIBC__" to something
> more appropriate?  With your change it looks like you will still get
> useless copies of these functions in the resulting binaries.

Attached patch detects these functions during configure and
includes/excludes them accordingly.

> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--fUYQa+Pmc3FrFX/N
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="alsa-utils-autoconf-strl-funcs.patch"

Index: alsa-utils-1.0.18/alsactl/init_sysdeps.c
===================================================================
--- alsa-utils-1.0.18.orig/alsactl/init_sysdeps.c	2008-10-29 05:42:11.000000000 -0700
+++ alsa-utils-1.0.18/alsactl/init_sysdeps.c	2009-02-10 23:17:47.000000000 -0800
@@ -17,7 +17,7 @@
  *
  */
 
-#ifdef __GLIBC__
+#if !HAVE_STRLCPY
 static size_t strlcpy(char *dst, const char *src, size_t size)
 {
 	size_t bytes = 0;
@@ -36,7 +36,10 @@
 		*q = '\0';
 	return bytes;
 }
+#endif /* !HAVE_STRLCPY */
 
+
+#if !HAVE_STRLCAT
 static size_t strlcat(char *dst, const char *src, size_t size)
 {
 	size_t bytes = 0;
@@ -60,4 +63,4 @@
 	*q = '\0';
 	return bytes;
 }
-#endif /* __GLIBC__ */
+#endif /* !HAVE_STRLCAT */
Index: alsa-utils-1.0.18/configure.in
===================================================================
--- alsa-utils-1.0.18.orig/configure.in	2008-10-29 05:48:01.000000000 -0700
+++ alsa-utils-1.0.18/configure.in	2009-02-10 23:02:07.000000000 -0800
@@ -6,7 +6,7 @@
 
 AM_GNU_GETTEXT([external])
 AM_GNU_GETTEXT_VERSION([0.15])
-
+AC_CHECK_FUNCS(strlcat strlcpy)
 dnl Checks for programs.
 
 dnl try to gues cross-compiler if not set

--fUYQa+Pmc3FrFX/N--

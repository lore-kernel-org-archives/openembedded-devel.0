Received: from [209.85.146.180] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LXPea-0005Ea-NG
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 01:42:09 +0100
Received: by wa-out-1112.google.com with SMTP id n7so237586wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2009 16:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=WALe36O44bEwtV7UTpjdXTQI0lmVffrMjLoJLafbWhQ=;
	b=lXLbPxcaWGrYG6JETeNk5Nk/t9ypAONF1/n95opfPE3u4AEKsAAPvOn40mJ7Pdupe2
	AHCOzaqzPie+OWGAwAuJLvaEdVm5F2bUIlsUjsI617ESTFPbL5JPwo4sWvTdcTfls6cc
	+8tJ4Jio1UNT+sQbsfxCJCuMTKmtEOCWjg8dk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=IFmL7YYG3XZ92weADCH037I3i203Pnluk4b9zXyaOWE6dsy+F5TpnXq7r9GrTFsPdl
	VAeYeYK86OrinQHzmuswxMCJgji012I45n8vxj5Fto0Pcw4Gz1yMyfmZ1py094tTkeKk
	YcTW31g5o/X1cdhgrVESo1QT5J0W4vzwCzqNs=
Received: by 10.114.234.13 with SMTP id g13mr117127wah.64.1234399256411;
	Wed, 11 Feb 2009 16:40:56 -0800 (PST)
Received: from gmail.com (adsl-71-146-3-29.dsl.pltn13.sbcglobal.net
	[71.146.3.29])
	by mx.google.com with ESMTPS id n22sm18444547pof.16.2009.02.11.16.40.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 11 Feb 2009 16:40:56 -0800 (PST)
Date: Wed, 11 Feb 2009 16:40:50 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090212004050.GA16757@gmail.com>
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
X-List-Received-Date: Thu, 12 Feb 2009 00:42:09 -0000
X-Groupsio-MsgNum: 7619
Content-Type: multipart/mixed; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline

--rwEMma7ioTxnRzrJ
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

here is a different patch.

--rwEMma7ioTxnRzrJ
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

--rwEMma7ioTxnRzrJ--

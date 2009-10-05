Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1Muu8U-0006Dx-09
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Oct 2009 22:26:25 +0200
Received: by fxm3 with SMTP id 3so3190605fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Oct 2009 13:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:in-reply-to
	:references:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	bh=EQ1b6q3XiwEWGYIWrBHDphYxTGF6TlBBitbQoQKgWUY=;
	b=QAtdFMnezKk0twfhZKbP9go41lwhvue3wWuJjul8VY2TVRaPxe7OfWf85PPsCwngTY
	vqD4OvhSKSdMKCeRHwbo3Vebz/DQAON2XlxPOONuXR48NNQrQj/jBIGxu6YcbUGxkwiY
	mLggYIV766pPMgA2TziIJP1GaemM4fjXomNqs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id
	:mime-version:x-mailer:content-transfer-encoding;
	b=Dxim9kduabXHIhp4Z8RQgDtndQIuZv1a/eDzO4kh5D8Aqb44sOUh2lYcmdoQ/+F+3e
	SapOSuuLhR0ZnTVD2NdeF1+rXHqR6WEn4j8G/WosB9shwH0chm2HG4Lrp0+ULbl1pwyF
	ZJnQfGX2DHMvRrVj3Tnb8F054hPdjNDNTv1mE=
Received: by 10.102.245.35 with SMTP id s35mr227103muh.124.1254774331753;
	Mon, 05 Oct 2009 13:25:31 -0700 (PDT)
Received: from ?192.168.1.2? (d86-32-77-106.cust.tele2.at [86.32.77.106])
	by mx.google.com with ESMTPS id 12sm22180206muq.24.2009.10.05.13.25.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 05 Oct 2009 13:25:30 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1254770821.9214.105.camel@lenovo.internal.reciva.com>
References: <1254768733.10712.3.camel@leeloo.somedomain>
	<1254770821.9214.105.camel@lenovo.internal.reciva.com>
Date: Mon, 05 Oct 2009 22:25:35 +0200
Message-Id: <1254774335.3947.12.camel@leeloo.somedomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 209.85.220.207
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: lighttpd 1.4.18 runtime issue
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
X-List-Received-Date: Mon, 05 Oct 2009 20:26:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

After further investigation, I found a document
(${S}/doc/configuration.txt) that states:
...
  Starting with lighttpd 1.4.0 three default modules are loaded  
  automaticly:

  - mod_indexfile
  - mod_dirlisting
  - mod_staticfile
...

The daemon did not start at all because it failed the module
initialization process. (Got no exact error messages, because I have no
access to the board atm.) The modules cannot be deactivated in the
config. After all, I think an RDEPENDS would be appropriate here. 

git diff (without any formatting changes) is attached.

Regards,
Michael


diff --git a/recipes/lighttpd/lighttpd_1.4.18.bb
b/recipes/lighttpd/lighttpd_1.4.18.bb
index d5870ba..a446122 100644
--- a/recipes/lighttpd/lighttpd_1.4.18.bb
+++ b/recipes/lighttpd/lighttpd_1.4.18.bb
@@ -2,7 +2,12 @@ DESCRIPTION = "Web server"
 SECTION = "net"
 LICENSE = "BSD"
 DEPENDS = "libpcre"
-PR = "r3"
+RDEPENDS_${PN} += " \
+        lighttpd-module-indexfile \
+        lighttpd-module-dirlisting \
+        lighttpd-module-staticfile"
+
+PR = "r4"
 
 SRC_URI = "http://www.lighttpd.net/download/lighttpd-${PV}.tar.gz \
 	   file://configure.in.patch;patch=1 \

Am Montag, den 05.10.2009, 20:27 +0100 schrieb Phil Blundell:
> Thanks for the patch.
> 
> For future reference, please don't combine mechanical operations like
> reformatting with other edits in a single patch.  It makes it much
> harder to see what the patch is actually doing if there is a lot of
> other extraneous noise going on.
> 
> Can you clarify what the effect is of failing to install
> lighttpd-module-indexfile; does the daemon just refuse to start at all,
> or does it just ignore the config file directive if the module is
> missing?  If the latter, and/or if folks are likely to edit the config
> file to remove the reference to that module, it might be better to set
> the module package as RRECOMMENDS rather than RDEPENDS.
> 
> p.
> 
> On Mon, 2009-10-05 at 20:52 +0200, Michael Lippautz wrote:
> > hej,
> > 
> > lighttpd_1.4.18 is installed with a config that should actually load its
> > module mod-indexfile.so.
> > 
> > Since the config is pretty default, I added the module to the runtime
> > depends. (also re-formated recipe, uses tabs now).
> > 
> > Regards,
> > Michael
> > 
> > 
> > diff --git a/recipes/lighttpd/lighttpd_1.4.18.bb
> > b/recipes/lighttpd/lighttpd_1.4.18.bb
> > index d5870ba..80d22bc 100644
> > --- a/recipes/lighttpd/lighttpd_1.4.18.bb
> > +++ b/recipes/lighttpd/lighttpd_1.4.18.bb
> > @@ -2,26 +2,31 @@ DESCRIPTION = "Web server"
> >  SECTION = "net"
> >  LICENSE = "BSD"
> >  DEPENDS = "libpcre"
> > -PR = "r3"
> > -
> > -SRC_URI = "http://www.lighttpd.net/download/lighttpd-${PV}.tar.gz \
> > -	   file://configure.in.patch;patch=1 \
> > -	   file://mod_redirect.c.patch;patch=1 \
> > -	   file://src-server.c.patch;patch=1 \
> > -	   file://index.html \
> > -	   file://lighttpd.conf \
> > -	   file://lighttpd"
> > -
> > -EXTRA_OECONF="--without-bzip2 \
> > -		--without-ldap \
> > -		--without-lua \
> > -		--without-memcache \
> > -		--with-pcre \
> > -		--without-webdav-props \
> > -		--without-webdav-locks \
> > -		--without-openssl \
> > -		--disable-nls \
> > -		--disable-static"
> > +PR = "r4"
> > +
> > +RDEPENDS_${PN} += " \
> > +	lighttpd-module-indexfile"
> > +
> > +SRC_URI = " \
> > +	http://www.lighttpd.net/download/lighttpd-${PV}.tar.gz \
> > +	file://configure.in.patch;patch=1 \
> > +	file://mod_redirect.c.patch;patch=1 \
> > +	file://src-server.c.patch;patch=1 \
> > +	file://index.html \
> > +	file://lighttpd.conf \
> > +	file://lighttpd"
> > +
> > +EXTRA_OECONF=" \
> > +	--without-bzip2 \
> > +	--without-ldap \
> > +	--without-lua \
> > +	--without-memcache \
> > +	--with-pcre \
> > +	--without-webdav-props \
> > +	--without-webdav-locks \
> > +	--without-openssl \
> > +	--disable-nls \
> > +	--disable-static"
> >  
> >  inherit autotools pkgconfig update-rc.d
> >  
> > @@ -44,6 +49,6 @@ FILES_${PN} += "${sysconfdir} /www"
> >  PACKAGES_DYNAMIC = "lighttpd-module-*"
> >  
> >  python populate_packages_prepend () {
> > -        lighttpd_libdir = bb.data.expand('${libdir}', d)
> > -        do_split_packages(d, lighttpd_libdir, '^mod_(.*)\.so$',
> > 'lighttpd-module-%s', 'Lighttpd module for %s', extra_depends='')
> > +	lighttpd_libdir = bb.data.expand('${libdir}', d)
> > +	do_split_packages(d, lighttpd_libdir, '^mod_(.*)\.so$',
> > 'lighttpd-module-%s', 'Lighttpd module for %s', extra_depends='')
> >  }
> > 
> > 
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




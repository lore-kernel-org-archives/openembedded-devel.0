Received: from [209.85.198.246] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LNMtL-0001T9-0F
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jan 2009 08:43:52 +0100
Received: by rv-out-0708.google.com with SMTP id f25so1067091rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2009 23:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=fNnIEF5t7n1XMzl0ayVvXlpZxXZDjVhfcmzeF77C+h0=;
	b=Y5bbyGMmVbdaNl69VlMbHRDcEQ/1jem3rMEUbic/Kwgab8JjGSj+plTTlkHbssU+cV
	FbaSNhWX24Q1TwcQpoA5mIx9bFsLQfaHZYLEHozzBhMknrs/T4WhWDcN6qAUNar2ZOCU
	vUv5001ViutPB9RbEB5vO2k2AV/DetPP8b6OM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=xor3WNG6sZE1+p7+DrxptsrbLtQmkl5feW6QBh90YDG21ndiIx/1LqowNI3g/k2bbc
	sZ4dutLh5yaBioJOieFdroEL0dLzHFiTLOaKTwLWm12qLjpvuT6vs9ehx7I23VaIHTwI
	92G2k/LawZ1wRoZkTK0ExNAtU6ktDROSUpQxQ=
Received: by 10.141.142.15 with SMTP id u15mr476639rvn.16.1232005032025;
	Wed, 14 Jan 2009 23:37:12 -0800 (PST)
Received: from localhost (adsl-71-146-7-99.dsl.pltn13.sbcglobal.net
	[71.146.7.99])
	by mx.google.com with ESMTPS id b39sm42172910rvf.0.2009.01.14.23.37.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 14 Jan 2009 23:37:11 -0800 (PST)
Date: Wed, 14 Jan 2009 23:37:10 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090115073709.GB7020@gmail.com>
References: <20090115061418.GA13352@denix.org>
MIME-Version: 1.0
In-Reply-To: <20090115061418.GA13352@denix.org>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: [RFC] Fix udev pulling in libvolume-id-dev
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
X-List-Received-Date: Thu, 15 Jan 2009 07:43:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/01/09 01:14), Denys Dmytriyenko wrote:
> Hi,
> 
> I was debugging the strange behavior of one of my boxes pulling in libc6-dev 
> into the filesystem image and it happened to be because udev pulled in 
> libvolume-id-dev instead of libvolume-id0... It worked as expected on the 
> other box, though.
> 
> Several people on IRC have seen this lingering bug before, but no fix was 
> available. Koen mentioned it got fixed for him by rebuilding udev...
> 
> After some investigation I found out that both libvolume-id packages (-dev and 
> regular) are registered to provide libvolume_id.so.0 and the one appearing 

I think -dev provides libvolume_id.so and libvolume-id provides
libvolume-id.so.* they are different. Our shlib handler should be able
to figure that out. I still wonder what caused it to pull libc-dev
though.

> last in os.walk() gets pulled in by udev. The order of files provided by 
> os.walk() depends on parallel builds and phase of the Moon.
> 
> libvolume-id-dev does not provide the actual .so library, but it contains a 
> symlink in /usr/lib, which points to /lib/libvolume.so.0 (the host one!) 
> instead of ../../lib/ one...
> 
> The first patch attached fixes this in udev and should be a no brainer. Unless 
> someone objects, I'll push it in in a day or two.
> 

Seems like we need this to work in a sysrooted env. 

> Since I was debugging the code which actually does this shlib magic in 
> package.bbclass, I thought it might be useful to prevent this kind of issues 
> in the future by skipping symlinks while looking for SONAME/NEEDED in the 
> objdump - please see the second patch attached and provide feedback.

But we need to process symlinks to find out package that contains target so that we can create
dependency on the package that contains target like in this case we need
to create dependency on libvolume-id for libvolume-id-dev because the
symlink points to a file provided by libvolume-id


btw. nice analysis

Thx

-Khem

> 
> -- 
> Denys

> diff --git a/packages/udev/udev-124/libvolume-id-soname.patch b/packages/udev/udev-124/libvolume-id-soname.patch
> new file mode 100644
> index 0000000..56365a4
> --- /dev/null
> +++ b/packages/udev/udev-124/libvolume-id-soname.patch
> @@ -0,0 +1,12 @@
> +diff -uNr udev-124-orig/extras/volume_id/lib/Makefile udev-124/extras/volume_id/lib/Makefile
> +--- udev-124-orig/extras/volume_id/lib/Makefile	2008-06-12 01:24:30.000000000 -0400
> ++++ udev-124/extras/volume_id/lib/Makefile	2009-01-14 23:32:42.000000000 -0500
> +@@ -113,7 +113,7 @@
> + ifeq ($(libdir),$(usrlibdir))
> + 	ln -sf $(SHLIB) $(DESTDIR)$(usrlibdir)/libvolume_id.so
> + else
> +-	ln -sf $(libdir)/$(SHLIB) $(DESTDIR)$(usrlibdir)/libvolume_id.so
> ++	ln -sf ../..$(libdir)/$(SHLIB) $(DESTDIR)$(usrlibdir)/libvolume_id.so
> + endif
> + 	$(INSTALL) -d $(DESTDIR)$(usrlibdir)/pkgconfig
> + 	$(INSTALL_DATA) libvolume_id.pc $(DESTDIR)$(usrlibdir)/pkgconfig/libvolume_id.pc
> diff --git a/packages/udev/udev_124.bb b/packages/udev/udev_124.bb
> index 515debe..aa156a1 100644
> --- a/packages/udev/udev_124.bb
> +++ b/packages/udev/udev_124.bb
> @@ -3,13 +3,14 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
>  the hotplug package and requires a kernel not older than 2.6.12."
>  RPROVIDES_${PN} = "hotplug"
>  
> -PR = "r11"
> +PR = "r12"
>  
>  SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
>  	   file://noasmlinkage.patch;patch=1 \
>  	   file://flags.patch;patch=1 \
>  	   file://vol_id_ld.patch;patch=1 \
>  	   file://udevtrigger_add_devname_filtering.patch;patch=1 \
> +	   file://libvolume-id-soname.patch;patch=1 \
>  	   file://mount.blacklist \
>  	   file://run.rules \
>  	   "

> diff --git a/classes/package.bbclass b/classes/package.bbclass
> index 8b7d649..a7cdb5f 100644
> --- a/classes/package.bbclass
> +++ b/classes/package.bbclass
> @@ -615,7 +615,7 @@ python package_do_shlibs() {
>  			for file in files:
>  				soname = None
>  				path = os.path.join(root, file)
> -				if os.access(path, os.X_OK) or lib_re.match(file):
> +				if (os.access(path, os.X_OK) or lib_re.match(file)) and not os.path.islink(path):
>  					cmd = bb.data.getVar('OBJDUMP', d, 1) + " -p " + path + " 2>/dev/null"
>  					cmd = "PATH=\"%s\" %s" % (bb.data.getVar('PATH', d, 1), cmd)
>  					fd = os.popen(cmd)

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q2c5Q-0001dx-NG
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 05:23:53 +0100
Received: by pwj9 with SMTP id 9so1112166pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2011 21:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=MMKuJxAbssdJCyGLtPR3r5zH7ylkJwPJJ98mXF99dj4=;
	b=qNYOAPEI4NrXH4BBV55iE+vLi3/YWkQHD++dNlLk+igpMCQWO3VSqaugB04nWHDIsP
	4YVsUH2zNeScZxalZjYAvnC3eW4gQstL1Tz4mM15aO23V7h4hZNzmwEw7IX3q3FmWI6d
	MI4Gvwl3+HdKxLqfhLj+RjIyWU0vQgUrr1ce8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=Hi278aAF+ajHZxQ58VF7G4NJoZA+eaPPOsUVAiXXPmmfCambAaGNSD2yXaa7hIAPOB
	44pw/fA7wgk788QTp0f32OGHVDlC5i3Q+9Lln4p0MSn7Us0VAl8zJ1lZaR86vO/KMtlK
	UcSSkrJiBHoarbiEGJZTWhbWXMGmDxf0r+2Co=
Received: by 10.142.139.18 with SMTP id m18mr5607601wfd.373.1300940520272;
	Wed, 23 Mar 2011 21:22:00 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n4sm10943831wfl.14.2011.03.23.21.21.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2011 21:21:59 -0700 (PDT)
Date: Wed, 23 Mar 2011 21:22:21 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110324042221.GA9120@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1300878254.4101.21.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1300878254.4101.21.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: libarchive: task compile fails with `error: static declaration of 'wcscpy' follows non-static declaration`
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
X-List-Received-Date: Thu, 24 Mar 2011 04:23:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/03/11 12:04), Paul Menzel wrote:
> Dear OE folks
> 
> 
> trying to test the latest changes in `libarchive_2.8.4.bb` I hit the
> following error.
> 
> 	arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi -DHAVE_CONFIG_H -I. -I/oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/include/libxml2 -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -g -MT libarchive/archive_entry.lo -MD -MP -MF libarchive/.deps/archive_entry.Tpo -c libarchive/archive_entry.c  -fPIC -DPIC -o libarchive/.libs/archive_entry.o
> 	libarchive/archive_entry.c:136:18: error: static declaration of 'wcscpy' follows non-static declaration
> 	/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/include/wchar.h:144:17: note: previous declaration of 'wcscpy' was here
> 	libarchive/archive_entry.c:145:15: error: static declaration of 'wcslen' follows non-static declaration
> 	/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/include/wchar.h:284:15: note: previous declaration of 'wcslen' was here
> 	arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi -DHAVE_CONFIG_H -I. -I/oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/include/libxml2 -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -g -MT libarchive/archive_entry_stat.lo -MD -MP -MF libarchive/.deps/archive_entry_stat.Tpo -c libarchive/archive_entry_stat.c -o libarchive/archive_entry_stat.o >/dev/null 2>&1
> 	arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi -DHAVE_CONFIG_H -I. -I/oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/include/libxml2 -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -g -MT libarchive/archive_entry_strmode.lo -MD -MP -MF libarchive/.deps/archive_entry_strmode.Tpo -c libarchive/archive_entry_strmode.c -o libarchive/archive_entry_strmode.o >/dev/null 2>&1
> 	arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi -DHAVE_CONFIG_H -I. -I/oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/include/libxml2 -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -g -MT libarchive/archive_entry_xattr.lo -MD -MP -MF libarchive/.deps/archive_entry_xattr.Tpo -c libarchive/archive_entry_xattr.c -o libarchive/archive_entry_xattr.o >/dev/null 2>&1
> 	make[1]: *** [libarchive/archive_entry.lo] Error 1
> 	make[1]: *** Waiting for unfinished jobs....
> 	make[1]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/libarchive-2.8.4-r0/libarchive-2.8.4'
> 	make: *** [all] Error 2
> 	+ die 'oe_runmake failed'
> 	+ oefatal 'oe_runmake failed'
> 	+ echo FATAL: 'oe_runmake failed'
> 	FATAL: oe_runmake failed
> 	+ exit 1
> 
> The following configuration is used.
> 
> 	Build Configuration:
> 	BB_VERSION        = "1.12.0"
> 	METADATA_BRANCH   = "master"
> 	METADATA_REVISION = "79d295c"
> 	TARGET_ARCH       = "arm"
> 	TARGET_OS         = "linux-gnueabi"
> 	MACHINE           = "beagleboard"
> 	DISTRO            = "minimal"
> 	DISTRO_VERSION    = "dev-snapshot-20110323"
> 	TARGET_FPU        = "soft"
> 

Well it works ok for me on both uclibc/eglibc

Build Configuration:
BB_VERSION        = "1.13.0"
METADATA_BRANCH   = "master"
METADATA_REVISION = "3e7790b"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "efikamx"
DISTRO            = "minimal"
DISTRO_VERSION    = "dev-snapshot-20110324"
TARGET_FPU        = "soft"

and as Phil pointed out somehow your test for wscpy is failing
I have 


checking for wcrtomb... yes
checking for wcscmp... yes
checking for wcscpy... yes
checking for wcslen... yes
checking for wctomb... yes
checking for wmemcmp... yes
checking for wmemcpy... yes

in log.do_configure

as well as in build/cmake/config.h.in

/* Define to 1 if you have the `wcscpy' function. */
#cmakedefine HAVE_WCSCPY 1


-Khem

> I will test a build using `angstrom-2010.x` next, but will not have time
> to track down the fix.
> 
> 
> Thanks,
> 
> Paul



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
-Khem



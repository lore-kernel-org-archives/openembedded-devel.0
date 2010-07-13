Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OYhqU-0007V0-SG
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 17:56:54 +0200
Received: by bwz10 with SMTP id 10so3968704bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jul 2010 08:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=qdt99p5G6qgXbxKLeudlB++/m+fAqSN9CzGHG1kP/2Y=;
	b=MQMAHHpnpBiG/YJvofTb2jS05cU34FknrzUpZRSFN7tLN2u8CfYy91yX9QF2ZNqE+1
	tPHxBkd4AGlR78B1W1ZrFPUheyh7kquJ5HGRhqkcXshUUQdwd1CM5KpxT7l53yEhDOGU
	SFvNRMtKTj/2xieQnSg6LdpLF+aktbCvhPXK4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=i+JfOWiEDZ0eq7gyJZf6gdXzj20KlYXBFc+beYiyoT2ruC14gRGdXZj3MBL0abrZbL
	bCJuS62kyAvvOn84coV5Zt1F74bswM1Xz/Ol+aE4z1FdlpCZoIVl0fTuSa98ig8JQ7c4
	vhuOEtqu43D6b+yGM6xS2AeydgNncpSGcQjQY=
Received: by 10.204.54.78 with SMTP id p14mr12165205bkg.197.1279036593581;
	Tue, 13 Jul 2010 08:56:33 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id o20sm24316418bkw.3.2010.07.13.08.56.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 13 Jul 2010 08:56:32 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OYhqM-0006Sa-D6; Tue, 13 Jul 2010 17:56:26 +0200
Date: Tue, 13 Jul 2010 17:56:26 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100713155626.GB21982@mx.loc>
References: <1279027764.3935.13.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1279027764.3935.13.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: angstrom-2008.1, uclibc, perl 5.8.8: error: #error It appears you have defined _FILE_OFFSET_BITS=64.
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
X-List-Received-Date: Tue, 13 Jul 2010 15:56:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 13, 2010 at 03:29:24PM +0200, Paul Menzel wrote:
>Dear OE folks,
>
>
>I tried to build angstrom-2008.1 with the OE dev branch using uclibc.
>
>        DISTRO = "angstrom-2008.1"
>        
>        GLIBC_GENERATE_LOCALES = "en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8"
>        
>        MACHINE = "beagleboard"
>        BUILD_ARCH = "i686"
>        BUILD_OS = "linux"
>        ANGSTROMLIBC = "uclibc"
>
>Building perl 5.8.8 I get the following error.
>
>        make[1]: Entering directory `/oe/angstrom-dev/work/armv7a-angstrom-linux-uclibceabi/perl-5.8.8-r34/perl-5.8.8'
>        `sh  cflags "optimize='-O2'" miniperlmain.o` -fPIC miniperlmain.c
>        	  CCCMD =  arm-angstrom-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -DPERL_CORE -c -isystem/oe/angstrom-dev/sysroots/armv7a-angstrom-linux-uclibceabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb3 -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
>        In file included from /oe/angstrom-dev/sysroots/armv7a-angstrom-linux-uclibceabi/usr/include/sys/types.h:27,
>                         from perl.h:420,
>                         from miniperlmain.c:36:
>        /oe/angstrom-dev/sysroots/armv7a-angstrom-linux-uclibceabi/usr/include/features.h:416:4: error: #error It appears you have defined _FILE_OFFSET_BITS=64. Unfortunately, uClibc was built without large file support enabled.

from http://repo.or.cz/w/buildroot.git/tree/HEAD:/package/perl
perl-5.8.8-020-largefile.patch
but you might need fixing up the config.sh nevertheless:
http://repo.or.cz/w/buildroot.git/blob/HEAD:/package/perl/perl.mk#l124

Just an idea,



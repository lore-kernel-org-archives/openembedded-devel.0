Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1O7sjl-0004oc-0F
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 18:06:46 +0200
Received: by ewy3 with SMTP id 3so104385ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Apr 2010 09:03:02 -0700 (PDT)
Received: by 10.213.77.11 with SMTP id e11mr432091ebk.56.1272643380006;
	Fri, 30 Apr 2010 09:03:00 -0700 (PDT)
Received: from dhcp-173-37-4-116.cisco.com (nat.ironport.com [63.251.108.100])
	by mx.google.com with ESMTPS id 14sm1316745ewy.10.2010.04.30.09.02.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 30 Apr 2010 09:02:59 -0700 (PDT)
Message-Id: <5239CA41-3C85-456C-B070-E2FAB2D273F6@sundius.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <q2x8db82dd41004300634g46c42cf7na4871677b8d92cb7@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Fri, 30 Apr 2010 09:02:55 -0700
References: <q2x8db82dd41004300634g46c42cf7na4871677b8d92cb7@mail.gmail.com>
X-Mailer: Apple Mail (2.936)
X-SA-Exim-Connect-IP: 209.85.219.211
X-SA-Exim-Mail-From: msundius@sundius.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Usage of meta recipe external-toolchain-csl
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
X-List-Received-Date: Fri, 30 Apr 2010 16:06:46 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

This is my understanding:

- the meta-toolchain.bb creates an sdk from a tool chain built by OE.
- the external-toolchain.bb takes the sdk built by meta-toolchain.bb  
and installs it back into oe to be used by rest of the build.

If you are using a CS toolchain that you didn't build yourself w/ the  
meta toolchain recipe then you might have to make some tweeks here and  
there, but in general the external toolchain recipe will pull the  
toolchain into your oe environment:

  -- the compiler into the cross or host staging area
  -- the binutils into the cross or host staging area
  -- the libraries (libc libgcc etc) into the target staging area
  -- the headerfiles into the target staging area

you need to set the PREFERRED_PROVIDER for each of these packages to  
point to the external-toolchain recipe that you are using. This is  
described in the OE user manual.

its something like this:
PREFERRED_PROVIDER_libc-headers = "external-mips-linux-toolchain"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-mips-linux- 
toolchain"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external- 
mips-linux-toolchain"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =  
"external-mips-linux-toolchain"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-mips- 
linux-toolchain"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "external- 
mips-linux-toolchain"
PREFERRED_PROVIDER_virtual/libc = "external-mips-linux-toolchain"
PREFERRED_PROVIDER_virtual/libintl = "external-mips-linux-toolchain"
PREFERRED_PROVIDER_virtual/libiconv = "external-mips-linux-toolchain"
PREFERRED_PROVIDER_glibc-utils = "external-mips-linux-toolchain"
PREFERRED_PROVIDER_libsegfault = "external-mips-linux-toolchain"
PREFERRED_PROVIDER_glibc-thread-db = "external-mips-linux-toolchain"
PREFERRED_PROVIDER_libgcc-dev = "external-mips-linux-toolchain"
PREFERRED_PROVIDER_libgcc = "external-mips-linux-toolchain"
PREFERRED_PROVIDER_libstdc++-dev = "external-mips-linux-toolchain"
PREFERRED_PROVIDER_libstdc++ = "external-mips-linux-toolchain"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "external- 
mips-linux-toolchain"

that's what I use in my distro. Note that we are using a bit of a non- 
standard toolchain forced upon us for legacy reasons and some things  
were not in the exact same place that the external-toolchain recipe  
was expecting so we had to do our own recipe.

I'm by no means an expert, but at least that's how we have things  
working :] good luck

mike

On Apr 30, 2010, at 6:34 AM, Jerry Jacobs wrote:

> Dear all,
>
> I'm very new to openembedded and already have a clear view how it is
> structured. My embedded board mini2440 is already in git and want to  
> create
> my own distro.
> The problem where I bump against is how to use the Codesourcery  
> external
> toolchain for my target. I know there is the file in recipes/meta/
> external-toolchain-csl.bb
> but it not clear how to use it.
>
> This is how my tree looks like:
>
> /opt/arm-2010q1/bin  ==> codesourcery toolchain
>
> /opt/mini2440/oe/
>   |----- bitbake              ==> bitbake
>   |----- openembedded ==> openembedded overlay
>   |----- tunebox             ==> my distro buildir
>           | ------ conf        ==> configuration dir for local.conf
>           | ------ setenv    ==> script to set the environment
>
> setenv:
> export OEBASE=/opt/mini2440/oe/openembedded
> export PATH=/opt/mini2440/oe/bitbake/bin:/opt/arm-2010q1/bin:$PATH
> export BBPATH=/opt/mini2440/oe/tunebox:$OEBASE
> export BB_ENV_EXTRAWHITE="OEBASE"
>
> local.conf:
> BBFILES = "/opt/mini2440/oe/openembedded/recipes/*/*.bb"
> DISTRO = "micro"
> MACHINE = "mini2440"
>
> I found also the arago distro which has a toolchain-csl.conf and  
> includes it
> in local.conf, but they do black magic to set the variables:
> TOOLCHAIN_SYSPATH
> TOOLCHAIN_PATH
> SDK_PATH
>
> which can be found in the git repository.
>
> I hope somebody can clear some things up, because its very obsecure  
> if you
> start from scratch.
>
> Kind regards,
> Jerry Jacobs
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




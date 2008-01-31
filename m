Received: from [72.14.220.157] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JKYZz-0005F8-GE
	for openembedded-devel@openembedded.org; Thu, 31 Jan 2008 13:31:43 +0100
Received: by fg-out-1718.google.com with SMTP id e12so591945fga.0
	for <openembedded-devel@openembedded.org>;
	Thu, 31 Jan 2008 04:31:51 -0800 (PST)
Received: by 10.82.187.2 with SMTP id k2mr3667388buf.19.1201782711062;
	Thu, 31 Jan 2008 04:31:51 -0800 (PST)
Received: from widy.localdomain ( [88.231.86.1])
	by mx.google.com with ESMTPS id g11sm12024526gve.6.2008.01.31.04.31.47
	(version=SSLv3 cipher=OTHER); Thu, 31 Jan 2008 04:31:49 -0800 (PST)
Date: Thu, 31 Jan 2008 14:44:17 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20080131144417.58877daf@widy.localdomain>
In-Reply-To: <1201568452.4687.123.camel@localhost.localdomain>
References: <20080129011635.42467fc9@widy.localdomain>
	<1201562570.4687.79.camel@localhost.localdomain>
	<20080129023105.1a0cf354@widy.localdomain>
	<1201568452.4687.123.camel@localhost.localdomain>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.1; i686-pc-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] A case of distro config overriding DISTRO var
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jan 2008 12:31:44 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Tue, 29 Jan 2008 01:00:52 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

> On Tue, 2008-01-29 at 02:31 +0200, Paul Sokolovsky wrote:
> > On Mon, 28 Jan 2008 23:22:50 +0000
> > Richard Purdie <rpurdie@rpsys.net> wrote:
> > > You need to put the := directly before the code that changes
> > > DISTRO. Yes, you could add this in bitbake.conf after local.conf
> > > and before including ${DISTRO}.conf but that seems ugly to me.
> > 
> > Ugly (or better, unclean) is to reuse top-level input parameter from
> > user for different purpose. So, at first, the meaning of DISTRO is
> > "name of the distro config", and then suddenly it changes to "value
> > to use for overrides, etc". The second use should have different
> > name then, as again, DISTRO is user's primary input param for OE.
> > That would be clean solution...
> 
> Distro maintainers have chosen to do this. They could use an
> ANGSTROM_DISTRO_VERSION variable to do this instead...

Well, ok, as only Angstrom does that, it's hard to call for OE to come
at save for all future distros and their users.

>  
> > > I'd prefer USERDISTRO = "${DISTRO}" in bitbake.conf and then
> > > having angstrom overriding that using := if it really has to...
> > 
> > ... But as we don't want to revamp OE up to that level ;-), then we
> > should find good place to work that around. The issue here is that
> > overriding DISTRO is common practice, we even have pe(a)rls like:
> > 
> > DISTRO = "Jornada Linux Mobility Edition"
> 
> Whoever merged that should be shot...

Ok, so at least we agree that overriding DISTRO without good reasons is
superfluous, if not bad. Please see patch below. This actually leaves
only Angstrom as overriding that variable.

> > So, it should be worked around on OE's level (== bitbake.conf), not
> > on distro's level.
> 
> Distro maintainers dug themselves into this hole...
> 
> But yes, I think something at OE level can help. That was my
> proposal...

One more question about "USERDISTRO". It breaks that prefix convention,
moreover I feel that it's tide against underscores in names. Is that
the case? Then I guess we should sit and think that problem is not
underscore used in identifiers, but underscore used for override
syntax. I have no idea why "_" was chosen for such role and even what
influence that could be (except shell??). But replacing it with "."
probably should not bring any problems (besides just doing that of
course! ;-)) and would improve syntax clarity.

> > Also, what's exactly ugly? ":="? 
> 
> It breaks the way standard variables work and catches people out. It
> has a long history of confusing users, developers and even the core
> devs. I ended up purging hundreds of the things from the metadata a
> while back since all but about 10 were totally unneeded and just
> confused and broke things. I have no desire to return to that.
> 
> It also stops people from overriding something from their local.conf.
> 
> > Then we for sure should make exception
> > for bitbake.conf, simply because := is unavoidable for meta-stuff,
> > and bitbake.conf already has bunch of them. 
> 
> Ok, looking through the conf directory, bitbake.conf has exactly 3 of
> them. DATE and TIME are obvious special cases and CACHE is commented
> to explain why its special.

DISTRO_ORIGINAL as was proposed by me is of the same class as DATE and
TIME - it just captures stuff once, and is "imperative" variable, not
supposed to be part of .bb expressions.

[]
> 
> Cheers,
> 
> Richard
> 
> 

============================================================
--- conf/distro/amsdelta-oe.conf
2444b09294bbede8664e4a7ed9234c099ea438c8 +++
conf/distro/amsdelta-oe.conf
76da0f1ba0c0bff5d385850eab80adec09746803 
@@ -1,4 +1,3 @@ -DISTRO =
"amsdelta-oe" DISTRO_NAME = "AmsDelta Linux"
 DISTRO_VERSION = "unstable-${DATE}"
 
============================================================
--- conf/distro/chinook-compat.conf
71a18c9555e92f4daa94631ec75895dff4657653 +++
conf/distro/chinook-compat.conf
b947a8f2568d5737e4ac97e8f352727f74f5e52d 
@@ -13,7 +13,6 @@ # of some
packages. If you encounter such a problem please provide a recipe # or
file a bug! 
-DISTRO = "chinook-compat"
 DISTRO_NAME = "Chinook-compat"
 DISTRO_VERSION = "test-${DATE}"
 DISTRO_TYPE = "debug"
============================================================
--- conf/distro/foonas.conf     798d1fa5c36020aa53c1313d2a9f58c32108afae
+++ conf/distro/foonas.conf     98a2a8a7f1273c47a8f19105d91023e6c24ff330
@@ -10,7 +10,6 @@ require conf/distro/angstrom-2008.1.conf
 ANGSTROM_MODE = ${FOONAS_MODE}
 require conf/distro/angstrom-2008.1.conf
 
-DISTRO = "foonas"
 DISTRO_NAME = "foonas"
 DISTRO_VERSION = "1.0-dev"
 DISTRO_REVISION = "1"
============================================================
--- conf/distro/jlime-shrek.conf
ba46d1959e57011f17da3184fd76bdf9e176677e +++
conf/distro/jlime-shrek.conf
4aa79fa3f008b3d4c92169d9af94ffa1dc1e8491 
@@ -1,9 +1,8 @@ #@TYPE: Distribution #@NAME: Jornada Linux Mobility
Edition (JLime) <www.jlime.com> #@DESCRIPTION: Distribution file for
JLime (Linux for HP jornada 5xx,6xx,7xx,8xx series) #@MAINTAINER:
Kristoffer Ericson <Kristoffer@jlime.com> 
-DISTRO = "Jornada Linux Mobility Edition"
 DISTRO_NAME = "JLime"
 DISTRO_VERSION = "Shrek"
 DISTRO_TYPE = "release"
============================================================
--- conf/distro/mamona.conf     79c71417e4ff26abcb40d138494fa02b837f1e76
+++ conf/distro/mamona.conf     5d40e92d458ce0b59a7069cdbdf8eaab449ed77f
@@ -1,9 +1,8 @@
 #@--------------------------------------------------------------------
 #@TYPE: Distribution
 #@NAME: Mamona 
 #@--------------------------------------------------------------------
 
-DISTRO = "mamona"
 DISTRO_NAME = Mamona""
 DISTRO_VERSION = "test-${DATE}"
 DISTRO_TYPE = "debug"
============================================================
--- conf/distro/mokoslug.conf   66f7b238488b8415f9c78e9e344f98a74e83edcf
+++ conf/distro/mokoslug.conf   65e3a76d9784539c4bfe189e558417b05fffc97a
@@ -8,7 +8,6 @@ require conf/distro/angstrom-2008.1.conf
 # MokoSlug is based on Angstrom, and would hopefully just be done by
features one day ... require conf/distro/angstrom-2008.1.conf
 
-DISTRO = "mokoslug"
 DISTRO_NAME = "MokoSlug"
 DISTRO_VERSION = "1.0-alpha"
 DISTRO_REVISION = "1"
============================================================
--- conf/distro/openmoko.conf   0faa207a22693f2ef2ed13e12ce53f250340b63f
+++ conf/distro/openmoko.conf   32e366a34046342c394581a28fe3f1af2a0a1a4c
@@ -10,7 +10,6 @@ require conf/distro/include/angstrom-200
 #
 # Header
 #
-DISTRO = "openmoko"
 DISTRO_NAME = "OpenMoko"
 DISTRO_VERSION = "P1-Snapshot-${DATE}"
 #DISTRO_TYPE = "release"




-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



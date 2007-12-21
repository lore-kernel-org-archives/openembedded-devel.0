Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1J5jE3-0001Gq-D8
	for openembedded-devel@openembedded.org; Fri, 21 Dec 2007 15:51:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBLEkXx3002684;
	Fri, 21 Dec 2007 14:46:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02624-02; Fri, 21 Dec 2007 14:46:26 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBLEkO9k002677
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Fri, 21 Dec 2007 14:46:24 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <476BAC9A.4070102@gmx.net>
References: <476B8D3A.7010703@gmx.net> <489984884.20071221133816@gmail.com>
	<476BAC9A.4070102@gmx.net>
Date: Fri, 21 Dec 2007 14:46:23 +0000
Message-Id: <1198248383.4636.69.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: java recipe policy for OE
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
X-List-Received-Date: Fri, 21 Dec 2007 14:51:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 2007-12-21 at 13:07 +0100, Robert Schuster wrote:
> Paul Sokolovsky schrieb:
> > Friday, December 21, 2007, 11:54:02 AM, you wrote:
> >> the toolchain stuff has not been committed yet but I still want to start
> >> a little discussion about the future of java packages in OE.
> > 
> >> a) jar location
> >> The Debian java packages have the fine habit of placing all the jars
> >> (this is what resembles a shared library in java land) into
> >> /usr/share/java. Since Java (still) lacks an automated mechanism to look
> >> up those jars they have to be provided manually when starting an
> >> application (e.g. through a shell script) and putting them into a common
> >> directory saves people's nerves.
> > 
> >> Making the jar location variable is easy, making applications work can
> >> be hard (patching scripts etc). I don't see much value in making this
> >> configurable either.
> > 
> >   What you mean by "variable"? Packages represent finished software
> > bundles, are supposed to be installed in specific place, don't have
> > special requirement of being relocatable, and are not supposed to be
> > tweak by users besides some specially marked config files.
> Yes, I was only talking about being variable/configurable at build time.

Having it fixed at runtime is fine. I'm happy with this as long as
someone could in theory change the path (just like they can change
prefix, bindir, sysconfdir etc.).

> >   Another thing, you should not assume that every distro will *build*
> > packages to be installed to /usr. Instead, OE offers location
> > variables (based on standard GNU configure path vars) for packages to
> > use. So, please don't hardcode /usr or something into your recipes.
> > Default CLASSPATH is ${datadir}/java thus (worth defining datadir_java
> > for that, so it was further configurable).
> Yes, I am using ${datadir}/java everywhere. ${datadir_java} would be no
> problem either. Should that go into bitbake.conf? 

Yes, but call it javadir or something, the '_' character is both special
and overused and I dread to think what would happen if "java" ever made
it into OVERRIDES!

> And what about
> staging. Is using ${STAGING_DATADIR}/java and
> ${STAGING_DATADIR_NATIVE}/java OK?

No, staging is moving to a state where it matches the target system
layout. At the moment the layout_* variables don't match the target
system layout but they are going to change to. Please try and follow
that style and ask me if you need an pointers on how to do it. Poky
shows how these variables will look after the changeover.

> >   So, once again, please don't hardcode paths in *your*
> > .bb's/.bbclass'es. But of course, patching 3rd party code to fully
> > adhere to this is yet another "another task". But if you can check for
> > this at least core components, like standard java runtime,
> > that would be appreciated.
> That would be possible. Is there a nice way to preprocess a patch? I
> would like to run sed on it to replace the hard coded path.

Ideally we should add a function to base.bbclass to make this kind of
thing simpler.

> >> c) naming
> >> Debian names packages containing only jars lib<PN>-java. If it has a
> >> corresponding JNI library it is called lib<PN>-jni. I would like to
> >> adopt this for OE. With the help of a bbclass for java library recipes
> >> this safes boilerplate. I have an early version of such a bbclass in the
> >> Jalimo repository for everyone to look at, criticise and enhance. :)
> > 
> >   Oh, these misguided debian naming conventions! (well, depends) We
> > already have inconsistency with this in OE. Python uses prefix, Perl -
> > suffixes. Chose your way ;-).
> Oh well. Adhering to the Debian rules makes java-gnome
> libjava-gnome-java which isnt exactly what I call a nice package name.
> Still for many other packages it is OK and in regard to the JNI packages
> I think it makes sense to use suffixes.

The suffixes look good to me. Whilst we roughly follow debian, we don't
have to copy, if we have ideas to make it nicer, I'm all in favour ;-).

Cheers,

Richard





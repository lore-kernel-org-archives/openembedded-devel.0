Received: from [217.146.130.193] (helo=chlothar.bnv-bamberg.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ba0547@bnv-bamberg.de>) id 1Lexyv-00045t-5t
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 21:46:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bnv-bamberg.de; s=mail2008; h=Subject:From:To:In-Reply-To:
	References:Content-Type:Date:Message-Id:Mime-Version:
	Content-Transfer-Encoding; bh=uS3utiH28knxBXVKQLvMcsYJFDO5ZWJ7QD
	IIHxE7RSA=; b=h93tpjcOZRkoZKuJPxUkeXOzXEpR4SooIzOadJtwpsea6WZ4LY
	+6hyzsyR1e0/ewZ+xemTleUGS7TEUnglcqb/YpQVC7mOGbFdP3SP4xwPCdCB7QNm
	2e5GDqNRDrL1+b3NQp6DO9x9j4gY7lSyMBWfMXJMC8QQHyaGOARmn4RRE=
Received: from localhost ([127.0.0.1] helo=chlothar.bnv-bamberg.de)
	by chlothar.bnv-bamberg.de with esmtp id 1Lexup-0000j7-Kl 
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 21:42:07 +0100
Received: from w0659.w.pppool.de ([89.58.6.89] helo=[192.168.2.3])
	by chlothar.bnv-bamberg.de with esmtpa (Exim 4.69)
	(envelope-from <ba0547@bnv-bamberg.de>) id 1Lexup-0000i0-Am
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 21:42:07 +0100
From: harald <ba0547@bnv-bamberg.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090304202357.GZ26343@smtp.west.cox.net>
References: <1236178350.4249.5.camel@debian.dorg.org>
	<20090304153617.GQ26343@smtp.west.cox.net>
	<1236195338.4249.20.camel@debian.dorg.org>
	<20090304194502.GX26343@smtp.west.cox.net>
	<1236197506.4249.25.camel@debian.dorg.org>
	<20090304202357.GZ26343@smtp.west.cox.net>
Date: Wed, 04 Mar 2009 21:42:04 +0100
Message-Id: <1236199324.4249.36.camel@debian.dorg.org>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Compile OE on Sun Ultrasparc 64 architecture?
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
X-List-Received-Date: Wed, 04 Mar 2009 20:46:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 04.03.2009, 13:23 -0700 schrieb Tom Rini:
> On Wed, Mar 04, 2009 at 09:11:46PM +0100, harald wrote:
> [snip]
> > > > | /bin/sh ../sparc64-linux-libtool --mode=compile
> [snip]
> > libtool was not even installed. there is no libtool-devel package
> > available for lenny at all. for none of the architectures. have
> > installed libtool 1.5.26-4. No updates available. same message than
> > before. do i need to reconfigure if i installed addidional packages on
> > build host? if yes, how do i do it? think the problem is anywhere in
> > sparc configuration. system compiles without libtool on x86_64 machine.
> 
> OE is making use of libtool, the version that it compiles for its own
> use, I believe, in this case.  Debian as you note provides a host
> libtool 1.5.26.  Perhaps Debian has a patch in libtool that needs to be
> imported to OE's version for it to have a correct sparc configuration.
> Or the problem could be deeper / elsewhere.  Traditionally, sparc hasn't
> been the most ... easy to use ... platform, so you may need to do some
> serious digging around to see just where the problem lies.
> 

i am not good enougth to dig in system to see where the problem is...
think at this point its the end of build host on sparc for me. have
several other machines which may also compile a OE system. i want to use
the sparc machine because i thought i would be the same debian
installation as on my x86_64 machine and this machine i can let run the
whole night long... if anyone is interested supporting this build
platform i would do some testing. libtool was not even installed first
time i did bitbake, so this may not be the problem of compilation
error. 

do i need to reconfigure anything if i install addidional packages on
build host? 




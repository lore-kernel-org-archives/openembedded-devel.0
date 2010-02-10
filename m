Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NfHk0-0007EJ-6D
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 19:56:51 +0100
Received: from [85.210.8.8] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NfHhW-0001NV-NM
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 18:54:14 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1265817038.9956.1.camel@dax.rpnet.com>
References: <1265247822-20734-1-git-send-email-denis@denix.org>
	<1265302671.25338.57.camel@conroy-linux>
	<20100204172234.GA5641@denix.org>
	<1265306225.26642.3.camel@trini-m4400>
	<1265461459.5019.20.camel@lenovo.internal.reciva.com>
	<1265655603.16517.13.camel@trini-m4400>
	<20100209200804.GA3142@gmail.com>
	<1265751396.6312.15.camel@trini-m4400>
	<1265817038.9956.1.camel@dax.rpnet.com>
Date: Wed, 10 Feb 2010 18:54:13 +0000
Message-ID: <1265828053.6761.142.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.8.8
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] meta-toolchain: make SDK relocatable by	using $SDK_PATH var in env setup script
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
X-List-Received-Date: Wed, 10 Feb 2010 18:56:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-02-10 at 15:50 +0000, Richard Purdie wrote:
> On Tue, 2010-02-09 at 14:36 -0700, Tom Rini wrote:
> > On Tue, 2010-02-09 at 12:08 -0800, Khem Raj wrote:
> > > On (08/02/10 12:00), Tom Rini wrote:
> > > I think the prerequisites of gcc libmpfr, libgmp and libmpc from 4.5
> > > onwards are probably not used by 
> > > any other tools we stage for host so it would be safer to build them inside
> > > gcc tree and link in statically and only create runtime deps on the
> > > libraries that always exist like libc. This will have better chance of
> > > relocation. We just need to untar these libraries in top of gcc src tree
> > > and it will use cofigure and use it. But this only solves gcc issue 
> > > for other host/cross packages which depend upon libs from staging we still
> > > need a solution. 
> > 
> > I was thinking that too.  Phil, can you try on your toolchain branch to
> > do this? :)
> 
> Another generic solution I'm wondering about is postprocessing the
> cross/native binaries with chrpath. This has the benefits of no horrible
> shell quoting and its generic.

Yeah, either that or wrapping the binaries in something (either a binayr
or just a shell script) which invokes the dynamic linker with an
appropriate library path.  That would also handle your situation where
you have a custom ld.so as well.

p.





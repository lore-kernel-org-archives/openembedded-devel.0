Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1HuC06-0000tD-MH
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jun 2007 20:37:26 +0200
Received: by wa-out-1112.google.com with SMTP id l24so726031waf
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2007 11:35:32 -0700 (PDT)
Received: by 10.114.166.1 with SMTP id o1mr2070844wae.1180722932368;
	Fri, 01 Jun 2007 11:35:32 -0700 (PDT)
Received: by 10.114.144.2 with HTTP; Fri, 1 Jun 2007 11:35:32 -0700 (PDT)
Message-ID: <432beae0706011135u58bb4e76t3e3b326d56a19e2a@mail.gmail.com>
Date: Fri, 1 Jun 2007 11:35:32 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1180717608.6390.200.camel@localhost.localdomain>
MIME-Version: 1.0
References: <bdb0025f0705301542s7e64e43cjb5b737e7f1958806@mail.gmail.com>
	<1180705209.6390.39.camel@localhost.localdomain>
	<432beae0706010755m47a91208obc66cc688a6f6f90@mail.gmail.com>
	<1180717608.6390.200.camel@localhost.localdomain>
Subject: Re: strange error: missing depends...
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
X-List-Received-Date: Fri, 01 Jun 2007 18:37:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 6/1/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Fri, 2007-06-01 at 07:55 -0700, Justin Patrin wrote:
> > In the spirit of giving users more info, I've noticed that lately
> > OE/bitbake will compile all of the packages and only start the
> > do_package_write once almost everything is built, before the image I'm
> > targeting gets built.
> >
> > I've figured out that this is due to dependency handling as what
> > depends on the packages being written to disk is the creation of the
> > image, which installs from those packages. The packaging also seems to
> > happen if I directly bitbake a provider. It seems somewhat strange
> > that bitbaking something which depends on something else doesn't cause
> > the dependency to create its package...
>
> If A DEPENDS on B and you want A (you bitbake A), do you need the
> package from B? The answer is you don't, you only need B to stage.
>

This is true, DEPENDS is just build. What I really meant was RDEPENDS.

> The dependency chains tell bitbake when it needs to build the package
> and it only does thinsg which it needs.
>
> This is totally configurable. You could add something to local.conf
> which always caused dependent packages to build if you so wished...
>

I understand this all and I also understand how and why bitbake is
doing what it's doing. My observation was that the common user
expectation, IMHO, is that doing: "bitbake nano" will build the nano
ipk(s) and all ipks of all RDEPENDS so that it is immediately
installable.

I would also expect that *any* package built, including DEPENDS would
be packaged as well but this is of lesser consequence.

Perhaps this expectation is only due to my use of previous bitbake/OE
iterations which always did this. If bitbake is not going to package
for all built recipes I'd suggest that this information be added to
the manual next to informaiton on how to make it build the packages
(hopefully via another command instead of adding a dependency to
local.conf...).

> Add some details about the options to the bitbake manual is on my todo
> list and is one reason I've not made the imminent bitbake release.
>

:-)

-- 
Justin Patrin



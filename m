Received: from [64.233.162.235] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1HuBNP-0004x8-QA
	for openembedded-devel@openembedded.org; Fri, 01 Jun 2007 19:57:27 +0200
Received: by nz-out-0506.google.com with SMTP id 9so522712nzo
	for <openembedded-devel@openembedded.org>;
	Fri, 01 Jun 2007 10:55:34 -0700 (PDT)
Received: by 10.114.175.16 with SMTP id x16mr2083777wae.1180720533862;
	Fri, 01 Jun 2007 10:55:33 -0700 (PDT)
Received: by 10.115.75.15 with HTTP; Fri, 1 Jun 2007 10:55:33 -0700 (PDT)
Message-ID: <bdb0025f0706011055g6e50927j97439ee462db7921@mail.gmail.com>
Date: Fri, 1 Jun 2007 14:55:33 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1180717608.6390.200.camel@localhost.localdomain>
MIME-Version: 1.0
References: <bdb0025f0705301542s7e64e43cjb5b737e7f1958806@mail.gmail.com>
	<1180705209.6390.39.camel@localhost.localdomain>
	<432beae0706010755m47a91208obc66cc688a6f6f90@mail.gmail.com>
	<1180717608.6390.200.camel@localhost.localdomain>
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Fri, 01 Jun 2007 17:57:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I believe that sometimes you just need the packageA without their
rdepends, but it will be pretty useful it bitbake provided an easy
option to build every depends... something like:
bitbake packageA --build-rdepends

Another idea that I have for the case that you want to build
everything is an option --dontstop that makes bitbake don't stop when
a rdepends build fail.
Doing this is possible to leave the build go to drink coffe, to sleep,
etc and when coming back you can check the log to see if everything
was build.

But for this I believe that is necessary a good log in html too...
Yes, I've already noticed that there is something like this in
bitbake1.8 but I didn't verify if this is working yet...

All these things are just ideas that would make our lives better (at leas mine).

Thanks,
Regards,
vivijim

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
> The dependency chains tell bitbake when it needs to build the package
> and it only does thinsg which it needs.
>
> This is totally configurable. You could add something to local.conf
> which always caused dependent packages to build if you so wished...
>
> Add some details about the options to the bitbake manual is on my todo
> list and is one reason I've not made the imminent bitbake release.
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



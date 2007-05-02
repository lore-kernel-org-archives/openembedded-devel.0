Received: from [64.233.162.233] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1HjLkL-0005VR-Kn
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2007 22:48:21 +0200
Received: by nz-out-0506.google.com with SMTP id m22so257099nzf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2007 13:38:55 -0700 (PDT)
Received: by 10.114.180.1 with SMTP id c1mr353593waf.1178138334498;
	Wed, 02 May 2007 13:38:54 -0700 (PDT)
Received: by 10.115.92.3 with HTTP; Wed, 2 May 2007 13:38:54 -0700 (PDT)
Message-ID: <432beae0705021338x7ca36c0oc937a6b1b03f6db5@mail.gmail.com>
Date: Wed, 2 May 2007 13:38:54 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <bdb0025f0705021252w7e32b305ybf9c914c1cb1edc0@mail.gmail.com>
MIME-Version: 1.0
References: <bdb0025f0705021104x23d2c407rb4da0e48e24eb911@mail.gmail.com>
	<200705022051.03720.openembedded@hrw.one.pl>
	<bdb0025f0705021252w7e32b305ybf9c914c1cb1edc0@mail.gmail.com>
Subject: Re: generating debian source packages (dsc)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 May 2007 20:48:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 5/2/07, Rodrigo Vivi <rodrigo.vivi@gmail.com> wrote:
> > classes/sourcepkg.bbclass is something which you want to extend
>
> I've thought about it but I'm not sure that it is a good idea because
> just few projects (or just mine) needs the dsc file .......... unless
> that I code another sourcedsc.bbclass that inherit the
> sourcedpkg.bbclass... o you think that it will work???  I'll think
> about it...
>

Yes, this is what Marcin meant. Create your own sourcedsc.bbclass
which inherits sourcepkg.bbclass. This is how, for example,
efl.bbclass and e.bbclass work.

> Another doubt that I forgot to mention on last email is about changelog:
> I'm generating a almost empty changelog file. Is there any official
> and/or more appropriated way to do that?
>
> Thanks,
> Vivi.
>
> >
> > --
> > JID: hrw-jabber.org
> > OpenEmbedded developer/consultant
> >
> >       I'm trying to decide if I should kill you or simply feign death
> >       until you feel awkward and leave.
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


-- 
Justin Patrin



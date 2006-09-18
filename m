Received: from [64.233.182.185] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <leoncamel@gmail.com>) id 1GPGbN-0001be-V2
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Sep 2006 12:43:50 +0200
Received: by nf-out-0910.google.com with SMTP id l23so3034423nfc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2006 03:39:49 -0700 (PDT)
Received: by 10.49.21.8 with SMTP id y8mr16745665nfi;
	Mon, 18 Sep 2006 03:39:48 -0700 (PDT)
Received: by 10.48.215.2 with HTTP; Mon, 18 Sep 2006 03:39:48 -0700 (PDT)
Message-ID: <ad39a30f0609180339x7818d187w293de79d99abd7a6@mail.gmail.com>
Date: Mon, 18 Sep 2006 18:39:48 +0800
From: "Leon Zhang" <leoncamel@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <1158574365.5494.2.camel@gandalf.tm.informatik.uni-frankfurt.de>
MIME-Version: 1.0
References: <ad39a30f0609180015wc6ba838vff48fef6d7d41f7d@mail.gmail.com>
	<1158569272.13420.28.camel@gandalf.tm.informatik.uni-frankfurt.de>
	<ad39a30f0609180203w552c0040g6ca3b2746a751d13@mail.gmail.com>
	<1158574365.5494.2.camel@gandalf.tm.informatik.uni-frankfurt.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.8
Subject: Re: opie-freetype issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Sep 2006 10:43:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

2006/9/18, Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>:
>
> Am Montag, den 18.09.2006, 17:03 +0800 schrieb Leon Zhang:
> > 2006/9/18, Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de
> >:
> > >
> > > Am Montag, den 18.09.2006, 15:15 +0800 schrieb Leon Zhang:
> > > >       hey, I am trying to fix the bug about opie-freetype.
> > >
> > > Which bug are we talking about?
> >
> >
> > Yesterday, I build opie-image failed. I got a dependency error. and I
> *did*
> > get nonthing in tmp/work/armv5te-linux/opie-freetype-1.2.2-r0/install/*.
> So,
> > I wrote the patch above. and if you check the irc log yesterday, you
> would
> > get more details talks about it.
>
> Missing dependencies is a different problem -- which can't be fixed
> by adding additional files within do_install. I'm afraid your
> distribution
> configuration is bogus.


Hmm, I don't thinks so. I am sure my configuration is correct. and that is a
*bug* indeed. Well, Please read

http://www.openembedded.org/viewmtn/diff.psp?id1=eea65847cfef3a7ff53e70dcfed248b5ad86b7fb&id2=b130be4ae6b3151966b2c1336b7712bfd28c58ac&fname=classes/opie.bbclass
for more information.

> >  I found that the
> > > > current package can't install anything into
> > > "tmp/work/armv5te-linux/opie-
> > > > freetype-1.2.2-r0/install/". So, I write a patch which add
> "do_install"
> > > > function to install something into the directory. Here is the patch,
> > >
> > > That's redundant. Opie installs plugins during the opie_install task
> as
> > > per opie.bbclass.
>
> > Well, is there better patch for this ?
>
> There is no need for a patch since this package used to work for years.
> If it doesn't nowadays, then there is something going wrong elsewhere.
>
> Marcin, please revert this patch.
>
> --
> Regards,
>
> Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


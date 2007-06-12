Received: from [72.14.204.232] (helo=qb-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1Hy7FP-0002N2-Fv
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jun 2007 16:21:27 +0200
Received: by qb-out-0506.google.com with SMTP id z1so2278572qbc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2007 07:18:31 -0700 (PDT)
Received: by 10.115.107.1 with SMTP id j1mr6705773wam.1181657909706;
	Tue, 12 Jun 2007 07:18:29 -0700 (PDT)
Received: by 10.115.75.15 with HTTP; Tue, 12 Jun 2007 07:18:29 -0700 (PDT)
Message-ID: <bdb0025f0706120718r1f90eadfoc5fccadb3d7263ed@mail.gmail.com>
Date: Tue, 12 Jun 2007 11:18:29 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1181645855.5628.4.camel@localhost.localdomain>
MIME-Version: 1.0
References: <bdb0025f0706111249n4b28df89p9cbaffa43de7ee06@mail.gmail.com>
	<1181645855.5628.4.camel@localhost.localdomain>
Subject: Re: strange error when coding a bbclass
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
X-List-Received-Date: Tue, 12 Jun 2007 14:21:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 6/12/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Mon, 2007-06-11 at 16:49 -0300, Rodrigo Vivi wrote:
> > I have this dummy function in dummyclass.bbclass
> >
> > python do_blah () {
> >     print "teste"
> > }
> >
> > just it...
> >
> > The strangest thing is that the error depends where I add this task:
> > * addtask blah before do_patch  # it breaks do_patch of quilt-native
> > * addtask blah before do_configure # it breaks do_stage of quilt-native
> > * addtask blah before do_install # it breaks do_configure of linux-libc-headers
> > # All logs are in the end of this e-mail.
> >
> > This is a very stupid and almost empty function that does nothing
> > important but the build breaks...
>
> Its not stupid, its by design.

Sorry, I mean my function is stupid. it does anything but a print.

>
> addtask inserts a dependency so if you add
>
> addtask blah before do_configure
>
> You are saying that say "patch" must run, followed by "blah" followed by
> "configure". Bitbake will check the task dependencies and build them if
> they're missing. If a subsequent task has a timestamp older than its
> dependencies it will rerun them too (just on a per recipe basis at
> present). There have been requests to extend that so if you rebuild gtk
> +, all the gtk apps will rebuild and we will probably optionally allow
> that in due course (it should be easy with the new bitbake core).

I've noticed that and it makes sense. What I really cannot understand
is how a very simple function that does anything but a print can break
that packages?

>
> Cheers,
>
> Richard

Thanks,
vivijim

>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


-- 
Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net



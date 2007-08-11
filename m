Received: from [209.85.128.189] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1IJudC-0000DC-Lu
	for openembedded-devel@openembedded.org; Sat, 11 Aug 2007 19:20:06 +0200
Received: by fk-out-0910.google.com with SMTP id 18so1033239fks
	for <openembedded-devel@openembedded.org>;
	Sat, 11 Aug 2007 10:20:05 -0700 (PDT)
Received: by 10.82.156.12 with SMTP id d12mr6463242bue.1186852805358;
	Sat, 11 Aug 2007 10:20:05 -0700 (PDT)
Received: by 10.82.117.9 with HTTP; Sat, 11 Aug 2007 10:20:05 -0700 (PDT)
Message-ID: <74d0deb30708111020k3645b5d9n9987a6fb6253c90b@mail.gmail.com>
Date: Sat, 11 Aug 2007 19:20:05 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1186839485.5859.39.camel@localhost.localdomain>
MIME-Version: 1.0
References: <74d0deb30708100622mb2c048et188fca0c03e8117e@mail.gmail.com>
	<1186761021.6405.45.camel@localhost.localdomain>
	<74d0deb30708110320n3cebe757seccd90801ee49e5a@mail.gmail.com>
	<1186836221.5859.32.camel@localhost.localdomain>
	<46BDB40D.4000301@dominion.kabel.utwente.nl>
	<1186839485.5859.39.camel@localhost.localdomain>
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] a small bbclass for task recipes
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
X-List-Received-Date: Sat, 11 Aug 2007 17:20:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 8/11/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Sat, 2007-08-11 at 15:05 +0200, Koen Kooi wrote:
> > Richard Purdie schreef:
> > > On Sat, 2007-08-11 at 12:20 +0200, pHilipp Zabel wrote:
> > >> I guess it should to something like
> > >> PACKAGES = "${PN} ${PN}-dbg ${PN}-dev" or not touch packages at all,
> > >> if the code also works for -doc and -locale and enable that code,
> > >> however it is done.
> > >
> > > PACKAGES shouldn't need touching. Empty -doc and -locale packages won't
> > > get created.
> >
> > Even with ALLOW_EMPTY="1"?
>
> Hmm. I guess adding ALLOW_EMPTY_foo = "1" for each task is boring so we
> could be doing:
>
> ALLOW_EMPTY_${PN}-doc = "0"
> ALLOW_EMPTY_${PN}-locale = "0"
>
> Is that preferable to overriding PACKAGES?

Good question. Those two lines are ugly enough to support
my wish to create task.bbclass instead of plastering them into each
and every task recipe :)

OTOH if we one day decide to add another ${PN}-something to base PACKAGES,
(${PN}-staging?),  this has to be adapted - not so if we overwrite PACKAGES.

regards
Philipp



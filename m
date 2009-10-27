Received: from [209.85.160.53] (helo=mail-pw0-f53.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rk.raggit@gmail.com>) id 1N2kdR-0006ky-MK
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 12:54:49 +0100
Received: by pwi18 with SMTP id 18so23467pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 04:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=V/zyvydEQ3iVN9pbTDCLWTtZHtlbUHW/2Tg22ZWQHts=;
	b=YkXvepXIkW4qlJ66nx3IU3xJZAQGlQHvtniC3uFUwb8y2FdRY/0boBZarIw0XaX0SP
	utWIcBAETz1dGULFgGXuV1WxZNy2txyovhNHqcoT5zTK17FwV8gmJw5HUHqDrFLobl8k
	qYNlLXTS2seGBsl3htSBZ2aRk+7wAv67D7+X0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NApFZX7Eg5TotqthCDUf5E983857Fu4j8l/uci2hDSeOREua9kAvP1kssFYcwAHO8B
	DZ2oUMpq36EM0VgjJrh+K/YHfqZuQg9EpHo6fLLLwy+VW/xRUnsW9qg8mbn5UtpHK5Wq
	ZK3mUzuCaMLyd4pdK9cREOyPhUQX+6YWQP41I=
MIME-Version: 1.0
Received: by 10.140.194.12 with SMTP id r12mr2119820rvf.65.1256644418994; Tue, 
	27 Oct 2009 04:53:38 -0700 (PDT)
In-Reply-To: <1256563179.23985.13.camel@mill.internal.reciva.com>
References: <ec1f3d400910230421r4509e19amc899870bdd640ce5@mail.gmail.com>
	<ec1f3d400910260325i54971290u914ff2c0a6ca301d@mail.gmail.com>
	<1256563179.23985.13.camel@mill.internal.reciva.com>
Date: Tue, 27 Oct 2009 17:23:38 +0530
Message-ID: <ec1f3d400910270453q2285bf57q98eada6fd37fcecc@mail.gmail.com>
From: RK Raggit <rk.raggit@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: rk.raggit@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [help] openembedded tarball sources on HTTP
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
X-List-Received-Date: Tue, 27 Oct 2009 11:54:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks for your reply Phil.

I set my ~/.subversion file with http proxy information and when i tried the
following, it succeeded -

#> svn co http://svn.collab.net/repos/svn/trunk subversion

Based on this i infer that my SVN ports are not blocked by the proxy.

Next i upgraded to cvs-1.12.10 which has support for http proxy tunnelling.
When i ran this ...

#> ./usr/bin/cvs '-d:pserver;proxy=xx.xx.xx.com
;proxyport=8080:anonymous@cvs.sv.gnu.org:/cvsroot/config' co -D "20050701
UTC" config

the command returned with this error "cvs [login aborted]: proxy server
xx.xx.xx.com:8080 does not support http tunnelling"

So i infer CVS-over-http tunnelling is not possible on my network ...but SVN
works directly. So thats one good news and one bad !

I will try other options mentioned -- using sources of available
distributions and using released tarballs (and also pursue my case with the
network admin ;) )

--RK


On Mon, Oct 26, 2009 at 6:49 PM, Phil Blundell <pb@reciva.com> wrote:

> I don't think anybody is publishing a comprehensive set of SCM-derived
> source tarballs.  As you say below, oesources.org was the closest to
> this but, since its demise, I don't think anybody else has stepped
> forwards to fill the vacancy.  Some individual DISTROs do mirror the
> sources that they are using, and you might like to check whether your
> distro falls into that category, but I don't believe there is any
> cross-distribution source mirror at present.
>
> Indeed, mirroring a full set of tarballs for every conceivable
> SRCDATE/SRCREV would be a somewhat daunting undertaking: a more feasible
> option would probably be to do an svn-over-http kind of proxy thing,
> where a request for something like
> http://svnproxy.oe.org/checkout?uri=svn://eleet.org/repository&rev=1234
> would run the checkout in real time and hand you back a tarball.  If you
> wanted to implement such a thing then it might be feasible to get it
> hosted on one of the oe.org machines.
>
> However, most/all recipes do offer at least one released tarball which
> you should be able to use rather than checking out from SCM every time.
> If you find a particular package whose sources are simply not available
> any other way than CVS or SVN then post the details here and someone may
> be able to point you at a tarball.
>
> p.
>
> On Mon, 2009-10-26 at 15:55 +0530, RK Raggit wrote:
> > anyone with some idea on this .. ? sorry for pushing , but i am kind of
> > evaluating OE and would like to know whether this is possible at all ?
> >
> > ...unblocking cvs,svn ports is defnitely not an option for me.
> >
> > --RK
> >
> > On Fri, Oct 23, 2009 at 4:51 PM, RK Raggit <rk.raggit@gmail.com> wrote:
> >
> > > Hi there,
> > >
> > > I am building openembedded recipes but i am behind a proxy that only
> allows
> > > http accesses and blocks cvs,svn ports.
> > >
> > > I would like to know where i can obtain pristine OE package (tarball)
> > > sources from a HTTP link. I tried
> > >
> > > http://oesources.org/source/current
> > >
> > > ...but that link does not work. Could someone please guide me the
> correct
> > > link ? I will update my CVS_TARBALL_STASH
> > > variable with this link.
> > >
> > > Thanks
> > > RK
> > >
> > >
> > >
>  > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


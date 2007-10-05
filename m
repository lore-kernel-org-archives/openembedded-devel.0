Received: from [209.85.132.245] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hvontres@gmail.com>) id 1IdqeX-0005s7-Nb
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2007 19:07:54 +0200
Received: by an-out-0708.google.com with SMTP id b33so79916ana
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2007 10:02:28 -0700 (PDT)
Received: by 10.142.253.21 with SMTP id a21mr1676127wfi.1191603747644;
	Fri, 05 Oct 2007 10:02:27 -0700 (PDT)
Received: by 10.143.11.12 with HTTP; Fri, 5 Oct 2007 10:02:27 -0700 (PDT)
Message-ID: <a7f8874a0710051002y3a6a4d83t9a9a008fff91532b@mail.gmail.com>
Date: Fri, 5 Oct 2007 10:02:27 -0700
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1191601344.17230.22.camel@localhost.localdomain>
MIME-Version: 1.0
References: <F38DEABE0E171746B133C1ABBD142D97071112B2@radmail.Radstone.Local>
	<1191601344.17230.22.camel@localhost.localdomain>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Cc: openembedded-devel@openembedded.org
Subject: Re: SVN fetcher behaviour
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
X-List-Received-Date: Fri, 05 Oct 2007 17:07:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/5/07, Philippe De Swert <philippedeswert@scarlet.be> wrote:
>
> Hello all,
>
> On Thu, 2007-10-04 at 11:57 +0100, Martyn Welch wrote:
> > It is failing to download gconf-dbus using "gconf-dbus_svn.bb". It seems
> > that the script does not specify a revision and it therefore trying to
> > download revision 1. This fails.
> >
> > I have managed to get the script to continue buy hacking the script to
> > get it to download the current revision (608), by adding "rev=608" to
> > the SRC_URI.
>
> I ran into a similar problem recently and it seems you need to edit
> ../org.openembedded.dev/conf/distro/include/sane-srcdates.inc or make
> sure it is included in your distro.
>
> > I've looked at
> > http://www.openembedded.org/user-manual&dpage=src_uri_variable, which
> > (under "SVN") describes the behaviour of the svn fetcher. This doesn't
> > seem to specify what the default behaviour of the svn fetcher is when no
> > revision is specified, I'd assumed it would be the "head", though I am
> > now having some doubt.
>
> I think this should be the default behaviour, unfortunately it is not.
> The expected behaviour is fetch the latest revision and build it but it
> dies not.  I think ib general it is a great improvement for managing svn
> revisions, but it sucks at building the latest and newest.
>
> Cheers,
>
> Philippe
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
<http://bugs.openembedded.org/show_bug.cgi?id=2897>

The default of "1" is set in conf/bitbake.conf. The reason for this is that
any svn recipe without an explicit SRCREV set will cause parsing to fail if
the build machine or the svn server is off line. If you can live with this
limitation, then you could comment that line out to get the default
behavior.



-- 
Henry von Tresckow (hvontres)


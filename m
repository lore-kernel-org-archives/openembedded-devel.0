Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RfcLS-00084g-Rs
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Dec 2011 20:05:55 +0100
Received: by vbbfc21 with SMTP id fc21so9389433vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Dec 2011 10:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=+IIMHZFlzXXrMZ6Ibc/PL6bKsf9CkhNKtZxlBA7YdI0=;
	b=bQo/GYEYmf3MF6auHYvnOZlmWXJA0ClVq4EBHz8zx4nrOsyWtuhCjafB5UOz33p/uV
	SD/c7EcTvMqFARhqUOzGci3wFwH5NTjRtJqxKi2wsX80aBpH/QZpJ+i6UKApgRw2icmv
	xLtfXAFmh4APE8f2JQu1KGw9L0E+VE+ZLnDs4=
MIME-Version: 1.0
Received: by 10.52.65.129 with SMTP id x1mr15350416vds.11.1325012319882; Tue,
	27 Dec 2011 10:58:39 -0800 (PST)
Received: by 10.52.160.137 with HTTP; Tue, 27 Dec 2011 10:58:39 -0800 (PST)
In-Reply-To: <CA+M6bXmmJENqVDy+Ym+65a5D6jmzjJQAR4T=2y=8CZs_W1hHyA@mail.gmail.com>
References: <CACW_hTbaEcTcwhut+9NJX6yci6Mu6w+uhqB3xKcfORSg5gM2FA@mail.gmail.com>
	<CA+M6bXn4T8YO5SwiotYJcy3K2ioQtUBsGLCTOXCZZE=yU2vdBg@mail.gmail.com>
	<CACW_hTZkQw6G=D=vKo1KUkHmbT-ODu7uPVH0ebbh-E7=R8zKMA@mail.gmail.com>
	<CA+M6bXmmJENqVDy+Ym+65a5D6jmzjJQAR4T=2y=8CZs_W1hHyA@mail.gmail.com>
Date: Tue, 27 Dec 2011 19:58:39 +0100
Message-ID: <CACW_hTbpGsdGp5aK=CRh7_FR05GWgfptf5V4VEOt=R8v3==_Vw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [2011.03-maintenance] net-snmp: please cherry pick 4a98e62ac35d4367d3c072819317deeda52abf5e from master
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
X-List-Received-Date: Tue, 27 Dec 2011 19:05:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/12/27 Tom Rini <tom.rini@gmail.com>

> On Tue, Dec 27, 2011 at 11:28 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
> > 2011/12/27 Tom Rini <tom.rini@gmail.com>
> >
> >> On Mon, Dec 26, 2011 at 1:29 PM, Frans Meulenbroeks
> >> <fransmeulenbroeks@gmail.com> wrote:
> >> > Please merge this one
> >> >
> >>
> http://cgit.openembedded.org/openembedded/commit/?id=4a98e62ac35d4367d3c072819317deeda52abf5e
> >> >
> >> > to the maintenance tree. it updates net-snmp to 5.7.1; the existing
> >> version
> >> > does not build for uclibc; this fixes it.
> >>
> >> Per the wiki page, this is not a proper request for the maintenance
> >> branch, please re-submit a pull request with the cherry-pick tested
> >> and confirmed to fix the issue, thanks.
> >>
> >> This has been tested for meta-oe (by Eric) and for the maintenance
> branch
> > (by me, actually it is part of our most recent product) and
> compile-tested
> > by me on master.
> > I'm not planning to set up a git or branch for a single patch. I'll mail
> a
> > patch in a few minutes.
> > Didn't know we became this bureaucratic. Will take that into account when
> > considering submitting my next patch.
>
> Yes, I'm only taking cherry-picks that others have done and
> send-email'd or pull requests and not individual cherry-pick requests
> so that I can be sure that the person requesting the change is sure
> this deals with their issue fully.  Sorry if I wasn't clear that
> individual patches are also fine (the wiki page does say patches or
> pull requests already, just re-confirmed).  Thanks.
>
> --
> Tom
>
> patch send,. it applies without any problem on the maintenance branch.
Could not compile-test it on the maintenance branch. When I tried to it
wanted to build binutils 2.21 but that one did not fetch.
See log below.
BTW opg-utils also is a non-fetcher.

Frans

NOTE: Running task 219 of 676 (ID: 332, /home/frans/oe/recipes/binutils/
binutils-cross_2.21.bb, do_fetch)
--2011-12-27 19:52:31--
ftp://ftp.gnu.org/gnu/binutils/binutils-2.21.tar.bz2
            => `/home/frans/sources/binutils-2.21.tar.bz2'
NOTE: package binutils-cross-2.21-r13.3: task do_fetch: Started
 Resolving ftp.gnu.org... 140.186.70.20
 Connecting to ftp.gnu.org|140.186.70.20|:21... connected.
 Logging in as anonymous ... Logged in!
 ==> SYST ... done.    ==> PWD ... done.
 ==> TYPE I ... done.  ==> CWD (1) /gnu/binutils ... done.
 ==> SIZE binutils-2.21.tar.bz2 ... done.
 ==> PASV ... done.    ==> RETR binutils-2.21.tar.bz2 ...
 No such file `binutils-2.21.tar.bz2'.

 --2011-12-27 19:52:33--
ftp://mirrors.kernel.org/gnu/binutils/binutils-2.21.tar.bz2
            => `/home/frans/sources/binutils-2.21.tar.bz2'
 Resolving mirrors.kernel.org... 149.20.4.71
 Connecting to mirrors.kernel.org|149.20.4.71|:21... connected.
 Logging in as anonymous ... Logged in!
 ==> SYST ... done.    ==> PWD ... done.
 ==> TYPE I ... done.  ==> CWD (1) /gnu/binutils ... done.
 ==> SIZE binutils-2.21.tar.bz2 ... done.
 ==> PASV ... done.    ==> RETR binutils-2.21.tar.bz2 ...
 No such file `binutils-2.21.tar.bz2'.

 --2011-12-27 19:52:36--
ftp://ftp.cs.ubc.ca/mirror2/gnu/binutils/binutils-2.21.tar.bz2
            => `/home/frans/sources/binutils-2.21.tar.bz2'
 Resolving ftp.cs.ubc.ca... 142.103.6.49
 Connecting to ftp.cs.ubc.ca|142.103.6.49|:21... connected.
 Logging in as anonymous ... Logged in!
 ==> SYST ... done.    ==> PWD ... done.
 ==> TYPE I ... done.  ==> CWD (1) /mirror2/gnu/binutils ...
 No such directory `mirror2/gnu/binutils'.

 --2011-12-27 19:52:39--
ftp://sunsite.ust.hk/pub/gnu/binutils/binutils-2.21.tar.bz2
            => `/home/frans/sources/binutils-2.21.tar.bz2'
 Resolving sunsite.ust.hk... failed: Name or service not known.
 wget: unable to resolve host address `sunsite.ust.hk'
 --2011-12-27 19:52:40--
ftp://ftp.ayamura.org/pub/gnu/binutils/binutils-2.21.tar.bz2
            => `/home/frans/sources/binutils-2.21.tar.bz2'
 Resolving ftp.ayamura.org... 205.178.189.131
^C


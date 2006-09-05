Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <papercrane@gmail.com>) id 1GKRQq-0005fJ-QQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Sep 2006 05:17:00 +0200
Received: by py-out-1112.google.com with SMTP id i75so2477834pye
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Sep 2006 20:14:17 -0700 (PDT)
Received: by 10.35.30.17 with SMTP id h17mr11508192pyj;
	Mon, 04 Sep 2006 20:14:17 -0700 (PDT)
Received: by 10.35.119.19 with HTTP; Mon, 4 Sep 2006 20:14:16 -0700 (PDT)
Message-ID: <432beae0609042014n7bd201a6gff6914aaf994609e@mail.gmail.com>
Date: Mon, 4 Sep 2006 20:14:17 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <432beae0609041100k79a7ac8r5b0f097b2c71d0fd@mail.gmail.com>
MIME-Version: 1.0
References: <44FC280C.9070908@nslu2-linux.org>
	<432beae0609041100k79a7ac8r5b0f097b2c71d0fd@mail.gmail.com>
Subject: Re: [Fwd: Re: bitbake freeze]
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
X-List-Received-Date: Tue, 05 Sep 2006 03:17:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 9/4/06, Justin Patrin <papercrane@gmail.com> wrote:
> On 9/4/06, =D8yvind Repvik <nail@nslu2-linux.org> wrote:
> >
> > Michael 'Mickey' Lauer wrote:
> > > Am Montag, den 04.09.2006, 00:28 -0700 schrieb Justin Patrin:
> > >> I just remembered the old "freeze" command that John Bowler wrote a
> > >> while ago and tried to use it. Unfortunately it doesn't seem to work
> > >> with the current OE.
> > >
> > > [...]
> > >
> > >> I realize the shell isn't really the right place for this and that
> > >> this might be nicer in a bb file somewhere but this is how I could g=
et
> > >> it working.
> > >
> > > The shell is _exactly_ the right place for it -- since the command li=
ne
> > > parsing
> > > went so fast, we need to come up with new use cases ;)
> > >
> > >> Let me know what you think and any suggestions for making the code b=
etter.
> > >
> > > I'm not familiar with the old freeze command (or I forgot it...), can
> > > you summarize
> > > what you want to achieve?
> > >
> > The old freeze command looked at what had been built, and made a config
> > file with a BBFILES variable that specified each specific .bb-file used
> > (eg. samba_3.0.20.bb, glibc_2.3.3+cvs20050420.bb, etc.). The effect was
> > more or less "freezing" the the build, making a release easier.
> >
>
> That's one use-case. My current code doesn't do this yet (although it
> should be simple to fix it)..
>
> Ok, it's fixed and the patch is updated.
>
> My use-case for this is to get a list of the packages which have been
> built in order to just update the packages in my personal feed. This
> way I can just "mtn up" and "bitbake -k world" to update to the
> current versions of these packages (similar to "emerge -u world" in
> portage).
>
> Now the freeze command will output 2 files.
> frozen-bbfiles.conf is a list of all of the specific bbfiles which
> provide all of the build packages.
> BBFILES :=3D "\
> /home/papercrane/oe/org.openembedded.oz354x/packages/alsa/alsa-settings_0=
.0.1.bb
> \
> /home/papercrane/oe/org.openembedded.oz354x/packages/alsa/alsa-utils_1.0.=
10.bb \
> /home/papercrane/oe/org.openembedded.oz354x/packages/altboot/altboot_1.0.=
8.bb \
> /home/papercrane/oe/org.openembedded.oz354x/packages/apmd/apmd_3.2.2.bb \
> ...
>
> frozen-packages.conf is a list of all of the packages which provide
> all of the built packages
> BBFILES :=3D "\
> /home/papercrane/oe/org.openembedded.oz354x/packages/alsa/*.bb \
> /home/papercrane/oe/org.openembedded.oz354x/packages/altboot/*.bb \
> /home/papercrane/oe/org.openembedded.oz354x/packages/apmd/*.bb \
> /home/papercrane/oe/org.openembedded.oz354x/packages/atd/*.bb \
> /home/papercrane/oe/org.openembedded.oz354x/packages/autoconf/*.bb \
>

I keep forgetting to mention that this is against the 1.6 branch.

--=20
Justin Patrin



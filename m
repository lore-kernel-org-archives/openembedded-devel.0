Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ranjithkannikara@gmail.com>) id 1OdwyY-0005XC-5I
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 05:06:35 +0200
Received: by iwn34 with SMTP id 34so4455570iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 20:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=Dy/Cnc81zHy720oHmymzuSdqVXofOJmj1c2w5S4D2kE=;
	b=o/E24AfBhWof27P+sGlFpZatr1cavEsyoSqjzoNfpzhoOc4BfWplNr3NjvWhkKj2ZY
	cluZLmH7FWqwJy3cB+BdXiphV5c9fAjstySxunx73D9v/ohl6Csu2vNnL3FnTARpeG1R
	wxkdjl6K9KXKykawnMMJLKdGlxl/exWTuOpQU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=N13Mle9BJiPRIxA1dRZiS6rSYEdQeIMsL7Ri4J6rc3KbYSIvLp5p4zo4zp/lzqtpQr
	NtTcryljkro5Lw4o5R1+SPylf39nqyOUeSN/aL0JJLWyIQNUlTTVrxLC5c6TDfjxmyBy
	W4EYHEA8i5UYc43yjE0yAUO24v73iHBlVaCmQ=
Received: by 10.231.149.80 with SMTP id s16mr11245822ibv.81.1280286376211; 
	Tue, 27 Jul 2010 20:06:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.181.166 with HTTP; Tue, 27 Jul 2010 20:05:55 -0700 (PDT)
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B57B5@deimsg40.de.net.world>
References: <AANLkTik+1EuG8Se996jFqVfQBXc3fFqoYPGzHh4hRsV2@mail.gmail.com> 
	<1280222125.3763.6.camel@mattotaupa>
	<alpine.DEB.2.00.1007270523480.16599@lynx> 
	<0B51A1E7C61D114DAE6FC10B0FD0ABA5018B57B5@deimsg40.de.net.world>
From: ranjith kannikara <ranjithkannikara@gmail.com>
Date: Wed, 28 Jul 2010 08:35:55 +0530
Message-ID: <AANLkTino5uOku+4BeMp+3T3-X086eUhgtGXXQfX1xOwi@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: ranjithkannikara@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: bitbake error on ncurses_5.4.bb C compiler cannot create executables
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
X-List-Received-Date: Wed, 28 Jul 2010 03:06:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

hi,
Thanks for all the responses.
I am using
   bitbake 1.8.18
   openembedded latest git pull form dev
   os-ubuntu 10.04

I got the problem cleared by just commenting the line which has the flag
"-fforward- ***" in the file ncurses5.4.inc <http://ncurses5.4.bb/>

Regards,
Ranjith
On Tue, Jul 27, 2010 at 9:07 PM, Hauser, Wolfgang (external) <
Wolfgang.Hauser.external@eads.com> wrote:

> I use the http://gitorious.org/angstrom/openembedded repository, and the
> latest pull reports the same error to me !
>
> I build an image extending a console-base-image for opma3evm using angstr=
om
> distro.
>
> Regards
> Wolfgang Hauser
>
> -----Urspr=FCngliche Nachricht-----
> Von: openembedded-devel-bounces@lists.openembedded.org [mailto:
> openembedded-devel-bounces@lists.openembedded.org] Im Auftrag von Robert
> P. J. Day
> Gesendet: Dienstag, 27. Juli 2010 11:26
> An: openembedded-devel@lists.openembedded.org
> Betreff: Re: [oe] bitbake error on ncurses_5.4.bb C compiler cannot creat=
e
> executables
>
> On Tue, 27 Jul 2010, Paul Menzel wrote:
>
> > Dear Ranjith,
> >
> >
> > Am Dienstag, den 27.07.2010, 09:44 +0530 schrieb ranjith kannikara:
> >
> > > I was trying to run " bitbake fso-illume-image" and it rerturned an
> error
> > > that do_config on ncurses5.4.bb failed
> > > the respective log is
> > >
> > > Configuring NCURSES 5.4 ABI 5 (Tue Jul 27 09:32:35 IST 2010)
> > > checking build system type... i686-pc-linux-gnu
> > > checking host system type... arm-oe-linux-gnueabi
> > > checking target system type... arm-oe-linux-gnueabi
> > > Configuring for linux-gnueabi
> > > checking for prefix... /usr
> > > checking for arm-oe-linux-gnueabi-gcc... arm-oe-linux-gnueabi-gcc
> > > -march=3Darmv4t -mtune=3Darm920t -mthumb-interwork -mthumb
> > > checking whether the C compiler works... no
> > > configure: error: in
> > >
> `/home/ranjith/test/build/tmp/work/armv4t-oe-linux-gnueabi/ncurses-5.4-r2=
0.0/ncurses-5.4':
> > > configure: error: C compiler cannot create executables
> >
> > Do other recipes work correctly?
> >
> > > See `config.log' for more details.
> > >
> > > and the config.log entry is
> > >
> > > .## ----------- ##
> > > ## confdefs.h. ##
> > > ## ----------- ##
> > >
> > > /* confdefs.h */
> > > #define PACKAGE_NAME ""
> > > #define PACKAGE_TARNAME ""
> > > #define PACKAGE_VERSION ""
> > > #define PACKAGE_STRING ""
> > > #define PACKAGE_BUGREPORT ""
> > > #define PACKAGE_URL ""
> > > #define SYSTEM_NAME "linux-gnueabi"
> > >
> > > configure: exit 77
> > >
> > > I tried googling and tried installing gcc newer version,
> buildessentials,
> > > epenembedded-essentials, but nothign worked for me.
> > > So can any one help me in this regard to solve this issue ,,
> >
> > You did not provide information on what configuration and distribution
> > you use. Did you try to rebuild the whole tree in a clean environment?
>
>  not sure if this will be of any help but when i tried to build
> yesterday, i also got an error on ncurses.  i didn't do any debugging,
> i just waited a bit, did a "git pull", noticed some ncurses commits,
> tried again and it built.  so are you working with the absolutely
> latest repo contents?
>
>  and, yes, it would be useful to know your distro and architecture.
>
> rday
>
> --
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                               Waterloo, Ontario, CANADA
>
>        Top-notch, inexpensive online Linux/OSS/kernel courses
>                        http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Ranjith Babu Kannikara
0091 9809215273
Student, Computer science and engg, GEC Thrissur...
Student developer google ( 2008 GSOC ).
http://sourceforge.net/users/kannikara
http://www.ranjithkannikara.blogspot.com/


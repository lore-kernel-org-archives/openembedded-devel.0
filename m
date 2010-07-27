Received: from mail-dotnet1.eads.net ([80.156.45.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OdmEs-0004Dx-SK for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 17:38:44 +0200
Received: from unknown (HELO de-gate1.mailhub.intra.corp) ([53.154.243.33])
	by mail-dotnet1.eads.net with ESMTP; 27 Jul 2010 17:28:30 +0200
Received: from gateinet1.mail.ds.corp ([149.207.23.241]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Tue, 27 Jul 2010 17:37:58 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet1.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 27 Jul 2010 17:37:58 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 27 Jul 2010 17:37:58 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B57B5@deimsg40.de.net.world>
In-Reply-To: <alpine.DEB.2.00.1007270523480.16599@lynx>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] bitbake error on ncurses_5.4.bb C compiler cannot create
	executables
Thread-Index: AcstbfvBSz9ZQUatTA6nl3V5wgHD5gALkATQ
References: <AANLkTik+1EuG8Se996jFqVfQBXc3fFqoYPGzHh4hRsV2@mail.gmail.com><1280222125.3763.6.camel@mattotaupa>
	<alpine.DEB.2.00.1007270523480.16599@lynx>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 27 Jul 2010 15:37:58.0091 (UTC)
	FILETIME=[B04B71B0:01CB2DA1]
X-SA-Exim-Connect-IP: 80.156.45.103
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Tue, 27 Jul 2010 15:38:44 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I use the http://gitorious.org/angstrom/openembedded repository, and the =
latest pull reports the same error to me !

I build an image extending a console-base-image for opma3evm using =
angstrom distro.=20

Regards
Wolfgang Hauser
=20
-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Robert P. J. Day
Gesendet: Dienstag, 27. Juli 2010 11:26
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] bitbake error on ncurses_5.4.bb C compiler cannot =
create executables

On Tue, 27 Jul 2010, Paul Menzel wrote:

> Dear Ranjith,
>
>
> Am Dienstag, den 27.07.2010, 09:44 +0530 schrieb ranjith kannikara:
>
> > I was trying to run " bitbake fso-illume-image" and it rerturned an =
error
> > that do_config on ncurses5.4.bb failed
> > the respective log is
> >
> > Configuring NCURSES 5.4 ABI 5 (Tue Jul 27 09:32:35 IST 2010)
> > checking build system type... i686-pc-linux-gnu
> > checking host system type... arm-oe-linux-gnueabi
> > checking target system type... arm-oe-linux-gnueabi
> > Configuring for linux-gnueabi
> > checking for prefix... /usr
> > checking for arm-oe-linux-gnueabi-gcc... arm-oe-linux-gnueabi-gcc
> > -march=3Darmv4t -mtune=3Darm920t -mthumb-interwork -mthumb
> > checking whether the C compiler works... no
> > configure: error: in
> > =
`/home/ranjith/test/build/tmp/work/armv4t-oe-linux-gnueabi/ncurses-5.4-r2=
0.0/ncurses-5.4':
> > configure: error: C compiler cannot create executables
>
> Do other recipes work correctly?
>
> > See `config.log' for more details.
> >
> > and the config.log entry is
> >
> > .## ----------- ##
> > ## confdefs.h. ##
> > ## ----------- ##
> >
> > /* confdefs.h */
> > #define PACKAGE_NAME ""
> > #define PACKAGE_TARNAME ""
> > #define PACKAGE_VERSION ""
> > #define PACKAGE_STRING ""
> > #define PACKAGE_BUGREPORT ""
> > #define PACKAGE_URL ""
> > #define SYSTEM_NAME "linux-gnueabi"
> >
> > configure: exit 77
> >
> > I tried googling and tried installing gcc newer version, =
buildessentials,
> > epenembedded-essentials, but nothign worked for me.
> > So can any one help me in this regard to solve this issue ,,
>
> You did not provide information on what configuration and distribution
> you use. Did you try to rebuild the whole tree in a clean environment?

  not sure if this will be of any help but when i tried to build
yesterday, i also got an error on ncurses.  i didn't do any debugging,
i just waited a bit, did a "git pull", noticed some ncurses commits,
tried again and it built.  so are you working with the absolutely
latest repo contents?

  and, yes, it would be useful to know your distro and architecture.

rday

--=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Top-notch, inexpensive online Linux/OSS/kernel courses
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



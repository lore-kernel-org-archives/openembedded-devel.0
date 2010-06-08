Received: from fallback4.mail.ru ([94.100.176.42])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad_soft@inbox.ru>) id 1OM5d3-0005mj-El
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 22:42:36 +0200
Received: from mx30.mail.ru (mx30.mail.ru [94.100.176.44])
	by fallback4.mail.ru (mPOP.Fallback_MX) with ESMTP id 56C8220D7DEA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jun 2010 00:05:43 +0400 (MSD)
Received: from [77.51.33.209] (port=59923 helo=localhost)
	by mx30.mail.ru with asmtp id 1OM53M-000DW2-00
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 00:05:40 +0400
Date: Wed, 9 Jun 2010 00:05:39 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100608200539.GA2568@rainbow>
References: <20100605204019.GA1403@jama>
	<AANLkTilB6QtJOplQmu00-D7TeVHKiz2fbO5_ZZjN7iRZ@mail.gmail.com>
	<20100608172005.GA28481@rainbow>
	<AANLkTinx7ElAXde__dWP6Eufdr4XtPl1uzzXE2srNGRP@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinx7ElAXde__dWP6Eufdr4XtPl1uzzXE2srNGRP@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam: Not detected
X-Mras: Ok
X-SA-Exim-Connect-IP: 94.100.176.42
X-SA-Exim-Mail-From: mad_soft@inbox.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Latest binutils-cross-2.20.1-r10.0 build issue with binutils-2.20.1 on gentoo host
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
X-List-Received-Date: Tue, 08 Jun 2010 20:42:36 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11:13 Tue 08 Jun     , Khem Raj wrote:
> On Tue, Jun 8, 2010 at 10:20 AM, Dmitry Artamonow <mad_soft@inbox.ru> w=
rote:
> > On 23:14 Mon 07 Jun =A0 =A0 , Martin Jansa wrote:
> >> On Sat, Jun 5, 2010 at 10:40 PM, Martin Jansa <martin.jansa@gmail.co=
m> wrote:
> >> > FYI:
> >> >
> >> > If you run into issue
> >> > ar: can't set BFD default target to `x86_64-pc-linux-gnu': Invalid=
 bfd target
> >> >
> >> > Like I did in:
> >> > http://tinderbox.openembedded.net/packages/601631/
> >> >
> > Yup. I got this breakage too, only binutils-cross version is 2.18-r10=
.2
> > and error is:
> > ar: can't set BFD default target to `i686-pc-linux-gnu': Invalid bfd =
target
> >
> > see for example http://tinderbox.openembedded.net/packages/602258/
> >
> > Though I didn't dig into problem deeply and simply workaround it by
> > reverting 208ece17f76686e0faa44b2a9223fcadb692a991
> > But I'll gladly test any patches fixing the issue (whatever it is) in=
 a
> > proper way.
>=20
> proper way is to fix binutils on your host.

Ahh, sorry - misread original Martin's post. So it's seems to be
Gentoo-specific problem (yes, my OE is on Gentoo too).
Still wondering why it worked before and how it's connected with adding
"--enable-shared" in 208ece17f766. Weird, because it breaks on building
static library.

--=20
Best regards,
Dmitry "MAD" Artamonow



